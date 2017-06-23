unit uDWJSONTools;

interface

Uses System.SysUtils, SysTypes, ServerUtils, System.Classes, Soap.EncdDecd, uDWConsts;

Function GetPairJSON  (Status      : Integer;
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8): String;Overload;
Function GetPairJSON  (Tag,
                       MessageText : String;
                       Encoding    : TEncodeSelect = esUtf8) : String;Overload;
Function EncodeStrings(Value       : String;
                       Encoding    : TEncoding)              : String;
Function DecodeStrings(Value       : String;
                       Encoding    : TEncoding)              : String;

implementation

Function EncodeStrings(Value : String; Encoding : TEncoding) : String;
Var
 Input,
 Output : TStringStream;
Begin
 Input := TStringStream.Create(Value,Encoding);
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
End;

Function DecodeStrings(Value : String;Encoding : TEncoding) : String;
Var
 Input,
 Output : TStringStream;
Begin
 If Length(Value) > 0 Then
  Begin
   Input := TStringStream.Create(Value, Encoding);
   Try
    Output := TStringStream.Create('', Encoding);
    Try
     Soap.EncdDecd.DecodeStream(Input, Output);
     Output.Position := 0;
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
 Result               := EncodeStrings(TServerUtils.Result2JSON(WSResult), GetEncoding(Encoding));
End;

Function GetPairJSON(Status      : Integer;
                     MessageText : String;
                     Encoding    : TEncodeSelect = esUtf8) : String;
Var
 WSResult : TResultErro;
Begin
 WSResult.STATUS      := IntToStr(Status);
 WSResult.MessageText := MessageText;
 Result               := EncodeStrings(TServerUtils.Result2JSON(WSResult), GetEncoding(Encoding));
End;

end.
