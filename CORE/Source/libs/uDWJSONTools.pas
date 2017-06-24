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
Begin
 {$IFDEF FPC}
 Result := EncodeStringBase64(Value);
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
Begin
 If Length(Value) > 0 Then
  Begin
   {$IFDEF FPC}
   Result := DecodeStringBase64(Value);
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
