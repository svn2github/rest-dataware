unit RestDWServerFormU;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp;

type
  TRestDWForm = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    Label2: TLabel;
    eUserName: TEdit;
    ePassword: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
  private
    FServer    : TIdHTTPWebBrokerBridge;
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
 ButtonStart.Enabled := Not FServer.Active;
 ButtonStop.Enabled  := FServer.Active;
 EditPort.Enabled    := Not FServer.Active;
 eUserName.Enabled   := EditPort.Enabled;
 ePassword.Enabled   := eUserName.Enabled;
End;

procedure TRestDWForm.ButtonStartClick(Sender: TObject);
Begin
 vUsername := eUsername.Text;
 vPassword := ePassword.Text;
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

procedure TRestDWForm.FormCreate(Sender: TObject);
begin
 FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

procedure TRestDWForm.StartServer;
begin
 If Not FServer.Active Then
  Begin
   FServer.Bindings.Clear;
   FServer.DefaultPort := StrToInt(EditPort.Text);
   FServer.Active      := True;
  End;
end;

end.
