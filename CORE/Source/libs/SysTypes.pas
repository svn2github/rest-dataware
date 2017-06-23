unit SysTypes;

Interface

Uses
 IdURI, IdGlobal, SysUtils, Classes, ServerUtils, uDWConsts;

Type
 TResultErro = Record
  Status,
  MessageText : String;
End;

TArguments = Array Of String;

Type
 TServerUtils = Class
  Class Function ParseRESTURL        (Const Cmd : String)      : TArguments;
  Class Function Result2JSON         (wsResult  : TResultErro) : String;
  Class Function ParseWebFormsParams (Params    : TStrings;
                                      Const URL : String)      : TArguments;
End;

Type
 TServerMethods = Class(TComponent)
 Protected
  Function    ReturnIncorrectArgs  : String;
  Function    ReturnMethodNotFound : String;
 Public
  Function    ReplyEvent(SendType  : TSendEvent;
                         Arguments : TArguments) : String;Virtual;
  Constructor Create    (aOwner    : TComponent); Override;
  Destructor  Destroy; Override;
End;

implementation

{ TServerMethods }

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
 Result := '{"STATUS":"' + wsResult.Status + '","MENSSAGE":"' + wsResult.MessageText + '"}';
End;

constructor TServerMethods.Create(aOwner: TComponent);
begin
  inherited;
end;

destructor TServerMethods.Destroy;
begin
  inherited;
end;

Function TServerMethods.ReplyEvent(SendType  : TSendEvent;
                                   Arguments : TArguments) : String;
Begin
 //Virtual Function
End;

Function TServerMethods.ReturnIncorrectArgs: String;
Var
 WSResult : TResultErro;
Begin
 WSResult.STATUS      := '-1';
 WSResult.MessageText := 'Total de argumentos menor que o esperado';
 Result               := TServerUtils.Result2JSON(WSResult);
End;

Function TServerMethods.ReturnMethodNotFound: String;
Var
 WSResult : TResultErro;
Begin
 WSResult.STATUS      := '-2';
 WSResult.MessageText := 'Metodo nao encontrado';
 Result               := TServerUtils.Result2JSON(WSResult);
End;

end.
