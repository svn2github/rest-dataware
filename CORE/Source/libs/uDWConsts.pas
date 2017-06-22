unit uDWConsts;

Interface

Uses System.SysUtils;

Const
 AuthRealm = 'Provide Authentication';
 UrlBase   = '%s://%s:%d/';

Type
 TEncodeSelect = (esASCII, esUtf8);
 TSendEvent    = (seGET,   sePOST,
                  sePUT,   seDELETE);
 TTypeRequest  = (trHttp, trHttps);

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
