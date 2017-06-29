unit formMain;

interface

uses
  {$IFDEF WINDOWS}Windows, uSock, {$ELSE}LCLType, {$ENDIF}Messages, SysUtils,
  Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  IdContext, Buttons, ComCtrls, MaskEdit, Menus, uRESTDWBase, IniFiles, IBConnection,
  sqldb;

Type

  { TfrmMain }

  TfrmMain = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    ButtonStart: TButton;
    ButtonStop: TButton;
    cbAdaptadores: TComboBox;
    cbPoolerState: TCheckBox;
    cbEncode: TCheckBox;
    ctiPrincipal: TTrayIcon;
    eCertFile: TEdit;
    edBD: TEdit;
    edPasswordBD: TEdit;
    edPasswordDW: TEdit;
    edPasta: TEdit;
    edPortaBD: TEdit;
    edPortaDW: TEdit;
    edUserNameBD: TEdit;
    edUserNameDW: TEdit;
    ePrivKeyFile: TEdit;
    ePrivKeyPass: TMaskEdit;
    IBConnection1: TIBConnection;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    lSeguro: TLabel;
    memoReq: TMemo;
    memoResp: TMemo;
    N5: TMenuItem;
    PageControl1: TPageControl;
    pmMenu: TPopupMenu;
    RestaurarAplicao1: TMenuItem;
    RESTServicePooler1: TRESTServicePooler;
    SairdaAplicao1: TMenuItem;
    SQLTransaction1: TSQLTransaction;
    tsConfigs: TTabSheet;
    tsLogs: TTabSheet;
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure cbAdaptadoresChange(Sender: TObject);
    procedure ctiPrincipalDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBConnection1BeforeConnect(Sender: TObject);
    procedure RESTServicePooler1LastRequest(Value: String);
    procedure RESTServicePooler1LastResponse(Value: String);
    procedure SairdaAplicao1Click(Sender: TObject);
  private
    { Private declarations }
    FCfgName,
    vDatabaseName,
    vDatabaseIP,
    vUsername,
    vPassword  : String;
    Procedure StartServer;
    procedure ShowApplication;
    function GetHandleOnTaskBar: THandle;
    procedure ChangeStatusWindow;
    procedure HideApplication;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses ServerMethodsUnit1;

{$IFDEF LCL}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}


{ TfrmMain }

Function TfrmMain.GetHandleOnTaskBar : THandle;
Begin
 Result := Application.MainForm.Handle;
End;

Procedure TfrmMain.ChangeStatusWindow;
Begin
 if Self.Visible then
  SairdaAplicao1.Caption := 'Minimizar para a bandeja'
 Else
  SairdaAplicao1.Caption := 'Sair da Aplicação';
 Application.ProcessMessages;
End;

procedure TfrmMain.StartServer;
begin
 If Not RESTServicePooler1.Active Then
  Begin
   RESTServicePooler1.ServicePort           := StrToInt(edPortaDW.Text);
   RESTServicePooler1.SSLPrivateKeyFile     := ePrivKeyFile.Text;
   RESTServicePooler1.SSLPrivateKeyPassword := ePrivKeyPass.Text;
   RESTServicePooler1.SSLCertFile           := eCertFile.Text;
   RESTServicePooler1.Active                := True;
   If Not RESTServicePooler1.Active Then
    Exit;
   IBConnection1.Connected                  := True;
   PageControl1.ActivePage := tsLogs;
   HideApplication;
  End;
 If RESTServicePooler1.Secure Then
  Begin
   lSeguro.Font.Color := clBlue;
   lSeguro.Caption    := 'Seguro : Sim';
  End
 Else
  Begin
   lSeguro.Font.Color := clRed;
   lSeguro.Caption    := 'Seguro : Não';
  End;
end;

Procedure TfrmMain.ShowApplication;
Begin
 ctiPrincipal.Visible := False;
 Application.ShowMainForm    := True;
 If Self <> Nil Then
  Begin
   Self.Visible     := True;
   Self.WindowState := wsNormal;
  End;
 {$IFDEF WINDOWS}ShowWindow(GetHandleOnTaskBar, SW_SHOW);{$ENDIF}
 ChangeStatusWindow;
End;

procedure TfrmMain.ctiPrincipalDblClick(Sender: TObject);
begin
   ShowApplication;
end;

procedure TfrmMain.ButtonStopClick(Sender: TObject);
begin
 RESTServicePooler1.Active := False;
 IBConnection1.Connected   := False;
 PageControl1.ActivePage := tsConfigs;
 ShowApplication;
end;

procedure TfrmMain.cbAdaptadoresChange(Sender: TObject);
begin
 vDatabaseIP := Trim(Copy(cbAdaptadores.Text, Pos('-' , cbAdaptadores.Text ) + 1 , 100));
end;

procedure TfrmMain.ButtonStartClick(Sender: TObject);
Var
 ini       : TIniFile;
Begin
 If FileExists(FCfgName) Then
  DeleteFile(FCfgName);
 ini       := TIniFile.Create(FCfgName);
 ini.WriteString('BancoDados', 'Servidor',  cbAdaptadores.Text);//  '127.0.0.1');
 ini.WriteString('BancoDados', 'BD',        edBD.Text);
 ini.WriteString('BancoDados', 'Pasta',     edPasta.Text);
 ini.WriteString('BancoDados', 'PortaDB',   edPortaBD.Text);
 ini.WriteString('BancoDados', 'PortaDW',   edPortaDW.Text);
 ini.WriteString('BancoDados', 'UsuarioBD', edUserNameBD.Text);
 ini.WriteString('BancoDados', 'SenhaBD',   edPasswordBD.Text);
 ini.WriteString('BancoDados', 'UsuarioDW', edUserNameDW.Text);
 ini.WriteString('BancoDados', 'SenhaDW',   edPasswordDW.Text);
 ini.WriteString('SSL',        'PKF',       ePrivKeyFile.Text);
 ini.WriteString('SSL',        'PKP',       ePrivKeyPass.Text);
 ini.WriteString('SSL',        'CF',        eCertFile.Text);
 ini.Free;
 vUsername := edUserNameDW.Text;
 vPassword := edPasswordDW.Text;
 StartServer;
End;

Procedure TfrmMain.HideApplication;
Begin
 ctiPrincipal.Visible := True;
 Application.ShowMainForm := False;
 If Self <> Nil Then
  Self.Visible := False;
 Application.Minimize;
 {$IFDEF WINDOWS}ShowWindow(GetHandleOnTaskBar, SW_HIDE);{$ENDIF}
 ChangeStatusWindow;
End;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
 CanClose := Not RESTServicePooler1.Active;
 If Not CanClose Then
  Begin
   CanClose := Not Self.Visible;
   If CanClose Then
    CanClose := Application.MessageBox('Você deseja realmente sair do programa ?',
                                       'Pergunta ?', mb_IconQuestion + mb_YesNo) = mrYes
   Else
    HideApplication;
  End;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   // define o nome do .ini de acordo c o EXE
 // dessa forma se quiser testar várias instâncias do servidor em
 // portas diferentes os arquivos não irão conflitar
 FCfgName := StringReplace(ExtractFileName(ParamStr(0) ), '.exe' , '' , [rfReplaceAll]);
 FCfgName := ExtractFilePath(ParamSTR(0)) + 'Config_' + FCfgName + '.ini' ;
 RESTServicePooler1.ServerMethodClass := TServerMethods1;
 PageControl1.ActivePage              := tsConfigs;
end;

procedure TfrmMain.FormShow(Sender: TObject);
Var
 porta_fb,
 porta_dw,
 servidor,
 database,
 pasta,
 usuarioDW,
 senhaDW,
 usuarioBD,
 senhaBD           : String;
 ini               : TIniFile;
 vTag, i           : Integer;
 {$IFDEF WINDOWS}aNetInterfaceList : tNetworkInterfaceList;{$ENDIF}
 Function ServerIpIndex(Items : TStrings; ChooseIP : String) : Integer;
 Var
  I : Integer;
 Begin
  Result := -1;
  For I := 0 To Items.Count -1 Do
   Begin
    If Pos(ChooseIP, Items[I]) > 0 Then
     Begin
      Result := I;
      Break;
     End;
   End;
 End;
Begin
 vTag := 0;
 {$IFDEF WINDOWS}
 If (GetNetworkInterfaces(aNetInterfaceList)) THen
  Begin
   cbAdaptadores.Items.Clear;
   For i := 0 to High (aNetInterfaceList) do
    Begin
     cbAdaptadores.Items.Add( 'Placa #' + IntToStr( i ) + ' - ' + aNetInterfaceList[i].AddrIP);
     If ( i <= 1 ) or ( Pos( '127.0.0.1' , aNetInterfaceList[i].AddrIP ) > 0 ) then
      Begin
       vDatabaseIP := aNetInterfaceList[i].AddrIP;
       vTag        := 1;
      End;
    End;
   cbAdaptadores.ItemIndex := vTag;
  End;
 {$ELSE}
 cbAdaptadores.Items.Clear;
 cbAdaptadores.Items.Add('127.0.0.1');
 {$ENDIF}
 ini                     := TIniFile.Create(FCfgName);
 cbAdaptadores.ItemIndex := ServerIpIndex(cbAdaptadores.Items,
                            ini.ReadString('BancoDados', 'Servidor',  '127.0.0.1'));
 edBD.Text               := ini.ReadString('BancoDados', 'BD',        'EMPLOYEE.FDB');
 edPasta.Text            := ini.ReadString('BancoDados', 'Pasta',     ExtractFilePath(ParamSTR(0)) + '..\');
 edPortaBD.Text          := ini.ReadString('BancoDados', 'PortaBD',   '3050');
 edPortaDW.Text          := ini.ReadString('BancoDados', 'PortaDW',   '8082' );
 edUserNameBD.Text       := ini.ReadString('BancoDados', 'UsuarioBD', 'SYSDBA');
 edPasswordBD.Text       := ini.ReadString('BancoDados', 'SenhaBD',   'masterkey');
 edUserNameDW.Text       := ini.ReadString('BancoDados', 'UsuarioDW', 'testserver');
 edPasswordDW.Text       := ini.ReadString('BancoDados', 'SenhaDW',   'testserver');
 ePrivKeyFile.Text       := ini.ReadString('SSL',        'PKF',       '');
 ePrivKeyPass.Text       := ini.ReadString('SSL',        'PKP',       '');
 eCertFile.Text          := ini.ReadString('SSL',        'CF',        '');
 ini.Free;
End;

procedure TfrmMain.IBConnection1BeforeConnect(Sender: TObject);
Var
 porta_BD,
 servidor,
 database,
 pasta,
 usuario_BD,
 senha_BD      : String;
Begin
 servidor      := vDatabaseIP;
 database      := edBD.Text;
 pasta         := IncludeTrailingPathDelimiter(edPasta.Text);
 porta_BD      := edPortaBD.Text;
 usuario_BD    := edUserNameBD.Text;
 senha_BD      := edPasswordBD.Text;
 vDatabaseName := pasta + database;
 TIBConnection(Sender).HostName     := Servidor;
 TIBConnection(Sender).UserName     := usuario_BD;
 TIBConnection(Sender).Password     := senha_BD;
 TIBConnection(Sender).DatabaseName := vDatabaseName;
end;

procedure TfrmMain.RESTServicePooler1LastRequest(Value: String);
begin
   memoReq.Lines.Add(Value);
end;

procedure TfrmMain.RESTServicePooler1LastResponse(Value: String);
begin
   memoResp.Lines.Add(Value);
end;

procedure TfrmMain.SairdaAplicao1Click(Sender: TObject);
begin
 Close;
end;

end.
