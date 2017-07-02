unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRESTDWBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, SMDWCore;

type
  TfServer = class(TForm)
    rspServerFiles: TRESTServicePooler;
    lbLocalFiles: TListBox;
    Image1: TImage;
    cbEncode: TCheckBox;
    edPasswordDW: TEdit;
    Label3: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    edUserNameDW: TEdit;
    Label2: TLabel;
    edPortaDW: TEdit;
    Label4: TLabel;
    ButtonStart: TButton;
    Label13: TLabel;
    Bevel2: TBevel;
    cbPoolerState: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
  private
    { Private declarations }
   Procedure LoadLocalFiles;
  public
    { Public declarations }
  end;

var
  fServer: TfServer;

implementation

{$R *.dfm}

Procedure TfServer.LoadLocalFiles;
Begin
 lbLocalFiles.Clear;

End;

procedure TfServer.ButtonStartClick(Sender: TObject);
begin
 If Not rspServerFiles.Active Then
  Begin
   rspServerFiles.ServerParams.HasAuthentication := True;
   rspServerFiles.ServerParams.UserName := edUserNameDW.Text;
   rspServerFiles.ServerParams.Password := edPasswordDW.Text;
   rspServerFiles.ServicePort := StrToInt(edPortaDW.Text);
   rspServerFiles.Active      := True;
   If Not rspServerFiles.Active Then
    Exit;
   ButtonStart.Caption        := 'Desativar';
   LoadLocalFiles;
  End
 Else
  Begin
   rspServerFiles.Active      := False;
   ButtonStart.Caption        := 'Ativar';
   lbLocalFiles.Clear;
  End;
end;

procedure TfServer.FormCreate(Sender: TObject);
begin
 rspServerFiles.ServerMethodClass := TSMDWCore;
end;

end.
