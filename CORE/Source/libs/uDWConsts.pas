unit uDWConsts;

Interface

Uses {$IFDEF FPC}
     SysUtils, DB, Classes, IdGlobal, IdCoderMIME, uZlibLaz, base64;
     {$ELSE}
     System.SysUtils, IdGlobal, uZlibLaz, EncdDecd,
     Data.DB, System.Classes, IdCoderMIME;
     {$ENDIF}

Const
 InitStrPos            = 1;
 TSepParams            = '|xxx|xxx|%';
 TValueFormatJSON      = '{"%s":"%s", "%s":"%s", "%s":"%s", "%s":"%s", "%s":[%s]}';
 TValueDisp            = '{"PARAMS":[%s], "RESULT":[%s]}';
 TValueArrayJSON       = '[%s]';
 TValueFormatJSONValue = '{"%s":"%s", "%s":"%s", "%s":"%s", "%s":"%s", "%s":%s}';
 TJsonDatasetHeader    = '{"Field":"%s", "Type":"%s", "Primary":"%s", "Required":"%s", "Size":%d, "Precision":%d}';
 TJsonValueFormat      = '%s';
 TJsonStringValue      = '"%s"';
 TSepValueMemString    = '\\';
 TQuotedValueMemString = '\"';
 AuthRealm             = 'Provide Authentication';
 UrlBase               = '%s://%s:%d/%s';
 ByteBuffer            = 1024 * 8; //8kb

Type
 TEncodeSelect    = (esASCII,     esUtf8);
 TSendEvent       = (seGET,       sePOST,
                     sePUT,       seDELETE);
 TTypeRequest     = (trHttp,      trHttps);
 TTypeObject      = (toDataset,   toParam,
                     toVariable,  toObject);
 TObjectDirection = (odIN, odOUT, odINOUT);
 TObjectValue     = (ovUnknown,         ovString,       ovSmallint,         ovInteger,    ovWord,                            // 0..4
                     ovBoolean,         ovFloat,        ovCurrency,         ovBCD,        ovDate,      ovTime,    ovDateTime,// 5..11
                     ovBytes,           ovVarBytes,     ovAutoInc,          ovBlob,       ovMemo,      ovGraphic, ovFmtMemo, //12..18
                     ovParadoxOle,      ovDBaseOle,     ovTypedBinary,      ovCursor,     ovFixedChar, ovWideString,         //19..24
                     ovLargeint,        ovADT, ovArray, ovReference,        ovDataSet,    ovOraBlob,   ovOraClob,            //25..31
                     ovVariant,         ovInterface,    ovIDispatch,        ovGuid,       ovTimeStamp, ovFMTBcd,             //32..37
                     ovFixedWideChar,   ovWideMemo,     ovOraTimeStamp,     ovOraInterval,                                   //38..41
                     ovLongWord,        ovShortint,     ovByte, ovExtended, ovConnection, ovParams,    ovStream,             //42..48
                     ovTimeStampOffset, ovObject,       ovSingle);                                                           //49..51
 TDatasetType     = (dtReflection,      dtFull,         dtDiff);

 Function GetEncoding             (Avalue          : TEncodeSelect)    : TEncoding;
 Function GetObjectName           (TypeObject      : TTypeObject)      : String;          Overload;
 Function GetObjectName           (TypeObject      : String)           : TTypeObject;     Overload;
 Function GetDirectionName        (ObjectDirection : TObjectDirection) : String;          Overload;
 Function GetDirectionName        (ObjectDirection : String)           : TObjectDirection;Overload;
 Function GetBooleanFromString    (Value           : String)           : Boolean;
 Function GetStringFromBoolean    (Value           : Boolean)          : String;
 Function GetValueType            (ObjectValue     : TObjectValue)     : String;          Overload;
 Function GetValueType            (ObjectValue     : String)           : TObjectValue;    Overload;
 Function GetFieldType            (FieldType       : TFieldType)       : String;          Overload;
 Function GetFieldType            (FieldType       : String)           : TFieldType;      Overload;
 Function StringFloat             (aValue          : String)           : String;
 Function GenerateStringFromStream(Stream          : TStream;
                                   AEncoding       : TEncoding) : String;Overload;
 Function  GenerateStringFromStream(Stream          : TStream)   : String;Overload;
 Function  FileToStr    (Const FileName     : String) : String;
 Procedure StrToFile    (Const FileName,
                               SourceString : String);
 Function  StreamToHex  (Stream : TStream)  : String;
 Procedure HexToStream  (Str    : String;
                         Stream : TStream);
 Function  StreamToBytes(Stream       : TMemoryStream) : tidBytes;
 Procedure CopyStream   (Const Source : TStream;
                               Dest   : TStream);
 Function  ZDecompressStr(Const S     : String;
                          Var Value   : String) : Boolean;
 Function  ZCompressStr  (Const s     : String;
                          Var Value   : String) : Boolean;
 Function  BytesArrToString(aValue : tIdBytes) : String;


implementation

Uses uDWJSONTools;


Function BytesArrToString(aValue : tIdBytes) : String;
Var
 StringStream : TStringStream;
Begin
 {$IFDEF FPC}
  StringStream := TStringStream.Create('');
  Try
   StringStream.Write(aValue[0], Length(aValue));
   StringStream.Position := 0;
   Result  := StringStream.DataString;
  Finally
   StringStream.Free;
  End;
 {$ELSE}
  Result   := BytesToString(aValue);
 {$ENDIF}
End;

Function ZCompressStr(Const s   : String;
                      Var Value : String) : Boolean;
Var
 Utf8Stream   : TStringStream;
 Compressed   : TMemoryStream;
 Base64Stream : TStringStream;
 {$IFDEF FPC}
  Encoder     : TBase64EncodingStream;
 {$ENDIF}
Begin
 Result := False;
 {$IFDEF FPC}
  Utf8Stream := TStringStream.Create(S);
 {$ELSE}
  Utf8Stream := TStringStream.Create(S, TEncoding.UTF8);
 {$ENDIF}
 Try
  Compressed := TMemoryStream.Create;
  Try
   {$IFDEF FPC}
    ZCompressStream(Utf8Stream, Compressed);
    Compressed.Position := 0;
    Base64Stream := TStringStream.Create('');
   {$ELSE}
    ZCompressStream(Utf8Stream, Compressed);
    Compressed.Position := 0;
    Base64Stream := TStringStream.Create('', TEncoding.ASCII);
   {$ENDIF}
   Try
    {$IFDEF FPC}
     Encoder       := TBase64EncodingStream.Create(Base64Stream);
     Encoder.CopyFrom(Compressed, Compressed.Size);
    {$ELSE}
     EncodeStream(Compressed, Base64Stream);
    {$ENDIF}
    Value  := Base64Stream.DataString;
    Result := True;
   Finally
    Base64Stream.Free;
   End;
  Finally
   Compressed.Free;
  End;
 Finally
  Utf8Stream.Free;
 End;
End;

Function ZDecompressStr(Const S   : String;
                        Var Value : String) : Boolean;
Var
 Utf8Stream,
 Compressed,
 Base64Stream : TStringStream;
 {$IFDEF FPC}
  Encoder      : TBase64DecodingStream;
 {$ENDIF}
Begin
 Result := False;
 {$IFDEF FPC}
  Base64Stream := TStringStream.Create(S);
 {$ELSE}
  Base64Stream := TStringStream.Create(S, TEncoding.ASCII);
 {$ENDIF}
 Try
  Compressed := TStringStream.Create('');
  Try
   {$IFDEF FPC}
    Utf8Stream    := TStringStream.Create('');
    Encoder       := TBase64DecodingStream.Create(Base64Stream);
    Utf8Stream.CopyFrom(Encoder, Encoder.Size);
    Utf8Stream.Position := 0;
    Compressed.position := 0;
    ZDecompressStream(Utf8Stream, Compressed);
   {$ELSE}
    Utf8Stream := TStringStream.Create('', TEncoding.UTF8);
    DecodeStream(Base64Stream, Compressed);
    Compressed.position := 0;
    ZDecompressStream(Compressed, Utf8Stream);
    Utf8Stream.Position := 0;
   {$ENDIF}
   Try
    Value := Compressed.DataString;
    Result := True;
   Finally
    Utf8Stream.Free;
   End;
  Finally
   Compressed.Free;
  End;
 Finally
  Base64Stream.Free;
 End;
End;

Function StreamToBytes(Stream : TMemoryStream) : tidBytes;
Begin
 Try
  Stream.Position := 0;
  SetLength  (Result, Stream.Size);
  Stream.Read(Result[0], Stream.Size);
 Finally
 End;
end;

Procedure HexToStream(Str    : String;
                      Stream : TStream);
Begin
 TMemoryStream(Stream).Size := Length(Str) Div 2;
 HexToBin(PChar (Str),   TMemoryStream(Stream).Memory, TMemoryStream(Stream).Size);
 Stream.Position := 0;
End;

Function StreamToHex(Stream  : TStream): string;
Begin
 Stream.Position := 0;
 SetLength     (Result, Stream.Size * 2);
 BinToHex      (TMemoryStream(Stream).Memory, PChar(Result), Stream.Size);
End;

Function FileToStr(Const FileName : String):string;
Var
 Stream : TFileStream;
Begin
 Stream:= TFileStream.Create(FileName, fmOpenRead);
 Try
  SetLength(Result, Stream.Size);
  Stream.Position := 0;
  Stream.ReadBuffer(Pointer(Result)^, Stream.Size);
 Finally
  Stream.Free;
 End;
End;

Procedure StrToFile(Const FileName, SourceString : string);
Var
 Stream : TFileStream;
Begin
 If FileExists(FileName) Then
  DeleteFile(FileName);
 Stream:= TFileStream.Create(FileName, fmCreate);
 Try
  Stream.WriteBuffer(Pointer(SourceString)^, Length(SourceString));
 Finally
  Stream.Free;
 End;
End;

Procedure CopyStream(Const Source : TStream;
                           Dest   : TStream);
Var
 BytesRead : Integer;
 Buffer    : PByte;
 Const
  MaxBufSize = $F000;
Begin
 { ** Criando a inst�ncia do objeto TMemoryStream para retorno do m�todo ** }
 Dest := TMemoryStream.Create;
 { ** Reposicionando o stream para o seu in�cio ** }
 source.Seek(0, TSeekOrigin.soBeginning);
 source.Position := 0;
 GetMem(Buffer, MaxBufSize);
 { ** Realizando a leitura do stream original, buffer a buffer ** }
 Repeat
  BytesRead := Source.Read(Buffer^, MaxBufSize);
  If BytesRead > 0 then
   Dest.WriteBuffer(Buffer^, BytesRead);
 Until MaxBufSize > BytesRead;
 { ** Reposicionando o stream de retorno para o seu in�cio ** }
 Dest.Seek(0, TSeekOrigin.soBeginning);
End;

Function GenerateStringFromStream(Stream : TStream; AEncoding: TEncoding) : String;
Var
 StringStream : TStringStream;
Begin
 StringStream := TStringStream.Create(''{$IFNDEF FPC}, AEncoding{$ENDIF});
 Try
  Stream.Position := 0;
  StringStream.CopyFrom(Stream, Stream.Size);
  Result                := StringStream.DataString;
 Finally
  {$IFNDEF FPC}StringStream.Clear;{$ENDIF}
  StringStream.Free;
 End;
End;

Function GenerateStringFromStream(Stream : TStream) : String;
Var
 idBytes : TIdBytes;
Begin
 Try
  SetLength(idBytes, Stream.Size);
  Stream.ReadBuffer(idBytes[0], Stream.Size);
 Finally
 End;
// vResult := PChar(AllocMem((Length(idBytes) * 2) + 1));
 SetLength(Result, Stream.Size * 2);
 BinToHex(@idBytes, PChar(Result), Length(idBytes));
End;

Function StringFloat     (aValue          : String)           : String;
Begin
 Result := StringReplace(aValue, '.', '', [rfReplaceall]);
End;

Function GetStringFromBoolean(Value       : Boolean)          : String;
Begin
 Result := 'false';
 If Value Then
  Result := 'true';
End;

Function GetObjectName   (TypeObject      : TTypeObject)       : String;
Begin
 Result := 'toObject';
 Case TypeObject Of
  toDataset  : Result := 'toDataset';
  toParam    : Result := 'toParam';
  toVariable : Result := 'toVariable';
  toObject   : Result := 'toObject';
 End;
End;

Function GetObjectName   (TypeObject      : String)       : TTypeObject;
Var
 vTypeObject : String;
Begin
 vTypeObject := Uppercase(TypeObject);
 If vTypeObject = Uppercase('toObject') Then
  Result := toObject
 Else If vTypeObject = Uppercase('toDataset') Then
  Result := toDataset
 Else If vTypeObject = Uppercase('toParam') Then
  Result := toParam
 Else If vTypeObject = Uppercase('toVariable') Then
  Result := toVariable
 Else If vTypeObject = Uppercase('toObject') Then
  Result := toObject;
End;

Function GetDirectionName(ObjectDirection : TObjectDirection) : String;
Begin
 Result := 'odINOUT';
 Case ObjectDirection Of
  odINOUT : Result := 'odINOUT';
  odIN    : Result := 'odIN';
  odOUT   : Result := 'odOUT';
 End;
End;

Function GetBooleanFromString(Value : String) : Boolean;
Begin
 Result := Uppercase(Value) = 'TRUE';
End;

Function GetDirectionName(ObjectDirection : String) : TObjectDirection;
Var
 vObjectDirection : String;
Begin
 vObjectDirection := Uppercase(ObjectDirection);
 If vObjectDirection = Uppercase('odINOUT') Then
  Result := odINOUT
 Else If vObjectDirection = Uppercase('odIN') Then
  Result := odIN
 Else If vObjectDirection = Uppercase('odOUT') Then
  Result := odOUT;
End;

Function GetValueType    (ObjectValue     : TObjectValue)     : String;
Begin
 Result := 'ovUnknown';
 Case ObjectValue Of
  ovUnknown         : Result := 'ovUnknown';
  ovString          : Result := 'ovString';
  ovSmallint        : Result := 'ovSmallint';
  ovInteger         : Result := 'ovInteger';
  ovWord            : Result := 'ovWord';
  ovBoolean         : Result := 'ovBoolean';
  ovFloat           : Result := 'ovFloat';
  ovCurrency        : Result := 'ovCurrency';
  ovBCD             : Result := 'ovBCD';
  ovDate            : Result := 'ovDate';
  ovTime            : Result := 'ovTime';
  ovDateTime        : Result := 'ovDateTime';
  ovBytes           : Result := 'ovBytes';
  ovVarBytes        : Result := 'ovVarBytes';
  ovAutoInc         : Result := 'ovAutoInc';
  ovBlob            : Result := 'ovBlob';
  ovMemo            : Result := 'ovMemo';
  ovGraphic         : Result := 'ovGraphic';
  ovFmtMemo         : Result := 'ovFmtMemo';
  ovParadoxOle      : Result := 'ovParadoxOle';
  ovDBaseOle        : Result := 'ovDBaseOle';
  ovTypedBinary     : Result := 'ovTypedBinary';
  ovCursor          : Result := 'ovCursor';
  ovFixedChar       : Result := 'ovFixedChar';
  ovWideString      : Result := 'ovWideString';
  ovLargeint        : Result := 'ovLargeint';
  ovADT             : Result := 'ovADT';
  ovArray           : Result := 'ovArray';
  ovReference       : Result := 'ovReference';
  ovDataSet         : Result := 'ovDataSet';
  ovOraBlob         : Result := 'ovOraBlob';
  ovOraClob         : Result := 'ovOraClob';
  ovVariant         : Result := 'ovVariant';
  ovInterface       : Result := 'ovInterface';
  ovIDispatch       : Result := 'ovIDispatch';
  ovGuid            : Result := 'ovGuid';
  ovTimeStamp       : Result := 'ovTimeStamp';
  ovFMTBcd          : Result := 'ovFMTBcd';
  ovFixedWideChar   : Result := 'ovFixedWideChar';
  ovWideMemo        : Result := 'ovWideMemo';
  ovOraTimeStamp    : Result := 'ovOraTimeStamp';
  ovOraInterval     : Result := 'ovOraInterval';
  ovLongWord        : Result := 'ovLongWord';
  ovShortint        : Result := 'ovShortint';
  ovByte            : Result := 'ovByte';
  ovExtended        : Result := 'ovExtended';
  ovConnection      : Result := 'ovConnection';
  ovParams          : Result := 'ovParams';
  ovStream          : Result := 'ovStream';
  ovTimeStampOffset : Result := 'ovTimeStampOffset';
  ovObject          : Result := 'ovObject';
  ovSingle          : Result := 'ovSingle';
 End;
End;

Function GetValueType (ObjectValue : String) : TObjectValue;
Var
 vObjectValue : String;
Begin
 vObjectValue := Uppercase(ObjectValue);
 If vObjectValue      = Uppercase('ovUnknown')         Then
  Result := ovUnknown
 Else If vObjectValue = Uppercase('ovString')          Then
  Result := ovString
 Else If vObjectValue = Uppercase('ovSmallint')        Then
  Result := ovSmallint
 Else If vObjectValue = Uppercase('ovInteger')         Then
  Result := ovInteger
 Else If vObjectValue = Uppercase('ovWord')            Then
  Result := ovWord
 Else If vObjectValue = Uppercase('ovBoolean')         Then
  Result := ovBoolean
 Else If vObjectValue = Uppercase('ovFloat')           Then
  Result := ovFloat
 Else If vObjectValue = Uppercase('ovCurrency')        Then
  Result := ovCurrency
 Else If vObjectValue = Uppercase('ovBCD')             Then
  Result := ovBCD
 Else If vObjectValue = Uppercase('ovDate')            Then
  Result := ovDate
 Else If vObjectValue = Uppercase('ovTime')            Then
  Result := ovTime
 Else If vObjectValue = Uppercase('ovDateTime')        Then
  Result := ovDateTime
 Else If vObjectValue = Uppercase('ovBytes')           Then
  Result := ovBytes
 Else If vObjectValue = Uppercase('ovVarBytes')        Then
  Result := ovVarBytes
 Else If vObjectValue = Uppercase('ovAutoInc')         Then
  Result := ovAutoInc
 Else If vObjectValue = Uppercase('ovBlob')            Then
  Result := ovBlob
 Else If vObjectValue = Uppercase('ovMemo')            Then
  Result := ovMemo
 Else If vObjectValue = Uppercase('ovGraphic')         Then
  Result := ovGraphic
 Else If vObjectValue = Uppercase('ovFmtMemo')         Then
  Result := ovFmtMemo
 Else If vObjectValue = Uppercase('ovParadoxOle')      Then
  Result := ovParadoxOle
 Else If vObjectValue = Uppercase('ovDBaseOle')        Then
  Result := ovDBaseOle
 Else If vObjectValue = Uppercase('ovTypedBinary')     Then
  Result := ovTypedBinary
 Else If vObjectValue = Uppercase('ovCursor')          Then
  Result := ovCursor
 Else If vObjectValue = Uppercase('ovFixedChar')       Then
  Result := ovFixedChar
 Else If vObjectValue = Uppercase('ovWideString')      Then
  Result := ovWideString
 Else If vObjectValue = Uppercase('ovLargeint')        Then
  Result := ovLargeint
 Else If vObjectValue = Uppercase('ovADT')             Then
  Result := ovADT
 Else If vObjectValue = Uppercase('ovArray')           Then
  Result := ovArray
 Else If vObjectValue = Uppercase('ovReference')       Then
  Result := ovReference
 Else If vObjectValue = Uppercase('ovDataSet')         Then
  Result := ovDataSet
 Else If vObjectValue = Uppercase('ovOraBlob')         Then
  Result := ovOraBlob
 Else If vObjectValue = Uppercase('ovOraClob')         Then
  Result := ovOraClob
 Else If vObjectValue = Uppercase('ovVariant')         Then
  Result := ovVariant
 Else If vObjectValue = Uppercase('ovInterface')       Then
  Result := ovInterface
 Else If vObjectValue = Uppercase('ovIDispatch')       Then
  Result := ovIDispatch
 Else If vObjectValue = Uppercase('ovGuid')            Then
  Result := ovGuid
 Else If vObjectValue = Uppercase('ovTimeStamp')       Then
  Result := ovTimeStamp
 Else If vObjectValue = Uppercase('ovFMTBcd')          Then
  Result := ovFMTBcd
 Else If vObjectValue = Uppercase('ovFixedWideChar')   Then
  Result := ovFixedWideChar
 Else If vObjectValue = Uppercase('ovWideMemo')        Then
  Result := ovWideMemo
 Else If vObjectValue = Uppercase('ovOraTimeStamp')    Then
  Result := ovOraTimeStamp
 Else If vObjectValue = Uppercase('ovOraInterval')     Then
  Result := ovOraInterval
 Else If vObjectValue = Uppercase('ovLongWord')        Then
  Result := ovLongWord
 Else If vObjectValue = Uppercase('ovShortint')        Then
  Result := ovShortint
 Else If vObjectValue = Uppercase('ovByte')            Then
  Result := ovByte
 Else If vObjectValue = Uppercase('ovExtended')        Then
  Result := ovExtended
 Else If vObjectValue = Uppercase('ovConnection')      Then
  Result := ovConnection
 Else If vObjectValue = Uppercase('ovParams')          Then
  Result := ovParams
 Else If vObjectValue = Uppercase('ovStream')          Then
  Result := ovStream
 Else If vObjectValue = Uppercase('ovTimeStampOffset') Then
  Result := ovTimeStampOffset
 Else If vObjectValue = Uppercase('ovObject')          Then
  Result := ovObject
 Else If vObjectValue = Uppercase('ovSingle')          Then
  Result := ovSingle;
End;

Function GetFieldType (FieldType     : TFieldType)     : String;
Begin
 Result := 'ftUnknown';
 Case FieldType Of
  ftUnknown         : Result := 'ftUnknown';
  ftString          : Result := 'ftString';
  ftSmallint        : Result := 'ftSmallint';
  ftInteger         : Result := 'ftInteger';
  ftWord            : Result := 'ftWord';
  ftBoolean         : Result := 'ftBoolean';
  ftFloat           : Result := 'ftFloat';
  ftCurrency        : Result := 'ftCurrency';
  ftBCD             : Result := 'ftBCD';
  ftDate            : Result := 'ftDate';
  ftTime            : Result := 'ftTime';
  ftDateTime        : Result := 'ftDateTime';
  ftBytes           : Result := 'ftBytes';
  ftVarBytes        : Result := 'ftVarBytes';
  ftAutoInc         : Result := 'ftAutoInc';
  ftBlob            : Result := 'ftBlob';
  ftMemo            : Result := 'ftMemo';
  ftGraphic         : Result := 'ftGraphic';
  ftFmtMemo         : Result := 'ftFmtMemo';
  ftParadoxOle      : Result := 'ftParadoxOle';
  ftDBaseOle        : Result := 'ftDBaseOle';
  ftTypedBinary     : Result := 'ftTypedBinary';
  ftCursor          : Result := 'ftCursor';
  ftFixedChar       : Result := 'ftFixedChar';
  ftWideString      : Result := 'ftWideString';
  ftLargeint        : Result := 'ftLargeint';
  ftADT             : Result := 'ftADT';
  ftArray           : Result := 'ftArray';
  ftReference       : Result := 'ftReference';
  ftDataSet         : Result := 'ftDataSet';
  ftOraBlob         : Result := 'ftOraBlob';
  ftOraClob         : Result := 'ftOraClob';
  ftVariant         : Result := 'ftVariant';
  ftInterface       : Result := 'ftInterface';
  ftIDispatch       : Result := 'ftIDispatch';
  ftGuid            : Result := 'ftGuid';
  ftTimeStamp       : Result := 'ftTimeStamp';
  ftFMTBcd          : Result := 'ftFMTBcd';
  ftFixedWideChar   : Result := 'ftFixedWideChar';
  ftWideMemo        : Result := 'ftWideMemo';
  {$IFNDEF FPC}
  ftOraTimeStamp    : Result := 'ftOraTimeStamp';
  ftOraInterval     : Result := 'ftOraInterval';
  ftLongWord        : Result := 'ftLongWord';
  ftShortint        : Result := 'ftShortint';
  ftByte            : Result := 'ftByte';
  ftExtended        : Result := 'ftExtended';
  ftConnection      : Result := 'ftConnection';
  ftParams          : Result := 'ftParams';
  ftStream          : Result := 'ftStream';
  ftTimeStampOffset : Result := 'ftTimeStampOffset';
  ftObject          : Result := 'ftObject';
  ftSingle          : Result := 'ftSingle';
  {$ENDIF}
 End;
End;

Function GetFieldType(FieldType : String) : TFieldType;
Var
 vFieldType : String;
Begin
 vFieldType := Uppercase(FieldType);
 If vFieldType      = Uppercase('ftUnknown')         Then
  Result := ftUnknown
 Else If vFieldType = Uppercase('ftString')          Then
  Result := ftString
 Else If vFieldType = Uppercase('ftSmallint')        Then
  Result := ftSmallint
 Else If vFieldType = Uppercase('ftInteger')         Then
  Result := ftInteger
 Else If vFieldType = Uppercase('ftWord')            Then
  Result := ftWord
 Else If vFieldType = Uppercase('ftBoolean')         Then
  Result := ftBoolean
 Else If vFieldType = Uppercase('ftFloat')           Then
  Result := ftFloat
 Else If vFieldType = Uppercase('ftCurrency')        Then
  Result := ftCurrency
 Else If vFieldType = Uppercase('ftBCD')             Then
  Result := ftBCD
 Else If vFieldType = Uppercase('ftDate')            Then
  Result := ftDate
 Else If vFieldType = Uppercase('ftTime')            Then
  Result := ftTime
 Else If vFieldType = Uppercase('ftDateTime')        Then
  Result := ftDateTime
 Else If vFieldType = Uppercase('ftBytes')           Then
  Result := ftBytes
 Else If vFieldType = Uppercase('ftVarBytes')        Then
  Result := ftVarBytes
 Else If vFieldType = Uppercase('ftAutoInc')         Then
  Result := ftAutoInc
 Else If vFieldType = Uppercase('ftBlob')            Then
  Result := ftBlob
 Else If vFieldType = Uppercase('ftMemo')            Then
  Result := ftMemo
 Else If vFieldType = Uppercase('ftGraphic')         Then
  Result := ftGraphic
 Else If vFieldType = Uppercase('ftFmtMemo')         Then
  Result := ftFmtMemo
 Else If vFieldType = Uppercase('ftParadoxOle')      Then
  Result := ftParadoxOle
 Else If vFieldType = Uppercase('ftDBaseOle')        Then
  Result := ftDBaseOle
 Else If vFieldType = Uppercase('ftTypedBinary')     Then
  Result := ftTypedBinary
 Else If vFieldType = Uppercase('ftCursor')          Then
  Result := ftCursor
 Else If vFieldType = Uppercase('ftFixedChar')       Then
  Result := ftFixedChar
 Else If vFieldType = Uppercase('ftWideString')      Then
  Result := ftWideString
 Else If vFieldType = Uppercase('ftLargeint')        Then
  Result := ftLargeint
 Else If vFieldType = Uppercase('ftADT')             Then
  Result := ftADT
 Else If vFieldType = Uppercase('ftArray')           Then
  Result := ftArray
 Else If vFieldType = Uppercase('ftReference')       Then
  Result := ftReference
 Else If vFieldType = Uppercase('ftDataSet')         Then
  Result := ftDataSet
 Else If vFieldType = Uppercase('ftOraBlob')         Then
  Result := ftOraBlob
 Else If vFieldType = Uppercase('ftOraClob')         Then
  Result := ftOraClob
 Else If vFieldType = Uppercase('ftVariant')         Then
  Result := ftVariant
 Else If vFieldType = Uppercase('ftInterface')       Then
  Result := ftInterface
 Else If vFieldType = Uppercase('ftIDispatch')       Then
  Result := ftIDispatch
 Else If vFieldType = Uppercase('ftGuid')            Then
  Result := ftGuid
 Else If vFieldType = Uppercase('ftTimeStamp')       Then
  {$IFNDEF FPC}
  Result := ftTimeStamp
  {$ELSE}
  Result := ftDateTime
  {$ENDIF}
 Else If vFieldType = Uppercase('ftFMTBcd')          Then
  Result := ftFMTBcd
 Else If vFieldType = Uppercase('ftFixedWideChar')   Then
  Result := ftFixedWideChar
 Else If vFieldType = Uppercase('ftWideMemo')        Then
  Result := ftWideMemo
 {$IFNDEF FPC}
 Else If vFieldType = Uppercase('ftOraTimeStamp')    Then
  Result := ftOraTimeStamp
 Else If vFieldType = Uppercase('ftOraInterval')     Then
  Result := ftOraInterval
 Else If vFieldType = Uppercase('ftLongWord')        Then
  Result := ftLongWord
 Else If vFieldType = Uppercase('ftShortint')        Then
  Result := ftShortint
 Else If vFieldType = Uppercase('ftByte')            Then
  Result := ftByte
 Else If vFieldType = Uppercase('ftExtended')        Then
  Result := ftExtended
 Else If vFieldType = Uppercase('ftConnection')      Then
  Result := ftConnection
 Else If vFieldType = Uppercase('ftParams')          Then
  Result := ftParams
 Else If vFieldType = Uppercase('ftStream')          Then
  Result := ftStream
 Else If vFieldType = Uppercase('ftTimeStampOffset') Then
  Result := ftTimeStampOffset
 Else If vFieldType = Uppercase('ftObject')          Then
  Result := ftObject
 Else If vFieldType = Uppercase('ftSingle')          Then
  Result := ftSingle
 {$ENDIF};
End;

Function GetEncoding(Avalue : TEncodeSelect) : TEncoding;
Begin
 Result := TEncoding.utf8;
 Case Avalue of
  esUtf8  : Result := TEncoding.Unicode;
  esASCII : Result := TEncoding.ASCII;
 End;
End;

end.
