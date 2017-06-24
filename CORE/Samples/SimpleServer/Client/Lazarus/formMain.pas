unit formMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, fpjson, jsonparser,
  DB, BufDataset, memds, Grids, DBGrids, ExtCtrls, uRESTDWBase,
  uDWConsts, uDWJSONObject, uDWJSONTools;

type

  { TForm2 }

  TForm2 = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Button1: TButton;
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
    MemDataset1: TMemDataset;
    DataSource1: TDataSource;
    RESTClientPooler1: TRESTClientPooler;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ListAlunos(Value : String);
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
Var
 lResponse,
 SQL : String;
 JSONValue : TJSONValue;
Begin
 RESTClientPooler1.Host     := eHost.Text;
 RESTClientPooler1.Port     := StrToInt(ePort.Text);
 RESTClientPooler1.UserName := edUserNameDW.Text;
 RESTClientPooler1.Password := edPasswordDW.Text;
 SQL := mComando.Text;
 If SQL <> '' Then
  Begin
   Try
    RESTClientPooler1.Host := eHost.Text;
    RESTClientPooler1.Port := StrToInt(ePort.Text);
    lResponse := RESTClientPooler1.SendEvent('ConsultaBanco/' + EncodeStrings(SQL{$IFNDEF FPC}, GetEncoding(RESTClientPooler1.Encoding){$ENDIF}));
    JSONValue := TJSONValue.Create;
    Try
     JSONValue.WriteToDataset(dtFull, lResponse, MemDataset1);
    Finally
     JSONValue.Free;
    End;
   Except
   End;
  End;
End;

procedure TForm2.ListAlunos(Value: String);
begin

end;

end.
