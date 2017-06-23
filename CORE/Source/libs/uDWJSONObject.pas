unit uDWJSONObject;

interface

Uses {$IFDEF LCL}
     SysUtils, SysTypes, Classes, uDWJSONTools, uDWConsts, IdGlobal, uKBDynamic, DB;
     {$ELSE}
     System.SysUtils, SysTypes,   System.Classes, uDWJSONTools, uDWConsts,
     IdGlobal,        uKBDynamic, System.Rtti,    Data.DB,      Soap.EncdDecd;
     {$ENDIF}


Const
 TValueFormatJSON   = '{"%s":"%s", "%s":"%s", "%s":"%s", "%s":%s}';
 TJsonDatasetHeader = '"%s":%s, "%s":%s, "%s":%d, "%s":%d, "%s":%s';
 TJsonValueFormat   = '["%d", %s]';

Type
 TJSONValue = Class
 Private
  vTAGName                     : String;
  vTypeObject                  : TTypeObject;
  vObjectDirection             : TObjectDirection;
  vObjectValue                 : TObjectValue;
  aValue                       : TIdBytes;
  vEncoding                    : TEncoding;
  Function  GetValue           : String;
  Procedure WriteValue (bValue : String);
  Function  FormatValue(bValue : String) : String;
  Function  GetValueJSON(bValue: String) : String;
 Public
  Procedure   ToStream       (Var bValue  : TMemoryStream);
  Procedure   LoadFromDataset(TableName   : String;
                              bValue      : TDataset);
  Procedure   WriteToDataset (DatasetType : TDatasetType;
                              TableName   : String;
                              var DestDS  : TDataset);
  Constructor Create;
  Destructor  Destroy;Override;
  Property    TypeObject                  : TTypeObject      Read vTypeObject      Write vTypeObject;
  Property    ObjectDirection             : TObjectDirection Read vObjectDirection Write vObjectDirection;
  Property    ObjectValue                 : TObjectValue     Read vObjectValue     Write vObjectValue;
  Property    Encoding                    : TEncoding        Read vEncoding        Write vEncoding;
  Property    Value                       : String           Read GetValue         Write WriteValue;
  Property    TAGName                     : String           Read vTAGName         Write vTAGName;
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
 vTAGName        := 'TAGJSON';
End;

Destructor TJSONValue.Destroy;
Begin
 SetLength(aValue, 0);
 inherited;
End;

Function TJSONValue.GetValueJSON(bValue : String): String;
Begin
 Result := bValue;
 If vObjectValue In [ovString, ovFixedChar,   ovWideString,
                     ovFixedWideChar, ovDate, ovTime,
                     ovDateTime]  Then
  Result := '"' + EscapeQuotes(bValue) + '"';
End;

Function TJSONValue.FormatValue(bValue : String): String;
Var
 aResult  : String;
Begin
 If vObjectValue In [ovMemo, ovGraphic, ovFmtMemo,
                     ovParadoxOle,      ovDBaseOle,
                     ovTypedBinary,     ovCursor,
                     ovDataSet,         ovOraBlob,
                     ovOraClob,         ovWideMemo,
                     ovParams,          ovStream]  Then
  {$IFDEF LCL}
   //Encode String Base64 Here
  {$ELSE}
  aResult := EncodeString(bValue)
  {$ENDIF}
 Else
  aResult := bValue;
 Result  := Format(TValueFormatJSON, ['ObjectType', GetObjectName(vTypeObject),
                                      'Direction',  GetDirectionName(vObjectDirection),
                                      'ValueType',  GetValueType(vObjectValue),
                                      vTAGName,     Format(TJsonValueFormat, [Length(aResult), GetValueJSON(aResult)])]);
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

Procedure TJSONValue.WriteValue(bValue : String);
Begin
 SetLength(aValue, 0);
 aValue := tIdBytes(vEncoding.GetBytes(FormatValue(bValue)));
End;

end.
