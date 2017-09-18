unit UDmService;

interface

uses
  System.SysUtils, System.Classes, uDWDatamodule, uRESTDWPoolerDB,
  uRestDWDriverFD, System.JSON, uDWJSONObject, FireDAC.Comp.Client,
  uDWConstsData, uDWConsts, CodeSiteLogging, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Stan.StorageJSON,
  FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Stan.Intf,
  FireDAC.Comp.UI, Data.DB, Datasnap.DBClient, FireDAC.Comp.DataSet,

  uClassePonto, nfeNFDXML, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  JvStringHolder, Vcl.Forms,
  Vcl.Dialogs, System.StrUtils

    ;

type
  TServerMetodDM = class(TServerMethodDataModule)
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    RESTDWDriverFD1: TRESTDWDriverFD;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Server_FDConnection: TFDConnection;
    qry: TFDQuery;
    FDMem: TFDMemTable;
    FDQuery1: TFDQuery;
    procedure ServerMethodDataModuleReplyEvent(SendType: TSendEvent; Context: string; var Params: TDWParams;
      var Result: string);
    procedure ServerMethodDataModuleWelcomeMessage(Welcomemsg: string);
  private
    { Private declarations }
    Function RetornaSql(Var Params: TDWParams): String;
    function setarbanco(Pcnpj: string): boolean;
    Function Runsql(Var Params: TDWParams): String;
    Function ApllyUpdadte(Var Params: TDWParams): String;

  public
    { Public declarations }
    vfuncoes: TClassePonto;

  end;

var
  ServerMetodDM: TServerMetodDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uPrincipal;

{$R *.dfm}

function TServerMetodDM.ApllyUpdadte(var Params: TDWParams): String;
Var
  JSONValue: TJSONValue;
  _vtabela, _vsql, _Vcnpj: string;
  
  aTag : WideString;
  _Posini , _poinitabela , _posfintabela : integer;
  Vqry : string;
 x,i: integer;

Begin
  JSONValue := TJSONValue.Create;
  JSONValue.Encoding := GetEncoding(FrmServer.ServerMetodos.Encoding);
  Try
    If (Params.ItemsString['SQL'] <> Nil) Then
      _vsql := Params.ItemsString['SQL'].Value;

    If (Params.ItemsString['CNPJ'] <> Nil) Then
      _Vcnpj := Params.ItemsString['CNPJ'].Value;


    if setarbanco(_Vcnpj) then
    begin
      if Server_FDConnection.Connected then
      begin

        Try
           i := 1;
           while Length( _vsql ) > 0 do
           begin
             aTag := 'º';
             _Posini := Pos(aTag, _vsql );
             Vqry := '';
             if _Posini > 0 then
             begin

               Vqry := copy( _vsql, 0, _Posini-1 );
               try
               JSONValue.WriteToDataset(dtFull, vqry , FDQuery1 );


               FDQuery1.ApplyUpdates(0);
               finally

               end;


               _vsql := copy( _vsql, _Posini+1, Length(_vsql) );
               inc( i );
             end
             else
             begin
               Vqry :=  _vsql;

               try
             //  JSONValue.WriteToDataset(dtFull, vqry , fdqry );



               finally
               end;



               break;
             end;
           end;

           for x  := 1 to i do
           begin



           end;


//          fdQuery.Open;
//
//          Result := JSONValue.ToJSON;
//
//          if (Params.ItemsString['RESULTADO'] <> nil) then
//            Params.ItemsString['RESULTADO'].SetValue(Result);

        Finally


        End;

      end;
    end;
  Finally
    FreeAndNil(JSONValue);

  End;

end;


function TServerMetodDM.RetornaSql(var Params: TDWParams): String;
Var
  JSONValue: TJSONValue;
  _vtabela, _vsql, _Vcnpj: string;
  fdQuery: TFDQuery;

Begin
  JSONValue := TJSONValue.Create;
  JSONValue.Encoding := GetEncoding(FrmServer.ServerMetodos.Encoding);
  Try
    If (Params.ItemsString['SQL'] <> Nil) Then
      _vsql := Params.ItemsString['SQL'].Value;

    If (Params.ItemsString['CNPJ'] <> Nil) Then
      _Vcnpj := Params.ItemsString['CNPJ'].Value;

    If (Params.ItemsString['TABELA'] <> Nil) Then
      _vtabela := Params.ItemsString['TABELA'].Value;

    if setarbanco(_Vcnpj) then
    begin
      if Server_FDConnection.Connected then
      begin
        fdQuery := TFDQuery.Create(Nil);
        Try
          fdQuery.Connection := Server_FDConnection;
          fdQuery.SQL.Add(_vsql);
          fdQuery.Open;
          JSONValue.LoadFromDataset(_vtabela, fdQuery, True);

          Result := JSONValue.ToJSON;

          if (Params.ItemsString['RESULTADO'] <> nil) then
            Params.ItemsString['RESULTADO'].SetValue(Result);

        Finally
          FreeAndNil(fdQuery);
        End;

      end;
    end;
  Finally
    FreeAndNil(JSONValue);

  End;

end;

function TServerMetodDM.Runsql(var Params: TDWParams): String;
Var
  JSONValue: TJSONValue;
  _vtabela, _vsql, _Vcnpj: string;
  fdQuery: TFDQuery;

Begin
  JSONValue := TJSONValue.Create;
  JSONValue.Encoding := GetEncoding(FrmServer.ServerMetodos.Encoding);
  Try
    If (Params.ItemsString['SQL'] <> Nil) Then
      _vsql := Params.ItemsString['SQL'].Value;

    If (Params.ItemsString['CNPJ'] <> Nil) Then
      _Vcnpj := Params.ItemsString['CNPJ'].Value;

    if setarbanco(_Vcnpj) then
    begin
      if Server_FDConnection.Connected then
      begin
        fdQuery := TFDQuery.Create(nil);
        Try
          fdQuery.Connection := Server_FDConnection;
          fdQuery.SQL.Text := _vsql;
          fdQuery.ExecSQL(_vsql);
          FreeAndNil(fdQuery);
          if (Params.ItemsString['RESULTADO'] <> nil) then
            Params.ItemsString['RESULTADO'].SetValue('OK');

        except

          if (Params.ItemsString['RESULTADO'] <> nil) then
            Params.ItemsString['RESULTADO'].SetValue('Erro');

        End;

      end;
    end;
  Finally
    FreeAndNil(JSONValue);

  End;

end;

procedure TServerMetodDM.ServerMethodDataModuleReplyEvent(SendType: TSendEvent; Context: string; var Params: TDWParams;
  var Result: string);
Var
  JSONObject: TJSONObject;
  _Vcnpj: string;
Begin
  JSONObject := TJSONObject.Create;
  Case SendType Of
    seGET, sePOST:
      Begin
        If UpperCase(Context) = UpperCase('DownloadFile') Then
          // Result := DownloadFile(Params)
        Else If UpperCase(Context) = UpperCase('SendReplicationFile') Then
          // Result := SendReplicationFile(Params)
        Else If UpperCase(Context) = UpperCase('FileList') Then
          // Result := FileList
        Else If UpperCase(Context) = UpperCase('runsql') Then
          Result := Runsql(Params)
        Else If UpperCase(Context) = UpperCase('ApllyUpdadte') Then
          Result := ApllyUpdadte(Params)


        Else
        Begin
          If (Params.ItemsString['CNPJ'] <> Nil) Then
            _Vcnpj := Params.ItemsString['CNPJ'].Value;
          if _Vcnpj <> EmptyStr then
            setarbanco(_Vcnpj);
        End;

      End;
  End;
  JSONObject.Free;
End;

procedure TServerMetodDM.ServerMethodDataModuleWelcomeMessage(Welcomemsg: string);
begin

  setarbanco(Welcomemsg);

end;

function TServerMetodDM.setarbanco(Pcnpj: string): boolean;
Var
  PontoInf: boolean;
  dataXML: TnfeNFDXML;
  aNodeRootList: TXmlNode;
  aTempNode, aTempNode2: TXmlNode;
  j, i: integer;
  SL, SL_Decrypted: TStringList;
  servidor: string;
Begin

  dataXML := TnfeNFDXML.Create;
  SL := TStringList.Create;
  SL_Decrypted := TStringList.Create;

  try

    SL.LoadFromFile(ExtractFilepath(Application.Exename) + 'data_config.xml');

    for i := 0 to SL.Count - 1 do
      SL_Decrypted.Add(string(Funcoes.Decrypt(string(SL.Strings[i]), 2801)));

    dataXML.ReadFromString(SL_Decrypted.Text);
    dataXML.XmlFormat := xfReadable;

    if not Assigned(dataXML.Root) then
    begin
      ShowMessage('Sem arquivo de configuração ( data_config.xml )');
      Application.Terminate;
      Exit;
      Abort;
    end;

    aNodeRootList := dataXML.RootNodeList;
    with aNodeRootList do
    begin
      for i := 0 to NodeCount - 1 do
      begin
        Result := false;
        aTempNode := Nodes[i];
        for j := 0 to aTempNode.NodeCount - 1 do
        begin
          aTempNode2 := aTempNode.Nodes[j];

          if Funcoes.Empty(aTempNode2.AttributeByName['file_path']) then
            Continue;

          // PontoInf := AnsiSameText(Trim(aTempNode2.AttributeByName['pontoinf']), '1');

          if Trim(Pcnpj) = Trim(aTempNode2.AttributeByName['cnpj']) then
          begin
            Server_FDConnection.Connected := false;
            servidor := IfThen(Trim(string(aTempNode2.AttributeByName['dbserver_host'])) = EmptyStr, 'localhost',
              string(aTempNode2.AttributeByName['dbserver_host']));
            Server_FDConnection.Params.Clear;
            Server_FDConnection.Params.Add('DriverID=FB');
            Server_FDConnection.Params.Add('Server=' + servidor);
            Server_FDConnection.Params.Add('Port=' + '3050');
            Server_FDConnection.Params.Add('Database=' + string(aTempNode2.AttributeByName['file_path']));
            Server_FDConnection.Params.Add('User_Name=' + 'SYSDBA');
            Server_FDConnection.Params.Add('Password=' + 'masterkey');
            Server_FDConnection.Params.Add('Protocol=TCPIP');
            Server_FDConnection.Params.Add('CharacterSet=WIN1252');
            Server_FDConnection.UpdateOptions.CountUpdatedRecords := false;
            Server_FDConnection.Connected := True;
            Result := True;

          end;
        end;
      end;

    end;
  finally
    SL.Free;
    SL_Decrypted.Free;

    dataXML.Free;
  end;

end;

initialization

Funcoes := TClassePonto.Create;

finalization

Funcoes.Free;

end.
