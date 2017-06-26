unit uDWJSONObject;

interface

Uses {$IFDEF FPC}
     SysUtils, SysTypes, Classes, uDWJSONTools, uDWConsts, IdGlobal, uKBDynamic, DB,
     uDWJSONParser;
     {$ELSE}
     System.SysUtils, SysTypes,   System.Classes, uDWJSONTools, uDWConsts, uDWJSONParser,
     IdGlobal,        uKBDynamic, System.Rtti,    Data.DB,      Soap.EncdDecd;
     {$ENDIF}

Type

 { TJSONValue }

 TJSONValue = Class
 Private
  vtagName                           : String;
  vTypeObject                        : TTypeObject;
  vObjectDirection                   : TObjectDirection;
  vObjectValue                       : TObjectValue;
  aValue                             : TIdBytes;
  vEncoding                          : TEncoding;
  Function    GetValue               : String;
  Procedure   WriteValue     (bValue : String);
  Function    FormatValue    (bValue : String)        : String;
  Function    GetValueJSON   (bValue : String)        : String;
  Function    DatasetValues  (bValue      : TDataset) : String;
 Public
  Procedure   ToStream       (Var bValue  : TMemoryStream);
  Procedure   LoadFromDataset(TableName   : String;
                              bValue      : TDataset);
  Procedure   WriteToDataset (DatasetType : TDatasetType;
                              JSONValue   : String;
                              DestDS      : TDataset);
  Procedure   LoadFromJSON   (bValue       : String);
  Constructor Create;
  Destructor  Destroy;Override;
  Property    TypeObject                  : TTypeObject      Read vTypeObject      Write vTypeObject;
  Property    ObjectDirection             : TObjectDirection Read vObjectDirection Write vObjectDirection;
  Property    ObjectValue                 : TObjectValue     Read vObjectValue     Write vObjectValue;
  Property    Encoding                    : TEncoding        Read vEncoding        Write vEncoding;
  Property    Value                       : String           Read GetValue         Write WriteValue;
  Property    Tagname                     : String           Read vtagName         Write vtagName;
End;

Type
 TJSONParam = Class(TObject)
 Private
  vJSONValue                         : TJSONValue;
  vEncoding                          : TEncoding;
  vTypeObject                        : TTypeObject;
  vObjectDirection                   : TObjectDirection;
  vObjectValue                       : TObjectValue;
  vParamName                         : String;
  Function    GetValue               : String;
  Procedure   WriteValue     (bValue : String);
  Procedure   SetParamName   (bValue : String);
 Public
  Constructor Create;
  Destructor  Destroy;Override;
  Property    TypeObject                  : TTypeObject      Read vTypeObject      Write vTypeObject;
  Property    ObjectDirection             : TObjectDirection Read vObjectDirection Write vObjectDirection;
  Property    ObjectValue                 : TObjectValue     Read vObjectValue     Write vObjectValue;
  Property    Encoding                    : TEncoding        Read vEncoding        Write vEncoding;
  Property    Value                       : String           Read GetValue         Write WriteValue;
  Property    ParamName                   : String           Read vParamName       Write SetParamName;
End;

Type
 TDWParams = Class(TList)
 Private
  Function  GetRec(Index    : Integer)      : TJSONParam; Overload;
  Procedure PutRec(Index    : Integer; Item : TJSONParam);Overload;
 Public
  Procedure Delete(Index : Integer);                      Overload;
  Function  Add   (Item  : TJSONParam) : Integer;         Overload;
  Property  Items[Index  : Integer]    : TJSONParam  Read GetRec Write PutRec; Default;
End;

implementation

Function  TDWParams.Add(Item : TJSONParam) : Integer;
Var
 vItem : ^TJSONParam;
Begin
 New(vItem);
 vItem^ := Item;
 Result := TList(Self).Add(vItem);
End;

Procedure TDWParams.Delete(Index : Integer);
Begin
 If (Index < Self.Count) And (Index > -1) Then
  Begin
   If Assigned(TList(Self).Items[Index]) Then
    FreeMem(TList(Self).Items[Index]);
   TList(Self).Delete(Index);
  End;
End;

Function  TDWParams.GetRec(Index : Integer) : TJSONParam;
Begin
 Result := Nil;
 If (Index < Self.Count) And (Index > -1) Then
  Result := TJSONParam(TList(Self).Items[Index]^);
End;

Procedure TDWParams.PutRec(Index : Integer; Item : TJSONParam);
Begin
 If (Index < Self.Count) And (Index > -1) Then
  TJSONParam(TList(Self).Items[Index]^) := Item;
End;

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

constructor TJSONValue.Create;
Begin
 vEncoding       := TEncoding.ANSI;
 vTypeObject     := toObject;
 ObjectDirection := odINOUT;
 vObjectValue    := ovString;
 vTAGName        := 'TAGJSON';
End;

destructor TJSONValue.Destroy;
Begin
 SetLength(aValue, 0);
 inherited;
End;

function TJSONValue.GetValueJSON(bValue: String): String;
Begin
 Result := bValue;
 If vObjectValue In [ovString, ovFixedChar,   ovWideString,
                     ovFixedWideChar, ovDate, ovTime,
                     ovDateTime]  Then
  Result := '"' + EscapeQuotes(bValue) + '"';
End;

function TJSONValue.FormatValue(bValue: String): String;
Var
 aResult  : String;
Begin
 If vObjectValue In [ovMemo, ovGraphic, ovFmtMemo,
                     ovParadoxOle,      ovDBaseOle,
                     ovTypedBinary,     ovCursor,
                     ovDataSet,         ovOraBlob,
                     ovOraClob,         ovWideMemo,
                     ovParams,          ovStream]  Then
  //Encode String Base64 Here
  aResult := EncodeStrings(bValue{$IFNDEF FPC}, vEncoding{$ENDIF})
 Else
  aResult := bValue;
 Result  := Format(TValueFormatJSON, ['ObjectType', GetObjectName(vTypeObject),
                                      'Direction',  GetDirectionName(vObjectDirection),
                                      'ValueType',  GetValueType(vObjectValue),
                                      vTAGName,     GetValueJSON(aResult)]);
End;

function TJSONValue.GetValue: String;
Begin
 Result := vEncoding.GetString(TBytes(aValue));
End;

function TJSONValue.DatasetValues(bValue: TDataset): String;
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
    If bValue.Fields[I].DataType in [{$IFNDEF FPC}ftExtended, {$ENDIF}ftFloat, ftCurrency, ftFMTBcd, ftBCD] Then
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
  vTempValue    : String;
  bStream       : TStream;
  vStringStream : TStringStream;
 Begin
  For I := 0 To bValue.Fields.Count -1 Do
   Begin
    If bValue.Fields[I].DataType      in [{$IFNDEF FPC}ftExtended, {$ENDIF}ftFloat, ftCurrency, ftFMTBcd,  ftBCD]     Then
     vTempValue := Format('"%s"', [StringFloat(bValue.Fields[I].AsString)])
    Else If bValue.Fields[I].DataType in [ftWideMemo, ftBytes, ftVarBytes, ftBlob,
                                          ftMemo,   ftGraphic, ftFmtMemo,  ftOraBlob, ftOraClob] Then
     Begin
      vStringStream     := TStringStream.Create('');
      Try
       bStream           := bValue.CreateBlobStream(TBlobField(bValue.Fields[I]), bmRead);
       bStream.Position := 0;
       vStringStream.CopyFrom(bStream, bStream.Size);
       vStringStream.Position := 0;
       vTempValue := Format('"%s"', [EncodeStrings(vStringStream.DataString{$IFNDEF FPC}, vEncoding{$ENDIF})]);
      Finally
       vStringStream.Free;
      End;
     End
    Else
     Begin
      If bValue.Fields[I].DataType in [ftString, ftWideString, ftFixedWideChar, ftFixedChar] Then
       vTempValue := Format('"%s"', [EncodeStrings(bValue.Fields[I].AsString{$IFNDEF FPC}, vEncoding{$ENDIF})])
      Else
       vTempValue := Format('"%s"', [EscapeQuotes(bValue.Fields[I].AsString)]);
     End;
    If I = 0 Then
     Result := vTempValue
    Else
     Result := Result + ', ' + vTempValue;
   End;
 End;
Begin
 bValue.DisableControls;
 If Not bValue.Active Then
  bValue.Open;
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

procedure TJSONValue.LoadFromDataset(TableName: String; bValue: TDataset);
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

procedure TJSONValue.ToStream(var bValue: TMemoryStream);
Begin
 If Length(aValue) > 0 Then
  Begin
   bValue := TMemoryStream.Create;
   bValue.Write(aValue[0], -1);
  End
 Else
  bValue := Nil;
End;

procedure TJSONValue.WriteToDataset(DatasetType: TDatasetType;
  JSONValue: String; DestDS: TDataset);
var
 JsonParser  : TJsonParser;
 bJsonValue  : TJsonObject;
 JsonArray   : TJsonArray;
 J, I        : Integer;
 FieldDef    : TFieldDef;
 Field       : TField;
 vBlobStream : TStringStream;
 Procedure SetValue(Field : TField; Value : String);
 Begin
  Case Field.DataType Of
   ftUnknown,
   ftString,
   ftFixedChar,
   ftFixedWideChar,
   ftWideString     :
    Begin
     Field.AsString := Value;
    End;
   ftAutoInc,
   ftSmallint,
   ftInteger,
   ftLargeint,
   ftWord,
   ftBoolean        :
    Begin
     If Value <> '' Then
      Field.AsInteger := StrToInt(Value);
    End;
   ftFloat,
   ftCurrency,
   ftBCD,
   ftFMTBcd         :
    Begin
     If Value <> '' Then
      Begin
       Case Field.DataType Of
        ftFloat     : Field.AsFloat := StrToFloat(Value);
        ftCurrency,
        ftBCD,
        ftFMTBcd    : Field.AsCurrency := StrToFloat(Value);
       End;
      End;
    End;
   ftDate,
   ftTime,
   ftDateTime,
   ftTimeStamp      :
    Begin
     If Value <> '' Then
      Field.AsDateTime := StrToDateTime(Value);
    End;
  End;
 End;
begin
 ClearJsonParser(JsonParser);
 Try
  ParseJson(JsonParser, JSONValue);
  bJsonValue       := JsonParser.Output.Objects[0];
  vTypeObject      := GetObjectName   (bJsonValue[0].Value.Value);
  vObjectDirection := GetDirectionName(bJsonValue[1].Value.Value);
  vObjectValue     := GetValueType    (bJsonValue[2].Value.Value);
  vtagName         := Lowercase       (bJsonValue[3].Key);
  //Add Field Defs
  DestDS.DisableControls;
  If DestDS.Active Then
   DestDS.Close;
  DestDS.FieldDefs.Clear;
  {$IFDEF FPC}
  DestDS.Fields.Clear;
  {$ENDIF}
  For J := 1 To Length(JsonParser.Output.Objects) -1 Do
   Begin
    bJsonValue         := JsonParser.Output.Objects[J];
    FieldDef           := DestDS.FieldDefs.AddFieldDef;
    FieldDef.Name      := bJsonValue[0].Value.Value;
    FieldDef.DataType  := GetFieldType(bJsonValue[1].Value.Value);
    FieldDef.Required  := UpperCase(bJsonValue[3].Value.Value) = 'S';
    If Not(FieldDef.DataType In [ftFloat, ftCurrency, ftBCD, ftFMTBcd]) Then
     Begin
      FieldDef.Size      := StrToInt(bJsonValue[4].Value.Value);
      FieldDef.Precision := StrToInt(bJsonValue[5].Value.Value);
     End;
   End;
  DestDS.Open;
  //Add Set PK Fields
  For J := 1 To Length(JsonParser.Output.Objects) -1 Do
   Begin
    bJsonValue         := JsonParser.Output.Objects[J];
    If UpperCase(bJsonValue[2].Value.Value) = 'S' Then
     Begin
      Field := DestDS.FieldByName(bJsonValue[0].Value.Value);
      If Field <> Nil Then
       Field.ProviderFlags := [pfInUpdate, pfInWhere, pfInKey];
     End;
   End;
  For J := 3 To Length(JsonParser.Output.Arrays) -1 Do
   Begin
    JsonArray  := JsonParser.Output.Arrays[J];
    DestDS.Append;
    For I := 0 To Length(JsonArray) -1 Do
     Begin
      If DestDS.Fields[I].DataType In [ftMemo, ftGraphic, ftFmtMemo,
                                       ftParadoxOle,      ftDBaseOle,
                                       ftTypedBinary,     ftCursor,
                                       ftDataSet,         ftOraBlob,
                                       ftOraClob,         ftWideMemo
                                       {$IFNDEF FPC}
                                       ,ftParams,         ftStream{$ENDIF}]  Then
       Begin
        vBlobStream := TStringStream.Create(DecodeStrings(JsonArray[I].Value{$IFNDEF FPC}, vEncoding{$ENDIF}));
        Try
         vBlobStream.Position := 0;
         DestDS.CreateBlobStream(DestDS.Fields[I], bmWrite);
        Finally
         {$IFNDEF FPC}
         vBlobStream.Clear;
         {$ENDIF}
         vBlobStream.Free;
        End;
       End
      Else
       Begin
        If JsonArray[I].Value <> '' Then
         Begin
          If DestDS.Fields[I].DataType in [ftString, ftWideString, ftFixedWideChar, ftFixedChar] Then
           DestDS.Fields[I].AsString := DecodeStrings(JsonArray[I].Value{$IFNDEF FPC}, vEncoding{$ENDIF})
          Else
           Begin
            {$IFNDEF FPC}
            DestDS.Fields[I].Value := JsonArray[I].Value;
            {$ELSE}
            SetValue(DestDS.Fields[I], JsonArray[I].Value);
            {$ENDIF}
           End;
         End;
       End;
     End;
    DestDS.Post;
   End;
 Finally
  If DestDS.Active Then
   DestDS.First;
  DestDS.EnableControls;
 End;
End;

Procedure TJSONValue.LoadFromJSON(bValue : String);
Var
 JsonParser  : TJsonParser;
 bJsonValue  : TJsonObject;
Begin
 ClearJsonParser(JsonParser);
 Try
  ParseJson(JsonParser, bValue);
  bJsonValue       := JsonParser.Output.Objects[0];
  vTypeObject      := GetObjectName   (bJsonValue[0].Value.Value);
  vObjectDirection := GetDirectionName(bJsonValue[1].Value.Value);
  vObjectValue     := GetValueType    (bJsonValue[2].Value.Value);
  vtagName         := Lowercase       (bJsonValue[3].Key);
  SetLength(aValue, 0);
  aValue := tIdBytes(vEncoding.GetBytes(bJsonValue[3].Value.Value));
 Finally

 End;
End;

procedure TJSONValue.WriteValue(bValue: String);
Begin
 SetLength(aValue, 0);
 aValue := tIdBytes(vEncoding.GetBytes(FormatValue(bValue)));
End;

{ TJSONParam }

constructor TJSONParam.Create;
begin
 vJSONValue := TJSONValue.Create;
 vEncoding       := TEncoding.ANSI;
 vTypeObject     := toObject;
 ObjectDirection := odINOUT;
 vObjectValue    := ovString;
end;

destructor TJSONParam.Destroy;
begin
  vJSONValue.Free;
  inherited;
end;

function TJSONParam.GetValue: String;
begin
 Result := vJSONValue.Value;
end;

procedure TJSONParam.SetParamName(bValue: String);
begin
 vParamName := Uppercase(bValue);
end;

procedure TJSONParam.WriteValue(bValue: String);
begin
 vJSONValue.Encoding         := vEncoding;
 vJSONValue.vtagName         := vParamName;
 vJSONValue.vTypeObject      := vTypeObject;
 vJSONValue.vObjectDirection := vObjectDirection;
 vJSONValue.vObjectValue     := vObjectValue;
 vJSONValue.WriteValue(bValue);
end;

end.
