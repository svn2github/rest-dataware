unit uDWConsts;

Interface

Uses System.SysUtils;

Const
 TSepValueMemString    = '\\';
 TQuotedValueMemString = '\"';
 AuthRealm             = 'Provide Authentication';
 UrlBase               = '%s://%s:%d/';

Type
 TEncodeSelect    = (esASCII, esUtf8);
 TSendEvent       = (seGET,   sePOST,
                     sePUT,   seDELETE);
 TTypeRequest     = (trHttp, trHttps);
 TTypeObject      = (toDataset, toParam, toVariable, toObject);
 TObjectDirection = (odIN, odOUT, odINOUT);
 TObjectValue     = (ovUnknown,         ovString,       ovSmallint,         ovInteger,    ovWord, // 0..4
                     ovBoolean,         ovFloat,        ovCurrency,         ovBCD,        ovDate,      ovTime,    ovDateTime, // 5..11
                     ovBytes,           ovVarBytes,     ovAutoInc,          ovBlob,       ovMemo,      ovGraphic, ovFmtMemo, // 12..18
                     ovParadoxOle,      ovDBaseOle,     ovTypedBinary,      ovCursor,     ovFixedChar, ovWideString, // 19..24
                     ovLargeint,        ovADT, ftArray, ovReference,        ovDataSet,    ovOraBlob,   ovOraClob, // 25..31
                     ovVariant,         ovInterface,    ovIDispatch,        ovGuid,       ovTimeStamp, ovFMTBcd, // 32..37
                     ovFixedWideChar,   ovWideMemo,     ovOraTimeStamp,     ovOraInterval, // 38..41
                     ovLongWord,        ovShortint,     ovByte, ovExtended, ovConnection, ovParams,    ovStream, //42..48
                     ovTimeStampOffset, ovObject,       ovSingle); //49..51
 TDatasetType     = (dtReflection,      dtFull,         dtDiff);

Function GetEncoding(Avalue : TEncodeSelect) : TEncoding;

implementation

Function GetEncoding(Avalue : TEncodeSelect) : TEncoding;
Begin
 Case Avalue of
  esUtf8  : Result := TEncoding.utf8;
  esASCII : Result := TEncoding.ASCII;
 End;
End;

end.
