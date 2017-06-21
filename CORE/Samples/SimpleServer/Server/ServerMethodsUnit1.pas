unit ServerMethodsUnit1;

interface

uses SysUtils, Classes, Windows,
     System.JSON, Dialogs, ServerUtils, SysTypes;

type
{$METHODINFO ON}
  TServerMethods1 = class(TServerMethods)
  private
    { Private declarations }
    Function ReturnIncorrectArgs : String;
    Function ReturnMethodNotFound : String;

    // http://localhost:8080/InsereAluno/fulano
    function InsereAluno (NomeAluno : String) : String;

    // http://localhost:8080/ConsultaAluno/fulano
    function ConsultaAluno (NomeAluno : String) : String;

    // http://localhost:8080/GetListaAlunos
    function GetListaAlunos : String;

    // http://localhost:8080/AtualizaAluno/Fulano/cicrano
    function AtualizaAluno (OldNomeAluno, NewNome : String) : String;

    // http://localhost:8080/ExcluiAluno/NomeAluno
    function ExcluiAluno (NomeAluno : String) : String;

  public
    { Public declarations }
    Constructor Create (aOwner : TComponent); Override;
    Destructor Destroy; Override;
    function CallGETServerMethod (Argumentos : TArguments) : String;Override;
    function CallPUTServerMethod (Argumentos : TArguments) : string;Override;
    function CallDELETEServerMethod (Argumentos : TArguments) : string;Override;
    function CallPOSTServerMethod (Argumentos : TArguments) : string;Override;
  end;
{$METHODINFO OFF}

implementation


uses StrUtils;


Constructor TServerMethods1.Create (aOwner : TComponent);
Begin
     inherited Create (aOwner);
End;

Destructor TServerMethods1.Destroy;
begin
     inherited Destroy;
End;

Function TServerMethods1.ReturnIncorrectArgs : String;
Var
     WSResult : TResultErro;
begin
     WSResult.STATUS   := -1;
     WSResult.MessageText := 'Total de argumentos menor que o esperado';
     Result := TServerUtils.Result2JSON(WSResult);
end;

Function TServerMethods1.ReturnMethodNotFound : String;
Var
     WSResult : TResultErro;
begin
     WSResult.STATUS   := -2;
     WSResult.MessageText := 'Metodo nao encontrado';
     Result := TServerUtils.Result2JSON(WSResult);
end;

function TServerMethods1.CallGETServerMethod (Argumentos : TArguments) : string;
Var
     FoundMethod : Boolean;
begin
     FoundMethod := False;
     If Length(Argumentos) > 0 Then
      Begin
       if UpperCase(Argumentos[0]) = UpperCase('ConsultaAluno') then begin
          FoundMethod := True;
          if Length (Argumentos) >= 2 then
             Result := ConsultaAluno (Argumentos[1])
          Else
             Result := ReturnIncorrectArgs;
       end;
       if UpperCase(Argumentos[0]) = UpperCase('GetListaAlunos') then begin
          FoundMethod := True;
          if Length (Argumentos) >= 1 then
             Result := GetListaAlunos
          Else
             Result := ReturnIncorrectArgs;
       end;
      end;
     if not FoundMethod then
        Result := ReturnMethodNotFound;
end;

function TServerMethods1.CallPOSTServerMethod (Argumentos : TArguments) : string;
Var
     FoundMethod : Boolean;
begin
     FoundMethod := False;
     if UpperCase(Argumentos[0]) = UpperCase('AtualizaAluno') then begin
        FoundMethod := True;
        if Length (Argumentos) >= 3 then
           Result := AtualizaAluno (Argumentos[1], Argumentos[2])
        Else
           Result := ReturnIncorrectArgs;
     end;
     if not FoundMethod then
        Result := ReturnMethodNotFound;
end;

function TServerMethods1.CallPUTServerMethod (Argumentos : TArguments) : string;
Var
     FoundMethod : Boolean;
begin
     FoundMethod := False;
     if UpperCase(Argumentos[0]) = UpperCase('InsereAluno') then begin
        FoundMethod := True;
        if Length (Argumentos) >= 2 then
           Result := InsereAluno (Argumentos[1])
        Else
           Result := ReturnIncorrectArgs;
     end;
     if not FoundMethod then
        Result := ReturnMethodNotFound;
end;

function TServerMethods1.CallDELETEServerMethod (Argumentos : TArguments) : string;
Var
     FoundMethod : Boolean;
begin
     FoundMethod := False;
     if UpperCase(Argumentos[0]) = UpperCase('ExcluiAluno') then begin
        FoundMethod := True;
        if Length (Argumentos) >= 2 then
           Result := ExcluiAluno (Argumentos[1])
        Else
           Result := ReturnIncorrectArgs;
     end;
     if not FoundMethod then
        Result := ReturnMethodNotFound;
end;

// Aqui voce vai
// 1 - Conectar com o Banco
// 2 - Executar a query
// 3 - Fechar conexão com o banco
// 4 - Retornar o resultado em JSON

// Foi usado um Arquivo Texto para armazenar dados e um StringList
// o objetivo aqui é apenas mostrar como é um WebService REST + JSON
// e suas operações, o codigo de banco fica por sua conta.

function TServerMethods1.InsereAluno (NomeAluno : String) : String;
Var
     List : TStringList;
     JSONObject : TJSONObject;
Begin
     List       := TStringList.Create;
     JSONObject := TJSONObject.Create;
     try
         if Not FileExists (ExtractFilePath(ParamStr(0)) + '\Alunos.Txt') then
            FileClose(FileCreate (ExtractFilePath(ParamStr(0)) + '\Alunos.Txt'));

         List.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
         List.Add (NomeAluno);
         List.SaveToFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');

         JSONObject.AddPair(TJSONPair.Create('STATUS', 'OK'));
         JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Inserido com sucesso'));
         Result := JSONObject.ToJSON;
     Finally
         List.Free;
         JSONObject.Free;
     end;
End;

function TServerMethods1.ConsultaAluno (NomeAluno : String) : String;
Var
     List : TStringList;
     JSONObject : TJSONObject;
     ID : Integer;
Begin
     List := TStringList.Create;
     JSONObject := TJSONObject.Create;
     try
         if FileExists (ExtractFilePath(ParamStr(0)) + '\Alunos.Txt') then Begin
            List.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
            ID := List.IndexOf(NomeAluno);
            if ID > -1 then Begin
               JSONObject.AddPair(TJSONPair.Create('ID', IntToStr(ID)));
            end else begin
               JSONObject.AddPair(TJSONPair.Create('STATUS', 'NOK'));
               JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Não encontrado'));
            end;
         End Else begin
            JSONObject.AddPair(TJSONPair.Create('STATUS', 'NOK'));
            JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Não encontrado'));
         end;
         Result := JSONObject.ToJSON;
     Finally
         List.Free;
         JSONObject.Free;
     end;
end;

function TServerMethods1.GetListaAlunos : String;
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
       try
         List.LoadFromFile(FileLoad);
         for Id := 0 to List.Count - 1 do Begin
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
       end;
      end;
end;

function TServerMethods1.AtualizaAluno (OldNomeAluno, NewNome : String) : String;
Var
     List       : TStringList;
     JSONObject : TJSONObject;
     ID         : Integer;
Begin
     List := TStringList.Create;
     JSONObject := TJSONObject.Create;
     try
         List.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
         ID := List.IndexOf(OldNomeAluno);
         if ID > -1 then Begin
            List[ID] := NewNome;
            List.SaveToFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
            JSONObject.AddPair(TJSONPair.Create('STATUS', 'OK'));
            JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Atualizado com sucesso'));
         End else begin
            JSONObject.AddPair(TJSONPair.Create('STATUS', 'NOK'));
            JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Aluno não encontrado'));
         end;
         Result := JSONObject.ToJSON;
     Finally
         List.Free;
         JSONObject.Free;
     end;
end;

function TServerMethods1.ExcluiAluno (NomeAluno : String) : String;
Var
     List       : TStringList;
     JSONObject : TJSONObject;
     ID         : Integer;
Begin
     List := TStringList.Create;
     JSONObject := TJSONObject.Create;
     try
         List.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
         ID := List.IndexOf(NomeAluno);
         if ID > -1 then Begin
            List.Delete(ID);
            List.SaveToFile(ExtractFilePath(ParamStr(0)) + '\Alunos.Txt');
            JSONObject.AddPair(TJSONPair.Create('STATUS', 'OK'));
            JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Deletado com sucesso'));
         End else begin
            JSONObject.AddPair(TJSONPair.Create('STATUS', 'NOK'));
            JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Aluno não encontrado'));
         end;
         Result := JSONObject.ToJSON;
     Finally
         List.Free;
         JSONObject.Free;
     end;
end;


end.




