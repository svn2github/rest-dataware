unit uDWConsts;

Interface

Uses {$IFDEF LCL}
     SysUtils, DB;
     {$ELSE}
     System.SysUtils,
     Data.DB;
     {$ENDIF}

Const
 TValueFormatJSON      = '{"%s":"%s", "%s":"%s", "%s":"%s", "%s":[%s]}';
 TJsonDatasetHeader    = '{"Field":"%s", "Type":"%s", "Primary":"%s", "Required":"%s", "Size":%d, "Precision":%d}';
 TJsonValueFormat      = '[%s]';
 TSepValueMemString    = '\\';
 TQuotedValueMemString = '\"';
 AuthRealm             = 'Provide Authentication';
 UrlBase               = '%s://%s:%d/';

Type
 TEncodeSelect    = (esASCII,    esUtf8);
 TSendEvent       = (seGET,      sePOST,
                     sePUT,      seDELETE);
 TTypeRequest     = (trHttp,     trHttps);
 TTypeObject      = (toDataset,  toParam,
                     toVariable, toObject);
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

 Function GetEncoding     (Avalue          : TEncodeSelect)    : TEncoding;
 Function GetObjectName   (TypeObject      : TTypeObject)      : String;
 Function GetDirectionName(ObjectDirection : TObjectDirection) : String;
 Function GetValueType    (ObjectValue     : TObjectValue)     : String;
 Function GetFieldType    (FieldType       : TFieldType)       : String;
 Function StringFloat     (aValue          : String)           : String;

implementation

Function StringFloat     (aValue          : String)           : String;
Begin
 Result := StringReplace(aValue, '.', '', [rfReplaceall]);
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

Function GetDirectionName(ObjectDirection : TObjectDirection) : String;
Begin
 Result := 'odINOUT';
 Case ObjectDirection Of
  odINOUT : Result := 'odINOUT';
  odIN    : Result := 'odIN';
  odOUT   : Result := 'odOUT';
 End;
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
 End;
End;

Function GetEncoding(Avalue : TEncodeSelect) : TEncoding;
Begin
 Result := TEncoding.utf8;
 Case Avalue of
  esUtf8  : Result := TEncoding.utf8;
  esASCII : Result := TEncoding.ASCII;
 End;
End;

end.
