unit formMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, uDWJSONObject,
  DB, Grids, DBGrids, uRESTDWBase,  uDWJSONTools,
  uDWConsts, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  uRESTDWPoolerDB, JvMemoryDataset;

type

  { TForm2 }

  TForm2 = class(TForm)
    eHost: TEdit;
    ePort: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    DataSource1: TDataSource;
    Image1: TImage;
    Bevel1: TBevel;
    Label7: TLabel;
    edPasswordDW: TEdit;
    Label6: TLabel;
    edUserNameDW: TEdit;
    Label8: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    Bevel3: TBevel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    mComando: TMemo;
    Button1: TButton;
    CheckBox1: TCheckBox;
    RESTDWClientSQL1: TRESTDWClientSQL;
    RESTDWDataBase1: TRESTDWDataBase;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
Begin
 RESTDWDataBase1.Close;
 RESTDWDataBase1.PoolerService := eHost.Text;
 RESTDWDataBase1.PoolerPort    := StrToInt(ePort.Text);
 RESTDWDataBase1.Login         := edUserNameDW.Text;
 RESTDWDataBase1.Password      := edPasswordDW.Text;
 RESTDWDataBase1.Compression   := CheckBox1.Checked;
 RESTDWDataBase1.Open;
 RESTDWClientSQL1.Close;
 RESTDWClientSQL1.SQL.Clear;
 RESTDWClientSQL1.SQL.Add(mComando.Text);
 RESTDWClientSQL1.Open;
End;

end.
