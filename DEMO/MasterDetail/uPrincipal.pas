unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRestPoolerDB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TForm4 = class(TForm)
    RESTDataBase: TRESTDataBase;
    RESTClientSQL1: TRESTClientSQL;
    RESTClientSQL2: TRESTClientSQL;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    RESTClientSQL1DEPT_NO: TStringField;
    RESTClientSQL1DEPARTMENT: TStringField;
    RESTClientSQL1HEAD_DEPT: TStringField;
    RESTClientSQL1MNGR_NO: TSmallintField;
    RESTClientSQL1BUDGET: TFloatField;
    RESTClientSQL1LOCATION: TStringField;
    RESTClientSQL1PHONE_NO: TStringField;
    RESTClientSQL2EMP_NO: TSmallintField;
    RESTClientSQL2FIRST_NAME: TStringField;
    RESTClientSQL2LAST_NAME: TStringField;
    RESTClientSQL2PHONE_EXT: TStringField;
    RESTClientSQL2HIRE_DATE: TSQLTimeStampField;
    RESTClientSQL2DEPT_NO: TStringField;
    RESTClientSQL2JOB_CODE: TStringField;
    RESTClientSQL2JOB_GRADE: TSmallintField;
    RESTClientSQL2JOB_COUNTRY: TStringField;
    RESTClientSQL2SALARY: TFloatField;
    RESTClientSQL2FULL_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure RESTClientSQL1AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
 RESTClientSQL1.Open;
end;

procedure TForm4.RESTClientSQL1AfterDelete(DataSet: TDataSet);
Var
 vError : String;
begin
 If Not (TRESTClientSQL(DataSet).ApplyUpdates(vError)) Then
  MessageDlg(vError, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
end;

end.
