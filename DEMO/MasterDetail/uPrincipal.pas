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
    RESTClientSQL1EMP_NO: TSmallintField;
    RESTClientSQL1FIRST_NAME: TStringField;
    RESTClientSQL1LAST_NAME: TStringField;
    RESTClientSQL1PHONE_EXT: TStringField;
    RESTClientSQL1HIRE_DATE: TSQLTimeStampField;
    RESTClientSQL1DEPT_NO: TStringField;
    RESTClientSQL1JOB_CODE: TStringField;
    RESTClientSQL1JOB_GRADE: TSmallintField;
    RESTClientSQL1JOB_COUNTRY: TStringField;
    RESTClientSQL1SALARY: TFloatField;
    RESTClientSQL1FULL_NAME: TStringField;
    RESTClientSQL2: TRESTClientSQL;
    RESTClientSQL2DEPT_NO: TStringField;
    RESTClientSQL2DEPARTMENT: TStringField;
    RESTClientSQL2HEAD_DEPT: TStringField;
    RESTClientSQL2MNGR_NO: TSmallintField;
    RESTClientSQL2BUDGET: TFloatField;
    RESTClientSQL2LOCATION: TStringField;
    RESTClientSQL2PHONE_NO: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
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

end.
