unit uDWJSONTools;

interface

Uses
  {$IFDEF FPC}
  SysUtils, ServerUtils, Classes, uDWConsts, IdGlobal, IdCoderMIME;
  {$ELSE}
  System.SysUtils, ServerUtils, System.Classes, IdGlobal, IdCoderMIME, uDWConsts;
  {$ENDIF}


Function GetPairJSON  (Status      : Integer;
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8): String;Overload;
Function GetPairJSON  (Tag,
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8) : String;Overload;
Function EncodeStrings(Value       : String
                      {$IFNDEF FPC};
                          Encoding : TEncoding = Nil
                                      {$ENDIF})              : String;
Function DecodeStrings(Value       : String
                      {$IFNDEF FPC};
                          Encoding : TEncoding = Nil
                                      {$ENDIF})              : String;
Function EncodeBytes  (Value : String{$IFNDEF FPC}; Encoding : TEncoding{$ENDIF}) : TIdBytes;

implementation

uses SysTypes;

Function EncodeBytes(Value : String{$IFNDEF FPC}; Encoding : TEncoding{$ENDIF}) : TIdBytes;
Var
 Encoder: TIdEncoderMIME;
Begin
 Encoder := TIdEncoderMIME.Create(nil);
 {$IFDEF FPC}
 Result := ToBytes(Encoder.Encode(Value, IndyTextEncoding_ASCII));
 {$ELSE}
 Result := ToBytes(Encoder.Encode(Value, IndyTextEncoding(Encoding)));
 {$ENDIF}
 Encoder.Free;
End;

Function EncodeStrings(Value : String{$IFNDEF FPC}; Encoding : TEncoding = Nil{$ENDIF}) : String;
Var
 Encoder: TIdEncoderMIME;
Begin
 Encoder := TIdEncoderMIME.Create(nil);
 {$IFDEF FPC}
 Result := Encoder.EncodeString(Value, IndyTextEncoding_ASCII);
 {$ELSE}
  If Encoding <> Nil Then
   Result := Encoder.EncodeString(Value, IndyTextEncoding(Encoding))
  Else
   Result := Encoder.EncodeString(Value, IndyTextEncoding_ASCII);
 {$ENDIF}
 Encoder.Free;
End;

Function DecodeStrings(Value : String{$IFNDEF FPC};Encoding : TEncoding = Nil{$ENDIF}) : String;
Var
 Encoder: TIdDecoderMIME;
Begin
 Encoder := TIdDecoderMIME.Create(nil);
 {$IFDEF FPC}
  Result := Encoder.DecodeString(Value, IndyTextEncoding_ASCII);
 {$ELSE}
  If Encoding <> Nil Then
   Result := Encoder.DecodeString(Value, IndyTextEncoding(Encoding))
  Else
   Result := Encoder.DecodeString(Value, IndyTextEncoding_ASCII);
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
 Result               := EncodeStrings(TServerUtils.Result2JSON(WSResult){$IFNDEF FPC}, GetEncoding(Encoding){$ENDIF});
End;

Function GetPairJSON(Status      : Integer;
                     MessageText : String;
                     Encoding    : TEncodeSelect = esUtf8) : String;
Var
 WSResult : TResultErro;
Begin
 WSResult.STATUS      := IntToStr(Status);
 WSResult.MessageText := MessageText;
 Result               := EncodeStrings(TServerUtils.Result2JSON(WSResult){$IFNDEF FPC}, GetEncoding(Encoding){$ENDIF});
End;

end.
