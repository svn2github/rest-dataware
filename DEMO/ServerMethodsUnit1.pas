//
// FireDACJSONReflect demo
// Copyright (c) 1995-2013 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//
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
     WebModuleUnit1,          uRestPoolerDB;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDConnectionEMPLOYEE: TFDConnection;
    RESTPoolerDB: TRESTPoolerDB;
    procedure FDConnectionEMPLOYEEBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //Echo Commands
    Function EchoPooler(Value: String): String;
    Function PoolersDataSet : String;
    //Execute commands
    Function ExecuteCommandPure(Pooler     : String;
                                SQL        : String;
                                Var Error  : Boolean;
                                Var MessageError : String;
                                Execute    : Boolean = False) : TFDJSONDataSets;Overload;
    Function ExecuteCommand(Pooler     : String;
                            SQL        : String;
                            Params     : TParams;
                            Var Error  : Boolean;
                            Var MessageError : String;
                            Execute    : Boolean = False) : TFDJSONDataSets;Overload;
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
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils, System.Generics.Collections;

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
      Result := Format('%s.%s', [Self.Name, Components[i].Name])
     Else
      Result := Result + '|' + Format('%s.%s', [Self.Name, Self.Components[i].Name]);
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
 vTempPooler := UpperCase(StringReplace(Pooler, Self.Name + '.', '', [rfReplaceAll, rfIgnoreCase]));
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
 vTempPooler := UpperCase(StringReplace(Pooler, Self.Name + '.', '', [rfReplaceAll, rfIgnoreCase]));
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
 vTempPooler := UpperCase(StringReplace(Pooler, Self.Name + '.', '', [rfReplaceAll, rfIgnoreCase]));
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
 vTempPooler := UpperCase(StringReplace(Pooler, Self.Name + '.', '', [rfReplaceAll, rfIgnoreCase]));
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

procedure TServerMethods1.FDConnectionEMPLOYEEBeforeConnect(Sender: TObject);
begin
 FDConnectionEMPLOYEE.Params.Database := 'localhost:' + ExtractFilePath(ParamSTR(0)) + 'EMPLOYEE.GDB';
end;

end.

