unit SMDWCore;

interface

uses Windows, SysUtils, Classes, uDWConsts, uDWJSONTools, uDWJSONObject,
     Winapi.ShellAPI, TypInfo, System.JSON, Dialogs, ServerUtils, SysTypes;

Type
{$METHODINFO ON}
  TSMDWCore = class(TServerMethods)
  Private
   Function ChangeBar          (Value        : String)    : String;
   Function DownloadFile       (Var Params   : TDWParams) : String;Overload;
   Function SendReplicationFile(Var Params   : TDWParams) : String;
   Function GetPathFile(Empresa, TipoEmpresa : String) : String;
  public
   { Public declarations }
   Constructor Create    (aOwner : TComponent); Override;
   Destructor  Destroy; Override;
   Function    ReplyEvent(SendType   : TSendEvent;
                          Context    : String;
                          Var Params : TDWParams) : String;Override;
  End;
{$METHODINFO OFF}

implementation

uses StrUtils, uPrincipal;

Function TSMDWCore.ReplyEvent(SendType   : TSendEvent;
                              Context    : String;
                              Var Params : TDWParams) : String;
Var
 JSONObject : TJSONObject;
Begin
 JSONObject := TJSONObject.Create;
 Case SendType Of
  sePOST   :
   Begin
    If UpperCase(Context) = Uppercase('DownloadFile') Then
     Result := DownloadFile(Params)
    Else If UpperCase(Context) = Uppercase('SendReplicationFile') Then
     Result := SendReplicationFile(Params)
    Else
     Begin
      JSONObject.AddPair(TJSONPair.Create('STATUS',   'NOK'));
      JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Método não encontrado'));
      Result := JSONObject.ToJSON;
     End;
   End;
 End;
 JSONObject.Free;
End;

Constructor TSMDWCore.Create (aOwner : TComponent);
Begin
 Inherited Create (aOwner);
End;

Destructor TSMDWCore.Destroy;
Begin
 Inherited Destroy;
End;

Function TSMDWCore.ChangeBar(Value : String) : String;
Begin
 Result := StringReplace(Value, '/', '\', [rfReplaceAll, rfIgnoreCase]);
End;

Function StringToHex(S : String) : String;
Var
 I : Integer;
Begin
 Result:= '';
 For I := 1 To Length(S) Do
  Result:= Result + IntToHex(ord(S[i]),2);
End;

Function TSMDWCore.GetPathFile(Empresa, TipoEmpresa : String) : String;
Begin
 Result := Format('%sREPLICACAO\%s\%s\', [IncludeTrailingPathDelimiter(ExtractFilePath(ParamSTR(0))),
                                          Empresa, TipoEmpresa]);
End;

Function TSMDWCore.SendReplicationFile(Var Params : TDWParams) : String;
Var
 vEmpresa,
 vArquivo,
 vTipoEmpresa,
 vLocalFile   : String;
 JSONValue    : uDWJSONObject.TJSONValue;
 vFileIn      : TStringStream;
 vFile        : TMemoryStream;
 Procedure DelFilesFromDir(Directory, FileMask : String; Const DelSubDirs: Boolean = False);
 Var
  SourceLst: string;
  FOS: TSHFileOpStruct;
 Begin
  FillChar(FOS, SizeOf(FOS), 0);
  FOS.Wnd   := 0;
  FOS.wFunc := FO_DELETE;
  SourceLst := IncludeTrailingPathDelimiter(Directory) + FileMask + #0;
  FOS.pFrom := PChar(SourceLst);
  If Not DelSubDirs Then
   FOS.fFlags := FOS.fFlags OR FOF_FILESONLY;
  // Remove the next line if you want a confirmation dialog box
  FOS.fFlags := FOS.fFlags OR FOF_NOCONFIRMATION;
  // Add the next line for a "silent operation" (no progress box)
  // FOS.fFlags := FOS.fFlags OR FOF_SILENT;
  SHFileOperation(FOS);
 End;
Begin
 If (Params.ItemsString['Empresa']     <> Nil) And
    (Params.ItemsString['Arquivo']     <> Nil) And
    (Params.ItemsString['TipoEmpresa'] <> Nil) Then
  Begin
   JSONValue          := uDWJSONObject.TJSONValue.Create;
   JSONValue.Encoding := GetEncoding(fServer.rspServerFiles.Encoding);
   vEmpresa           := Trim(Params.ItemsString['Empresa'].Value);
   vArquivo           := Trim(Params.ItemsString['Arquivo'].Value);
   vTipoEmpresa       := Trim(Params.ItemsString['TipoEmpresa'].Value);
   vLocalFile         := GetPathFile(vEmpresa, vTipoEmpresa) + vArquivo;
   ForceDirectories(ExtractFilePath(vLocalFile));
   If FileExists(vLocalFile) Then
    DeleteFile(vLocalFile);
   vFileIn            := TStringStream.Create(Params.ItemsString['FileSend'].Value, JSONValue.Encoding);
   Try
    vFileIn.Position   := 0;
    vFileIn.SaveToFile(vLocalFile);
   Finally
    Params.ItemsString['Result'].SetValue(GetStringFromBoolean(vFileIn.Size > 0));
    Result := 'SEND(OK)';
    vFileIn.Clear;
    vFileIn.Free;
   End;
  End;
End;

Function TSMDWCore.DownloadFile(Var Params : TDWParams) : String;
Var
 JSONValue    : uDWJSONObject.TJSONValue;
 vFile        : TMemoryStream;
 vLocalFile,
 vArquivo,
 vTipoEmpresa : String;
 vFileExport  : TStringStream;
Begin
 If (Params.ItemsString['Arquivo']     <> Nil) And
    (Params.ItemsString['TipoEmpresa'] <> Nil) Then
  Begin
   JSONValue             := uDWJSONObject.TJSONValue.Create;
   JSONValue.Encoding    := Params.Encoding;
   JSONValue.ObjectValue := ovBlob;
   vArquivo           := Trim(Params.ItemsString['Arquivo'].Value);
   vTipoEmpresa       := Trim(Params.ItemsString['TipoEmpresa'].Value);
   If (vArquivo     <> '') And
      (vTipoEmpresa <> '') Then
    Begin
     Try
      vLocalFile := IncludeTrailingPathDelimiter(ExtractFilePath(ParamSTR(0)) + ChangeBar(vTipoEmpresa)) + vArquivo;
      If FileExists(vLocalFile) Then
       Begin
        vFile := TMemoryStream.Create;
        Try
         vFile.LoadFromFile(vLocalFile);
         vFile.Position  := 0;
        Except

        End;
        JSONValue.SetValue(GenerateStringFromStream(vFile, JSONValue.Encoding));
        Result          := JSONValue.ToJSON;
       End;
     Finally
      FreeAndNil(vFile);
      FreeAndNil(JSONValue);
     End;
    End;
  End;
End;

End.




