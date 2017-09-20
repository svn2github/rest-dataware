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
    dsSYS_POINT_CLIENTE: TDataSource;
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
    SYS_POINT_CLIENTE: TRESTDWClientSQL;
    SYS_POINT_CLIENTEIDSYS_POINT_CLIENTE: TStringField;
    SYS_POINT_CLIENTESTATUS: TStringField;
    SYS_POINT_CLIENTERAZAO_SOCIAL: TStringField;
    SYS_POINT_CLIENTECNPJ: TStringField;
    SYS_POINT_CLIENTEMENSAGEM: TMemoField;
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
    FDMem: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    cdscliente: TRESTDWClientSQL;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    MemoField1: TMemoField;
    DsCliente: TDataSource;
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
  SYS_POINT_CLIENTE.First;
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

var
  _vsql : string ;



begin
  _vsql := 'SELECT first 3 P.*,' + #13#10 +
       'CID1.DESCRICAO AS FK_CIDADE_NOME,' + #13#10 +
       'CID1.UF AS FK_CIDADE_UF,' + #13#10 +
       '' + #13#10 +
       'CID2.DESCRICAO AS FK_CIDADE_ENTR_NOME,' + #13#10 +
       'CID2.UF AS FK_CIDADE_ENTR_UF,' + #13#10 +
       '' + #13#10 +
       'CID3.DESCRICAO AS FK_CIDADE_COB_NOME,' + #13#10 +
       'CID3.UF AS FK_CIDADE_COB_UF,' + #13#10 +
       '' + #13#10 +
       'P1.RAZAO_SOCIAL AS FK_REPRES_RAZAO,' + #13#10 +
       'P2.RAZAO_SOCIAL AS FK_SUPERVISOR_RAZAO ,' + #13#10 +
       'P3.RAZAO_SOCIAL AS FK_TRANS_RAZAO ,' + #13#10 +
       'P4.RAZAO_SOCIAL AS FK_RAZAO_GERENTE ,' + #13#10 +
       'GP.DESCRICAO AS FK_DESC_GRUPOPESSOA ,' + #13#10 +
       'TB.DESCRICAO AS FK_DESCRTB,' + #13#10 +
       'TB1.DESCRICAO AS FK_DESCRTB1,' + #13#10 +
       'TB2.DESCRICAO AS FK_DESCRTB2,' + #13#10 +
       'TB3.DESCRICAO AS FK_DESCRTB3,' + #13#10 +
       '' + #13#10 +
       'R.DESCRICAO AS FK_ROTA' + #13#10 +
       '' + #13#10 +
       'FROM PESSOA P' + #13#10 +
       'LEFT JOIN CIDADE CID1 ON (CID1.IDCIDADE = P.IDCIDADE)' + #13#10 +
       'LEFT JOIN CIDADE CID2 ON (CID2.IDCIDADE = P.ENTR_IDCIDADE)' + #13#10 +
       'LEFT JOIN CIDADE CID3 ON (CID3.IDCIDADE = P.COB_IDCIDADE)' + #13#10 +
       'LEFT JOIN PESSOA P1 ON (P1.IDPESSOA = P.IDREPRESENTANTE)  AND ( P1.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE )' + #13#10 +
       'LEFT JOIN PESSOA P2 ON (P2.IDPESSOA = P.REPRESENTANTE_IDSUPERVISOR)  AND ( P2.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE )' + #13#10 +
       'LEFT JOIN PESSOA P3 ON (P3.IDPESSOA = P.IDPESSOATRANS )  AND ( P3.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE )' + #13#10 +
       'LEFT JOIN PESSOA P4 ON (P4.IDPESSOA = P.REPRESENTANTE_IDGERENTE )  AND ( P4.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE )' + #13#10 +
       'LEFT JOIN GRUPOPESSOA GP ON ( GP.IDGRUPOPESSOA = P.IDGRUPOPESSOA ) AND ( GP.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE )' + #13#10 +
       'LEFT JOIN TABELAPRECO TB ON ( TB.IDTABELAPRECO = P.IDTABELAPRECO ) AND ( TB.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE )' + #13#10 +
       'LEFT JOIN TABELAPRECO TB1 ON ( TB1.IDTABELAPRECO = P.IDTABELAPRECO1_NET ) AND ( TB1.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE )' + #13#10 +
       '' + #13#10 +
       'LEFT JOIN TABELAPRECO TB2 ON ( TB2.IDTABELAPRECO = P.IDTABELAPRECO2_NET ) AND ( TB2.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE )' + #13#10 +
       'LEFT JOIN TABELAPRECO TB3 ON ( TB3.IDTABELAPRECO = P.IDTABELAPRECO3_NET ) AND ( TB3.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE )' + #13#10 +
       'LEFT JOIN ROTA R ON (R.IDSYS_POINT_CLIENTE = P.IDSYS_POINT_CLIENTE AND R.IDROTA=P.IDROTA)' ;

  Funcoes.RetornaSQL(_vsql );
  dm.Ret_sql.First;
  cdscliente.LoadFromDataSet(dm.Ret_sql, 0, lmCopy);




  cxPageControl1.Properties.HideTabs := true;
  cxPageControl1.ActivePageIndex := 0;

   // abrindo a tabela de configuracoes
  Funcoes.RetornaSQL('select * from SYS_POINT_CLIENTE');
  dm.Ret_sql.First;
  SYS_POINT_CLIENTE.LoadFromDataSet(dm.Ret_sql, 0, lmCopy);


  Funcoes.RetornaSQL('select * from empresa');
  dm.Ret_sql.First;
  CdsEmpresa.LoadFromDataSet(dm.Ret_sql, 0, lmCopy);

  _vincluindo := false;



end;

procedure TFrmAdminConfig.JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if not( cdsEmpresa.state in [dsedit]) then
     cdsEmpresa.edit;
  cdsEmpresa.FieldByName( 'IDSYS_POINT_CLIENTE' ).AsString := SYS_POINT_CLIENTE.FieldByName('IDSYS_POINT_CLIENTE').AsString;
  cdsEmpresa.FieldByName( 'FK_POINT_CLIENTE').AsString := SYS_POINT_CLIENTE.FieldByName( 'RAZAO_SOCIAL').AsString;
  cdsEmpresa.Post;
  Panel3.Visible := false;
  dxNavBar1.Enabled := true;
  JvImgBtn3.Enabled := true;
  JvImgBtn4.Enabled := true;
  cxGrid2.Enabled := true;
end;

procedure TFrmAdminConfig.JvImgBtn1Click(Sender: TObject);
begin


 funcoes.ApplayUpdates([SYS_POINT_CLIENTE]);
 cxPageControl1.ActivePageIndex := 0;
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
