unit uDWJSONTools;

interface

Uses
  {$IFDEF FPC}
  SysUtils, SysTypes, ServerUtils, Classes, uDWConsts, Base64;
  {$ELSE}
  System.SysUtils, SysTypes, ServerUtils, System.Classes, Soap.EncdDecd, uDWConsts;
  {$ENDIF}


Function GetPairJSON  (Status      : Integer;
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8): String;Overload;
Function GetPairJSON  (Tag,
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8) : String;Overload;
Function EncodeStrings(Value       : String
                      {$IFNDEF FPC};
                          Encoding : TEncoding
                                      {$ENDIF})              : String;
Function DecodeStrings(Value       : String
                      {$IFNDEF FPC};
                          Encoding : TEncoding
                                      {$ENDIF})              : String;

implementation

Function EncodeStrings(Value : String{$IFNDEF FPC}; Encoding : TEncoding{$ENDIF}) : String;
Var
 Input,
 Output : TStringStream;
 {$IFDEF FPC}
 Encoder : TBase64EncodingStream;
 {$ENDIF}
Begin
 {$IFDEF FPC}
 Input := TStringStream.Create(Value);
 Try
  Input.Position := 0;
  Output := TStringStream.Create('');
  Try
   Encoder := TBase64EncodingStream.Create(Output);
   Encoder.CopyFrom(Input, Input.Size);
   Encoder.Position := 0;
   Result := Encoder.ReadAnsiString;
  Finally
   Output.Free;
  End;
 Finally
  Input.Free;
 End;
 {$ELSE}
 Input := TStringStream.Create(Value, Encoding);
 Try
  Input.Position := 0;
  Output := TStringStream.Create('', Encoding);
  Try
   Soap.EncdDecd.EncodeStream(Input, Output);
   Result := Output.DataString;
  Finally
   Output.Free;
  End;
 Finally
  Input.Free;
 End;
 {$ENDIF}
End;

Function DecodeStrings(Value : String{$IFNDEF FPC};Encoding : TEncoding{$ENDIF}) : String;
Var
 Input,
 Output : TStringStream;
 {$IFDEF FPC}
 Decoder: TBase64DecodingStream;
 {$ENDIF}
Begin
 If Length(Value) > 0 Then
  Begin
   {$IFDEF FPC}
   Input := TStringStream.Create(Value);
   Try
    Output := TStringStream.Create('');
    Try
     Decoder       := TBase64DecodingStream.Create(Input);
     Output.CopyFrom(Decoder, Decoder.Size);
     Output.Position := 0;
     Try
      Result := Output.ReadAnsiString;
     Except
      Raise;
     End;
    Finally
     Output.Free;
    End;
   Finally
    Input.Free;
   End;
   {$ELSE}
   Input := TStringStream.Create(Value, Encoding);
   Try
    Output := TStringStream.Create('', Encoding);
    Try
     Input.Position := 0;
     Soap.EncdDecd.DecodeStream(Input, Output);
     Try
      Result := Output.DataString;
     Except
      Raise;
     End;
    Finally
     Output.Free;
    End;
   Finally
    Input.Free;
   End;
   {$ENDIF}
  End;
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
