unit uDWJSONTools;

interface

Uses
  {$IFDEF FPC}
   SysUtils, ServerUtils, Classes, uDWConsts, IdGlobal, IdCoderMIME, uDWConstsData, IdHashMessageDigest, base64, LConvEncoding;
  {$ELSE}
   {$if CompilerVersion > 21} // Delphi 2010 pra cima
    System.SysUtils, ServerUtils, System.Classes, IdGlobal, IdCoderMIME, uDWConsts, uDWConstsData, IdHashMessageDigest;
   {$ELSE}
    SysUtils, ServerUtils, Classes, IdGlobal, IdCoderMIME, uDWConsts, uDWConstsData, IdHashMessageDigest;
   {$IFEND}
  {$ENDIF}

Const
 ReTablebase64 = #$40 + #$40 + #$40 + #$40 + #$40 + #$40 + #$40 + #$40 + #$40 + #$40 + #$3E + #$40
               + #$40 + #$40 + #$3F + #$34 + #$35 + #$36 + #$37 + #$38 + #$39 + #$3A + #$3B + #$3C
               + #$3D + #$40 + #$40 + #$40 + #$40 + #$40 + #$40 + #$40 + #$00 + #$01 + #$02 + #$03
               + #$04 + #$05 + #$06 + #$07 + #$08 + #$09 + #$0A + #$0B + #$0C + #$0D + #$0E + #$0F
               + #$10 + #$11 + #$12 + #$13 + #$14 + #$15 + #$16 + #$17 + #$18 + #$19 + #$40 + #$40
               + #$40 + #$40 + #$40 + #$40 + #$1A + #$1B + #$1C + #$1D + #$1E + #$1F + #$20 + #$21
               + #$22 + #$23 + #$24 + #$25 + #$26 + #$27 + #$28 + #$29 + #$2A + #$2B + #$2C + #$2D
               + #$2E + #$2F + #$30 + #$31 + #$32 + #$33 + #$40 + #$40 + #$40 + #$40 + #$40 + #$40;
 TableBase64   = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';


Function GetPairJSON  (Status      : Integer;
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8) : String;Overload;
Function GetPairJSON  (Tag,
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8) : String;Overload;
Function DecodeBase64 (Const Value : AnsiString)             : AnsiString;
Function EncodeBase64 (Const Value : AnsiString)             : AnsiString;
Function EncodeStrings(Value       : String)                 : String;
Function DecodeStrings(Value       : String)                 : String;
Function EncodeBytes  (Value : String{$IFNDEF FPC}{$if CompilerVersion > 21}
                                      ;Encoding : TEncoding {$IFEND}{$ENDIF}) : TIdBytes;

Implementation

Uses SysTypes;


Function Decode4to3Ex(const Value, Table: AnsiString): AnsiString;
Var
 p,  x, y,
 lv, d, dl : Integer;
 c         : Byte;
Begin
 lv := Length(Value);
 SetLength(Result, lv);
 x := 1;
 dl := 4;
 d := 0;
 p := 1;
 While x <= lv Do
  Begin
   y := Ord(Value[x]);
   If y In [33..127] Then
    c := Ord(Table[y - 32])
   Else
    c := 64;
   Inc(x);
   If c > 63 Then
    Continue;
   d := (d shl 6) or c;
   dec(dl);
   If dl <> 0 Then
    Continue;
   Result[p] := AnsiChar((d shr 16) and $ff);
   Inc(p);
   Result[p] := AnsiChar((d shr 8) and $ff);
   Inc(p);
   Result[p] := AnsiChar(d and $ff);
   Inc(p);
   d := 0;
   dl := 4;
  End;
 Case dl Of
  1 : Begin
       d := d shr 2;
       Result[p] := AnsiChar((d shr 8) and $ff);
       Inc(p);
       Result[p] := AnsiChar(d and $ff);
       Inc(p);
      End;
  2 : Begin
       d := d shr 4;
       Result[p] := AnsiChar(d and $ff);
       Inc(p);
      End;
 End;
 SetLength(Result, p - 1);
End;

Function Encode3to4(Const Value, Table : AnsiString) : AnsiString;
Var
 c     : Byte;
 n, l,
 Count : Integer;
 DOut  : Array[0..3] of Byte;
Begin
 SetLength(Result, ((Length(Value) + 2) div 3) * 4);
 l := 1;
 Count := 1;
 While Count <= Length(Value) do
  Begin
   c := Ord(Value[Count]);
   Inc(Count);
   DOut[0] := (c and $FC) shr 2;
   DOut[1] := (c and $03) shl 4;
   If Count <= Length(Value) then
    Begin
     c := Ord(Value[Count]);
     Inc(Count);
     DOut[1] := DOut[1] + (c and $F0) shr 4;
     DOut[2] := (c and $0F) shl 2;
     If Count <= Length(Value) then
      Begin
       c := Ord(Value[Count]);
       Inc(Count);
       DOut[2] := DOut[2] + (c and $C0) shr 6;
       DOut[3] := (c and $3F);
      End
     Else
      DOut[3] := $40;
    End
   Else
    Begin
     DOut[2] := $40;
     DOut[3] := $40;
    End;
   For n := 0 To 3 Do
    Begin
     If (DOut[n] + 1) <= Length(Table) Then
      Begin
       Result[l] := Table[DOut[n] + 1];
       Inc(l);
      End;
     End;
  End;
 SetLength(Result, l - 1);
End;

Function DecodeBase64(Const Value : AnsiString) : AnsiString;
Begin
 Result := Decode4to3Ex(Value, ReTableBase64);
End;

Function EncodeBase64(Const Value : AnsiString) : AnsiString;
Begin
 Result := Encode3to4(Value, TableBase64);
End;

Function EncodeBytes(Value : String{$IFNDEF FPC}{$if CompilerVersion > 21}; Encoding : TEncoding{$IFEND}{$ENDIF}) : TIdBytes;
Var
 Encoder: TIdEncoderMIME;
Begin
 Encoder := TIdEncoderMIME.Create(nil);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   Result := ToBytes(Encoder.Encode(Value, IndyTextEncoding_ASCII));
  {$ELSE}
   Result := ToBytes(Encoder.Encode(Value{$if CompilerVersion > 21}, IndyTextEncoding(Encoding){$IFEND}));
  {$IFEND}
 {$ELSE}
  Result := ToBytes(Encoder.Encode(Value));
 {$ENDIF}
 Encoder.Free;
End;

Function HexStringToString(Value : String) : String;
Var
 BinaryStream : TStringStream;
Begin
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   BinaryStream := TStringStream.Create('', TEncoding.ANSI);
  {$ELSE}
   BinaryStream := TStringStream.Create('');
  {$IFEND}
 {$ELSE}
  BinaryStream := TStringStream.Create('');
 {$ENDIF}
 Try
  BinaryStream.Size := Length(Value) div 2;
  If BinaryStream.Size > 0 Then
   Begin
    HexToBin(PChar(Value), TMemoryStream(BinaryStream).Memory, BinaryStream.Size);
    Result := BinaryStream.DataString;
   End;
 Finally
  BinaryStream.Free;
 End;
End;

Function StringToHex(Value : String) : String;
Var
 BinaryStream : TStringStream;
Begin
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   BinaryStream := TStringStream.Create(AnsiString(Utf8Encode(Value)), TEncoding.ANSI);
  {$ELSE}
   BinaryStream := TStringStream.Create(Value);
  {$IFEND}
 {$ELSE}
  BinaryStream := TStringStream.Create(Value);
 {$ENDIF}
 Try
  BinaryStream.Position := 0;
  SetLength(Result, BinaryStream.Size * 2);
  BinToHex(TMemoryStream(BinaryStream).Memory, PChar(Result), BinaryStream.Size);
 Finally
  BinaryStream.Free;
 End;
End;

Function EncodeStrings(Value : String) : String;
Begin
 Result := EncodeBase64(Value);
End;

Function DecodeStrings(Value : String) : String;
Begin
 {$IFDEF FPC}
  Result := CP1252ToUTF8(DecodeBase64(Value));
 {$ELSE}
  Result := DecodeBase64(Value);
 {$ENDIF}
End;

Function GetPairJSON(Tag,
                     MessageText : String;
                     Encoding    : TEncodeSelect = esUtf8) : String;
Var
 WSResult : TResultErro;
Begin
 WSResult.STATUS      := Tag;
 WSResult.MessageText := MessageText;
 Result               := EncodeStrings(TServerUtils.Result2JSON(WSResult));
End;

Function GetPairJSON(Status      : Integer;
                     MessageText : String;
                     Encoding    : TEncodeSelect = esUtf8) : String;
Var
 WSResult : TResultErro;
Begin
 WSResult.STATUS      := IntToStr(Status);
 WSResult.MessageText := MessageText;
 Result               := EncodeStrings(TServerUtils.Result2JSON(WSResult));
End;

end.
