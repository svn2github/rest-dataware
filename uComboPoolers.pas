unit uComboPoolers;

interface

uses
 System.Classes,
 DesignEditors,
 DesignIntf,
 uRestPoolerDB;

Type
 TPoolersList = Class(TStringProperty)
 Public
  Function  GetAttributes  : TPropertyAttributes; Override;
  Procedure GetValues(Proc : TGetStrProc);        Override;
  Procedure Edit;                                 Override;
End;

Procedure Register;

implementation

{$IFDEF MSWINDOWS}
Procedure Register;
Begin
 RegisterComponents('REST Dataware',     [TRESTPoolerDB, TRESTDataBase, TRESTClientSQL, TRESTPoolerList]);
 RegisterPropertyEditor(TypeInfo(String), TRESTDataBase, 'PoolerName', TPoolersList);
End;
{$ENDIF}
{$IFNDEF MSWINDOWS}
Procedure Register;
Begin
 RegisterComponents('REST Dataware',      [TRESTDataBase, TRESTClientSQL, TRESTPoolerList]);
 RegisterPropertyEditor(TypeInfo(String), TRESTDataBase, 'PoolerName', TPoolersList);
End;
{$ENDIF}

procedure TPoolersList.Edit;
Var
 vTempData : String;
Begin
 Inherited Edit;
 Try
  vTempData := GetValue;
  SetValue(vTempData);
 Finally
 End;
end;

Procedure TPoolersList.GetValues(Proc : TGetStrProc);
Var
 vLista : TStringList;
 I      : Integer;
Begin
 //Provide a list of Poolers
 With GetComponent(0) as TRESTDataBase Do
  Begin
   Try
    vLista := TRESTDataBase(GetComponent(0)).GetRestPoolers;
    For I := 0 To vLista.Count -1 Do
     Proc (vLista[I]);
   Except
   End;
   If vLista <> Nil Then
    vLista.DisposeOf;
  End;
End;

Function TPoolersList.GetAttributes : TPropertyAttributes;
Begin
  // editor, sorted list, multiple selection
 Result := [paValueList, paSortList];
End;

end.
