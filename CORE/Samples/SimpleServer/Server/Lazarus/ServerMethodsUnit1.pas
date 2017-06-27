unit ServerMethodsUnit1;

interface

uses SysUtils, Classes, uDWConsts,
     fpjson, Dialogs, ServerUtils, SysTypes,
     uDWJSONObject, sqldb, uDWJSONTools;

Type
{$METHODINFO ON}

  { TServerMethods1 }

  TServerMethods1 = class(TServerMethods)
  Private
   // http://localhost:8080/InsereAluno/fulano
   Function InsereAluno (NomeAluno : String) : String;
   // http://localhost:8080/ConsultaAluno/fulano
   Function ConsultaAluno (NomeAluno : String) : String;
   // http://localhost:8080/GetListaAlunos
   Function GetListaAlunos : String;
   // http://localhost:8080/AtualizaAluno/Fulano/cicrano
   Function AtualizaAluno(OldNomeAluno,
                          NewNome   : String) : String;
   // http://localhost:8080/ExcluiAluno/NomeAluno
   Function ExcluiAluno  (NomeAluno : String) : String;
   Function CallGETServerMethod   (Argumentos : TArguments) : String;
   Function CallPUTServerMethod   (Argumentos : TArguments) : string;
   Function CallDELETEServerMethod(Argumentos : TArguments) : string;
   Function CallPOSTServerMethod  (Argumentos : TArguments) : string;
   Function ConsultaBanco(SQL: String): String;            Overload;
   Function ConsultaBanco(Var Params : TDWParams) : String;Overload;
  public
   { Public declarations }
   Constructor Create    (aOwner : TComponent); Override;
   Destructor  Destroy; Override;
   Function    ReplyEvent(SendType   : TSendEvent;
                          Arguments  : TArguments) : String;Override;
   Function    ReplyEvent(SendType   : TSendEvent;
                          Context    : String;
                          Var Params : TDWParams)  : String;Override;
  End;
{$METHODINFO OFF}

implementation


uses StrUtils, formMain;


Constructor TServerMethods1.Create (aOwner : TComponent);
Begin
 Inherited Create (aOwner);
End;

Destructor TServerMethods1.Destroy;
Begin
 Inherited Destroy;
End;

Function TServerMethods1.CallGETServerMethod (Argumentos : TArguments) : string;
Var
 FoundMethod : Boolean;
begin
 FoundMethod := False;
 If Length(Argumentos) > 0 Then
  Begin
   If UpperCase(Argumentos[0]) = UpperCase('ConsultaAluno') Then
    Begin
     FoundMethod := True;
     If Length (Argumentos) >= 2 Then
      Result := ConsultaAluno (Argumentos[1])
     Else
      Result := ReturnIncorrectArgs;
    End;
   If UpperCase(Argumentos[0]) = UpperCase('GetListaAlunos') Then
    Begin
     FoundMethod := True;
     If Length (Argumentos) >= 1 Then
      Result := GetListaAlunos
     Else
      Result := ReturnIncorrectArgs;
    End;
   If UpperCase(Argumentos[0]) = UpperCase('ConsultaBanco') Then
    Begin
     FoundMethod := True;
     If Length (Argumentos) >= 2 Then
      Result := ConsultaBanco(Argumentos[1])
     Else
      Result := ReturnIncorrectArgs;
    End;
  End;
 If Not FoundMethod Then
  Result := ReturnMethodNotFound;
End;

Function TServerMethods1.CallPOSTServerMethod (Argumentos : TArguments) : string;
Var
 FoundMethod : Boolean;
Begin
 FoundMethod := False;
 If UpperCase(Argumentos[0]) = UpperCase('AtualizaAluno') Then
  Begin
   FoundMethod := True;
   If Length (Argumentos) >= 3 Then
    Result := AtualizaAluno (Argumentos[1], Argumentos[2])
   Else
    Result := ReturnIncorrectArgs;
  End;
 If UpperCase(Argumentos[0]) = UpperCase('ConsultaBanco') Then
  Begin
   FoundMethod := True;
   If Length (Argumentos) >= 2 Then
    Result := ConsultaBanco(Argumentos[1])
   Else
    Result := ReturnIncorrectArgs;
  End;
 If Not FoundMethod Then
  Result := ReturnMethodNotFound;
End;

Function TServerMethods1.CallPUTServerMethod (Argumentos : TArguments) : string;
Var
 FoundMethod : Boolean;
Begin
 FoundMethod := False;
 If UpperCase(Argumentos[0]) = UpperCase('InsereAluno') Then
  Begin
   FoundMethod := True;
   If Length (Argumentos) >= 2 Then
    Result := InsereAluno (Argumentos[1])
   Else
    Result := ReturnIncorrectArgs;
  End;
 If Not FoundMethod Then
  Result := ReturnMethodNotFound;
End;

Function TServerMethods1.CallDELETEServerMethod (Argumentos : TArguments) : string;
Var
 FoundMethod : Boolean;
Begin
 FoundMethod := False;
 If UpperCase(Argumentos[0]) = UpperCase('ExcluiAluno') Then
  Begin
   FoundMethod := True;
   If Length (Argumentos) >= 2 Then
    Result := ExcluiAluno (Argumentos[1])
   Else
    Result := ReturnIncorrectArgs;
  End;
 If Not FoundMethod Then
  Result := ReturnMethodNotFound;
End;

// Aqui voce vai
// 1 - Conectar com o Banco
// 2 - Executar a query
// 3 - Fechar conexão com o banco
// 4 - Retornar o resultado em JSON

// Foi usado um Arquivo Texto para armazenar dados e um StringList
// o objetivo aqui é apenas mostrar como é um WebService REST + JSON
// e suas operações, o codigo de banco fica por sua conta.

Function TServerMethods1.InsereAluno (NomeAluno : String) : String;
Var
 List       : TStringList;
 JSONObject : TJSONObject;
Begin
 List       := TStringList.Create;
 JSONObject := TJSONObject.Create;
 Try
  If Not FileExists (ExtractFilePath(ParamStr(0)) + '\Alunos.Txt') then
   FileClose(FileCreate (ExtractFilePath(ParamStr(0)) + '\Alunos.Txt'));
  List.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
  List.Add (NomeAluno);
  List.SaveToFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
  JSONObject.Add('STATUS', 'OK');
  JSONObject.Add('MENSAGEM', 'Inserido com sucesso');
  Result := JSONObject.AsJSON;
 Finally
  List.Free;
  JSONObject.Free;
 End;
End;

Function TServerMethods1.ReplyEvent(SendType   : TSendEvent;
                                    Context    : String;
                                    Var Params : TDWParams) : String;
Var
 JSONObject : uDWJSONObject.TJSONValue;
Begin
 JSONObject := uDWJSONObject.TJSONValue.Create;
 Case SendType Of
  sePOST   :
   Begin
    If UpperCase(Context) = Uppercase('ConsultaBanco') Then
     Result := ConsultaBanco(Params)
    Else
     Begin
//      JSONObject.AddPair(TJSONPair.Create('STATUS',   'NOK'));
//      JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Método não encontrado'));
      Result := JSONObject.ToJSON;
     End;
   End;
 End;
 JSONObject.Free;
End;

Function TServerMethods1.ReplyEvent(SendType  : TSendEvent;
                                    Arguments : TArguments) : String;
Begin
 Case SendType Of
  seGET    : Result := CallGETServerMethod   (Arguments);
  sePOST   : Result := CallPOSTServerMethod  (Arguments);
  sePUT    : Result := CallPUTServerMethod   (Arguments);
  seDELETE : Result := CallDELETEServerMethod(Arguments);
 End;
End;

Function TServerMethods1.ConsultaAluno (NomeAluno : String) : String;
Var
 List : TStringList;
 JSONObject : TJSONObject;
 ID : Integer;
Begin
 List := TStringList.Create;
 JSONObject := TJSONObject.Create;
 Try
  If FileExists (ExtractFilePath(ParamStr(0)) + '\Alunos.Txt') Then
   Begin
    List.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
    ID := List.IndexOf(NomeAluno);
    If ID > -1 Then
     JSONObject.Add('ID', IntToStr(ID))
    Else
     Begin
      JSONObject.Add('STATUS', 'NOK');
      JSONObject.Add('MENSAGEM', 'Não encontrado');
     End;
   End
  Else
   Begin
    JSONObject.Add('STATUS', 'NOK');
    JSONObject.Add('MENSAGEM', 'Não encontrado');
   End;
  Result := JSONObject.AsJSON;
 Finally
  List.Free;
  JSONObject.Free;
 End;
End;

Function TServerMethods1.GetListaAlunos : String;
Var
 List        : TStringList;
 ID          : Integer;
 LJson       : TJSONObject;
 LJsonObject : TJSONObject;
 LArr        : TJSONArray;
 FileLoad,
 LinesD      : String;
Begin
 FileLoad    := ExtractFilePath(ParamSTR(0)) + '\Alunos.Txt';
 If FileExists(FileLoad) Then
  Begin
   List        := TStringList.Create;
   LJsonObject := TJSONObject.Create;
   LArr        := TJSONArray.Create;
   Try
    List.LoadFromFile(FileLoad);
    For Id := 0 To List.Count - 1 Do
     Begin
      LinesD := List [ID];
      LJson := TJSONObject.Create;
      LJson.Add('NomeAluno', LinesD);
      LArr.Add(LJson);
     End;
    LJsonObject.Add('Alunos', LArr);
    LinesD := LJsonObject.AsJSON;
    Result := LinesD;
   Finally
    List.Free;
    LJsonObject.Free;
   End;
  End;
End;

Function TServerMethods1.AtualizaAluno (OldNomeAluno, NewNome : String) : String;
Var
 List       : TStringList;
 JSONObject : TJSONObject;
 ID         : Integer;
Begin
 List := TStringList.Create;
 JSONObject := TJSONObject.Create;
 Try
  List.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
  ID := List.IndexOf(OldNomeAluno);
  If ID > -1 Then
   Begin
    List[ID] := NewNome;
    List.SaveToFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
    JSONObject.Add('STATUS',   'OK');
    JSONObject.Add('MENSAGEM', 'Atualizado com sucesso');
   End
  Else
   Begin
    JSONObject.Add('STATUS',   'NOK');
    JSONObject.Add('MENSAGEM', 'Aluno não encontrado');
   End;
  Result := JSONObject.AsJSON;
 Finally
  List.Free;
  JSONObject.Free;
 End;
End;

Function TServerMethods1.ExcluiAluno (NomeAluno : String) : String;
Var
 List       : TStringList;
 JSONObject : TJSONObject;
 ID         : Integer;
Begin
 List := TStringList.Create;
 JSONObject := TJSONObject.Create;
 Try
  List.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
  ID := List.IndexOf(NomeAluno);
  If ID > -1 Then
   Begin
    List.Delete(ID);
    List.SaveToFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
    JSONObject.Add('STATUS',   'OK');
    JSONObject.Add('MENSAGEM', 'Deletado com sucesso');
   End
  Else
   Begin
    JSONObject.Add('STATUS',   'NOK');
    JSONObject.Add('MENSAGEM', 'Aluno não encontrado');
   End;
  Result := JSONObject.AsJSON;
 Finally
  List.Free;
  JSONObject.Free;
 End;
End;

Function TServerMethods1.ConsultaBanco(Var Params : TDWParams) : String;
Var
 vSQL : String;
 JSONValue : TJSONValue;
 fdQuery   : TSQLQuery;
Begin
 If Params.ItemsString['SQL'] <> Nil Then
  Begin
   fdQuery            := TSQLQuery.Create(Nil);
   JSONValue          := uDWJSONObject.TJSONValue.Create;
   JSONValue.Encoding := GetEncoding(frmMain.RESTServicePooler1.Encoding);
   If Params.ItemsString['SQL'].value <> '' Then
    Begin
     If Params.ItemsString['TESTPARAM'] <> Nil Then
      Params.ItemsString['TESTPARAM'].Value := 'OK';
     vSQL      := Params.ItemsString['SQL'].value;
     Try
      fdQuery.DataBase := frmMain.IBConnection1;
      fdQuery.SQL.Add(vSQL);
      JSONValue.Encoding := GetEncoding(frmMain.RESTServicePooler1.Encoding);
      JSONValue.LoadFromDataset('sql', fdQuery);
      Result             := JSONValue.ToJSON;
     Finally
      JSONValue.Free;
      fdQuery.Free;
     End;
    End;
  End;
End;

Function TServerMethods1.ConsultaBanco(SQL: String): String;
Var
 vSQL : String;
 JSONValue : TJSONValue;
 fdQuery   : TSQLQuery;
Begin
 fdQuery   := TSQLQuery.Create(Nil);
 JSONValue := TJSONValue.Create;
 JSONValue.LoadFromJSON(SQL);
 If JSONValue.Value <> '' Then
  Begin
   vSQL      := DecodeStrings(JSONValue.Value{$IFNDEF FPC}, GetEncoding(RestDWForm.RESTServicePooler1.Encoding){$ENDIF});
   Try
    fdQuery.DataBase := frmMain.IBConnection1;
    fdQuery.SQL.Add(vSQL);
    JSONValue.Encoding := GetEncoding(frmMain.RESTServicePooler1.Encoding);
    JSONValue.LoadFromDataset('sql', fdQuery);
    Result             := JSONValue.Value;
   Finally
    JSONValue.Free;
    fdQuery.Free;
   End;
  End;
End;

End.




