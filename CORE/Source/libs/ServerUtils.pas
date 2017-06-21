unit ServerUtils;

interface

Uses
    Classes, StringBuilderUnit,
    SysTypes, SysUtils, IdURI, IdGlobal;

Type
 TServerUtils = class
  Class Function ParseRESTURL        (Const Cmd : String)      : TArguments;
  Class Function Result2JSON         (wsResult  : TResultErro) : String;
  Class Function ParseWebFormsParams (Params    : TStrings;
                                      Const URL : String)      : TArguments;
 End;
 TServerParams = Class(TPersistent)
 Private
  fUsername,
  fPassword                     : String;
  fHasAuthenticacion            : Boolean;
  Function GetUserName          : String;
  Function GetPassword          : String;
  Function GetHasAuthentication : Boolean;
 Public
  Property HasAuthentication : Boolean Read fHasAuthenticacion Write fHasAuthenticacion;
  Property UserName          : String  Read GetUserName        Write fUsername;
  Property Password          : String  Read GetPassword        Write fPassword;
  Constructor Create; Overload;
  Procedure   Assign(Source : TPersistent); Override;
End;

implementation

// Retorna um array de strings com os parametros vindos da URL
// Ex de Cmd : 'GET /NomedoMetodo/Argumento1/Argumento2/ArgumentoN HTTP/1.1'
Class Function TServerUtils.ParseRESTURL (Const Cmd : string) : TArguments;
Var
 NewCmd       : String;
 ArraySize    : Integer;
 iBar1, IBar2 : Integer;
 Cont         : Integer;
 Function CountExpression(Value : String; Expression : Char) : Integer;
 Var
  I : Integer;
 Begin
  Result := 0;
  For I := 0 To Length(Value) -1 Do
   Begin
    If Value[I] = Expression Then
      Inc(Result);
   End;
 End;
Begin
 NewCmd    := Cmd;
 If CountExpression(NewCmd, '/') > 0 Then
  Begin
   ArraySize := CountExpression(NewCmd, '/');
   SetLength(Result, ArraySize);
   NewCmd    := NewCmd + '/';
   iBar1 := Pos ('/', NewCmd);
   Delete (NewCmd, 1, iBar1);
   For Cont := 0 to ArraySize - 1 Do
    Begin
     iBar2 := Pos ('/', NewCmd);
     Result [Cont] := TIdURI.URLDecode (Copy (NewCmd, 1, iBar2 - 1), IndyTextEncoding (encUTF8));
     Delete (NewCmd, 1, iBar2);
    End;
  End;
End;

Class Function TServerUtils.ParseWebFormsParams (Params : TStrings; const URL : String): TArguments;
Var
 I   : Integer;
 Cmd : string;
Begin
 SetLength(Result, Params.Count + 1);
 // Extrai nome do ServerMethod
 Cmd       := URL + '/';
 I         := Pos ('/', Cmd);
 Delete(Cmd, 1, I);
 I         := Pos ('/', Cmd);
 Result[0] := Copy(Cmd, 1, I - 1);
 // Extrai Parametros
 For I := 0 To Params.Count -1 Do
  Result[I +1] := Copy(Params[I], Pos('=', Params[I]) + 1, 255);
End;

Class Function TServerUtils.Result2JSON (wsResult : TResultErro) : String;
Begin
 Result := '{"STATUS":"' + IntToStr(wsResult.Status) + '","MENSSAGE":"' + wsResult.MessageText + '"}';
End;

Procedure TServerParams.Assign(Source: TPersistent);
Var
 Src : TServerParams;
Begin
 If Source is TServerParams Then
  Begin
   Src := TServerParams(Source);
   fUsername := Src.fUsername;
   fPassword := Src.fPassword;
   fHasAuthenticacion := Src.fHasAuthenticacion;
  End
 Else
  Inherited;
End;

Constructor TServerParams.Create;
Begin
 HasAuthentication := False;
End;

Function TServerParams.GetUserName : String;
Begin
 Result := fUsername;
End;

Function TServerParams.GetPassword : String;
Begin
 Result := fPassword;
End;

Function TServerParams.GetHasAuthentication : Boolean;
Begin
 Result := fHasAuthenticacion;
End;

end.
