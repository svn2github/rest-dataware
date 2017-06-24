unit ServerMethodsUnit1;

interface

uses SysUtils, Classes, Windows, uDWConsts, uDWJSONTools, uDWJSONObject,
     System.JSON, Dialogs, ServerUtils, SysTypes,
     {$IFDEF FPC}
     {$ELSE}
     FireDAC.Dapt,
     FireDAC.Phys.FBDef,
     FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, Data.DB,
     FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
     FireDAC.Stan.StorageJSON;
     {$ENDIF}

Type
{$METHODINFO ON}
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
   // http://localhost:8080/ConsultaBanco/SQL ENCODE64
   Function ConsultaBanco(SQL       : String) : String;
   Function CallGETServerMethod   (Argumentos : TArguments) : String;
   Function CallPUTServerMethod   (Argumentos : TArguments) : string;
   Function CallDELETEServerMethod(Argumentos : TArguments) : string;
   Function CallPOSTServerMethod  (Argumentos : TArguments) : string;
  public
   { Public declarations }
   Constructor Create    (aOwner : TComponent); Override;
   Destructor  Destroy; Override;
   Function    ReplyEvent(SendType  : TSendEvent;
                          Arguments : TArguments) : String;Override;
  End;
{$METHODINFO OFF}

implementation

uses StrUtils, RestDWServerFormU;


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
  JSONObject.AddPair(TJSONPair.Create('STATUS',   'OK'));
  JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Inserido com sucesso'));
  Result := JSONObject.ToJSON;
 Finally
  List.Free;
  JSONObject.Free;
 End;
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
     JSONObject.AddPair(TJSONPair.Create('ID', IntToStr(ID)))
    Else
     Begin
      JSONObject.AddPair(TJSONPair.Create('STATUS',   'NOK'));
      JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Não encontrado'));
     End;
   End
  Else
   Begin
    JSONObject.AddPair(TJSONPair.Create('STATUS',   'NOK'));
    JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Não encontrado'));
   End;
  Result := JSONObject.ToJSON;
 Finally
  List.Free;
  JSONObject.Free;
 End;
End;

Function TServerMethods1.ConsultaBanco(SQL: String): String;
Var
 vSQL : String;
 JSONValue : uDWJSONObject.TJSONValue;
 {$IFDEF FPC}
 {$ELSE}
 fdQuery : TFDQuery;
 {$ENDIF}
Begin
 vSQL := DecodeStrings(SQL{$IFNDEF FPC}, GetEncoding(RestDWForm.RESTServicePooler1.Encoding){$ENDIF});
 {$IFDEF FPC}
 {$ELSE}
  fdQuery   := TFDQuery.Create(Nil);
  JSONValue := uDWJSONObject.TJSONValue.Create;
  Try
   fdQuery.Connection := RestDWForm.Server_FDConnection;
   fdQuery.SQL.Add(vSQL);
   JSONValue.LoadFromDataset('sql', fdQuery);
   Result             := JSONValue.Value;
  Finally
   JSONValue.Free;
   fdQuery.Free;
  End;
 {$ENDIF}
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
      LJson.AddPair(TJSONPair.Create('NomeAluno', LinesD));
      LArr.Add(LJson);
     End;
    LJsonObject.AddPair(TJSONPair.Create('Alunos', LArr));
    LinesD := LJsonObject.ToJSON;
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
    JSONObject.AddPair(TJSONPair.Create('STATUS',   'OK'));
    JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Atualizado com sucesso'));
   End
  Else
   Begin
    JSONObject.AddPair(TJSONPair.Create('STATUS',   'NOK'));
    JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Aluno não encontrado'));
   End;
  Result := JSONObject.ToJSON;
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
    JSONObject.AddPair(TJSONPair.Create('STATUS',   'OK'));
    JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Deletado com sucesso'));
   End
  Else
   Begin
    JSONObject.AddPair(TJSONPair.Create('STATUS',   'NOK'));
    JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Aluno não encontrado'));
   End;
  Result := JSONObject.ToJSON;
 Finally
  List.Free;
  JSONObject.Free;
 End;
End;


End.




