unit Ufuncoes;

interface

uses

{$IFDEF Debug}
  CodeSiteLogging,
{$ENDIF}
  uDWJSON, uDWJSONObject, System.JSON, System.SysUtils, Data.DB, REST.Response.Adapter,
  UDM, FireDAC.Comp.Client, Menus, System.Classes, Vcl.Forms, Vcl.Controls,
  uLogin, Winapi.Windows, Vcl.Dialogs, Graphics, JvMemoryDataset,
  uDWConstsData,
  uDWConsts, DBXJSon ;

const

  Codes64 = '0A1B2C3D4E5F6G7H89IjKlMnOPqRsTuVWXyZabcdefghijkLmNopQrStUvwxYz+/';
  C1 = 52845;
  C2 = 22719;
  // Cor de fundo e Texto do Edit para o necessário
  cCorFundoNecessario = $00D2D2FF;
  cCorTextoNecessario = 'clBlack';

  cCorFundoRequerido = $00B8B8DC;
  cCorTextoRequerido = clWhite;

type

  TUser = class(TObject)
  private
    FUserID: string;
    FUserRealName: string;
    FUserPassword: string;
    FUserLogin: string;
    FAdmin: Boolean;
    FPriv: Boolean;
    FMainMenu: TMainMenu;
    FUserRights: TStringList;
    FIdsys_point_cliente: string;
    FIdempresa: string;
    FRazaoSocial: string;

    procedure SetUserID(const Value: string);
    procedure SetUserLogin(const Value: string);
    procedure SetUserPassword(const Value: string);
    procedure SetUserRealName(const Value: string);
    procedure SetAdmin(const Value: Boolean);
    procedure SetPriv(const Value: Boolean);
    procedure SetMainMenu(const Value: TMainMenu);
    procedure SetUserRights(const Value: TStringList);
    procedure Setidempresa(const Value: string);
    procedure Setidsys_point_cliente(const Value: string);
    procedure SetRazaoSocial(const Value: string);

  public

    constructor Create;
    destructor Destroy; override;

    function Login(const FinalizarSistema: Boolean = False; const sLogin: string = '';
      const sSenha: string = ''): Boolean;
    procedure LoadRights(FormObj: TCustomForm);

    property UserID: string read FUserID write SetUserID;
    property UserLogin: string read FUserLogin write SetUserLogin;
    property UserPassword: string read FUserPassword write SetUserPassword;
    property UserRealName: string read FUserRealName write SetUserRealName;
    property Priv: Boolean read FPriv write SetPriv;
    property Admin: Boolean read FAdmin write SetAdmin;
    property MainMenu: TMainMenu read FMainMenu write SetMainMenu;
    property UserRights: TStringList read FUserRights write SetUserRights;
    property Idsys_point_cliente: string read FIdsys_point_cliente write Setidsys_point_cliente;
    property Idempresa: string read FIdempresa write Setidempresa;
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;

  end;

  TFuncoes = class(TObject)
  private
    procedure SetDentroFirma(const Value: Boolean);
    procedure SetUserKey(const Value: Word);
    procedure SetMaquinaDesenvolvedor(const Value: Boolean);
    procedure Setversao(const Value: string);

  public
    CurrentUser: TUser;
    FDentroFirma: Boolean;
    FUserKey: Word;
    FMaquinaDesenvolvedor: Boolean;
    Fversao: string;
    property DentroFirma: Boolean read FDentroFirma write SetDentroFirma;
    property UserKey: Word read FUserKey write SetUserKey;
    property MaquinaDesenvolvedor: Boolean read FMaquinaDesenvolvedor write SetMaquinaDesenvolvedor;
    property versao: string read Fversao write Setversao;

    constructor Create;
    destructor Destroy; override;
    procedure JsonToDataset(aDataset: TDataSet; aJSON: string);
    function GetConfig(ACampo: string; ADefaultIfEmpty: Variant): Variant;
    procedure Retornasql(_sql: string);
    procedure RunSql(_sql: string);
    function Empty(Texto: string): Boolean;
    function pegaversao: string;
    function GetIDEmpresa(const vQuoted: Boolean = True): string;
    function GetIDPointCliente(const vQuoted: Boolean = True): string;
    function RetornaGUID(const SemHifen: Boolean = True): string;
    function Decrypt(const S: AnsiString; Key: Word): AnsiString;
    function Encrypt(const S: AnsiString; Key: Word): AnsiString;
    function VersaoMaior(Ver1, Ver2: string): Boolean;
    function FixSlash(aPath: string): string;
    function DataSetToJsonTxt(pDataSet: TDataSet): string;
    procedure VerificaForm(TFormulario: TComponentClass; var Formulario);

  end;

var
  Funcoes: TFuncoes;

implementation

{ TFuncoes }

uses UPrincipal, NFDXML;

constructor TFuncoes.Create;
begin
  CurrentUser := TUser.Create;

end;

destructor TFuncoes.Destroy;
begin
  FreeAndNil(CurrentUser);

  inherited;
end;



procedure Tfuncoes.VerificaForm(TFormulario: TComponentClass; var Formulario);
var
  i: integer;
  Achou: Boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    Achou := False;
    for i := 0 to Screen.FormCount - 1 do
    begin

      if Screen.Forms[i].ClassType = TFormulario then
      begin
        Achou := True;
        if TForm(Formulario).Visible = False then
          TForm(Formulario).Visible := True;
        TForm(Formulario).Show;
      end;
    end;
    if not Achou then
    begin
      Application.CreateForm(TFormulario, Formulario);
      if (TForm(Formulario).FormStyle = fsMDIChild) and (TForm(Formulario).Tag = 15) then
        TForm(Formulario).Visible := True;

      if TForm(Formulario).FormStyle = fsNormal then
      begin
        try

          TForm(Formulario).ShowModal;
        finally
          TForm(Formulario).Release;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;



function TFuncoes.DataSetToJsonTxt(pDataSet: TDataSet): string;
var
  ArrayJSon: TJSONArray;
  ObjJSon: TJSONObject;
  strJSon: TJSONString;
  intJSon: TJSONNumber;
  TrueJSon: TJSONTrue;
  FalseJSon: TJSONFalse;
  I: Integer;
  pField: TField;
begin
  ArrayJSon := TJSONArray.Create;
  try
    pDataSet.First;
    while not pDataSet.Eof do
    begin
      ObjJSon := TJSONObject.Create;
      for pField in pDataSet.Fields do
        case pField.DataType of
          ftString:
            begin
              strJSon := TJSONString.Create(pField.AsString);
              ObjJSon.AddPair(pField.FieldName, strJSon);
            end;
          ftInteger:
            begin
              intJSon := TJSONNumber.Create(pField.AsInteger);
              ObjJSon.AddPair(pField.FieldName, intJSon);
            end;
          ftBoolean:

            begin
              TrueJSon := TJSONTrue.Create;
              ObjJSon.AddPair(pField.FieldName, TrueJSon);
            end;

        else // casos gerais são tratados como string
          begin
            strJSon := TJSONString.Create(pField.AsString);
            ObjJSon.AddPair(pField.FieldName, strJSon);
          end;
        end;
      ArrayJSon.AddElement(ObjJSon);
      pDataSet.next;
    end;
    result := ArrayJSon.ToString;
  finally
    ArrayJSon.Free;
  end;
end;

function TFuncoes.FixSlash(aPath: string): string;
var
  vPath: string;
begin
  vPath := aPath;

  if vPath <> '' then
  begin
    if vPath[Length(vPath)] <> '\' then
      vPath := vPath + '\';
    if vPath[1] = '\' then
      Delete(vPath, 1, 1);
  end;

  result := vPath;
end;

function TFuncoes.VersaoMaior(Ver1, Ver2: string): Boolean;
var
  na, nb: array [1 .. 4] of Integer;
  I, Ps: Integer;
  sStr, tVer1, tVer2: string;
begin
  tVer1 := Trim(Ver1);
  tVer2 := Trim(Ver2);
  if (Pos('.', tVer1) <= 0) or (Pos('.', tVer2) <= 0) then
  begin
    result := True;
    Exit;
  end;

  { Pegando a primeira versão, e decompondo ela }
  sStr := tVer1;
  for I := 1 to 4 do
  begin
    Ps := Pos('.', sStr);
    if Ps > 0 then
      na[I] := StrToInt(Copy(sStr, 1, Ps - 1))
    else
      na[I] := StrToInt(sStr);
    sStr := Copy(sStr, Ps + 1, Length(sStr));
  end;

  { Pegando a segunda versão, e decompondo ela }
  sStr := tVer2;
  for I := 1 to 4 do
  begin
    Ps := Pos('.', sStr);
    if Ps > 0 then
      nb[I] := StrToInt(Copy(sStr, 1, Ps - 1))
    else
      nb[I] := StrToInt(sStr);
    sStr := Copy(sStr, Ps + 1, Length(sStr));
  end;

  result := False;

  if (na[1] > nb[1]) then
    result := True;
  if (na[1] <= nb[1]) and (na[2] > nb[2]) then
    result := True;
  if (na[1] <= nb[1]) and (na[2] <= nb[2]) and (na[3] > nb[3]) then
    result := True;
  if (na[1] <= nb[1]) and (na[2] <= nb[2]) and (na[3] <= nb[3]) and (na[4] > nb[4]) then
    result := True;

end;

function TFuncoes.Decrypt(const S: AnsiString; Key: Word): AnsiString;
  function InternalDecrypt(const S: AnsiString; Key: Word): AnsiString;
  var
    I: Word;
    Seed: int64;
  begin
    result := S;
    Seed := Key;
    for I := 1 to Length(result) do
    begin
      result[I] := AnsiChar(Byte(result[I]) xor (Seed shr 8));
      Seed := (Byte(S[I]) + Seed) * Word(C1) + Word(C2)
    end
  end;
  function PreProcess(const S: AnsiString): AnsiString;
  var
    SS: AnsiString;
    function Decode(const S: AnsiString): AnsiString;
    const
      Map: array [AnsiChar] of Byte = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 0, 0, 0, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 0, 0,
        0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 0,
        0, 0, 0, 0, 0, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
        50, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    var
      I: LongInt;
    begin
      case Length(S) of
        2:
          begin
            I := Map[S[1]] + (Map[S[2]] shl 6);
            SetLength(result, 1);
            Move(I, result[1], Length(result))
          end;
        3:
          begin
            I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12);
            SetLength(result, 2);
            Move(I, result[1], Length(result))
          end;
        4:
          begin
            I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12) + (Map[S[4]] shl 18);
            SetLength(result, 3);
            Move(I, result[1], Length(result))
          end
      end
    end;

  begin
    SS := S;
    result := '';
    while SS <> '' do
    begin
      result := result + Decode(Copy(SS, 1, 4));
      Delete(SS, 1, 4)
    end
  end;

begin
  result := InternalDecrypt(PreProcess(S), Key)
end;

function TFuncoes.Encrypt(const S: AnsiString; Key: Word): AnsiString;
  function InternalEncrypt(const S: AnsiString; Key: Word): AnsiString;
  var
    I: Word;
    Seed: int64;
  begin
    result := S;
    Seed := Key;
    for I := 1 to Length(result) do
    begin
      result[I] := AnsiChar(Byte(result[I]) xor (Seed shr 8));
      Seed := (Byte(result[I]) + Seed) * Word(C1) + Word(C2)
    end
  end;
  function PostProcess(const S: AnsiString): AnsiString;
  var
    SS: AnsiString;

    function Encode(const S: AnsiString): AnsiString;
    const
      Map: array [0 .. 63] of AnsiChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' + 'abcdefghijklmnopqrstuvwxyz0123456789+/';
    var
      I: LongInt;
    begin
      I := 0;
      Move(S[1], I, Length(S));
      case Length(S) of
        1:
          result := Map[I mod 64] + Map[(I shr 6) mod 64];
        2:
          result := Map[I mod 64] + Map[(I shr 6) mod 64] + Map[(I shr 12) mod 64];
        3:
          result := Map[I mod 64] + Map[(I shr 6) mod 64] + Map[(I shr 12) mod 64] + Map[(I shr 18) mod 64]
      end
    end;

  begin
    SS := S;
    result := '';
    while SS <> '' do
    begin
      result := result + Encode(Copy(SS, 1, 3));
      Delete(SS, 1, 3)
    end
  end;

begin
  result := PostProcess(InternalEncrypt(S, Key))
end;

function TFuncoes.RetornaGUID(const SemHifen: Boolean = True): string;
var
  vGUID: TGUID;
begin
  CreateGUID(vGUID);
  if not SemHifen then
    result := GUIDToString(vGUID)
  else
  begin
    result := StringReplace(GUIDToString(vGUID), '-', EmptyStr, [rfReplaceAll]);
    result := StringReplace(result, '{', EmptyStr, [rfReplaceAll]);
    result := StringReplace(result, '}', EmptyStr, [rfReplaceAll]);
  end;
end;

function TFuncoes.GetIDEmpresa(const vQuoted: Boolean = True): string;
begin
  if CurrentUser.FIdempresa.IsEmpty then
    Exit;

  if vQuoted then
    result := QuotedStr(Trim(CurrentUser.Idempresa))
  else
    result := Trim(Funcoes.CurrentUser.Idempresa);
end;

function TFuncoes.GetIDPointCliente(const vQuoted: Boolean = True): string;
begin
  if vQuoted then
    result := QuotedStr(Trim(CurrentUser.Idsys_point_cliente))
  else
    result := Trim(CurrentUser.Idsys_point_cliente);
end;

function TFuncoes.pegaversao: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: Word;
begin
  try
    VerInfoSize := GetFileVersionInfoSize(PChar(Application.ExeName), Dummy);
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(PChar(Application.ExeName), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
    with (VerValue^) do
    begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;
    end;
    FreeMem(VerInfo, VerInfoSize);
    result := Format('%d.%d.%d.%d', [V1, V2, V3, V4]);
  except
    result := '0.0.0';
  end;
end;

function TFuncoes.Empty(Texto: string): Boolean;
begin
  result := (Trim(Texto) = '');
end;

procedure TFuncoes.JsonToDataset(aDataset: TDataSet; aJSON: string);
var
  JObj: TJSONArray;
  vConv: TCustomJSONDataSetAdapter;
begin
  if (aJSON = EmptyStr) then
  begin
    Exit;
  end;

  JObj := TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  vConv := TCustomJSONDataSetAdapter.Create(Nil);

  try
    vConv.Dataset := aDataset;
    vConv.UpdateDataSet(JObj);
  finally
    vConv.Free;
    JObj.Free;
  end;
end;

procedure TFuncoes.Retornasql(_sql: string);
var
  TempSQL: string;
begin

  if (dm.Fcnpj <> EmptyStr) then
  begin
    dm.Coneccao.Close;
    dm.Coneccao.WelcomeMessage := dm.Fcnpj;
    dm.Coneccao.PoolerService := dm.Fservidor;
    dm.Coneccao.PoolerPort := dm.Fporta;
    dm.Coneccao.Login := dm.Fusuario;
    dm.Coneccao.Password := dm.Fsenha;
    dm.Coneccao.Compression := True;

    TempSQL := _sql;
    TempSQL := StringReplace(TempSQL, ':idempresa', Funcoes.GetIDEmpresa, [rfReplaceAll, rfIgnoreCase]);
    TempSQL := StringReplace(TempSQL, ':pempresa', Funcoes.GetIDEmpresa, [rfReplaceAll, rfIgnoreCase]);
    TempSQL := StringReplace(TempSQL, ':idsys_point_cliente', Funcoes.GetIDPointCliente, [rfReplaceAll, rfIgnoreCase]);
    TempSQL := StringReplace(TempSQL, ':psys_point_cliente', Funcoes.GetIDPointCliente, [rfReplaceAll, rfIgnoreCase]);
    dm.Ret_sql.Close;
    dm.Ret_sql.SQL.Clear;
    dm.Ret_sql.SQL.Add(TempSQL);
    dm.Ret_sql.Open;
    dm.Ret_sql.First;

  end;

end;

procedure TFuncoes.RunSql(_sql: string);
Var
  DWParams: TDWParams;
  JSONParam: TJSONParam;
  lResponse: String;

Begin
  dm.RESTClientPooler1.RequestTimeOut := 2 * 60000;

  DWParams := TDWParams.Create;

  try
    DWParams.Encoding := GetEncoding(dm.RESTClientPooler1.Encoding);

    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'SQL';
    JSONParam.ObjectDirection := odIN;
    JSONParam.SetValue(_sql);
    DWParams.Add(JSONParam);

    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'CNPJ';
    JSONParam.ObjectDirection := odIN;
    JSONParam.SetValue(dm.Fcnpj);
    DWParams.Add(JSONParam);

    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'RESULTADO';
    JSONParam.SetValue('');
    DWParams.Add(JSONParam);

    lResponse := dm.RESTClientPooler1.SendEvent('runsql', DWParams);

  finally
    FreeAndNil(DWParams);

  end;

end;

procedure TFuncoes.SetDentroFirma(const Value: Boolean);
begin
  FDentroFirma := Value;
end;

procedure TFuncoes.SetMaquinaDesenvolvedor(const Value: Boolean);
begin
  FMaquinaDesenvolvedor := Value;
end;

procedure TFuncoes.SetUserKey(const Value: Word);
begin
  FUserKey := 1574;
end;

function TFuncoes.GetConfig(ACampo: string; ADefaultIfEmpty: Variant): Variant;
begin
  if (dm.CdsConfig.FieldByName(ACampo).IsNull) then
    result := ADefaultIfEmpty
  else
  begin
    case dm.CdsConfig.FieldByName(ACampo).DataType of
      ftString, ftWord, ftMemo, ftLongWord, ftFixedWideChar, ftWideMemo, ftWideString, ftFixedChar, ftFmtMemo, ftBytes,
        ftVarBytes:
        begin
          if (dm.CdsConfig.FieldByName(ACampo).AsString = EmptyStr) then
            result := ADefaultIfEmpty
          else
            result := dm.CdsConfig.FieldByName(ACampo).Value;
        end;
    else
      result := dm.CdsConfig.FieldByName(ACampo).Value;
    end;
  end;

end;

{ TUser }

constructor TUser.Create;
begin
  FUserRights := TStringList.Create;
end;

destructor TUser.Destroy;
begin
  FreeAndNil(FUserRights);
  inherited;
end;

procedure TUser.LoadRights(FormObj: TCustomForm);
var
  I: Integer;
  ObjName: string;
begin
  if Admin then
    Exit;

  for I := 0 to UserRights.Count - 1 do
  begin
    ObjName := UserRights.Strings[I];

    if FormObj.FindComponent(ObjName) = nil then
      Exit;

    if FormObj.FindComponent(ObjName) is TControl then
      TControl(FormObj.FindComponent(ObjName)).Enabled := True;

    if FormObj.FindComponent(ObjName) is TMenuItem then // TMenuItem
      TMenuItem(FormObj.FindComponent(ObjName)).Enabled := True;

  end;

end;

function TUser.Login(const FinalizarSistema: Boolean; const sLogin, sSenha: string): Boolean;
var
  sSQL: string;
begin
  FrmLogin := TFrmLogin.Create(nil);
  FrmLogin.FinalizaSistema := FinalizarSistema;
  try
    if Funcoes.Empty(sLogin) and Funcoes.Empty(sSenha) then
      result := (FrmLogin.ShowModal = mrOk)
    else
    begin
      FrmLogin.edUser.Text := sLogin;
      FrmLogin.edSenha.Text := sSenha;
      FrmLogin.edUser.Enabled := False;
      FrmLogin.edSenha.Enabled := False;
      result := (FrmLogin.ShowModal = mrOk);
    end;

    if result then
    begin
      Funcoes.Retornasql('SELECT  * FROM EMPRESA WHERE IDSYS_POINT_CLIENTE = ' + QuotedStr(Trim(FIdsys_point_cliente)));
      dm.Ret_sql.First;
      dm.CdsEmpresa.LoadFromDataSet(dm.Ret_sql, 0, lmCopy);

    end;

  finally
    FrmLogin.Release;
    // if Result then
    // UFuncoesRO.FindArea := TcFindArea.Create;
  end;
end;

procedure TUser.SetAdmin(const Value: Boolean);
begin
  FAdmin := Value;
end;

procedure TUser.Setidempresa(const Value: string);
begin
  FIdempresa := Value;
end;

procedure TUser.Setidsys_point_cliente(const Value: string);
begin
  FIdsys_point_cliente := Value;
end;

procedure TUser.SetMainMenu(const Value: TMainMenu);
begin
  FMainMenu := Value;
end;

procedure TUser.SetPriv(const Value: Boolean);
begin
  FPriv := Value;
end;

procedure TUser.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TUser.SetUserID(const Value: string);
begin
  FUserID := Value;
end;

procedure TUser.SetUserLogin(const Value: string);
begin
  FUserLogin := Value;
end;

procedure TUser.SetUserPassword(const Value: string);
begin
  FUserPassword := Value;
end;

procedure TUser.SetUserRealName(const Value: string);
begin
  FUserRealName := Value;
end;

procedure TUser.SetUserRights(const Value: TStringList);
begin
  FUserRights.Assign(Value);
end;

procedure TFuncoes.Setversao(const Value: string);
begin
  Fversao := Value;
end;

end.
