unit RestDWServerFormU;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  winsock,  Winapi.iphlpapi, Winapi.IpTypes,  uSock,   System.IniFiles,

  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TRestDWForm = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    edPortaDW: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    Label2: TLabel;
    edUserNameDW: TEdit;
    edPasswordDW: TEdit;
    Label3: TLabel;
    cbAdaptadores: TComboBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edPortaBD: TEdit;
    edUserNameBD: TEdit;
    edPasswordBD: TEdit;
    Label13: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edPasta: TEdit;
    Label12: TLabel;
    edBD: TEdit;
    Label14: TLabel;
    Bevel3: TBevel;
    Label6: TLabel;
    Image1: TImage;
    edIP: TEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbAdaptadoresChange(Sender: TObject);
  private
    FServer    : TIdHTTPWebBrokerBridge;
    FCfgName,
    vUsername,
    vPassword  : String;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
   Property Username : String Read vUsername Write vUsername;
   Property Password : String Read vPassword Write vPassword;
  end;

var
  RestDWForm : TRestDWForm;

implementation

{$R *.dfm}

uses
  Winapi.ShellApi, Datasnap.DSSession;

procedure TRestDWForm.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
Begin
 ButtonStart.Enabled   := Not FServer.Active;
 ButtonStop.Enabled    := FServer.Active;
 edPortaDW.Enabled     := ButtonStart.Enabled;
 edUserNameDW.Enabled  := ButtonStart.Enabled;
 edPasswordDW.Enabled  := ButtonStart.Enabled;
 cbAdaptadores.Enabled := ButtonStart.Enabled;
 edPortaBD.Enabled     := ButtonStart.Enabled;
 edPasta.Enabled       := ButtonStart.Enabled;
 edBD.Enabled          := ButtonStart.Enabled;
 edIP.Enabled          := ButtonStart.Enabled;
 edUserNameBD.Enabled  := ButtonStart.Enabled;
 edPasswordBD.Enabled  := ButtonStart.Enabled;
End;

procedure TRestDWForm.ButtonStartClick(Sender: TObject);
Var
 ini       : TIniFile;
Begin
 If FileExists(FCfgName) Then
  DeleteFile(FCfgName);
 ini       := TIniFile.Create(FCfgName);
 ini.WriteString('BancoDados', 'Servidor',  RestDWForm.edIP.Text);//  '127.0.0.1');
 ini.WriteString('BancoDados', 'BD',        RestDWForm.edBD.Text);
 ini.WriteString('BancoDados', 'Pasta',     RestDWForm.edPasta.Text);
 ini.WriteString('BancoDados', 'PortaDB',   RestDWForm.edPortaBD.Text);
 ini.WriteString('BancoDados', 'PortaDW',   RestDWForm.edPortaDW.Text);
 ini.WriteString('BancoDados', 'UsuarioBD', RestDWForm.edUserNameBD.Text);
 ini.WriteString('BancoDados', 'SenhaBD',   RestDWForm.edPasswordBD.Text);
 ini.WriteString('BancoDados', 'UsuarioDW', RestDWForm.edUserNameDW.Text);
 ini.WriteString('BancoDados', 'SenhaDW',   RestDWForm.edPasswordDW.Text);
 ini.Free;
 vUsername := edUserNameDW.Text;
 vPassword := edPasswordDW.Text;
 StartServer;
End;

procedure TerminateThreads;
Begin
 If TDSSessionManager.Instance <> Nil Then
  TDSSessionManager.Instance.TerminateAllSessions;
End;

procedure TRestDWForm.ButtonStopClick(Sender: TObject);
begin
 TerminateThreads;
 FServer.Active := False;
 FServer.Bindings.Clear;
end;

Procedure TRestDWForm.cbAdaptadoresChange(Sender: TObject);
Begin
 edIP.Text := Trim(Copy(cbAdaptadores.Text, Pos('-' , cbAdaptadores.Text ) + 1 , 100));
End;

Procedure TRestDWForm.FormCreate(Sender: TObject);
Begin
 FServer := TIdHTTPWebBrokerBridge.Create(Self);
 // define o nome do .ini de acordo c o EXE
 // dessa forma se quiser testar várias instâncias do servidor em
 // portas diferentes os arquivos não irão conflitar
 FCfgName := StringReplace(ExtractFileName(ParamStr(0) ), '.exe' , '' , [rfReplaceAll]);
 FCfgName := ExtractFilePath(ParamSTR(0)) + 'Config_' + FCfgName + '.ini' ;
End;

procedure TRestDWForm.FormShow(Sender: TObject);
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
 i                 : Integer;
 aNetInterfaceList : tNetworkInterfaceList;
Begin
 //Alguns Clientes tem 2 placas de rede ou tem WIFI e CABEADO
 If (GetNetworkInterfaces(aNetInterfaceList)) THen
  Begin
   cbAdaptadores.Items.Clear;
   For i := 0 to High (aNetInterfaceList) do
    Begin
     cbAdaptadores.Items.Add( 'Placa #' + IntToStr( i ) + ' - ' + aNetInterfaceList[i].AddrIP);
     If ( i <= 1 ) or ( Pos( '127.0.0.1' , aNetInterfaceList[i].AddrIP ) > 0 ) then
      Begin
       edIP.Text := aNetInterfaceList[i].AddrIP;
       edIP.Tag := i;
      End;
    End;
   cbAdaptadores.ItemIndex := edIP.Tag;
  End;
 ini               := TIniFile.Create(FCfgName);
 edIP.Text         := ini.ReadString('BancoDados', 'Servidor', 'localhost');
 edBD.Text         := ini.ReadString('BancoDados', 'BD', 'EMPLOYEE.FDB');
 edPasta.Text      := ini.ReadString('BancoDados', 'Pasta', ExtractFilePath(ParamSTR(0)) + '..\');
 edPortaBD.Text    := ini.ReadString('BancoDados', 'PortaBD', '3050');
 edPortaDW.Text    := ini.ReadString('BancoDados', 'PortaDW', '8082' );
 edUserNameBD.Text := ini.ReadString('BancoDados', 'UsuarioBD', 'SYSDBA');
 edPasswordBD.Text := ini.ReadString('BancoDados', 'SenhaBD', 'masterkey');
 edUserNameDW.Text := ini.ReadString('BancoDados', 'UsuarioDW', 'testserver');
 edPasswordDW.Text := ini.ReadString('BancoDados', 'SenhaDW', 'testserver');
 ini.Free;
End;

procedure TRestDWForm.StartServer;
begin
 If Not FServer.Active Then
  Begin
   FServer.Bindings.Clear;
   FServer.DefaultPort := StrToInt( edPortaDW.Text);
   FServer.Active      := True;
  End;
end;

end.



