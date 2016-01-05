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

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Phys.IB, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, Data.FireDACJSONReflect, System.JSON,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FireDAC.Phys.IBDef,
  WebModuleUnit1, uRestPoolerDB;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDQueryDepartmentEmployees: TFDQuery;
    FDQueryDepartment: TFDQuery;
    FDQueryDepartmentNames: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDConnectionEMPLOYEE: TFDConnection;
    RESTPoolerDB: TRESTPoolerDB;
  private
    { Private declarations }
  public
    { Public declarations }
    Function EchoPooler(Value: String): String;
    Function PoolersDataSet : String;
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
    // Strongly typed methods
    function GetDepartmentNames: TFDJSONDataSets;
    function GetDepartmentEmployees(const AID: string): TFDJSONDataSets;
    procedure ApplyChangesDepartmentEmployees(
      const ADeltaList: TFDJSONDeltas);
    // Equivalent TJSONObject methods (C++ compatible)
    function GetDepartmentNamesJSON: TJSONObject;
    function GetDepartmentEmployeesJSON(const AID: string): TJSONObject;
    procedure ApplyChangesDepartmentEmployeesJSON(
      const AJSONObject: TJSONObject);
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils, System.Generics.Collections;

const
  sDepartment = 'Department';
  sEmployees = 'Employees';

// Get a Department and all Employees in the department.  Result TFDJSONDataSets.

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
 vTempPooler := UpperCase(StringReplace(Pooler, Self.Name + '.', '', [rfReplaceAll, rfIgnoreCase]));
 For I := 0 to ComponentCount -1 Do
  Begin
   If Components[i] is TRESTPoolerDB Then
    Begin
     If UpperCase(Components[i].Name) = vTempPooler Then
      Begin
       Result := TRESTPoolerDB(Components[i]).ExecuteCommand(SQL, Params, Error, MessageError, Execute);
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

function TServerMethods1.GetDepartmentEmployees(
  const AID: string): TFDJSONDataSets;
begin
  // Clear active so that query will reexecute
  FDQueryDepartmentEmployees.Active := False;
  FDQueryDepartment.Active := False;
  FDQueryDepartment.Params[0].Value := AID;
  FDQueryDepartmentEmployees.Params[0].Value := AID;

  // Create dataset list
  Result := TFDJSONDataSets.Create;
  // Add departments dataset
  TFDJSONDataSetsWriter.ListAdd(Result, sDepartment, FDQueryDepartment);
  // Add employees dataset
  TFDJSONDataSetsWriter.ListAdd(Result, sEmployees, FDQueryDepartmentEmployees);
end;

// Get a Department and all Employees in the department.  Return TJSONObject.
function TServerMethods1.GetDepartmentEmployeesJSON(
  const AID: string): TJSONObject;
var
  LDataSets: TFDJSONDataSets;
begin
  LDataSets := GetDepartmentEmployees(AID);
  try
    Result := TJSONObject.Create;
    TFDJSONInterceptor.DataSetsToJSONObject(LDataSets, Result)
  finally
    LDataSets.Free;
  end;
end;

// Update department and employees using deltas.  TFDJSONDeltas parameter.
procedure TServerMethods1.ApplyChangesDepartmentEmployees(
  const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  // Create the apply object
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
  // Apply the department delta
  LApply.ApplyUpdates(sDepartment, FDQueryDepartment.Command);
  if LApply.Errors.Count = 0 then
    // If no errors, apply the employee delta
    LApply.ApplyUpdates(sEmployees, FDQueryDepartmentEmployees.Command);
  if LApply.Errors.Count > 0 then
    // Raise an exception if any errors.
    raise Exception.Create(LApply.Errors.Strings.Text);
end;

// Update department and employees using deltas.  TJSONObject parameter.
procedure TServerMethods1.ApplyChangesDepartmentEmployeesJSON(
  const AJSONObject: TJSONObject);
var
  LDeltas: TFDJSONDeltas;
begin
  LDeltas := TFDJSONDeltas.Create;
  TFDJSONInterceptor.JSONObjectToDataSets(AJSONObject, LDeltas);
  ApplyChangesDepartmentEmployees(LDeltas);
end;

// Get all Departments.  Result TFDJSONDataSets.
function TServerMethods1.GetDepartmentNames: TFDJSONDataSets;
begin
  // Clear active so that query will reexecute
  FDQueryDepartmentNames.Active := False;

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, FDQueryDepartmentNames);
end;

// Get all Departments.  Result TFDJSONDataSets;
function TServerMethods1.GetDepartmentNamesJSON: TJSONObject;
var
  LDataSets: TFDJSONDataSets;
begin
  LDataSets := GetDepartmentNames;
  try
    Result := TJSONObject.Create;
    TFDJSONInterceptor.DataSetsToJSONObject(LDataSets, Result);
  finally
    LDataSets.Free;
  end;
end;

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

end.

