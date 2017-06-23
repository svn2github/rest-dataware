unit uDWJSONObject;

interface

Uses
     {$IFDEF LCL}
     SysUtils, SysTypes,   Classes, uDWJSONTools, uDWConsts,
     IdGlobal,        uKBDynamic,   DB;
     {$ELSE}
     System.SysUtils, SysTypes,   System.Classes, uDWJSONTools, uDWConsts,
     IdGlobal,        uKBDynamic, System.Rtti,    Data.DB;
     {$ENDIF}


Const
 TValueFormatJSON   = '"%s":%s, "%s":%s, "%s":%s';
 TJsonDatasetHeader = '"%s":%s, "%s":%s, "%s":%d, "%s":%d, "%s":%s';
 TJsonValueFormat   = '"%s":%d, "%s":%s';

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
  Procedure   ToStream       (Var bValue  : TMemoryStream);
  Procedure   LoadFromDataset(TableName   : String;
                              bValue      : TDataset);
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
                                     bValue     : TDataset);
Begin

End;

Procedure TJSONValue.ToStream(var bValue : TMemoryStream);
Begin
 If Length(aValue) > 0 Then
  Begin
   bValue := TMemoryStream.Create;
   bValue.Write(aValue[0], -1);
  End
 Else
  bValue := Nil;
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
