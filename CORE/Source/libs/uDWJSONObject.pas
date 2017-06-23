unit uDWJSONObject;

interface

Uses System.SysUtils, SysTypes, System.Classes, uDWJSONTools, uDWConsts, IdGlobal, uKBDynamic,
     System.Rtti,     Data.DB;

Const
 TValueFormatJSON   = '%s|%s|%s|';
 TJsonDatasetHeader = '%s|%s|%d|%d|%s|';
 TJsonValueFormat   = '%d|%s|';

Type
 TJSONValue = Class
 Private
  vTypeObject                : TTypeObject;
  vObjectDirection           : TObjectDirection;
  vObjectValue               : TObjectValue;
  aValue                     : TIdBytes;
  vEncoding                  : TEncoding;
  Function  GetValue         : String;
  Procedure WriteValue(Value : String);
 Public
  Property    TypeObject                  : TTypeObject      Read vTypeObject      Write vTypeObject;
  Property    ObjectDirection             : TObjectDirection Read vObjectDirection Write vObjectDirection;
  Property    ObjectValue                 : TObjectValue     Read vObjectValue     Write vObjectValue;
  Property    Encoding                    : TEncoding        Read vEncoding        Write vEncoding;
  Property    Value                       : String           Read GetValue         Write WriteValue;
  Procedure   ToStream       (Var Value   : TMemoryStream);
  Procedure   LoadFromDataset(TableName   : String;
                              Value       : TDataset);
  Procedure   WriteToDataset (DatasetType : TDatasetType;
                              TableName   : String;
                              var DestDS  : TDataset);
  Constructor Create;
  Destructor  Destroy;Override;
End;

implementation

Function EscapeQuotes(Const S : String) : String;
Begin
 //Easy but not best performance
 Result := StringReplace(S,      '\', TSepValueMemString,    [rfReplaceAll]);
 Result := StringReplace(Result, '"', TQuotedValueMemString, [rfReplaceAll]);
End;

Function RevertQuotes(Const S : String) : String;
Begin
 //Easy but not best performance
 Result := StringReplace(S,      TSepValueMemString,    '\', [rfReplaceAll]);
 Result := StringReplace(Result, TQuotedValueMemString, '"', [rfReplaceAll]);
End;

{ TJSONValue }

Constructor TJSONValue.Create;
Begin
 vEncoding       := TEncoding.ANSI;
 vTypeObject     := toObject;
 ObjectDirection := odINOUT;
 vObjectValue    := ovString;
End;

Destructor TJSONValue.Destroy;
Begin
 SetLength(aValue, 0);
 inherited;
End;

Function  TJSONValue.GetValue : String;
Begin
 Result := vEncoding.GetString(TBytes(aValue));
End;

Procedure TJSONValue.LoadFromDataset(TableName : String;
                                     Value     : TDataset);
Begin

End;

Procedure TJSONValue.ToStream(var Value : TMemoryStream);
Begin
 If Length(aValue) > 0 Then
  Begin
   Value := TMemoryStream.Create;
   Value.Write(aValue[0], -1);
  End
 Else
  Value := Nil;
End;

Procedure TJSONValue.WriteToDataset(DatasetType : TDatasetType;
                                    TableName   : String;
                                    var DestDS  : TDataset);
Begin

End;

Procedure TJSONValue.WriteValue(Value : String);
Begin
 SetLength(aValue, 0);
 aValue := tIdBytes(vEncoding.GetBytes(Value));
End;

end.
