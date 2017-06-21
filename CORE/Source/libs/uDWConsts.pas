unit uDWConsts;

Interface

Uses System.SysUtils;

Const
 AuthRealm = 'Provide Authentication';

Type
 TEncodeSelect = (esASCII, esUtf8);

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
