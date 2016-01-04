unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRestPoolerDB, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    RESTClientSQL: TRESTClientSQL;
    RESTDataBase: TRESTDataBase;
    RESTClientSQLEMP_NO: TSmallintField;
    RESTClientSQLFIRST_NAME: TStringField;
    RESTClientSQLLAST_NAME: TStringField;
    RESTClientSQLPHONE_EXT: TStringField;
    RESTClientSQLHIRE_DATE: TSQLTimeStampField;
    RESTClientSQLDEPT_NO: TStringField;
    RESTClientSQLJOB_CODE: TStringField;
    RESTClientSQLJOB_GRADE: TSmallintField;
    RESTClientSQLJOB_COUNTRY: TStringField;
    RESTClientSQLSALARY: TFloatField;
    RESTClientSQLFULL_NAME: TStringField;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RESTDataBaseConnection(Sucess: Boolean; const Error: string);
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
 if Not (Sucess) then
  MessageDlg(Error, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 RESTClientSQL.Active       := False;
 RESTClientSQL.SQL.Clear;
 RESTClientSQL.SQL.Add(Edit1.Text);
 If RESTClientSQL.Params.Count > 0 Then
  RESTClientSQL.ParamByName(Edit3.Text).AsString := Edit2.Text;
 RESTClientSQL.Active       := True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 RESTClientSQL.Active := False;
 RESTDataBase.Active  := False;
 Form1 := Nil;
 Release;
end;

procedure TForm1.FormCreate(Sender: TObject);
Var
 I         : Integer;
 vTempList : TStringList;
begin
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
// RESTClientSQL.Active       := True;
end;

end.
