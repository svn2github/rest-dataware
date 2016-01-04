unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRestPoolerDB, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
   RESTDataBase  : TRESTDataBase;
   RESTClientSQL : TRESTClientSQL;
   procedure OnConnection(Sucess : Boolean; Const Error : String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.OnConnection(Sucess : Boolean; Const Error : String);
Begin
 if Not (Sucess) then
  MessageDlg(Error, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
{
 Else if RESTDataBase.Active then
  MessageDlg('Meu IP é : ' + RESTDataBase.MyIP, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  }
End;

procedure TForm1.Button1Click(Sender: TObject);
begin
 RESTClientSQL.Active       := False;
 RESTClientSQL.SQL.Clear;
 RESTClientSQL.SQL.Add(Edit1.Text);
 RESTClientSQL.Active       := True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// RESTClientSQL.Active := False;
// RESTDataBase.Active  := False;
// RESTClientSQL.DisposeOf;
// RESTDataBase.DisposeOf;
end;

procedure TForm1.FormCreate(Sender: TObject);
Var
 I         : Integer;
 vTempList : TStringList;
begin
 RESTDataBase               := TRESTDataBase.Create(Self);
 RESTDataBase.PoolerService := '127.0.0.1';
 RESTDataBase.PoolerURL     := '';
 RESTDataBase.PoolerPort    := 8080;
 RESTDataBase.OnConnection  := OnConnection;
 RESTDataBase.RestModule    := 'TServerMethods1';
 RESTDataBase.Active        := True;
 Memo1.Lines.Clear;
 If RESTDataBase.Active Then
  Begin
   vTempList := RESTDataBase.GetRestPoolers;
   If vTempList <> Nil Then
    Begin
     For I := 0 to vTempList.Count -1 do
      Memo1.Lines.Add(vTempList[I]);
    End;
  End;
 RESTClientSQL              := TRESTClientSQL.Create(Self);
 RESTClientSQL.DataBase     := RESTDataBase;
 RESTClientSQL.SQL.Add(Edit1.Text);
 DataSource1.DataSet        := RESTClientSQL;
 RESTClientSQL.Active       := True;
end;

end.
