unit uPoolerMethod;

Interface

Uses System.JSON,             Datasnap.DSProxyRest,  Datasnap.DSClientRest,          Data.DBXCommon,
     Data.DBXClient,          Data.DBXDataSnap,      Data.DBXJSON, Datasnap.DSProxy, System.Classes,
     System.SysUtils,         Data.DB, Data.SqlExpr, Data.DBXDBReaders,              Data.DBXCDSReaders,
     Data.FireDACJSONReflect, Data.DBXJSONReflect;

 Type
  TSMPoolerMethodClient        = Class(TDSAdminRestClient)
  Private
   FEchoPoolerCommand,
   FPoolersDataSetCommand,
   FPoolersDataSetCommand_Cache,
   FEchoStringCommand,
   FExecuteCommandCommand,
   FExecuteCommandPureCommand       : TDSRestCommand;
  Public
   Constructor Create(ARestConnection: TDSRestConnection); Overload;
   Constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); Overload;
   Destructor  Destroy; override;
   Function    EchoPooler(Value, Method_Prefix : String; const ARequestFilter: string = ''): string;
   Function    PoolersDataSet(Method_Prefix        : String; const ARequestFilter: string = ''): TStringList;
   Function    ExecuteCommand(Pooler               : String;
                              Method_Prefix        : String;
                              SQL                  : String;
                              Params               : TParams;
                              Var Error            : Boolean;
                              Var MessageError     : String;
                              Execute              : Boolean;
                              const ARequestFilter : String = ''): TFDJSONDataSets;
   Function    ExecuteCommandPure(Pooler               : String;
                                  Method_Prefix        : String;
                                  SQL                  : String;
                                  Var Error            : Boolean;
                                  Var MessageError     : String;
                                  Execute              : Boolean;
                                  const ARequestFilter : String = ''): TFDJSONDataSets;
 End;

Const
  TSMPoolerMethodClient_EchoPooler: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMPoolerMethodClient_PoolersDataSet: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStringList')
  );

  TSMPoolerMethodClient_ExecuteCommand: array [0..6] of TDSRestParameterMetaData =
  (
    (Name: 'Pooler'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'SQL'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Params'; Direction: 1; DBXType: 23; TypeName: 'TParams'),
    (Name: 'Error'; Direction: 3; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'MessageError'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: 'Execute'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSMPoolerMethodClient_ExecuteCommandPure: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'Pooler'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'SQL'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Error'; Direction: 3; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'MessageError'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: 'Execute'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

implementation

Function TSMPoolerMethodClient.ExecuteCommandPure(Pooler               : String;
                                                  Method_Prefix        : String;
                                                  SQL                  : String;
                                                  Var Error            : Boolean;
                                                  Var MessageError     : String;
                                                  Execute              : Boolean;
                                                  const ARequestFilter : String = ''): TFDJSONDataSets;
Begin
 If FExecuteCommandPureCommand = Nil Then
  Begin
   FExecuteCommandPureCommand := FConnection.CreateCommand;
   FExecuteCommandPureCommand.RequestType := 'GET';
   FExecuteCommandPureCommand.Text := Method_Prefix + '.ExecuteCommandPure';
   FExecuteCommandPureCommand.Prepare(TSMPoolerMethodClient_ExecuteCommandPure);
  End;
 FExecuteCommandPureCommand.Parameters[0].Value.SetWideString(Pooler);
 FExecuteCommandPureCommand.Parameters[1].Value.SetWideString(SQL);
 FExecuteCommandPureCommand.Parameters[2].Value.SetBoolean(Error);
 FExecuteCommandPureCommand.Parameters[3].Value.SetWideString(MessageError);
 FExecuteCommandPureCommand.Parameters[4].Value.SetBoolean(Execute);
 FExecuteCommandPureCommand.Execute(ARequestFilter);
 Error := FExecuteCommandPureCommand.Parameters[2].Value.GetBoolean;
 MessageError := FExecuteCommandPureCommand.Parameters[3].Value.GetWideString;
 If Not FExecuteCommandPureCommand.Parameters[5].Value.IsNull Then
  Begin
   If Not Execute Then
    Begin
     FUnMarshal := TDSRestCommand(FExecuteCommandPureCommand.Parameters[5].ConnectionHandler).GetJSONUnMarshaler;
     Try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FExecuteCommandPureCommand.Parameters[5].Value.GetJSONValue(True)));
      If FInstanceOwner Then
       FExecuteCommandPureCommand.FreeOnExecute(Result);
     Finally
      FreeAndNil(FUnMarshal);
     End;
    End;
  End
 Else
  Result := Nil;
End;

Function TSMPoolerMethodClient.ExecuteCommand(Pooler               : String;
                                              Method_Prefix        : String;
                                              SQL                  : String;
                                              Params               : TParams;
                                              Var Error            : Boolean;
                                              Var MessageError     : String;
                                              Execute              : Boolean;
                                              Const ARequestFilter : String) : TFDJSONDataSets;
Begin
 If FExecuteCommandCommand = Nil Then
  Begin
   FExecuteCommandCommand := FConnection.CreateCommand;
   FExecuteCommandCommand.RequestType := 'POST';
   FExecuteCommandCommand.Text := Method_Prefix + '."ExecuteCommand"';
   FExecuteCommandCommand.Prepare(TSMPoolerMethodClient_ExecuteCommand);
  End;
 FExecuteCommandCommand.Parameters[0].Value.SetWideString(Pooler);
 FExecuteCommandCommand.Parameters[1].Value.SetWideString(SQL);
 FExecuteCommandCommand.Parameters[2].Value.SetDBXReader(TDBXParamsReader.Create(Params, FInstanceOwner), True);
 FExecuteCommandCommand.Parameters[3].Value.SetBoolean(Error);
 FExecuteCommandCommand.Parameters[4].Value.SetWideString(MessageError);
 FExecuteCommandCommand.Parameters[5].Value.SetBoolean(Execute);
 FExecuteCommandCommand.Execute(ARequestFilter);
 Error := FExecuteCommandCommand.Parameters[3].Value.GetBoolean;
 MessageError := FExecuteCommandCommand.Parameters[4].Value.GetWideString;
 If Not FExecuteCommandCommand.Parameters[6].Value.IsNull Then
  Begin
   If Not Execute Then
    Begin
     FUnMarshal := TDSRestCommand(FExecuteCommandCommand.Parameters[6].ConnectionHandler).GetJSONUnMarshaler;
     Try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FExecuteCommandCommand.Parameters[6].Value.GetJSONValue(True)));
      If FInstanceOwner Then
       FExecuteCommandCommand.FreeOnExecute(Result);
     Finally
      FreeAndNil(FUnMarshal);
     End;
    End;
  End
 Else
  Result := Nil;
End;

Function TSMPoolerMethodClient.EchoPooler(Value, Method_Prefix: string; const ARequestFilter: string): string;
Begin
 If FEchoPoolerCommand = Nil Then
  Begin
   FEchoPoolerCommand := FConnection.CreateCommand;
   FEchoPoolerCommand.RequestType := 'GET';
   FEchoPoolerCommand.Text := Method_Prefix + '.EchoPooler';
   FEchoPoolerCommand.Prepare(TSMPoolerMethodClient_EchoPooler);
  End;
 FEchoPoolerCommand.Parameters[0].Value.SetWideString(Value);
 FEchoPoolerCommand.Execute(ARequestFilter);
 Result := FEchoPoolerCommand.Parameters[1].Value.GetWideString;
end;

Function TSMPoolerMethodClient.PoolersDataSet(Method_Prefix: string;const ARequestFilter: string): TStringList;
Var
 vTempString : String;
Begin
 If FPoolersDataSetCommand = Nil then
  Begin
   FPoolersDataSetCommand             := FConnection.CreateCommand;
   FPoolersDataSetCommand.RequestType := 'GET';
   FPoolersDataSetCommand.Text        := Method_Prefix + '.PoolersDataSet';
   FPoolersDataSetCommand.Prepare(TSMPoolerMethodClient_PoolersDataSet);
  End;
 FPoolersDataSetCommand.Execute(ARequestFilter);
 vTempString := FPoolersDataSetCommand.Parameters[0].Value.GetWideString;
 Result      := TStringList.Create;
 While Not (vTempString = '') Do
  Begin
   if Pos('|', vTempString) > 0 then
    Begin
     Result.Add(Copy(vTempString, 1, Pos('|', vTempString) -1));
     Delete(vTempString, 1, Pos('|', vTempString) -1);
    End
   Else
    Begin
     Result.Add(Copy(vTempString, 1, Length(vTempString)));
     Delete(vTempString, 1, Length(vTempString));
    End;
  End;
End;

Constructor TSMPoolerMethodClient.Create(ARestConnection: TDSRestConnection);
Begin
 inherited Create(ARestConnection);
 FInstanceOwner := True;
End;

Constructor TSMPoolerMethodClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
Begin
 inherited Create(ARestConnection, AInstanceOwner);
End;

Destructor TSMPoolerMethodClient.Destroy;
Begin
 FEchoPoolerCommand.DisposeOf;
 FPoolersDataSetCommand.DisposeOf;
 FPoolersDataSetCommand_Cache.DisposeOf;
 FEchoStringCommand.DisposeOf;
 inherited;
End;

end.

