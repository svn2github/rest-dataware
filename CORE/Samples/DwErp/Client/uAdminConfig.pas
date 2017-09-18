unit uAdminConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxNavBar, dxNavBarCollns, cxClasses, dxNavBarBase,
  cxPCdxBarPopupMenu, cxPC, Vcl.StdCtrls, Datasnap.DBClient, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDropDownEdit, cxTextEdit, cxMaskEdit,
  Vcl.ExtCtrls, JvExStdCtrls, JvButton, JvCtrls, DB, cxDBLookupComboBox,
  cxButtonEdit, JvExControls, JvGradientHeaderPanel,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, cxNavigator, dxBarBuiltInMenu,
  JvMemoryDataset, uRESTDWPoolerDB, JvMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client ,
 uDWJSONObject   ,
 uDWConsts ,uDWConstsData

  ;

type
  TFrmAdminConfig = class(TForm)
    dxNavBar1: TdxNavBar;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Item2: TdxNavBarItem;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Label1: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsSysPoint: TDataSource;
    cxGrid1DBTableView1STATUS: TcxGridDBColumn;
    cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1CNPJ: TcxGridDBColumn;
    Panel1: TPanel;
    JvImgBtn1: TJvImgBtn;
    JvImgBtn2: TJvImgBtn;
    Panel2: TPanel;
    JvImgBtn3: TJvImgBtn;
    JvImgBtn4: TJvImgBtn;
    dsEmpresa: TDataSource;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1IDSYS_POINT_CLIENTE: TcxGridDBColumn;
    cxGridDBTableView1STATUS: TcxGridDBColumn;
    cxGridDBTableView1NOME_FANTASIA: TcxGridDBColumn;
    cxGridDBTableView1CNPJ: TcxGridDBColumn;
    cxGridDBTableView1IE: TcxGridDBColumn;
    cxGridDBTableView1CEP: TcxGridDBColumn;
    cxGridDBTableView1ENDERECO: TcxGridDBColumn;
    cxGridDBTableView1NUMERO: TcxGridDBColumn;
    cxGridDBTableView1COMPLEMENTO: TcxGridDBColumn;
    cxGridDBTableView1BAIRRO: TcxGridDBColumn;
    cxGridDBTableView1TELEFONE: TcxGridDBColumn;
    cxGridDBTableView1TELEFONE2: TcxGridDBColumn;
    cxGridDBTableView1FK_CIDADE_DESC: TcxGridDBColumn;
    cxGridDBTableView1FK_CIDADE_UF: TcxGridDBColumn;
    dxNavBar1Item3: TdxNavBarItem;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    JvGradientHeaderPanel2: TJvGradientHeaderPanel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    Panel3: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvImgBtn5: TJvImgBtn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cdsEmpresa: TRESTDWClientSQL;
    cdsSysPoint: TRESTDWClientSQL;
    cdsSysPointIDSYS_POINT_CLIENTE: TStringField;
    cdsSysPointSTATUS: TStringField;
    cdsSysPointRAZAO_SOCIAL: TStringField;
    cdsSysPointCNPJ: TStringField;
    cdsSysPointMENSAGEM: TMemoField;
    cdsEmpresaIDSYS_POINT_CLIENTE: TStringField;
    cdsEmpresaIDEMPRESA: TStringField;
    cdsEmpresaDTHR_CADASTRO: TSQLTimeStampField;
    cdsEmpresaDTHR_MODIFICACAO: TSQLTimeStampField;
    cdsEmpresaSTATUS: TStringField;
    cdsEmpresaRAZAO_SOCIAL: TStringField;
    cdsEmpresaNOME_FANTASIA: TStringField;
    cdsEmpresaCNPJ: TStringField;
    cdsEmpresaIE: TStringField;
    cdsEmpresaIDCIDADE: TIntegerField;
    cdsEmpresaCEP: TStringField;
    cdsEmpresaENDERECO: TStringField;
    cdsEmpresaEMAIL: TStringField;
    cdsEmpresaNUMERO: TStringField;
    cdsEmpresaCOMPLEMENTO: TStringField;
    cdsEmpresaBAIRRO: TStringField;
    cdsEmpresaTELEFONE: TStringField;
    cdsEmpresaTELEFONE2: TStringField;
    cdsEmpresaTIPO_EMPRESA: TStringField;
    cdsEmpresaTIPO_CAD: TStringField;
    cdsEmpresaESTADO: TStringField;
    cdsEmpresaCODMUN: TIntegerField;
    cdsEmpresaCPAIS: TIntegerField;
    cdsEmpresaXPAIS: TStringField;
    cdsEmpresaUSA_NFE: TStringField;
    cdsEmpresaNOME_CONTADOR: TStringField;
    cdsEmpresaCPF_CONTADOR: TStringField;
    cdsEmpresaCRC_CONTADOR: TStringField;
    cdsEmpresaCNPJ_CONTADOR: TStringField;
    cdsEmpresaCEP_CONTADOR: TStringField;
    cdsEmpresaEND_CONTADOR: TStringField;
    cdsEmpresaNUM_CONTADOR: TIntegerField;
    cdsEmpresaCOMPLEMENTO_CONTADOR: TStringField;
    cdsEmpresaBAIRRO_CONTADOR: TStringField;
    cdsEmpresaFONE_CONTADOR: TStringField;
    cdsEmpresaFAX_CONTADOR: TStringField;
    cdsEmpresaEMAIL_CONTADOR: TStringField;
    cdsEmpresaCODCIDADE_CONTADOR: TStringField;
    cdsEmpresaE116_DT_VCTO: TDateField;
    cdsEmpresaE116_COD_REC: TStringField;
    cdsEmpresaE116_COD_OR: TStringField;
    cdsEmpresaIND_PERFIL: TStringField;
    cdsEmpresaSPED_IND_NAT_PJ: TStringField;
    cdsEmpresaSPED_IND_ATIV: TStringField;
    cdsEmpresaSPED_COD_INC_TRIB: TStringField;
    cdsEmpresaSPED_IND_APRO_CRED: TStringField;
    cdsEmpresaSPED_COD_TIPO_CONT: TStringField;
    cdsEmpresaSPED_IND_REG_CUM: TStringField;
    cdsEmpresaINSCESTADUAL: TStringField;
    cdsEmpresaCNPJBOLETO: TStringField;
    cdsEmpresaM200RM205: TStringField;
    cdsEmpresaM600RM605: TStringField;
    cdsEmpresaSMTPEMAIL: TStringField;
    cdsEmpresaUSUARIOEMAIL: TStringField;
    cdsEmpresaSENHAEMAIL: TStringField;
    cdsEmpresaPORTAEMAIL: TIntegerField;
    JvMemo1: TJvMemo;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDMemTable2: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure cdsSysPointNewRecord(DataSet: TDataSet);
    procedure JvImgBtn2Click(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure dxNavBar1Item1Click(Sender: TObject);
    procedure dxNavBar1Item2Click(Sender: TObject);
    procedure JvImgBtn3Click(Sender: TObject);
    procedure JvImgBtn4Click(Sender: TObject);
    procedure dxNavBar1Item3Click(Sender: TObject);
    procedure cdsEmpresaNewRecord(DataSet: TDataSet);
    procedure cdsEmpresaReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure cxGridDBTableView1Column1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure JvImgBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmAdminConfig: TFrmAdminConfig;
  _vincluindo: boolean;

implementation

{$R *.dfm}

uses UFuncoes, uDM;

procedure TFrmAdminConfig.cdsEmpresaNewRecord(DataSet: TDataSet);
begin
//  cdsEmpresaIDEMPRESA.AsString := Funcoes.RetornaGUID;
//  cdsEmpresaDTHR_CADASTRO.AsDateTime := Now;
//  cdsEmpresaDTHR_MODIFICACAO.AsDateTime := Now;
//  cdsEmpresaSTATUS.AsString := 'A';
//  cdsEmpresaUSA_NFE.AsString := 'N';
  _vincluindo := true;

end;

procedure TFrmAdminConfig.cdsEmpresaReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage(E.Message);
end;

procedure TFrmAdminConfig.cdsSysPointNewRecord(DataSet: TDataSet);
begin
//  cdsSysPointIDSYS_POINT_CLIENTE.AsString := Funcoes.RetornaGUID;
//  cdsSysPointSTATUS.AsString := 'A';
end;

procedure TFrmAdminConfig.cxGridDBTableView1Column1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Panel3.Visible := true;
  cdsSysPoint.First;
  dxNavBar1.Enabled := false;
  JvImgBtn3.Enabled := false;
  JvImgBtn4.Enabled := false;
  cxGrid2.Enabled := false;
  if _vincluindo = true then
    cdsEmpresa.Append;

end;

procedure TFrmAdminConfig.dxNavBar1Item1Click(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 1;
end;

procedure TFrmAdminConfig.dxNavBar1Item2Click(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 2;
end;

procedure TFrmAdminConfig.dxNavBar1Item3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAdminConfig.FormCreate(Sender: TObject);
begin
  cxPageControl1.Properties.HideTabs := true;
  cxPageControl1.ActivePageIndex := 0;

   // abrindo a tabela de configuracoes
  Funcoes.RetornaSQL('select * from SYS_POINT_CLIENTE');
  dm.Ret_sql.First;
  CdsSyspoint.LoadFromDataSet(dm.Ret_sql, 0, lmCopy);


  Funcoes.RetornaSQL('select * from empresa');
  dm.Ret_sql.First;
  CdsEmpresa.LoadFromDataSet(dm.Ret_sql, 0, lmCopy);

  _vincluindo := false;



end;

procedure TFrmAdminConfig.JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if not( cdsEmpresa.state in [dsedit]) then
     cdsEmpresa.edit;
  cdsEmpresa.FieldByName( 'IDSYS_POINT_CLIENTE' ).AsString := cdsSysPoint.FieldByName('IDSYS_POINT_CLIENTE').AsString;
  cdsEmpresa.FieldByName( 'FK_POINT_CLIENTE').AsString := cdsSysPoint.FieldByName( 'RAZAO_SOCIAL').AsString;
  cdsEmpresa.Post;
  Panel3.Visible := false;
  dxNavBar1.Enabled := true;
  JvImgBtn3.Enabled := true;
  JvImgBtn4.Enabled := true;
  cxGrid2.Enabled := true;
end;

procedure TFrmAdminConfig.JvImgBtn1Click(Sender: TObject);
var
JSONValue     : TJSONValue;
jsontexto : string;

  DWParams: TDWParams;
  JSONParam: TJSONParam;
  lResponse: String;

begin
 JSONValue := TJSONValue.Create;

 JSONValue.LoadFromDataset('SYS_POINT_CLIENTE', cdsSysPoint, False );

 jsontexto:= ' {"ObjectType":"toDataset", "Direction":"odINOUT", "Encoded":"False", "ValueType":"ovDataSet", "'+'SYS_POINT_CLIENTE'+'":[';
 jsontexto:= jsontexto + JSONValue.Value + ']}' ;
 jvMemo1.Text := jsontexto;




 JSONValue.WriteToDataset(dtFull, jvMemo1.Text, FDMemTable2 );


 JSONValue.Free;

 dm.RESTClientPooler1.RequestTimeOut := 2 * 60000;

  DWParams := TDWParams.Create;

  try
    DWParams.Encoding := GetEncoding( dm.RESTClientPooler1.Encoding);

    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'SQL';
    JSONParam.ObjectDirection := odIN;
    JSONParam.SetValue( jvmemo1.Text +'º'+jvmemo1.Text );
    DWParams.Add(JSONParam);

    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'CNPJ';
    JSONParam.ObjectDirection := odIN;
    JSONParam.SetValue( dm.cnpj);
    DWParams.Add(JSONParam);


    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'RESULTADO';
    JSONParam.SetValue('');
    DWParams.Add(JSONParam);

    lResponse := dm.RESTClientPooler1.SendEvent('ApllyUpdadte', DWParams);

    If DWParams.ItemsString['RESULTADO'].Value <> '' Then
    begin

      // Memo1.Lines.Text := trim(DWParams.ItemsString['RESULTADO'].Value);
      // JSONValue.WriteToDataset(dtFull, Memo1.Lines.Text, FDMemTable1);

    end;

  finally
    FreeAndNil(DWParams);

  end;


//  cxPageControl1.ActivePageIndex := 0;
end;

procedure TFrmAdminConfig.JvImgBtn2Click(Sender: TObject);
begin
 // cdsSysPoint.CancelUpdates;
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TFrmAdminConfig.JvImgBtn3Click(Sender: TObject);
var
  sql: string;

begin

//  sql := 'update SYS_CONFIG' + #13#10 + 'set  USA_NFE = ' +QuotedStr(  cdsEmpresaUSA_NFE.AsString ) + ' where  ( IDSYS_POINT_CLIENTE = ' +
 //   QuotedStr( trim( cdsEmpresaIDSYS_POINT_CLIENTE.AsString )) + ' ) and  ( IDEMPRESA = ' + quotedstr( trim( cdsEmpresaIDEMPRESA.AsString ))+ ' ) ';

  funcoes.RunSQL( sql );

//  cdsEmpresa.ApplyUpdates(0);
//  cxPageControl1.ActivePageIndex := 0;
end;

procedure TFrmAdminConfig.JvImgBtn4Click(Sender: TObject);
begin
//  cdsEmpresa.CancelUpdates;
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TFrmAdminConfig.JvImgBtn5Click(Sender: TObject);
begin
  if not(cdsEmpresa.state in [dsedit]) then
    cdsEmpresa.edit;

 // cdsEmpresaIDSYS_POINT_CLIENTE.AsString := cdsSysPointIDSYS_POINT_CLIENTE.AsString;
 // cdsEmpresaFK_POINT_CLIENTE.AsString := cdsSysPointRAZAO_SOCIAL.AsString;
  cdsEmpresa.Post;
  Panel3.Visible := false;
  dxNavBar1.Enabled := true;
  JvImgBtn3.Enabled := true;
  JvImgBtn4.Enabled := true;
  cxGrid1.Enabled := true;
  cxGrid2.Enabled := true;

end;

end.
