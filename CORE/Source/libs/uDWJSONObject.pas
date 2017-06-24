unit uDWJSONObject;

interface

Uses {$IFDEF LCL}
     SysUtils, SysTypes, Classes, uDWJSONTools, uDWConsts, IdGlobal, uKBDynamic, DB;
     {$ELSE}
     System.SysUtils, SysTypes,   System.Classes, uDWJSONTools, uDWConsts,
     IdGlobal,        uKBDynamic, System.Rtti,    Data.DB,      Soap.EncdDecd;
     {$ENDIF}

Type
 TJSONValue = Class
 Private
  vtagName                      : String;
  vTypeObject                   : TTypeObject;
  vObjectDirection              : TObjectDirection;
  vObjectValue                  : TObjectValue;
  aValue                        : TIdBytes;
  vEncoding                     : TEncoding;
  Function  GetValue            : String;
  Procedure WriteValue  (bValue : String);
  Function  FormatValue (bValue : String) : String;
  Function  GetValueJSON(bValue : String) : String;
  Function    DatasetValues  (bValue      : TDataset) : String;
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
  Property    Tagname                     : String           Read vtagName         Write vtagName;
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

Function TJSONValue.DatasetValues(bValue : TDataset) : String;
Var
 vLines : String;
 Function GenerateHeader : String;
 Var
  I : Integer;
  vPrimary,
  vRequired,
  vGenerateLine : String;
 Begin
  For I := 0 To bValue.Fields.Count -1 Do
   Begin
    vPrimary := 'N';
    If pfInKey in bValue.Fields[I].ProviderFlags Then
     vPrimary := 'S';
    vRequired := 'N';
    If bValue.Fields[I].Required Then
     vRequired := 'S';
    If bValue.Fields[I].DataType in [ftExtended, ftFloat, ftCurrency, ftFMTBcd, ftBCD] Then
     vGenerateLine := Format(TJsonDatasetHeader, [bValue.Fields[I].FieldName,
                                                   GetFieldType(bValue.Fields[I].DataType),
                                                   vPrimary, vRequired,
                                                   TFloatField(bValue.Fields[I]).Size,
                                                   TFloatField(bValue.Fields[I]).Precision])
    Else
     vGenerateLine := Format(TJsonDatasetHeader, [bValue.Fields[I].FieldName,
                                                  GetFieldType(bValue.Fields[I].DataType),
                                                  vPrimary, vRequired,
                                                  bValue.Fields[I].Size, 0]);

    If I = 0 Then
     Result := vGenerateLine
    Else
     Result := Result + ', ' + vGenerateLine;
   End;
 End;
 Function GenerateLine : String;
 Var
  I : Integer;
  vTempValue,
  vGenerateLine : String;
  bStream       : TStream;
  vStringStream : TStringStream;
 Begin
  For I := 0 To bValue.Fields.Count -1 Do
   Begin
    If bValue.Fields[I].DataType      in [ftExtended, ftFloat, ftCurrency, ftFMTBcd,  ftBCD]     Then
     vTempValue := Format('"%s"', [StringFloat(bValue.Fields[I].AsString)])
    Else If bValue.Fields[I].DataType in [ftWideMemo, ftBytes, ftVarBytes, ftBlob,
                                          ftMemo,   ftGraphic, ftFmtMemo,  ftOraBlob, ftOraClob] Then
     Begin
      vStringStream     := TStringStream.Create;
      bStream           := bValue.CreateBlobStream(TBlobField(bValue.Fields[I]), bmread);
      bStream.Position := 0;
      vStringStream.Read(bStream, bStream.Size);
      vStringStream.Position := 0;
      vTempValue := Format('"%s"', [EncodeString(vStringStream.DataString)]);
     End
    Else
     vTempValue := Format('"%s"', [EscapeQuotes(bValue.Fields[I].AsString)]);
    If I = 0 Then
     Result := vTempValue
    Else
     Result := Result + ', ' + vTempValue;
   End;
 End;
Begin
 bValue.DisableControls;
 bValue.First;
 Result := '[' + GenerateHeader + '], [%s]';
 While Not bValue.Eof Do
  Begin
   If bValue.RecNo = 1 Then
    vLines := '[' + GenerateLine + ']'
   Else
    vLines := vLines + ', [' + GenerateLine + ']';
   bValue.Next;
  End;
 Result := Format(Result, [vLines]);
 bValue.First;
 bValue.EnableControls;
End;

Procedure TJSONValue.LoadFromDataset(TableName : String;
                                     bValue    : TDataset);
Var
 vTagGeral : String;
Begin
 vTypeObject      := toDataset;
 vObjectDirection := odINOUT;
 vObjectValue     := ovDataSet;
 vtagName         := lowercase(TableName);
 vTagGeral        := Format(TValueFormatJSON, ['ObjectType', GetObjectName(vTypeObject),
                                               'Direction',  GetDirectionName(vObjectDirection),
                                               'ValueType',  GetValueType(vObjectValue),
                                               vtagName,     DatasetValues(bValue)]);
 aValue := tIdBytes(vEncoding.GetBytes(vTagGeral));
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
