unit uDWJSONTools;

interface

Uses
  {$IFDEF FPC}
   SysUtils, ServerUtils, Classes, uDWConsts, IdGlobal, IdCoderMIME;
  {$ELSE}
   {$if CompilerVersion > 21} // Delphi 2010 pra cima
    System.SysUtils, ServerUtils, System.Classes, IdGlobal, IdCoderMIME, uDWConsts;
   {$ELSE}
    SysUtils, ServerUtils, Classes, IdGlobal, IdCoderMIME, uDWConsts;
   {$IFEND}
  {$ENDIF}

Function GetPairJSON  (Status      : Integer;
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8): String;Overload;
Function GetPairJSON  (Tag,
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8) : String;Overload;
Function EncodeStrings(Value       : String{$IFNDEF FPC}{$if CompilerVersion > 21}
                                            ;Encoding : TEncoding = Nil
                                           {$IFEND}{$ENDIF})             : String;
Function DecodeStrings(Value       : String{$IFNDEF FPC}{$if CompilerVersion > 21}
                                            ;Encoding : TEncoding = Nil
                                           {$IFEND}{$ENDIF})              : String;
Function EncodeBytes  (Value : String{$IFNDEF FPC}{$if CompilerVersion > 21}
                                      ;Encoding : TEncoding {$IFEND}{$ENDIF}) : TIdBytes;

implementation

Uses SysTypes;

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

Function EncodeStrings(Value : String{$IFNDEF FPC}{$if CompilerVersion > 21}; Encoding : TEncoding = Nil{$IFEND}{$ENDIF}) : String;
Var
 Encoder: TIdEncoderMIME;
Begin
 Encoder := TIdEncoderMIME.Create(nil);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   Result := Encoder.EncodeString(Value, IndyTextEncoding_ASCII);
  {$ELSE}
   Result := Encoder.EncodeString(Value);
  {$IFEND}
 {$ELSE}
  Result := Encoder.EncodeString(Value);
 {$ENDIF}
 Encoder.Free;
End;

Function DecodeStrings(Value : String{$IFNDEF FPC}{$if CompilerVersion > 21};Encoding : TEncoding = Nil{$IFEND}{$ENDIF}) : String;
Var
 Encoder: TIdDecoderMIME;
Begin
 Encoder := TIdDecoderMIME.Create(nil);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   Result := Encoder.DecodeString(Value, IndyTextEncoding_ASCII);
  {$ELSE}
   Result := Encoder.DecodeString(Value);
  {$IFEND}
 {$ELSE}
  Result := Encoder.DecodeString(Value);
 {$ENDIF}
 Encoder.Free;
End;

Function GetPairJSON(Tag,
                     MessageText : String;
                     Encoding    : TEncodeSelect = esUtf8) : String;
Var
 WSResult : TResultErro;
Begin
 WSResult.STATUS      := Tag;
 WSResult.MessageText := MessageText;
 Result               := EncodeStrings(TServerUtils.Result2JSON(WSResult){$IFNDEF FPC}{$if CompilerVersion > 21}, GetEncoding(Encoding){$IFEND}{$ENDIF});
End;

Function GetPairJSON(Status      : Integer;
                     MessageText : String;
                     Encoding    : TEncodeSelect = esUtf8) : String;
Var
 WSResult : TResultErro;
Begin
 WSResult.STATUS      := IntToStr(Status);
 WSResult.MessageText := MessageText;
 Result               := EncodeStrings(TServerUtils.Result2JSON(WSResult){$IFNDEF FPC}{$if CompilerVersion > 21}, GetEncoding(Encoding){$IFEND}{$ENDIF});
End;

end.
