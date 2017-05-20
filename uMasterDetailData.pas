unit uMasterDetailData;

Interface

Uses System.SysUtils, System.Classes, Datasnap.DSServer;

Type
 TRESTClientSQL    = Class End;
 TMasterDetailItem = Class
 Private
  vDataSet : TRESTClientSQL;
  vFields  : TStringList;
 Protected
 Public
  Constructor Create;
  Destructor  Free;
  Procedure   ParseFields(Value : String);
  Property    DataSet : TRESTClientSQL Read vDataSet Write vDataSet;
  Property    Fields  : TStringList    Read vFields  Write vFields;
End;

Type
 TMasterDetailList = Class(TList)
 Private
  Function  GetRec(Index    : Integer)      : TMasterDetailItem;  Overload;
  Procedure PutRec(Index    : Integer; Item : TMasterDetailItem); Overload;
 Protected
 Public
  Procedure Delete(Index : Integer);                              Overload;
  Procedure Delete(Value : TRESTClientSQL);                       Overload;
  Function  Add   (Item  : TMasterDetailItem) : Integer;          Overload;
  Property  Items[Index  : Integer]           : TMasterDetailItem   Read GetRec Write PutRec; Default;
End;

Implementation

{ TMasterDetailList }

Function TMasterDetailList.Add(Item: TMasterDetailItem): Integer;
Var
 vItem : ^TMasterDetailItem;
Begin
 New(vItem);
 vItem^ := Item;
 Result := TList(Self).Add(vItem);
End;

Procedure TMasterDetailList.Delete(Index: Integer);
Begin
 If (Index < Self.Count) And (Index > -1) Then
  Begin
   If Assigned(TList(Self).Items[Index]) Then
    FreeMem(TList(Self).Items[Index]);
   TList(Self).Delete(Index);
  End;
End;

Procedure TMasterDetailList.Delete(Value : TRESTClientSQL);
Var
 I : Integer;
Begin
 For I := 0 To Self.Count -1 Do
  Begin
   If (TMasterDetailItem(TList(Self).Items[I]^)          <> Nil)   And
      (TMasterDetailItem(TList(Self).Items[I]^).vDataSet =  Value) Then
    Begin
     If Assigned(TList(Self).Items[I]) Then
      FreeMem(TList(Self).Items[I]);
     TList(Self).Delete(I);
     Break;
    End;
  End;
End;

Function TMasterDetailList.GetRec(Index: Integer): TMasterDetailItem;
Begin
 Result := Nil;
 If (Index < Self.Count) And (Index > -1) Then
  Result := TMasterDetailItem(TList(Self).Items[Index]^);
End;

Procedure TMasterDetailList.PutRec(Index: Integer; Item: TMasterDetailItem);
Begin
 If (Index < Self.Count) And (Index > -1) Then
  TMasterDetailItem(TList(Self).Items[Index]^) := Item;
End;

{ TMasterDetailItem }

Constructor TMasterDetailItem.Create;
Begin
 vFields := TStringList.Create;
End;

Destructor TMasterDetailItem.Free;
Begin
 vFields.Free;
End;

Procedure TMasterDetailItem.ParseFields(Value : String);
Begin
// vFields
End;

end.
