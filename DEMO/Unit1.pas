unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRestPoolerDB, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ImgList;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    RESTClientSQL: TRESTClientSQL;
    RESTDataBase: TRESTDataBase;
    Edit2: TEdit;
    Edit3: TEdit;
    ListBox1: TListBox;
    Button2: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure RESTDataBaseConnection(Sucess: Boolean; const Error: string);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.RESTDataBaseConnection(Sucess: Boolean; const Error: string);
begin
 Caption := 'Cliente de Testes Utilizando o PoolerDB';
 if Not (Sucess) then
  MessageDlg(Error, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0)
 Else
  Caption := Caption + ' - ' + RESTDataBase.MyIP;
end;

procedure TForm1.Button1Click(Sender: TObject);
Var
 vTempList : TStringList;
Begin
 RESTDataBase.PoolerService := Edit4.Text;
 RESTDataBase.PoolerPort    := StrToInt(Edit5.Text);
 if ListBox1.Items.Count = 0 then
  Begin
   vTempList   := RESTDataBase.GetRestPoolers;
   If vTempList <> Nil Then
    If vTempList.Count > 0 Then
     Begin
      ListBox1.Items.Assign(vTempList);
      RESTDataBase.PoolerName := ListBox1.Items[0];
     End;
  End;
 RESTDataBase.Active := True;
 if RESTDataBase.Active then
  Begin
   RESTClientSQL.Active       := False;
   RESTClientSQL.SQL.Clear;
   RESTClientSQL.SQL.Add(Edit1.Text);
   If RESTClientSQL.ParamByName(Edit3.Text) <> Nil Then
    RESTClientSQL.ParamByName(Edit3.Text).AsString := Edit2.Text;
   RESTClientSQL.Active       := True;
  End;
end;

procedure TForm1.Button2Click(Sender: TObject);
Var
 vTempList : TStringList;
Begin
 if ListBox1.Items.Count = 0 then
  Begin
   vTempList   := RESTDataBase.GetRestPoolers;
   ListBox1.Items.Assign(vTempList);
   If vTempList <> Nil Then
    If vTempList.Count > 0 Then
     Begin
      ListBox1.Items.Assign(vTempList);
      RESTDataBase.PoolerName := ListBox1.Items[0];
     End;
  End;
 RESTDataBase.Active := True;
 if RESTDataBase.Active then
  Begin
   RESTClientSQL.Active       := False;
   RESTClientSQL.SQL.Clear;
   RESTClientSQL.SQL.Add(Edit1.Text);
   If RESTClientSQL.ParamByName(Edit3.Text) <> Nil Then
    RESTClientSQL.ParamByName(Edit3.Text).AsString := Edit2.Text;
   RESTClientSQL.ExecSQL;
  End;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 RESTClientSQL.Active := False;
 RESTDataBase.Active  := False;
 Form1 := Nil;
 Release;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
 if ListBox1.ItemIndex > -1 then
  RESTDataBase.PoolerName := ListBox1.Items[ListBox1.ItemIndex];
end;

end.
