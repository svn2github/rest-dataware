unit uDWPoolerMethod;

Interface

Uses {$IFDEF FPC}
     SysUtils,           Classes, SysTypes,   ServerUtils, {$IFDEF WINDOWS}Windows,{$ENDIF}
     uRESTDWBase,        uDWJSONTools,        uDWConsts,  uDWJSONObject;
     {$ELSE}
     {$IF CompilerVersion < 21}
     SysUtils, Classes,
     {$ELSE}
     System.SysUtils, System.Classes,
     {$IFEND}
     SysTypes,           ServerUtils,         Windows,
     uRESTDWBase,        uDWJSONTools,        uDWConsts,  uDWJSONObject;
     {$ENDIF}

 Type
  TDWPoolerMethodClient        = Class(TDWClientMethodExecute)
  Private
   vCompression          : Boolean;
   {$IFNDEF FPC}
    {$if CompilerVersion > 21}
     vEncoding            : TEncoding;
    {$IFEND}
   {$ENDIF}
  Public
   Constructor Create(AOwner: TComponent);Override;
   Destructor  Destroy;Override;
   Function EchoPooler            (Value, Method_Prefix    : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : String;Override;
   //Retorna todos os Poolers no DataModule do WebService
   Function PoolersDataSet        (Method_Prefix           : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TStringList;Override;
   //Roda Comando SQL
   Function InsertValue           (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Params                  : TDWParams;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : Integer;Override;
   Function ExecuteCommand        (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Params                  : TDWParams;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   Execute                 : Boolean;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TJSONValue;Override;
   Function ExecuteCommandJSON    (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Params                  : TDWParams;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   Execute                 : Boolean;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TJSONValue;Override;
   Function InsertValuePure       (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : Integer;Override;
   Function ExecuteCommandPure    (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   Execute                 : Boolean;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TJSONValue;Override;
   Function ExecuteCommandPureJSON(Pooler,
                                   Method_Prefix,
                                   SQL                     : String;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   Execute                 : Boolean;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TJSONValue;Override;
   //Executa um ApplyUpdate no Servidor
   Procedure   ApplyChangesPure   (Pooler, Method_Prefix,
                                   TableName,
                                   SQL                     : String;
                                   ADeltaList              : TDWDatalist;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '');Override;
   Procedure   ApplyChanges       (Pooler, Method_Prefix,
                                   TableName,
                                   SQL                     : String;
                                   Params                  : TDWParams;
                                   ADeltaList              : TDWDatalist;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '');Override;
   //Lista todos os Pooler's do Servidor
   Procedure GetPoolerList        (Method_Prefix           : String;
                                   Var PoolerList          : TStringList;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '');Override;
   //StoredProc
   Procedure  ExecuteProcedure    (Pooler,
                                   Method_Prefix,
                                   ProcName                : String;
                                   Params                  : TDWParams;
                                   Var Error               : Boolean;
                                   Var MessageError        : String);Override;
   Procedure  ExecuteProcedurePure(Pooler,
                                   Method_Prefix,
                                   ProcName                : String;
                                   Var Error               : Boolean;
                                   Var MessageError        : String);
   Property Compression  : Boolean   Read vCompression Write vCompression;
  {$IFNDEF FPC}
   {$if CompilerVersion > 21}
   Property Encoding     : TEncoding        Read vEncoding        Write vEncoding;
   {$IFEND}
  {$ENDIF}
  End;

implementation


{ TDWPoolerMethodClient }

Procedure TDWPoolerMethodClient.ApplyChanges(Pooler, Method_Prefix,
                                             TableName, SQL : String;
                                             Params: TDWParams;
                                             ADeltaList: TDWDatalist;
                                             var Error: Boolean;
                                             var MessageError: String;
                                             TimeOut: Integer;
                                             UserName, Password: String);
Begin
  inherited;

End;

Procedure TDWPoolerMethodClient.ApplyChangesPure(Pooler, Method_Prefix,
                                                 TableName,
                                                 SQL                     : String;
                                                 ADeltaList              : TDWDatalist;
                                                 Var Error               : Boolean;
                                                 Var MessageError        : String;
                                                 TimeOut                 : Integer = 3000;
                                                 UserName                : String  = '';
                                                 Password                : String  = '');
Begin

End;

Constructor TDWPoolerMethodClient.Create(AOwner: TComponent);
Begin
  Inherited;

End;

Destructor TDWPoolerMethodClient.Destroy;
Begin

  Inherited;
End;

Function TDWPoolerMethodClient.EchoPooler(Value, Method_Prefix    : String;
                                          TimeOut                 : Integer = 3000;
                                          UserName                : String  = '';
                                          Password                : String  = '')   : String;
Begin

End;

Function TDWPoolerMethodClient.ExecuteCommand(Pooler, Method_Prefix,
                                              SQL                     : String;
                                              Params                  : TDWParams;
                                              Var Error               : Boolean;
                                              Var MessageError        : String;
                                              Execute                 : Boolean;
                                              TimeOut                 : Integer = 3000;
                                              UserName                : String  = '';
                                              Password                : String  = '')   : TJSONValue;
Begin

End;

Function TDWPoolerMethodClient.ExecuteCommandJSON(Pooler, Method_Prefix,
                                                  SQL                     : String;
                                                  Params                  : TDWParams;
                                                  Var Error               : Boolean;
                                                  Var MessageError        : String;
                                                  Execute                 : Boolean;
                                                  TimeOut                 : Integer = 3000;
                                                  UserName                : String  = '';
                                                  Password                : String  = '')   : TJSONValue;
Begin

End;

Function TDWPoolerMethodClient.ExecuteCommandPure(Pooler, Method_Prefix,
                                                  SQL                     : String;
                                                  Var Error               : Boolean;
                                                  Var MessageError        : String;
                                                  Execute                 : Boolean;
                                                  TimeOut                 : Integer = 3000;
                                                  UserName                : String  = '';
                                                  Password                : String  = '')   : TJSONValue;
Begin

End;

Function TDWPoolerMethodClient.ExecuteCommandPureJSON(Pooler,
                                                      Method_Prefix,
                                                      SQL                     : String;
                                                      Var Error               : Boolean;
                                                      Var MessageError        : String;
                                                      Execute                 : Boolean;
                                                      TimeOut                 : Integer = 3000;
                                                      UserName                : String  = '';
                                                      Password                : String  = '')   : TJSONValue;
Begin

End;

Procedure TDWPoolerMethodClient.ExecuteProcedure(Pooler,
                                                 Method_Prefix,
                                                 ProcName                : String;
                                                 Params                  : TDWParams;
                                                 Var Error               : Boolean;
                                                 Var MessageError        : String);
Begin

End;

Procedure TDWPoolerMethodClient.ExecuteProcedurePure(Pooler,
                                                     Method_Prefix,
                                                     ProcName                : String;
                                                     Var Error               : Boolean;
                                                     Var MessageError        : String);
Begin

End;

Procedure TDWPoolerMethodClient.GetPoolerList(Method_Prefix           : String;
                                              Var PoolerList          : TStringList;
                                              TimeOut                 : Integer = 3000;
                                              UserName                : String  = '';
                                              Password                : String  = '');
Begin

End;

Function TDWPoolerMethodClient.InsertValue(Pooler, Method_Prefix,
                                           SQL                     : String;
                                           Params                  : TDWParams;
                                           Var Error               : Boolean;
                                           Var MessageError        : String;
                                           TimeOut                 : Integer = 3000;
                                           UserName                : String  = '';
                                           Password                : String  = ''): Integer;
Begin

End;

Function TDWPoolerMethodClient.InsertValuePure(Pooler, Method_Prefix,
                                               SQL                     : String;
                                               Var Error               : Boolean;
                                               Var MessageError        : String;
                                               TimeOut                 : Integer = 3000;
                                               UserName                : String  = '';
                                               Password                : String  = ''): Integer;
Begin

End;

Function TDWPoolerMethodClient.PoolersDataSet(Method_Prefix           : String;
                                              TimeOut                 : Integer = 3000;
                                              UserName                : String  = '';
                                              Password                : String  = ''): TStringList;
Begin

End;

end.

