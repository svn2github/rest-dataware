unit UPrincipal;

interface

uses
{$IFDEF Debug}
  CodeSiteLogging,
{$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, uDWJSONObject,
  DB, Grids, DBGrids, uRESTDWBase, uDWJSONTools,
  uDWConsts, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  uRESTDWPoolerDB, JvMemoryDataset, Vcl.ComCtrls,
  idComponent, uDWConstsData, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Stan.StorageJSON, FireDAC.Comp.UI, uDWJSON, Ufuncoes,
  Datasnap.DBClient, System.ImageList, Vcl.ImgList,  Vcl.Menus, JvExControls,
  JvLED, JvExComCtrls, JvStatusBar;

type

  { TForm2 }

  TFrmPrincipal = class(TForm)
    Bevel1: TBevel;
    RESTClientPooler1: TRESTClientPooler;
    Button3: TButton;
    DataSource1: TDataSource;
    RESTDWDataBase1: TRESTDWDataBase;
    RESTDWClientSQL1: TRESTDWClientSQL;
    DataSource2: TDataSource;
    FDMemTable1: TFDMemTable;
    Button1: TButton;
    Button2: TButton;
    RESTDWClientSQL2: TRESTDWClientSQL;
    RESTDWClientSQL1IDSYS_POINT_CLIENTE: TStringField;
    RESTDWClientSQL1IDPESSOA: TIntegerField;
    RESTDWClientSQL1DATA_CADASTRO: TSQLTimeStampField;
    RESTDWClientSQL1DATA_ATUALIZACAO: TSQLTimeStampField;
    RESTDWClientSQL1DATA_ADMISSAO: TDateField;
    RESTDWClientSQL1TIPO_CAD: TStringField;
    RESTDWClientSQL1STATUS: TStringField;
    RESTDWClientSQL1RAZAO_SOCIAL: TStringField;
    RESTDWClientSQL1NOME_FANTASIA: TStringField;
    RESTDWClientSQL1FISICO_JURIDICO: TStringField;
    RESTDWClientSQL1FIS_CPF: TStringField;
    RESTDWClientSQL1FIS_RG: TStringField;
    RESTDWClientSQL1FIS_DATA_NASC: TDateField;
    RESTDWClientSQL1FIS_FILIACAO_PAI: TStringField;
    RESTDWClientSQL1FIS_FILIACAO_MAE: TStringField;
    RESTDWClientSQL1JUR_CNPJ: TStringField;
    RESTDWClientSQL1JUR_INSC_EST: TStringField;
    RESTDWClientSQL1JUR_INSC_EST_UF: TStringField;
    RESTDWClientSQL1JUR_SUFRAMA: TStringField;
    RESTDWClientSQL1TELEFONE1: TStringField;
    RESTDWClientSQL1TELEFONE2: TStringField;
    RESTDWClientSQL1TELEFONE3: TStringField;
    RESTDWClientSQL1TELEFONE4: TStringField;
    RESTDWClientSQL1IDCIDADE: TIntegerField;
    RESTDWClientSQL1ENDERECO: TStringField;
    RESTDWClientSQL1NUMERO: TStringField;
    RESTDWClientSQL1COMPLEMENTO: TStringField;
    RESTDWClientSQL1BAIRRO: TStringField;
    RESTDWClientSQL1CEP: TStringField;
    RESTDWClientSQL1HOMEPAGE: TStringField;
    RESTDWClientSQL1EMAIL: TStringField;
    RESTDWClientSQL1OBS: TMemoField;
    RESTDWClientSQL1ENTR_ENDERECO: TStringField;
    RESTDWClientSQL1ENTR_BAIRRO: TStringField;
    RESTDWClientSQL1ENTR_NUMERO: TStringField;
    RESTDWClientSQL1ENTR_IDCIDADE: TIntegerField;
    RESTDWClientSQL1ENTR_CEP: TStringField;
    RESTDWClientSQL1ENTR_UF: TStringField;
    RESTDWClientSQL1ENTR_PONTOREF: TStringField;
    RESTDWClientSQL1ENTR_COMPLEMENTO: TStringField;
    RESTDWClientSQL1COB_ENDERECO: TStringField;
    RESTDWClientSQL1COB_BAIRRO: TStringField;
    RESTDWClientSQL1COB_NUMERO: TStringField;
    RESTDWClientSQL1COB_IDCIDADE: TIntegerField;
    RESTDWClientSQL1COB_CEP: TStringField;
    RESTDWClientSQL1COB_UF: TStringField;
    RESTDWClientSQL1COB_PONTOREF: TStringField;
    RESTDWClientSQL1COB_COMPLEMENTO: TStringField;
    RESTDWClientSQL1PROF_EMPRESA: TStringField;
    RESTDWClientSQL1PROF_ENDERECO: TStringField;
    RESTDWClientSQL1PROF_BAIRRO: TStringField;
    RESTDWClientSQL1PROF_IDCIDADE: TIntegerField;
    RESTDWClientSQL1PROF_UF: TStringField;
    RESTDWClientSQL1PROF_CEP: TStringField;
    RESTDWClientSQL1PROF_OCUPACAO: TStringField;
    RESTDWClientSQL1PROF_TRABDESDE: TDateField;
    RESTDWClientSQL1PROF_SALARIO: TBCDField;
    RESTDWClientSQL1PROF_PROFISSAO: TStringField;
    RESTDWClientSQL1PROF_TELEFONE: TStringField;
    RESTDWClientSQL1PROF_RAMAL: TStringField;
    RESTDWClientSQL1SPC_REG: TStringField;
    RESTDWClientSQL1SPC_QNT: TIntegerField;
    RESTDWClientSQL1FINAN_LIMITE_CREDITO: TBCDField;
    RESTDWClientSQL1CONF_IDVENCIMENTO: TIntegerField;
    RESTDWClientSQL1CONF_ISCLIENTE: TStringField;
    RESTDWClientSQL1CONF_ISFORNECEDOR: TStringField;
    RESTDWClientSQL1CONF_ISTRANSPORTADORA: TStringField;
    RESTDWClientSQL1CONF_ISREPRESENTANTE: TStringField;
    RESTDWClientSQL1CONF_ISSUPERVISOR: TStringField;
    RESTDWClientSQL1CONF_ISFACCIONISTA: TStringField;
    RESTDWClientSQL1CONF_ISFUNCIONARIO: TStringField;
    RESTDWClientSQL1IDREPRESENTANTE: TIntegerField;
    RESTDWClientSQL1REPRESENTANTE_COMISSAO: TBCDField;
    RESTDWClientSQL1REPRESENTANTE_IDSUPERVISOR: TIntegerField;
    RESTDWClientSQL1SUPERVISOR_COMISSAO: TBCDField;
    RESTDWClientSQL1REDESPACHO: TMemoField;
    RESTDWClientSQL1CMUN: TIntegerField;
    RESTDWClientSQL1XPAIS: TStringField;
    RESTDWClientSQL1CPAIS: TIntegerField;
    RESTDWClientSQL1PLACAVEICULO: TStringField;
    RESTDWClientSQL1COD_ANTT: TStringField;
    RESTDWClientSQL1UFPLACAVEICULO: TStringField;
    RESTDWClientSQL1INSCRICAOSUF: TStringField;
    RESTDWClientSQL1IDTABELAPRECO: TIntegerField;
    RESTDWClientSQL1ENVIADO: TStringField;
    RESTDWClientSQL1IDGRUPOPESSOA: TIntegerField;
    RESTDWClientSQL1DTANIVERSARIO: TDateField;
    RESTDWClientSQL1LIMITECRE: TBCDField;
    RESTDWClientSQL1OPERADORA1: TStringField;
    RESTDWClientSQL1OPERADORA2: TStringField;
    RESTDWClientSQL1OPERADORA3: TStringField;
    RESTDWClientSQL1OPERADORA4: TStringField;
    RESTDWClientSQL1TIPOEMP: TStringField;
    RESTDWClientSQL1IDPESSOATRANS: TIntegerField;
    RESTDWClientSQL1LOGIN_NET: TStringField;
    RESTDWClientSQL1SENHA_NET: TStringField;
    RESTDWClientSQL1ATIVO_NET: TStringField;
    RESTDWClientSQL1SENHACRIPTO_NET: TStringField;
    RESTDWClientSQL1IDTABELAPRECO1_NET: TIntegerField;
    RESTDWClientSQL1IDTABELAPRECO2_NET: TIntegerField;
    RESTDWClientSQL1IDTABELAPRECO3_NET: TIntegerField;
    RESTDWClientSQL1CONF_ISGERENTE: TStringField;
    RESTDWClientSQL1REPRESENTANTE_IDGERENTE: TIntegerField;
    RESTDWClientSQL1COMISSAOGERENTE: TBCDField;
    RESTDWClientSQL1DTFUNDACAO: TDateField;
    RESTDWClientSQL1DTULTSPC: TDateField;
    RESTDWClientSQL1DTULTVENDA: TDateField;
    RESTDWClientSQL1VLRULTVENDA: TBCDField;
    RESTDWClientSQL1LIBERAVENDA: TStringField;
    RESTDWClientSQL1OBSLIBERAVENDA: TMemoField;
    RESTDWClientSQL1IDROTA: TIntegerField;
    RESTDWClientSQL1INTERNET: TIntegerField;
    RESTDWClientSQL1INTERNET_MSG: TStringField;
    RESTDWClientSQL1UF: TStringField;
    RESTDWClientSQL1TESTE: TIntegerField;
    StatusBar: TJvStatusBar;
    JvLED1: TJvLED;
    mnuPrincipal: TMainMenu;
    Arquivo1: TMenuItem;
    EfetuarLogoffdoUsurioCorrente1: TMenuItem;
    N22: TMenuItem;
    FinalizarAplicao1: TMenuItem;
    Cadastros1: TMenuItem;
    Estoque1: TMenuItem;
    GruposdeProduto1: TMenuItem;
    SubGrupo1: TMenuItem;
    Cores1: TMenuItem;
    amanhos1: TMenuItem;
    Coleo1: TMenuItem;
    Produtos1: TMenuItem;
    Mercadoria1: TMenuItem;
    ProdutoAcabado1: TMenuItem;
    Produtoacabadosimplificado1: TMenuItem;
    abelapreo1: TMenuItem;
    ManuitenoCodigobarra1: TMenuItem;
    K1: TMenuItem;
    N1: TMenuItem;
    MatriaPrima1: TMenuItem;
    UsoConsumoAtivoImobilizado1: TMenuItem;
    Geral1: TMenuItem;
    Pessoas1: TMenuItem;
    Grupopessoa1: TMenuItem;
    Cidades1: TMenuItem;
    Etiquetas2: TMenuItem;
    Rotas1: TMenuItem;
    ServidorSMTP1: TMenuItem;
    R4: TMenuItem;
    Faturamento1: TMenuItem;
    CdigoTributrio1: TMenuItem;
    Mensagem1: TMenuItem;
    NaturezaOperao1: TMenuItem;
    CartadeCobrana1: TMenuItem;
    Cotas1: TMenuItem;
    Financeiro1: TMenuItem;
    PlanodeContasFinanceiro1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    Vencimentos1: TMenuItem;
    Banco1: TMenuItem;
    Faco1: TMenuItem;
    servios1: TMenuItem;
    Custos1: TMenuItem;
    Encargos1: TMenuItem;
    Apuraocustodoproduto1: TMenuItem;
    balanceamentoProdutivo1: TMenuItem;
    M1: TMenuItem;
    Processos1: TMenuItem;
    MaquinrioProcesso1: TMenuItem;
    DescrioEventoprocesso1: TMenuItem;
    Cronoanalisedepeas1: TMenuItem;
    MetaporPercentual1: TMenuItem;
    N14: TMenuItem;
    C2: TMenuItem;
    s1: TMenuItem;
    SPEDE1101: TMenuItem;
    E1101: TMenuItem;
    E1: TMenuItem;
    SPEDFiscalRegistros1: TMenuItem;
    N01: TMenuItem;
    Movimentos1: TMenuItem;
    Estoque2: TMenuItem;
    Balanoproduto1: TMenuItem;
    BaixaMatriaprima1: TMenuItem;
    BaixaMatriaprimamanual1: TMenuItem;
    BA1: TMenuItem;
    RetornoMateriaindustrializada1: TMenuItem;
    BaixadeUsoConsumoAtivoImobilizado1: TMenuItem;
    Historicodemovimentaes1: TMenuItem;
    Acerto1: TMenuItem;
    Produto1: TMenuItem;
    Matriaprima3: TMenuItem;
    AcertoUsoConsumoAtivoimobilizado1: TMenuItem;
    Inventario1: TMenuItem;
    ProdutoAcabado3: TMenuItem;
    Matriaprima4: TMenuItem;
    compras1: TMenuItem;
    Notaentrada1: TMenuItem;
    FreteConhecimento1: TMenuItem;
    NotadeentradaViaXML1: TMenuItem;
    EmissoEntradaPropria1: TMenuItem;
    Faturamento2: TMenuItem;
    lANAMENTOS1: TMenuItem;
    Pedidos1: TMenuItem;
    PedidoParcial1: TMenuItem;
    Gerandonovopedido1: TMenuItem;
    PedidosrieD1: TMenuItem;
    F2: TMenuItem;
    N3: TMenuItem;
    VendaECF1: TMenuItem;
    N4: TMenuItem;
    PedidosVendasdiversas1: TMenuItem;
    PedidoSimplesRemessa1: TMenuItem;
    N6: TMenuItem;
    PedidoIndustrializao1: TMenuItem;
    PedidoRetornoMercadoria1: TMenuItem;
    N8: TMenuItem;
    Devoluo1: TMenuItem;
    NotadeComplemento1: TMenuItem;
    Cupom1: TMenuItem;
    CupomPDV1: TMenuItem;
    DevoluoCupomPDV1: TMenuItem;
    Entregadepedidos1: TMenuItem;
    Manifesto1: TMenuItem;
    Pedidomanifesto1: TMenuItem;
    ManifestoVendaTalo1: TMenuItem;
    MaifestoRetorno1: TMenuItem;
    NotasFiscais1: TMenuItem;
    Pedido1: TMenuItem;
    N12: TMenuItem;
    Manifesto2: TMenuItem;
    RetornoManifesto1: TMenuItem;
    N13: TMenuItem;
    PedidoVendadiversa1: TMenuItem;
    pedidoindustrializao2: TMenuItem;
    PedidoSimplesRemessa2: TMenuItem;
    RetornoMercadoriaIndustrializada1: TMenuItem;
    Devoluo2: TMenuItem;
    NotaComplementar1: TMenuItem;
    DevoluodeCupom1: TMenuItem;
    G2: TMenuItem;
    N16: TMenuItem;
    produo1: TMenuItem;
    Ordemdeproduo1: TMenuItem;
    O1: TMenuItem;
    EntradadeProdutos1: TMenuItem;
    EntradaporPedido1: TMenuItem;
    IndustrializaoInternaMatriaprima1: TMenuItem;
    N15: TMenuItem;
    Refernciasemproduo1: TMenuItem;
    Posicionamentodaspeas1: TMenuItem;
    N19: TMenuItem;
    I2: TMenuItem;
    Custo1: TMenuItem;
    Entradadefuncionrios1: TMenuItem;
    EntradaFuncionrioporCodBarra1: TMenuItem;
    LanamentoOcorrnciaDescontosTempo1: TMenuItem;
    N18: TMenuItem;
    Expedio1: TMenuItem;
    Separaopeasexpedio1: TMenuItem;
    Movimento1: TMenuItem;
    EnvioFaco1: TMenuItem;
    RetornoFaco1: TMenuItem;
    RetornoMatriaprimafaco1: TMenuItem;
    Caixa1: TMenuItem;
    Contareceber1: TMenuItem;
    Manuteno2: TMenuItem;
    DescontosdeTtulos1: TMenuItem;
    DescontoDuplicatas1: TMenuItem;
    DevoluodeTtulos1: TMenuItem;
    AntecipaocancelamerntoFinanceiro1: TMenuItem;
    E2: TMenuItem;
    E3: TMenuItem;
    E4: TMenuItem;
    R5: TMenuItem;
    ContasPagar1: TMenuItem;
    Manuteno1: TMenuItem;
    FluxodeCaixa1: TMenuItem;
    Lanamento1: TMenuItem;
    Cheques1: TMenuItem;
    Cadastro2: TMenuItem;
    Pessoa2: TMenuItem;
    Cheque1: TMenuItem;
    BaixadeCheques1: TMenuItem;
    CancelaBaixa1: TMenuItem;
    Repasse1: TMenuItem;
    ArquivosFiscais1: TMenuItem;
    Sintegra1: TMenuItem;
    Sped1: TMenuItem;
    SPEDContribuies1: TMenuItem;
    ControleGerenciais1: TMenuItem;
    CRMGestodeRelacionamentocomoCliente1: TMenuItem;
    ContacorrenteCliente1: TMenuItem;
    ContacorrenteEmpresaFornecedor1: TMenuItem;
    CentraldeCobrana1: TMenuItem;
    Lanamentos2: TMenuItem;
    CredDebporrepresentante1: TMenuItem;
    CrditoDebito1: TMenuItem;
    ManutenoCrditoDbito1: TMenuItem;
    PesquisaCrditoCliente1: TMenuItem;
    R1: TMenuItem;
    ArquivoFCI1: TMenuItem;
    Relatrios7: TMenuItem;
    Estoque3: TMenuItem;
    Mercadoria2: TMenuItem;
    ProdutoAcabado2: TMenuItem;
    EstoqueFsico1: TMenuItem;
    Iventrio1: TMenuItem;
    RCPEP31: TMenuItem;
    Etiquetas1: TMenuItem;
    EtiquetasOrdemdeProduo1: TMenuItem;
    Fichatecnica1: TMenuItem;
    MatriaPrima2: TMenuItem;
    EstoqueFsico2: TMenuItem;
    Inventrio1: TMenuItem;
    RCPEP32: TMenuItem;
    EtiquetasEAN131: TMenuItem;
    Baixas1: TMenuItem;
    U1: TMenuItem;
    I1: TMenuItem;
    Catlogo1: TMenuItem;
    Compras2: TMenuItem;
    EntradasDirias1: TMenuItem;
    CrditoICMS1: TMenuItem;
    Faturamento3: TMenuItem;
    IdentificadordeVolumes1: TMenuItem;
    Romaneio1: TMenuItem;
    Pedidos2: TMenuItem;
    P4: TMenuItem;
    P5: TMenuItem;
    ProdutosdosPedidos1: TMenuItem;
    N11: TMenuItem;
    ProdutosVendidos1: TMenuItem;
    P3: TMenuItem;
    MatriasPrimasVendidas1: TMenuItem;
    RankingdeRepresentantes1: TMenuItem;
    Estatisticadevenda1: TMenuItem;
    clientesCompraramnocompraram1: TMenuItem;
    ClientesCompraramnocompraram2: TMenuItem;
    C3: TMenuItem;
    FiscaldeSada1: TMenuItem;
    RetornomercadoriaIndustrializada2: TMenuItem;
    Produo3: TMenuItem;
    Listagemdecorte1: TMenuItem;
    OrdemdeProduo2: TMenuItem;
    O2: TMenuItem;
    F1: TMenuItem;
    Entradadepeas1: TMenuItem;
    PedidosEmabertocompendncia1: TMenuItem;
    G1: TMenuItem;
    Produo2: TMenuItem;
    EtiquetaProduo1: TMenuItem;
    ProduoFuncionrio1: TMenuItem;
    Faco4: TMenuItem;
    Faco2: TMenuItem;
    ContaCorrente1: TMenuItem;
    GastoMatriaprima1: TMenuItem;
    Facoporcliente1: TMenuItem;
    R3: TMenuItem;
    ContasReceber1: TMenuItem;
    Movimentao2: TMenuItem;
    N2: TMenuItem;
    EmissodeImpressos1: TMenuItem;
    EmissoDuplicatas1: TMenuItem;
    EmissoBoletos1: TMenuItem;
    Duplicatamercantil1: TMenuItem;
    CentraldeCobrana2: TMenuItem;
    ResulmoFinanceirodoCliente1: TMenuItem;
    itlosemCarteira1: TMenuItem;
    Recibo1: TMenuItem;
    ContasPagar2: TMenuItem;
    Movimentao1: TMenuItem;
    Comissoporfaturamento1: TMenuItem;
    Recibo2: TMenuItem;
    Financeiro2: TMenuItem;
    LanamentosdeCaixa1: TMenuItem;
    LimitesdeCrdito1: TMenuItem;
    Balanofinanceiro1: TMenuItem;
    Fechamentodecaixa1: TMenuItem;
    C1: TMenuItem;
    Cheques2: TMenuItem;
    Controledevisitas2: TMenuItem;
    Pessoas2: TMenuItem;
    Pessoa1: TMenuItem;
    Aniversariantes1: TMenuItem;
    Maladirela1: TMenuItem;
    R2: TMenuItem;
    Fiscal1: TMenuItem;
    Sada1: TMenuItem;
    Entrada1: TMenuItem;
    FCI1: TMenuItem;
    P2: TMenuItem;
    A2: TMenuItem;
    bALANOpRODUTIVO1: TMenuItem;
    Dirio1: TMenuItem;
    Mensal1: TMenuItem;
    Utilitrios1: TMenuItem;
    PaineldeControle1: TMenuItem;
    ManutenoNFE1: TMenuItem;
    ConsultaStatus1: TMenuItem;
    Inutilizarnumerao1: TMenuItem;
    Alteranumerodenota1: TMenuItem;
    Manutenodendices1: TMenuItem;
    AcertarSequenciadores1: TMenuItem;
    P6: TMenuItem;
    Calculadora1: TMenuItem;
    N5: TMenuItem;
    Usurios1: TMenuItem;
    EmpresaparaSintegra1: TMenuItem;
    N10: TMenuItem;
    ImportarExportarPedidos1: TMenuItem;
    Importar1: TMenuItem;
    Exportar1: TMenuItem;
    GerarXMLparacontabilidade1: TMenuItem;
    Acerto2: TMenuItem;
    Logsdosistema1: TMenuItem;
    PedidosdaInternet1: TMenuItem;
    Mudanadoestadodospedidos1: TMenuItem;
    CalculadigVerificadorProduto1: TMenuItem;
    A1: TMenuItem;
    ImportararquivoIBPT1: TMenuItem;
    P1: TMenuItem;
    A3: TMenuItem;
    Janela1: TMenuItem;
    Cascata1: TMenuItem;
    AlinharnaHorizontal1: TMenuItem;
    AlinharnaVertical1: TMenuItem;
    Organizarcones1: TMenuItem;
    MinimizarTudo1: TMenuItem;
    N7: TMenuItem;
    Ajuda1: TMenuItem;
    VerificarAtualizaes1: TMenuItem;
    N17: TMenuItem;
    EntrarEmcontatocomSuporteTcnico1: TMenuItem;
    EntraremcontatoSuporteTcnico1: TMenuItem;
    DigitarNovonmerodeSrie1: TMenuItem;
    N9: TMenuItem;
    Sobre1: TMenuItem;
    Suporte1: TMenuItem;
    Mysuite1: TMenuItem;
    Suporte2: TMenuItem;
    imgMenusImagens32x: TImageList;
    img16xRibbonAplication: TImageList;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure RESTDWDataBase1Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure RESTDWDataBase1Connection(Sucess: Boolean; const Error: string);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dxBarSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);

  private
    { Private declarations }
    FBytesToTransfer: Int64;
  public
    { Public declarations }
    JSONValue: TJSONValue;
    _vfinalisa_sistema: string;


  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UDM, uSplashConexao;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin

  RESTDWDataBase1.Close;
  RESTDWDataBase1.WelcomeMessage := '00.000.000/0000-00';
  RESTDWDataBase1.PoolerService := 'localhost';
  RESTDWDataBase1.PoolerPort := 8080;
  RESTDWDataBase1.Login := 'point';
  RESTDWDataBase1.Password := 'gadu!@##@!';
  RESTDWDataBase1.Compression := True;
  RESTDWDataBase1.Open;
  RESTDWClientSQL1.Close;
  RESTDWClientSQL1.SQL.Clear;
  RESTDWClientSQL1.SQL.Add('select * from pessoa');
  RESTDWClientSQL1.Open;
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  // RESTDWDataBase1.Close;
  // RESTDWDataBase1.WelcomeMessage := '11.111.111/1111-11';
  // RESTDWDataBase1.PoolerService := 'localhost';
  // RESTDWDataBase1.PoolerPort := 8080;
  // RESTDWDataBase1.Login := 'point';
  // RESTDWDataBase1.Password := 'gadu!@##@!';
  // RESTDWDataBase1.Compression := True;
  // RESTDWDataBase1.Open;
  // RESTDWClientSQL2.Close;
  // RESTDWClientSQL2.SQL.Clear;
  // RESTDWClientSQL2.SQL.Add('select * from pessoa');
  // RESTDWClientSQL2.Open;
end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
Var
  DWParams: TDWParams;
  JSONParam: TJSONParam;
  lResponse: String;

Begin
  RESTClientPooler1.RequestTimeOut := 2 * 60000;

  DWParams := TDWParams.Create;

  try
    DWParams.Encoding := GetEncoding(RESTClientPooler1.Encoding);

    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'SQL';
    JSONParam.ObjectDirection := odIN;
    JSONParam.SetValue('select * from pessoa');
    DWParams.Add(JSONParam);

    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'CNPJ';
    JSONParam.ObjectDirection := odIN;
    JSONParam.SetValue('00.000.000/0000-00');
    // JSONParam.SetValue('11.111.111/1111-11');
    DWParams.Add(JSONParam);

    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'TABELA';
    JSONParam.ObjectDirection := odIN;
    JSONParam.SetValue('pessoa');
    DWParams.Add(JSONParam);

    JSONParam := TJSONParam.Create(DWParams.Encoding);
    JSONParam.ParamName := 'RESULTADO';
    JSONParam.SetValue('');
    DWParams.Add(JSONParam);

    lResponse := RESTClientPooler1.SendEvent('RetornaSql', DWParams);

    If DWParams.ItemsString['RESULTADO'].Value <> '' Then
    begin

      // Memo1.Lines.Text := trim(DWParams.ItemsString['RESULTADO'].Value);
      // JSONValue.WriteToDataset(dtFull, Memo1.Lines.Text, FDMemTable1);

    end;

  finally
    FreeAndNil(DWParams);

  end;

end;

procedure TFrmPrincipal.dxBarSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.FormActivate(Sender: TObject);
var
  i, j, k, l: integer;

begin

  if _vfinalisa_sistema = 'N' then
  begin

    { testa se é para usar cliente na faccao  utilitarios / faccao }

    if AnsiSameText(Funcoes.GetConfig('LIBERATESTEREFFACCAO', 'N'), 'S') then
    begin

      for i := 0 to self.ComponentCount - 1 do
      begin

        if self.Components[i] is TMainMenu then
        begin
          for j := 0 to TMainMenu(self.Components[i]).Items.Count - 1 do
          begin
            if j = 3 then
            begin
              for k := 0 to TMainMenu(self.Components[i]).Items[j].Count - 1 do
              begin
                for l := 0 to TMainMenu(self.Components[i]).Items[j].Items[k].Count - 1 do
                begin

                  if TMainMenu(self.Components[i]).Items[j].Items[k].Items[l].Name = 'Facoporcliente1' then

                    TMainMenu(self.Components[i]).Items[j].Items[k].Items[l].Visible := True;
                end;
              end;
            end;
          end;
        end;
      end;
    end;

  end;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if Assigned(Funcoes) then
    FreeAndNil(Funcoes);

  // if Assigned(FindArea) then
  // FindArea.Free;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  // Definindo pro DevExpress usar as formatações do delphi.
  Funcoes := TFuncoes.Create;
  Funcoes.Fversao := funcoes.pegaversao;

  Top := 0;
  Left := 0;
  WindowState := wsMaximized;
  DoubleBuffered := True;
  StatusBar.Panels.Items[5].Text := 'Versão 2017/2018';

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
  _vsql: string;

begin

  _vfinalisa_sistema := 'N';
  Funcoes.CurrentUser.MainMenu := mnuPrincipal;

  // chamando a tela de login
  Funcoes.CurrentUser.Login(True, EmptyStr, EmptyStr);

  FrmSplashConexao := TFrmSplashConexao.Create(nil);
  try
    FrmSplashConexao.JvGradientHeaderPanel1.LabelCaption := 'Aguarde ...';
    FrmSplashConexao.Memo1.Text := ' concluindo as configurações ...';
    FrmSplashConexao.Memo1.Visible := True;
    FrmSplashConexao.Show;
    FrmSplashConexao.Repaint;
    if _vfinalisa_sistema = 'S' then
    begin
      // Halt(0);
      // Application.Terminate;

      exit;
    end;
    if not Funcoes.Empty(Funcoes.CurrentUser.UserID) then
    begin // Efetuou o login
      Caption := Caption + ' - ' + dm.CdsEmpresa.FieldByName('RAZAO_SOCIAL').AsString + '  [' +
        string( Funcoes.Fversao ) + ']';
      StatusBar.Panels.Items[2].Text := Funcoes.CurrentUser.UserLogin;
      StatusBar.Panels.Items[3].Text := dm.CdsEmpresa.FieldByName('RAZAO_SOCIAL').AsString;

    end;

    // caso tenha algum agendamento..

    _vsql := 'select agd.*, p.idpessoa , p.razao_social from crmagenda agd' + #13#10 +
      'left join crm c on ( c.idcrm = agd.idcrm ) and ( c.idsys_point_cliente = :idsys_point_cliente ) and' + #13#10 +
      '( c.idempresa = :idempresa  )' + #13#10 +
      'left join pessoa p on ( p.idpessoa = c.idpessoa ) and ( p.idsys_point_cliente = :idsys_point_cliente )' + #13#10
      + 'where  ( agd.idsys_point_cliente =:idsys_point_cliente  ) and ( agd.idempresa = :idempresa  )' + #13#10 +
      'and (  agd.strealizado = ''N'') and ( agd.dtcompromisso  <=' +
      QuotedStr(FormatDateTime('dd.mm.yyyy', Now)) + ' )';

    Funcoes.RetornaSQL(_vsql);
    if dm.Ret_sql.RecordCount > 0 then
   //   TimerAgenda.Enabled := True;

    StatusBar.Panels.Items[1].Text := FormatDateTime('dd/mm/yyyy hh:mm', Now);

    // abrindo a tabela de configuracoes
    Funcoes.RetornaSQL('select * from SYS_CONFIG');
    dm.Ret_sql.First;
    dm.CdsConfig.LoadFromDataSet(dm.Ret_sql, 0, lmCopy);


  finally
    FrmSplashConexao.Free;
    // TmrGetInfos.Enabled := true;
  end;

  if dm.CdsConfig.RecordCount > 1 then
  begin

    Application.MessageBox('Verifique pois a tabela SYS_CONFIG possui mais de 1 registro.', PChar(Application.Title),
      MB_OK + MB_ICONWARNING);
    Application.Terminate;
    halt(0);
  end;


  // Validacao.Execute(FrmPrincipal);

end;

procedure TFrmPrincipal.RESTDWDataBase1Connection(Sucess: Boolean; const Error: string);
begin
  if not Sucess then
  begin
    Application.MessageBox('Servidor está fora do ar ' + #13#10 + 'entre em contato com o suporte.',
      PChar(Application.Title), MB_OK + mb_iconinformation);

  end;

end;

procedure TFrmPrincipal.RESTDWDataBase1Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  If FBytesToTransfer = 0 Then // No Update File
    exit;

end;

procedure TFrmPrincipal.Usurios1Click(Sender: TObject);
begin
 // Funcoes.VerificaForm(TFrmCad_Usuario, FrmCad_Usuario);
end;

end.
