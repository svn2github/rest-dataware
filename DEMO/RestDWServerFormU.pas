//
// FireDACJSONReflect demo
// Copyright (c) 1995-2013 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//
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
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RestDWForm: TRestDWForm;

implementation

{$R *.dfm}

uses
  Winapi.ShellApi, Datasnap.DSSession;

procedure TRestDWForm.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
Begin
 ButtonStart.Enabled := Not FServer.Active;
 ButtonStop.Enabled  := FServer.Active;
 EditPort.Enabled    := Not FServer.Active;
End;

procedure TRestDWForm.ButtonStartClick(Sender: TObject);
Begin
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
