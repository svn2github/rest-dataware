unit uDWPoolerMethod;

Interface

Uses {$IFDEF FPC}
     SysUtils,   uDWConstsData, Classes, SysTypes,   ServerUtils, {$IFDEF WINDOWS}Windows,{$ENDIF}
     uDWConsts,          uRESTDWBase,        uDWJSONTools,        uDWJSONObject;
     {$ELSE}
     {$IF CompilerVersion < 21}
     SysUtils, Classes,
     {$ELSE}
     System.SysUtils, System.Classes,
     {$IFEND}
     SysTypes,   uDWConstsData, ServerUtils,         Windows,
     uDWConsts,  uRESTDWBase,        uDWJSONTools,        uDWJSONObject;
     {$ENDIF}

 Type
  TDWPoolerMethodClient  = Class(TComponent)
  Private
   vCompression          : Boolean;
   {$IFNDEF FPC}
    {$if CompilerVersion > 21}
     vEncoding           : TEncodeSelect;
    {$IFEND}
   {$ENDIF}
   vHost : String;
   vPort : Integer;
  Public
   Constructor Create(AOwner: TComponent);Override;
   Destructor  Destroy;Override;
   Function GetPoolerList         (Method_Prefix           : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TStringList;Overload;
   Function EchoPooler            (Method_Prefix,
                                   Pooler                  : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : String;
   //Retorna todos os Poolers no DataModule do WebService
   Function PoolersDataSet        (Method_Prefix           : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TStringList;
   //Roda Comando SQL
   Function InsertValue           (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Params                  : TDWParams;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : Integer;
   Function ExecuteCommand        (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Params                  : TDWParams;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   Execute                 : Boolean;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TJSONValue;
   Function ExecuteCommandJSON    (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Params                  : TDWParams;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   Execute                 : Boolean;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TJSONValue;
   Function InsertValuePure       (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : Integer;
   Function ExecuteCommandPure    (Pooler, Method_Prefix,
                                   SQL                     : String;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   Execute                 : Boolean;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TJSONValue;
   Function ExecuteCommandPureJSON(Pooler,
                                   Method_Prefix,
                                   SQL                     : String;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   Execute                 : Boolean;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '')   : TJSONValue;
   //Executa um ApplyUpdate no Servidor
   Procedure   ApplyChangesPure   (Pooler, Method_Prefix,
                                   TableName,
                                   SQL                     : String;
                                   ADeltaList              : TDWDatalist;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '');
   Procedure   ApplyChanges       (Pooler, Method_Prefix,
                                   TableName,
                                   SQL                     : String;
                                   Params                  : TDWParams;
                                   ADeltaList              : TDWDatalist;
                                   Var Error               : Boolean;
                                   Var MessageError        : String;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '');
   //Lista todos os Pooler's do Servidor
   Procedure GetPoolerList        (Method_Prefix           : String;
                                   Var PoolerList          : TStringList;
                                   TimeOut                 : Integer = 3000;
                                   UserName                : String  = '';
                                   Password                : String  = '');Overload;
   //StoredProc
   Procedure  ExecuteProcedure    (Pooler,
                                   Method_Prefix,
                                   ProcName                : String;
                                   Params                  : TDWParams;
                                   Var Error               : Boolean;
                                   Var MessageError        : String);
   Procedure  ExecuteProcedurePure(Pooler,
                                   Method_Prefix,
                                   ProcName                : String;
                                   Var Error               : Boolean;
                                   Var MessageError        : String);
   Property Compression  : Boolean   Read vCompression Write vCompression;
  {$IFNDEF FPC}
   {$if CompilerVersion > 21}
   Property Encoding     : TEncodeSelect     Read vEncoding        Write vEncoding;
   {$IFEND}
  {$ENDIF}
   Property    Host : String   Read vHost Write vHost;
   Property    Port : Integer  Read vPort Write vPort;
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
 vCompression := True;
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   vEncoding  := esASCII;
  {$IFEND}
 {$ENDIF}
 Host := '127.0.0.1';
 Port := 8082;
End;

Destructor TDWPoolerMethodClient.Destroy;
Begin
 Inherited;
End;

Function TDWPoolerMethodClient.GetPoolerList(Method_Prefix  : String;
                                             TimeOut        : Integer = 3000;
                                             UserName       : String  = '';
                                             Password       : String  = '')   : TStringList;
Var
 RESTClientPooler : TRESTClientPooler;
 vTempString,
 lResponse        : String;
 JSONParam        : TJSONParam;
 DWParams         : TDWParams;
Begin
 RESTClientPooler                 := TRESTClientPooler.Create(Nil);
 RESTClientPooler.Host            := Host;
 RESTClientPooler.Port            := Port;
 RESTClientPooler.UserName        := UserName;
 RESTClientPooler.Password        := Password;
 RESTClientPooler.RequestTimeOut  := TimeOut;
 RESTClientPooler.UrlPath         := Method_Prefix;
 RESTClientPooler.DataCompression := Compression;
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Result';
 JSONParam.ObjectDirection       := odOUT;
 JSONParam.SetValue('');
 DWParams  := TDWParams.Create;
 DWParams.Add(JSONParam);
 Try
  Try
   lResponse := RESTClientPooler.SendEvent('GetPoolerList', DWParams);
   If lResponse <> '' Then
    Begin
     Result      := TStringList.Create;
     vTempString := DWParams.ItemsString['Result'].Value;
     While Not (vTempString = '') Do
      Begin
       if Pos('|', vTempString) > 0 then
        Begin
         Result.Add(Copy(vTempString, 1, Pos('|', vTempString) -1));
         Delete(vTempString, 1, Pos('|', vTempString));
        End
       Else
        Begin
         Result.Add(Copy(vTempString, 1, Length(vTempString)));
         Delete(vTempString, 1, Length(vTempString));
        End;
      End;
    End;
  Except
  End;
 Finally
  RESTClientPooler.Free;
  DWParams.Free;
 End;
End;

Function TDWPoolerMethodClient.EchoPooler(Method_Prefix,
                                          Pooler    : String;
                                          TimeOut   : Integer;
                                          UserName,
                                          Password  : String) : String;
Var
 RESTClientPooler : TRESTClientPooler;
 vTempString,
 lResponse        : String;
 JSONParam        : TJSONParam;
 DWParams         : TDWParams;
Begin
 RESTClientPooler                := TRESTClientPooler.Create(Nil);
 RESTClientPooler.Host           := Host;
 RESTClientPooler.Port           := Port;
 RESTClientPooler.UserName       := UserName;
 RESTClientPooler.Password       := Password;
 RESTClientPooler.RequestTimeOut := TimeOut;
 RESTClientPooler.UrlPath        := Method_Prefix;
 DWParams                        := TDWParams.Create;
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Pooler';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(Pooler);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Result';
 JSONParam.ObjectDirection       := odOUT;
 JSONParam.SetValue('');
 DWParams.Add(JSONParam);
 Try
  Try
   lResponse := RESTClientPooler.SendEvent('EchoPooler', DWParams);
   If lResponse <> '' Then
    Result   := DWParams.ItemsString['Result'].Value;
  Except
  End;
 Finally
  RESTClientPooler.Free;
  DWParams.Free;
 End;
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
Var
 RESTClientPooler : TRESTClientPooler;
 vTempString,
 lResponse        : String;
 JSONParam        : TJSONParam;
 DWParams         : TDWParams;
Begin
 RESTClientPooler                := TRESTClientPooler.Create(Nil);
 RESTClientPooler.Host           := Host;
 RESTClientPooler.Port           := Port;
 RESTClientPooler.UserName       := UserName;
 RESTClientPooler.Password       := Password;
 RESTClientPooler.RequestTimeOut := TimeOut;
 RESTClientPooler.UrlPath        := Method_Prefix;
 DWParams                        := TDWParams.Create;
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ENDIF}
 JSONParam.ParamName             := 'Pooler';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(Pooler);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ENDIF}
 JSONParam.ParamName             := 'Method_Prefix';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(Method_Prefix);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ENDIF}
 JSONParam.ParamName             := 'SQL';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(SQL);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ENDIF}
 JSONParam.ParamName             := 'Params';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(Params.ToJSON);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ENDIF}
 JSONParam.ParamName             := 'Error';
 JSONParam.ObjectDirection       := odInOut;
 JSONParam.SetValue(BooleanToString(False));
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ENDIF}
 JSONParam.ParamName             := 'MessageError';
 JSONParam.ObjectDirection       := odInOut;
 JSONParam.SetValue(MessageError);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ENDIF}
 JSONParam.ParamName             := 'Execute';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(BooleanToString(Execute));
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ENDIF}
 JSONParam.ParamName             := 'Result';
 JSONParam.ObjectDirection       := odOUT;
 JSONParam.SetValue('');
 DWParams.Add(JSONParam);
 Try
  Try
   lResponse := RESTClientPooler.SendEvent('ExecuteCommandJSON', DWParams);
   If lResponse <> '' Then
    Begin
     Result         := TJSONValue.Create;
     Result.Encoded := False;
     Result.LoadFromJSON(DWParams.ItemsString['Result'].Value);
     If DWParams.ItemsString['Error'] <> Nil Then
      Error         := StringToBoolean(DWParams.ItemsString['Error'].Value);
     If DWParams.ItemsString['MessageError'] <> Nil Then
      MessageError  := DWParams.ItemsString['MessageError'].Value;
    End;
  Except
  End;
 Finally
  RESTClientPooler.Free;
  DWParams.Free;
 End;
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
Var
 RESTClientPooler : TRESTClientPooler;
 vTempString,
 lResponse        : String;
 JSONParam        : TJSONParam;
 DWParams         : TDWParams;
Begin
 RESTClientPooler                := TRESTClientPooler.Create(Nil);
 RESTClientPooler.Host           := Host;
 RESTClientPooler.Port           := Port;
 RESTClientPooler.UserName       := UserName;
 RESTClientPooler.Password       := Password;
 RESTClientPooler.RequestTimeOut := TimeOut;
 RESTClientPooler.UrlPath        := Method_Prefix;
 DWParams                        := TDWParams.Create;
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Pooler';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(Pooler);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Method_Prefix';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(Method_Prefix);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'SQL';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(SQL);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Params';
 JSONParam.ObjectDirection       := odInOut;
 JSONParam.SetValue(Params.ToJSON);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Error';
 JSONParam.ObjectDirection       := odInOut;
 JSONParam.SetValue(BooleanToString(False));
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'MessageError';
 JSONParam.ObjectDirection       := odInOut;
 JSONParam.SetValue(MessageError);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Execute';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(BooleanToString(Execute));
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Result';
 JSONParam.ObjectDirection       := odOUT;
 JSONParam.SetValue('');
 DWParams.Add(JSONParam);
 Try
  Try
   lResponse := RESTClientPooler.SendEvent('ExecuteCommandJSON', DWParams);
   If lResponse <> '' Then
    Begin
     Result         := TJSONValue.Create;
     Result.Encoded := False;
     If DWParams.ItemsString['Result'] <> Nil Then
      Begin
       If DWParams.ItemsString['Result'].Value <> '' Then
        Result.LoadFromJSON(DWParams.ItemsString['Result'].Value);
      End;
     If DWParams.ItemsString['Error'] <> Nil Then
      Error         := StringToBoolean(DWParams.ItemsString['Error'].Value);
     If DWParams.ItemsString['MessageError'] <> Nil Then
      MessageError  := DWParams.ItemsString['MessageError'].Value;
    End;
  Except
  End;
 Finally
  RESTClientPooler.Free;
  DWParams.Free;
 End;
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
Var
 RESTClientPooler : TRESTClientPooler;
 vTempString,
 lResponse        : String;
 JSONParam        : TJSONParam;
 DWParams         : TDWParams;
Begin
 RESTClientPooler                := TRESTClientPooler.Create(Nil);
 RESTClientPooler.Host           := Host;
 RESTClientPooler.Port           := Port;
 RESTClientPooler.UserName       := UserName;
 RESTClientPooler.Password       := Password;
 RESTClientPooler.RequestTimeOut := TimeOut;
 RESTClientPooler.UrlPath        := Method_Prefix;
 DWParams                        := TDWParams.Create;
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                      := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Pooler';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(Pooler);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Method_Prefix';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(Method_Prefix);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'SQL';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(SQL);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Error';
 JSONParam.ObjectDirection       := odInOut;
 JSONParam.SetValue(BooleanToString(False));
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'MessageError';
 JSONParam.ObjectDirection       := odInOut;
 JSONParam.SetValue(MessageError);
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Execute';
 JSONParam.ObjectDirection       := odIn;
 JSONParam.SetValue(BooleanToString(Execute));
 DWParams.Add(JSONParam);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   RESTClientPooler.Encoding     := vEncoding;
   JSONParam                     := TJSONParam.Create(GetEncoding(TEncodeSelect(RESTClientPooler.Encoding)));
  {$ELSE}
   JSONParam                     := TJSONParam.Create;
  {$IFEND}
 {$ELSE}
  JSONParam                     := TJSONParam.Create;
 {$ENDIF}
 JSONParam.ParamName             := 'Result';
 JSONParam.ObjectDirection       := odOUT;
 JSONParam.SetValue('');
 DWParams.Add(JSONParam);
 Try
  Try
   lResponse := RESTClientPooler.SendEvent('ExecuteCommandPureJSON', DWParams);
   If lResponse <> '' Then
    Begin
     Result         := TJSONValue.Create;
     Result.Encoded := False;
     If DWParams.ItemsString['Result'] <> Nil Then
      Begin
       If DWParams.ItemsString['Result'].Value <> '' Then
        Result.LoadFromJSON(DWParams.ItemsString['Result'].Value);
      End;
    End;
  Except
  End;
 Finally
  RESTClientPooler.Free;
  DWParams.Free;
 End;
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

