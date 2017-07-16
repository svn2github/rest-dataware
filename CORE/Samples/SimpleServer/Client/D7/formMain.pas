unit formMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, uDWJSONObject, uLkJSON,
  DB, Grids, DBGrids, uRESTDWBase, uDWJSONTools, uDWConsts,
  ExtCtrls, acPNG, DBClient, uRESTDWPoolerDB;

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
    RESTClientPooler1: TRESTClientPooler;
    ClientDataSet1: TClientDataSet;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

procedure TForm2.Button1Click(Sender: TObject);
Var
 lResponse,
 SQL : String;
 JSONValue : uDWJSONObject.TJSONValue;
 DWParams  : TDWParams;
 JSONParam : TJSONParam;
Begin
 RESTClientPooler1.Host     := eHost.Text;
 RESTClientPooler1.Port     := StrToInt(ePort.Text);
 RESTClientPooler1.UserName := edUserNameDW.Text;
 RESTClientPooler1.Password := edPasswordDW.Text;
 RESTClientPooler1.DataCompression := CheckBox1.Checked;
 SQL := mComando.Text;
 DWParams            := TDWParams.Create;
 JSONParam           := TJSONParam.Create;
 JSONParam.ParamName := 'SQL';
 JSONParam.SetValue(SQL);
 DWParams.Add(JSONParam);
 JSONParam           := TJSONParam.Create;
 JSONParam.ParamName := 'TESTPARAM';
 JSONParam.SetValue('');
 DWParams.Add(JSONParam);
 Try
  If SQL <> '' Then
   Begin
    Try
     RESTClientPooler1.Host := eHost.Text;
     RESTClientPooler1.Port := StrToInt(ePort.Text);
     lResponse := RESTClientPooler1.SendEvent('ConsultaBanco', DWParams);
     If lResponse <> '' Then
      Begin
       JSONValue := TJSONValue.Create;
       Try
        JSONValue.WriteToDataset(dtFull, lResponse, ClientDataSet1);
       Finally
        JSONValue.Free;
       End;
      End;
     Showmessage(Format('Mostrando o Parametro "TESTPARAM" Retornando o valor "%s" do Servidor',
                        [DWParams.ItemsString['TESTPARAM'].Value]));
    Except
    End;
   End;
 Finally

 End;
End;

end.
