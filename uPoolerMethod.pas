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
   FExecuteCommandJSONCommand,
   FExecuteCommandPureCommand,
   FExecuteCommandPureJSONCommand,
   FApplyChangesPureCommand,
   FApplyChangesCommand          : TDSRestCommand;
  Public
   Constructor Create(ARestConnection: TDSRestConnection); Overload;
   Constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); Overload;
   Destructor  Destroy; override;
   //Faz uma chamada de Execução para verificar o funcionamento do WebService
   Function    EchoPooler(Value, Method_Prefix : String;
                          Const ARequestFilter : String = '')     : String;
   //Retorna todos os Poolers no DataModule do WebService
   Function    PoolersDataSet(Method_Prefix        : String;
                              Const ARequestFilter : String = '') : TStringList;
   //Roda Comando SQL
   Function    ExecuteCommand    (Pooler,
                                  Method_Prefix,
                                  SQL                  : String;
                                  Params               : TParams;
                                  Var Error            : Boolean;
                                  Var MessageError     : String;
                                  Execute              : Boolean;
                                  Const ARequestFilter : String = '') : TFDJSONDataSets;
   Function    ExecuteCommandJSON(Pooler,
                                  Method_Prefix,
                                  SQL                  : String;
                                  Params               : TParams;
                                  Var Error            : Boolean;
                                  Var MessageError     : String;
                                  Execute              : Boolean;
                                  Const ARequestFilter : String = '') : TJSONObject;

   Function    ExecuteCommandPure(Pooler,
                                  Method_Prefix,
                                  SQL                  : String;
                                  Var Error            : Boolean;
                                  Var MessageError     : String;
                                  Execute              : Boolean;
                                  Const ARequestFilter : String = '') : TFDJSONDataSets;
   Function    ExecuteCommandPureJSON(Pooler,
                                      Method_Prefix,
                                      SQL              : String;
                                      Var Error: Boolean;
                                      Var MessageError : String;
                                      Execute: Boolean;
                                      Const ARequestFilter: string = ''): TJSONObject;
   //Executa um ApplyUpdate no Servidor
   Procedure   ApplyChangesPure  (Pooler,
                                  Method_Prefix,
                                  TableName,
                                  SQL                  : String;
                                  ADeltaList           : TFDJSONDeltas;
                                  Var Error            : Boolean;
                                  Var MessageError     : String;
                                  Const ARequestFilter : String = '');
   Procedure   ApplyChanges      (Pooler,
                                  Method_Prefix,
                                  TableName,
                                  SQL                  : String;
                                  Params               : TParams;
                                  ADeltaList           : TFDJSONDeltas;
                                  Var Error            : Boolean;
                                  Var MessageError     : String;
                                  Const ARequestFilter : String = '');
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

  TSMPoolerMethodClient_ExecuteCommandJSON: array [0..6] of TDSRestParameterMetaData =
  (
    (Name: 'Pooler'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'SQL'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Params'; Direction: 1; DBXType: 23; TypeName: 'TParams'),
    (Name: 'Error'; Direction: 3; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'MessageError'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: 'Execute'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONObject')
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

  TSMPoolerMethodClient_ExecuteCommandPureJSON: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'Pooler'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'SQL'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Error'; Direction: 3; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'MessageError'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: 'Execute'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONObject')
  );

  TSMPoolerMethodClient_ApplyChangesPure: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'Pooler'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'TableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'SQL'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas'),
    (Name: 'Error'; Direction: 3; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'MessageError'; Direction: 3; DBXType: 26; TypeName: 'string')
  );

  TSMPoolerMethodClient_ApplyChanges: array [0..6] of TDSRestParameterMetaData =
  (
    (Name: 'Pooler'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'TableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'SQL'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Params'; Direction: 1; DBXType: 23; TypeName: 'TParams'),
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas'),
    (Name: 'Error'; Direction: 3; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'MessageError'; Direction: 3; DBXType: 26; TypeName: 'string')
  );

implementation

Function EncodeStrings(Value : String) : String;
Begin
 Result := StringReplace(Value,  '%', '|:|', [rfReplaceAll, rfIgnoreCase]); //Sinal de %
 Result := StringReplace(Result, '/', '|*|', [rfReplaceAll, rfIgnoreCase]); //Sinal de /
 Result := StringReplace(Result, '-', '|A|', [rfReplaceAll, rfIgnoreCase]); //Sinal de -
 Result := StringReplace(Result, '.', '|B|', [rfReplaceAll, rfIgnoreCase]); //Sinal de .
End;

Function DecodeStrings(Value : String) : String;
Begin
 Result := StringReplace(Value,  '|:|', '%', [rfReplaceAll, rfIgnoreCase]); //Sinal de %
 Result := StringReplace(Result, '|*|', '/', [rfReplaceAll, rfIgnoreCase]); //Sinal de /
 Result := StringReplace(Result, '|A|', '-', [rfReplaceAll, rfIgnoreCase]); //Sinal de -
 Result := StringReplace(Result, '|B|', '.', [rfReplaceAll, rfIgnoreCase]); //Sinal de .
End;

Procedure TSMPoolerMethodClient.ApplyChangesPure(Pooler,
                                                 Method_Prefix,
                                                 TableName,
                                                 SQL                  : String;
                                                 ADeltaList           : TFDJSONDeltas;
                                                 Var Error            : Boolean;
                                                 Var MessageError     : String;
                                                 Const ARequestFilter : String = '');
Begin
 If FApplyChangesPureCommand = Nil Then
  Begin
   FApplyChangesPureCommand := FConnection.CreateCommand;
   FApplyChangesPureCommand.RequestType := 'POST';
   FApplyChangesPureCommand.Text := Method_Prefix + '."ApplyChangesPure"';
   FApplyChangesPureCommand.Prepare(TSMPoolerMethodClient_ApplyChangesPure);
  End;
 FApplyChangesPureCommand.Parameters[0].Value.SetWideString(Pooler);
 FApplyChangesPureCommand.Parameters[1].Value.SetWideString(TableName);
 FApplyChangesPureCommand.Parameters[2].Value.SetWideString(SQL);
 If Not Assigned(ADeltaList) Then
  FApplyChangesPureCommand.Parameters[3].Value.SetNull
 Else
  Begin
   FMarshal := TDSRestCommand(FApplyChangesPureCommand.Parameters[3].ConnectionHandler).GetJSONMarshaler;
   Try
    FApplyChangesPureCommand.Parameters[3].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
    If FInstanceOwner Then
     ADeltaList.Free;
   Finally
    FreeAndNil(FMarshal);
   End;
  End;
 FApplyChangesPureCommand.Parameters[4].Value.SetBoolean(Error);
 FApplyChangesPureCommand.Parameters[5].Value.SetWideString(MessageError);
 FApplyChangesPureCommand.Execute(ARequestFilter);
 Error := FApplyChangesPureCommand.Parameters[4].Value.GetBoolean;
 MessageError := FApplyChangesPureCommand.Parameters[5].Value.GetWideString;
End;

Procedure TSMPoolerMethodClient.ApplyChanges(Pooler,
                                             Method_Prefix,
                                             TableName,
                                             SQL                  : String;
                                             Params               : TParams;
                                             ADeltaList           : TFDJSONDeltas;
                                             Var Error            : Boolean;
                                             Var MessageError     : String;
                                             Const ARequestFilter : String = '');
Begin
 If FApplyChangesCommand = Nil Then
  Begin
   FApplyChangesCommand := FConnection.CreateCommand;
   FApplyChangesCommand.RequestType := 'POST';
   FApplyChangesCommand.Text := Method_Prefix + '."ApplyChanges"';
   FApplyChangesCommand.Prepare(TSMPoolerMethodClient_ApplyChanges);
  End;
 FApplyChangesCommand.Parameters[0].Value.SetWideString(Pooler);
 FApplyChangesCommand.Parameters[1].Value.SetWideString(TableName);
 FApplyChangesCommand.Parameters[2].Value.SetWideString(SQL);
 FApplyChangesCommand.Parameters[3].Value.SetDBXReader(TDBXParamsReader.Create(Params, FInstanceOwner), True);
 If Not Assigned(ADeltaList) Then
  FApplyChangesCommand.Parameters[4].Value.SetNull
 Else
  Begin
   FMarshal := TDSRestCommand(FApplyChangesCommand.Parameters[4].ConnectionHandler).GetJSONMarshaler;
   Try
    FApplyChangesCommand.Parameters[4].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
    If FInstanceOwner Then
     ADeltaList.Free;
   Finally
    FreeAndNil(FMarshal);
   End
  End;
 FApplyChangesCommand.Parameters[5].Value.SetBoolean(Error);
 FApplyChangesCommand.Parameters[6].Value.SetWideString(MessageError);
 FApplyChangesCommand.Execute(ARequestFilter);
 Error        := FApplyChangesCommand.Parameters[5].Value.GetBoolean;
 MessageError := FApplyChangesCommand.Parameters[6].Value.GetWideString;
end;

Function TSMPoolerMethodClient.ExecuteCommandPureJSON(Pooler,
                                                      Method_Prefix,
                                                      SQL                  : String;
                                                      Var Error            : Boolean;
                                                      Var MessageError     : String;
                                                      Execute              : Boolean;
                                                      Const ARequestFilter : string = ''): TJSONObject;
Begin
 If FExecuteCommandPureJSONCommand = Nil Then
  Begin
   FExecuteCommandPureJSONCommand := FConnection.CreateCommand;
   FExecuteCommandPureJSONCommand.RequestType := 'GET';
   FExecuteCommandPureJSONCommand.Text := Method_Prefix + '.ExecuteCommandPureJSON';
   FExecuteCommandPureJSONCommand.Prepare(TSMPoolerMethodClient_ExecuteCommandPureJSON);
  End;
 FExecuteCommandPureJSONCommand.Parameters[0].Value.SetWideString(Pooler);
 FExecuteCommandPureJSONCommand.Parameters[1].Value.SetWideString(SQL);
 FExecuteCommandPureJSONCommand.Parameters[2].Value.SetBoolean(Error);
 FExecuteCommandPureJSONCommand.Parameters[3].Value.SetWideString(MessageError);
 FExecuteCommandPureJSONCommand.Parameters[4].Value.SetBoolean(Execute);
 FExecuteCommandPureJSONCommand.Execute(ARequestFilter);
 Error := FExecuteCommandPureJSONCommand.Parameters[2].Value.GetBoolean;
 MessageError := FExecuteCommandPureJSONCommand.Parameters[3].Value.GetWideString;
 Result := TJSONObject(FExecuteCommandPureJSONCommand.Parameters[5].Value.GetJSONValue(FInstanceOwner));
End;


Function TSMPoolerMethodClient.ExecuteCommandPure(Pooler,
                                                  Method_Prefix,
                                                  SQL                  : String;
                                                  Var Error            : Boolean;
                                                  Var MessageError     : String;
                                                  Execute              : Boolean;
                                                  const ARequestFilter : String = ''): TFDJSONDataSets;
Begin
 Result := Nil;
 If FExecuteCommandPureCommand = Nil Then
  Begin
   FExecuteCommandPureCommand := FConnection.CreateCommand;
   FExecuteCommandPureCommand.RequestType := 'GET';
   FExecuteCommandPureCommand.Text := Method_Prefix + '.ExecuteCommandPure';
   FExecuteCommandPureCommand.Prepare(TSMPoolerMethodClient_ExecuteCommandPure);
  End;
 FExecuteCommandPureCommand.Parameters[0].Value.SetWideString(Pooler);
 FExecuteCommandPureCommand.Parameters[1].Value.SetWideString(EncodeStrings(SQL));
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
  End;
End;

Function TSMPoolerMethodClient.ExecuteCommandJSON(Pooler,
                                                  Method_Prefix,
                                                  SQL                  : String;
                                                  Params               : TParams;
                                                  Var Error            : Boolean;
                                                  Var MessageError     : String;
                                                  Execute              : Boolean;
                                                  Const ARequestFilter : String) : TJSONObject;
Begin
 If FExecuteCommandJSONCommand = Nil Then
  Begin
   FExecuteCommandJSONCommand := FConnection.CreateCommand;
   FExecuteCommandJSONCommand.RequestType := 'POST';
   FExecuteCommandJSONCommand.Text := Method_Prefix + '."ExecuteCommandJSON"';
   FExecuteCommandJSONCommand.Prepare(TSMPoolerMethodClient_ExecuteCommandJSON);
  End;
 FExecuteCommandJSONCommand.Parameters[0].Value.SetWideString(Pooler);
 FExecuteCommandJSONCommand.Parameters[1].Value.SetWideString(SQL);
 FExecuteCommandJSONCommand.Parameters[2].Value.SetDBXReader(TDBXParamsReader.Create(Params, FInstanceOwner), True);
 FExecuteCommandJSONCommand.Parameters[3].Value.SetBoolean(Error);
 FExecuteCommandJSONCommand.Parameters[4].Value.SetWideString(MessageError);
 FExecuteCommandJSONCommand.Parameters[5].Value.SetBoolean(Execute);
 FExecuteCommandJSONCommand.Execute(ARequestFilter);
 Error := FExecuteCommandJSONCommand.Parameters[3].Value.GetBoolean;
 MessageError := FExecuteCommandJSONCommand.Parameters[4].Value.GetWideString;
 Result := TJSONObject(FExecuteCommandJSONCommand.Parameters[6].Value.GetJSONValue(FInstanceOwner));
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
 Result := Nil;
 If FExecuteCommandCommand = Nil Then
  Begin
   FExecuteCommandCommand := FConnection.CreateCommand;
   FExecuteCommandCommand.RequestType := 'POST';
   FExecuteCommandCommand.Text := Method_Prefix + '."ExecuteCommand"';
   FExecuteCommandCommand.Prepare(TSMPoolerMethodClient_ExecuteCommand);
  End;
 FExecuteCommandCommand.Parameters[0].Value.SetWideString(Pooler);
 FExecuteCommandCommand.Parameters[1].Value.SetWideString(EncodeStrings(SQL));
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
  End;
End;

Function TSMPoolerMethodClient.EchoPooler(Value, Method_Prefix : String;
                                          Const ARequestFilter : String) : String;
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

Function TSMPoolerMethodClient.PoolersDataSet(Method_Prefix        : String;
                                              Const ARequestFilter : String) : TStringList;
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

