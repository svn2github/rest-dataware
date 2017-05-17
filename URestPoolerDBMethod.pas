unit URestPoolerDBMethod;

interface
    uses System.SysUtils,         System.Classes,           Datasnap.DSServer,  Datasnap.DSAuth,
     FireDAC.Stan.Intf,       FireDAC.Stan.Option,      FireDAC.Stan.Param,
     FireDAC.Stan.Error,      FireDAC.DatS,             FireDAC.Phys.Intf,  FireDAC.DApt.Intf,
     FireDAC.Stan.Async,      FireDAC.DApt,             FireDAC.UI.Intf,    FireDAC.VCLUI.Wait,
     FireDAC.Stan.Def,        FireDAC.Stan.Pool,        FireDAC.Phys,       Data.DB,
     FireDAC.Comp.Client,     FireDAC.Phys.IBBase,      FireDAC.Phys.IB,    FireDAC.Comp.UI,
     FireDAC.Comp.DataSet,    Data.FireDACJSONReflect,  System.JSON,
     FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FireDAC.Phys.IBDef,
     Vcl.Dialogs,              TypInfo,
     Vcl.Forms, uRestPoolerDB;

  type

   Tmodule=class helper for TDataModule
    private

    published

      Function GetUnitClassName : String;
      Function GetPoolerName(Value : String) : String;
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
implementation

{ Tmodule }

procedure Tmodule.ApplyChanges(Pooler, TableName, SQL: String; Params: TParams;
  const ADeltaList: TFDJSONDeltas; var Error: Boolean;
  var MessageError: String);
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

procedure Tmodule.ApplyChangesPure(Pooler, TableName, SQL: String;
  const ADeltaList: TFDJSONDeltas; var Error: Boolean;
  var MessageError: String);
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

function Tmodule.EchoPooler(Value: String): String;
begin
  Result := String('127.0.0.1');
end;

function Tmodule.ExecuteCommand(Pooler, SQL: String; Params: TParams;
  var Error: Boolean; var MessageError: String;
  Execute: Boolean): TFDJSONDataSets;
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

function Tmodule.ExecuteCommandJSON(Pooler, SQL: String; Params: TParams;
  var Error: Boolean; var MessageError: String; Execute: Boolean): TJSONObject;
Var
 LDataSets : TFDJSONDataSets;
Begin
  LDataSets := ExecuteCommand(Pooler, SQL, Params, Error, MessageError, Execute);
  Try
   Result := TJSONObject.Create;
   TFDJSONInterceptor.DataSetsToJSONObject(LDataSets, Result)
  Finally
   LDataSets.Free;
  End;
End;

function Tmodule.ExecuteCommandPure(Pooler, SQL: String; var Error: Boolean;
  var MessageError: String; Execute: Boolean): TFDJSONDataSets;
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

function Tmodule.ExecuteCommandPureJSON(Pooler, SQL: String; var Error: Boolean;
  var MessageError: String; Execute: Boolean): TJSONObject;
Var
 LDataSets : TFDJSONDataSets;
Begin
 LDataSets := ExecuteCommandPure(Pooler, SQL, Error, MessageError, Execute);
 Try
  Result := TJSONObject.Create;
  TFDJSONInterceptor.DataSetsToJSONObject(LDataSets, Result)
 Finally
  LDataSets.Free;
 End;
End;

procedure Tmodule.GetPoolerList(var PoolerList: TStringList);
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

function Tmodule.GetPoolerName(Value: String): String;
begin
 Result := Value;
 If Pos('.', Result) > 0 Then
  Result := Copy(Result, Pos('.', Result) +1, Length(Result));
end;

function Tmodule.GetUnitClassName: String;
Var
 VMT,
 P    : Pointer;
Begin
 Result := '';
 VMT:= Pointer(self.ClassType);
 P:= PPointer(PByte(VMT) + vmtTypeInfo)^;
 If P <> Nil Then
  Result := GetTypeData(P).UnitName;
End;


function Tmodule.InsertValue(Pooler, SQL: String; Params: TParams;
  var Error: Boolean; var MessageError: String): Integer;
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

function Tmodule.InsertValuePure(Pooler, SQL: String; var Error: Boolean;
  var MessageError: String): Integer;
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

function Tmodule.PoolersDataSet: String;
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
      Result := Result + '|' + Format('%s.%s', [GetUnitClassName, Components[i].Name]);
    End;
  End;
end;





end.
