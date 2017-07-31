unit formMain;

interface

uses
  {$IFDEF WINDOWS}Windows, {$ELSE}LCLType, {$ENDIF}Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, fpjson, jsonparser,
  DB, BufDataset, memds, Grids, DBGrids, ExtCtrls, uRESTDWBase, uRESTDWPoolerDB,
  uDWConsts, uDWJSONObject, uDWJSONTools;

type

  { TForm2 }

  TForm2 = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    edPasswordDW: TEdit;
    edUserNameDW: TEdit;
    eHost: TEdit;
    ePort: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    mComando: TMemo;
    DataSource1: TDataSource;
    RESTDWClientSQL1: TRESTDWClientSQL;
    RESTDWDataBase1: TRESTDWDataBase;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$IFDEF LCL}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}


{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
Begin
 {$IFDEF UNIX}
 DateSeparator    := '/';
 ShortDateFormat  := 'dd/mm/yyyy';
 LongDateFormat   := 'dd mmmm yyyy';
 DecimalSeparator := ',';
 CurrencyDecimals := 2;
 {$ENDIF}
 RESTDWDataBase1.PoolerService := eHost.Text;
 RESTDWDataBase1.PoolerPort    := StrToInt(ePort.Text);
 RESTDWDataBase1.Login         := edUserNameDW.Text;
 RESTDWDataBase1.Password      := edPasswordDW.Text;
 RESTDWDataBase1.Compression   := CheckBox1.Checked;
 RESTDWClientSQL1.Close;
 RESTDWClientSQL1.sql.clear;
 RESTDWClientSQL1.sql.add(mComando.Text);
 RESTDWClientSQL1.Active       := True;
End;

procedure TForm2.Button2Click(Sender: TObject);
Var
 vError : String;
begin
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
 If Not RESTDWClientSQL1.ExecSQL(vError) Then
  MessageBox(0, PChar('Erro executando o comando ' + RESTDWClientSQL1.SQL.Text),
                         'Erro...', mb_iconerror + mb_ok)
 Else
  MessageBox(0, 'Comando executado com sucesso...',
                         'Informação !!!', mb_iconinformation + mb_ok);
end;

end.
