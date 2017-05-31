// Para Funcionar o Servidor é necessário que todos os Métodos declarados em PUBLIC sejam
//adicionados em seus Projetos.
//Gilberto Rocha da Silva

unit ServerMethodsUnit1;

interface

uses System.SysUtils,         System.Classes,           Datasnap.DSServer,  Datasnap.DSAuth,
     FireDAC.Stan.Intf,       FireDAC.Stan.Option,      FireDAC.Stan.Param,
     FireDAC.Stan.Error,      FireDAC.DatS,             FireDAC.Phys.Intf,  FireDAC.DApt.Intf,
     FireDAC.Stan.Async,      FireDAC.DApt,             FireDAC.UI.Intf,    FireDAC.VCLUI.Wait,
     FireDAC.Stan.Def,        FireDAC.Stan.Pool,        FireDAC.Phys,       Data.DB,
     FireDAC.Comp.Client,     FireDAC.Phys.IBBase,      FireDAC.Phys.IB,    FireDAC.Comp.UI,
     FireDAC.Comp.DataSet,    Data.FireDACJSONReflect,  System.JSON,
     FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FireDAC.Phys.IBDef,
     WebModuleUnit1,          Vcl.Dialogs,              TypInfo,

     IniFiles,

     Vcl.Forms, uRestPoolerDB, URestPoolerDBMethod, FireDAC.Phys.FBDef, FireDAC.Phys.FB;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDGUIxWaitCursor1      : TFDGUIxWaitCursor;
    FDStanStorageJSONLink1 : TFDStanStorageJSONLink;
    Server_FDConnection: TFDConnection;
    RESTPoolerDB: TRESTPoolerDB;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure Server_FDConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
   vUserName,
   vPassword : String;
   Function  GetUnitClassName : String;
  public
    { Public declarations }
    //Echo Commands
    Function EchoPooler(Value: String): String;
    Function PoolersDataSet : String;
    //Execute commands
    Function    InsertValue(Pooler,
                            SQL                  : String;
                            Params               : TParams;
                            Var Error            : Boolean;
                            Var MessageError     : String): Integer;
    Function ExecuteCommandPure(Pooler     : String;
                                SQL        : String;
                                Var Error  : Boolean;
                                Var MessageError : String;
                                Execute    : Boolean = False) : TFDJSONDataSets;
    Function ExecuteCommandPureJSON(Pooler     : String;
                                    SQL        : String;
                                    Var Error  : Boolean;
                                    Var MessageError : String;
                                    Execute    : Boolean = False) : TJSONObject;
    Function ExecuteCommand(Pooler     : String;
                            SQL        : String;
                            Params     : TParams;
                            Var Error  : Boolean;
                            Var MessageError : String;
                            Execute    : Boolean = False) : TFDJSONDataSets;
    Function ExecuteCommandJSON(Pooler     : String;
                                SQL        : String;
                                Params     : TParams;
                                Var Error  : Boolean;
                                Var MessageError : String;
                                Execute    : Boolean = False) : TJSONObject;
    Function  InsertValuePure(Pooler,
                              SQL                  : String;
                              Var Error            : Boolean;
                              Var MessageError     : String) : Integer;
    //Apply Changes on DB
    Procedure ApplyChangesPure(Pooler           : String;
                               TableName        : String;
                               SQL              : String;
                               Const ADeltaList : TFDJSONDeltas;
                               Var Error        : Boolean;
                               Var MessageError : String);Overload;
    Procedure ApplyChanges(Pooler           : String;
                           TableName        : String;
                           SQL              : String;
                           Params           : TParams;
                           Const ADeltaList : TFDJSONDeltas;
                           Var Error        : Boolean;
                           Var MessageError : String);Overload;
    //Get All Poolers
   Procedure GetPoolerList(Var PoolerList : TStringList);
  end;
{$METHODINFO OFF}

Var
 UserName,
 Password : String;
 vDatabaseName : String;


implementation

{$R *.dfm}

uses System.StrUtils, System.Generics.Collections, RestDWServerFormU;

Function GetPoolerName(Value : String) : String;
Begin
 Result := Value;
 If Pos('.', Result) > 0 Then
  Result := Copy(Result, Pos('.', Result) +1, Length(Result));
End;

Function TServerMethods1.EchoPooler(Value: String): String;
Begin
 Result := String(remoteIP);
End;

Function TServerMethods1.PoolersDataSet : String;
Var
 I : Integer;
Begin
 Result := '';
 For I := 0 to ComponentCount -1 Do
  Begin
   If Components[i] is TRESTPoolerDB Then
    Begin
     If Result = '' then
      Result := Format('%s.%s', [GetUnitClassName, Components[i].Name])
     Else
      Result := Result + '|' + Format('%s.%s', [GetUnitClassName, Self.Components[i].Name]);
    End;
  End;
End;

Procedure TServerMethods1.ApplyChangesPure(Pooler           : String;
                                           TableName        : String;
                                           SQL              : String;
                                           Const ADeltaList : TFDJSONDeltas;
                                           Var Error        : Boolean;
                                           Var MessageError : String);
Var
 I : Integer;
 vTempPooler : String;
Begin
 vTempPooler := UpperCase(GetPoolerName(Pooler));
 For I := 0 to ComponentCount -1 Do
  Begin
   If Components[i] is TRESTPoolerDB Then
    Begin
     If UpperCase(Components[i].Name) = vTempPooler Then
      Begin
       TRESTPoolerDB(Components[i]).ApplyChanges(TableName, SQL, Error, MessageError, ADeltaList);
       Break;
      End;
    End;
  End;
End;

procedure TServerMethods1.DataModuleCreate(Sender: TObject);
begin
 UserName := RestDWForm.Username;
 Password := RestDWForm.Password;
end;

Function TServerMethods1.GetUnitClassName : String;
Var
 VMT,
 P    : Pointer;
Begin
 Result := '';
 VMT:= Pointer(Self.ClassType);
 P:= PPointer(PByte(VMT) + vmtTypeInfo)^;
 If P <> Nil Then
  Result := GetTypeData(P).UnitName;
End;

Procedure TServerMethods1.GetPoolerList(Var PoolerList : TStringList);
Var
 I : Integer;
Begin
 If PoolerList = Nil Then
  PoolerList := TStringList.Create;
 PoolerList.Clear;
 For I := 0 to ComponentCount -1 Do
  Begin
   If Components[i] is TRESTPoolerDB Then
    PoolerList.Add(GetUnitClassName + '.' + TRESTPoolerDB(Components[i]).Name);
  End;
End;

Procedure TServerMethods1.ApplyChanges(Pooler           : String;
                                       TableName        : String;
                                       SQL              : String;
                                       Params           : TParams;
                                       Const ADeltaList : TFDJSONDeltas;
                                       Var Error        : Boolean;
                                       Var MessageError : String);
Var
 I : Integer;
 vTempPooler : String;
Begin
 vTempPooler := UpperCase(GetPoolerName(Pooler));
 For I := 0 to ComponentCount -1 Do
  Begin
   If Components[i] is TRESTPoolerDB Then
    Begin
     If UpperCase(Components[i].Name) = vTempPooler Then
      Begin
       TRESTPoolerDB(Components[i]).ApplyChanges(TableName, SQL, Params, Error, MessageError, ADeltaList);
       Break;
      End;
    End;
  End;
End;

Function TServerMethods1.ExecuteCommandPureJSON(Pooler     : String;
                                                SQL        : String;
                                                Var Error  : Boolean;
                                                Var MessageError : String;
                                                Execute    : Boolean = False) : TJSONObject;
Var
 LDataSets : TFDJSONDataSets;
Begin
 LDataSets := ExecuteCommandPure(Pooler, SQL, Error, MessageError, Execute);
 Try
  Result := TJSONObject.Create;
  //if LDataSets <> Nil then
     TFDJSONInterceptor.DataSetsToJSONObject(LDataSets, Result)
 Finally
  LDataSets.Free;
 End;
End;

Function TServerMethods1.ExecuteCommandJSON(Pooler     : String;
                                            SQL        : String;
                                            Params     : TParams;
                                            Var Error  : Boolean;
                                            Var MessageError : String;
                                            Execute    : Boolean = False) : TJSONObject;
Var
 LDataSets : TFDJSONDataSets;
Begin
 LDataSets := ExecuteCommand(Pooler, SQL, Params, Error, MessageError, Execute);
 Try
  Result := TJSONObject.Create;

  //if LDataSets <> Nil then
     TFDJSONInterceptor.DataSetsToJSONObject(LDataSets, Result)
 Finally
  LDataSets.Free;
 End;
End;

Function TServerMethods1.ExecuteCommand(Pooler     : String;
                                        SQL        : String;
                                        Params     : TParams;
                                        Var Error  : Boolean;
                                        Var MessageError : String;
                                        Execute    : Boolean = False) : TFDJSONDataSets;
Var
 I : Integer;
 vTempPooler : String;
Begin
 Result := Nil;
 vTempPooler := UpperCase(GetPoolerName(Pooler));
 For I := 0 to ComponentCount -1 Do
  Begin
   If Components[i] is TRESTPoolerDB Then
    Begin
     If UpperCase(Components[i].Name) = vTempPooler Then
      Begin
       Result := TRESTPoolerDB(Components[i]).ExecuteCommand(SQL, Params, Error, MessageError, Execute);;
       Break;
      End;
    End;
  End;
End;

Function TServerMethods1.ExecuteCommandPure(Pooler     : String;
                                            SQL        : String;
                                            Var Error  : Boolean;
                                            Var MessageError : String;
                                            Execute    : Boolean = False) : TFDJSONDataSets;
Var
 I : Integer;
 vTempPooler : String;
Begin
 Result := Nil;
 vTempPooler := UpperCase(GetPoolerName(Pooler));
 For I := 0 to ComponentCount -1 Do
  Begin
   If Components[i] is TRESTPoolerDB Then
    Begin
     If UpperCase(Components[i].Name) = vTempPooler Then
      Begin
       Result := TRESTPoolerDB(Components[i]).ExecuteCommand(SQL, Error, MessageError, Execute);
       Break;
      End;
    End;
  End;
End;

Function TServerMethods1.InsertValue(Pooler,
                                     SQL                  : String;
                                     Params               : TParams;
                                     Var Error            : Boolean;
                                     Var MessageError     : String): Integer;
Var
 I : Integer;
 vTempPooler : String;
Begin
 Result := -1;
 vTempPooler := UpperCase(GetPoolerName(Pooler));
 For I := 0 to ComponentCount -1 Do
  Begin
   If Components[i] is TRESTPoolerDB Then
    Begin
     If UpperCase(Components[i].Name) = vTempPooler Then
      Begin
       Result := TRESTPoolerDB(Components[i]).InsertMySQLReturnID(SQL, Params, Error, MessageError);
       Break;
      End;
    End;
  End;
End;

Function  TServerMethods1.InsertValuePure(Pooler,
                                          SQL                  : String;
                                          Var Error            : Boolean;
                                          Var MessageError     : String) : Integer;
Var
 I : Integer;
 vTempPooler : String;
Begin
 Result := -1;
 vTempPooler := UpperCase(GetPoolerName(Pooler));
 For I := 0 to ComponentCount -1 Do
  Begin
   If Components[i] is TRESTPoolerDB Then
    Begin
     If UpperCase(Components[i].Name) = vTempPooler Then
      Begin
       Result := TRESTPoolerDB(Components[i]).InsertMySQLReturnID(SQL, Error, MessageError);
       Break;
      End;
    End;
  End;
End;

procedure TServerMethods1.Server_FDConnectionBeforeConnect(Sender: TObject);
Var
 fname,
 porta_BD,
 porta_DW,
 servidor,
 database,
 pasta,
 usuario_DW,
 senha_DW,
 usuario_BD,
 senha_BD     : String;
 ini       : TIniFile;

  Function GetServer(Value : String) : String;
 Begin
  If Pos('/', Value) = 0 Then
   Result := Value
  Else
   Result := Copy(Value, 1, Pos('/', Value) -1);
 End;
 Function GetPort(Value : String) : String;
 Begin
  If Pos('/', Value) = 0 Then
   Result := '3050'
  Else
   Result := Copy(Value, Pos('/', Value) + 1, Length(Value));
 End;

begin

  servidor   := RestDWForm.edIP.Text ;
  database   := RestDWForm.edBD.Text;
  pasta      := RestDWForm.edPasta.Text;

  if Copy( pasta, Length(pasta) , 1 ) <> '\' then
     pasta := pasta + '\';

  porta_BD   := RestDWForm.edPortaBD.Text ;
  usuario_BD := RestDWForm.edUserNameBD.Text;
  senha_BD   := RestDWForm.edPasswordBD.Text;

  //vDatabaseName  := Format('%s/' + porta_BD + ':%s', [servidor, pasta + database]);
  vDatabaseName  := pasta + database ;// Format('%s:' + '%s', [servidor, pasta + database]);

  //If Pos('/', servidor) = 0 Then
  // vDatabaseName  := Format('%s/' + porta_fb + ':%s', [servidor, database])
  //Else
  // vDatabaseName  := Format('%s:%s', [servidor, database]);




 Server_FDConnection.Params.Clear;
 Server_FDConnection.Params.Add( 'DriverID=FB');
 Server_FDConnection.Params.Add( 'Server=' + servidor );// GetServer(servidor));
 Server_FDConnection.Params.Add( 'Port=' + porta_BD ) ;//GetPort(servidor));
 Server_FDConnection.Params.Add( 'Database=' + vDatabaseName );//servidor + ':' + pasta + database ); // 'Database='
 Server_FDConnection.Params.Add( 'User_Name=' + usuario_BD);
 Server_FDConnection.Params.Add( 'Password=' + senha_BD);
 Server_FDConnection.Params.Add( 'Protocol=TCPIP');
 //Server_FDConnection.Params.Add( 'CharacterSet=ISO8859_1');

 //TFDConnection(Sender).
  Server_FDConnection.UpdateOptions.CountUpdatedRecords := False;

end;
{
begin

 Server_FDConnection.Params.Clear;

 Server_FDConnection.Params.Add( 'DriverID=FB' ); // IB
 Server_FDConnection.Params.Add( 'Database=localhost: ' + 'c:\mkmdados\' + 'MKMDATAFILE.FDB' );//  ExtractFilePath(ParamSTR(0)) + 'MKMDATAFILE.FDB' );
 Server_FDConnection.Params.Add( 'User_Name=sysdba' );
 Server_FDConnection.Params.Add( 'password=masterkey' );

 Server_FDConnection.UpdateOptions.CountUpdatedRecords := False;

end;
  }
end.

