unit untMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    Label2: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    labTotArqs: TLabel;
    labArq: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Label6: TLabel;
    Label8: TLabel;
    Bevel4: TBevel;
    edPastaOriginal: TEdit;
    pg: TProgressBar;
    memo_Original: TMemo;
    ButtonStart: TButton;
    edPastaConvertido: TEdit;
    Button1: TButton;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    cbxEngine: TComboBox;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin

     ShowMessage( 'Desenvolvido a partir da necessidade PESSOAL de converter ZEOS para RestDW ' +
                  'após algumas tentativas frustradas de usar o "reFind".' + sLineBreak + sLineBreak +
                  'Facilmente poderá ser adaptado a quaquer necessidade como opção ao GReplace, por exemplo, ' + sLineBreak +
                  'com a vantagem de não só substituir mas ADICIONAR linhas de código tanto ao .DFM quanto ao .PAS' + sLineBreak + sLineBreak +
                  'Qualquer dúvida: ' + sLineBreak + sLineBreak +
                  'skype: mikromundo.com ou ' + sLineBreak +
                  'email: mikromundo@gail.com' + sLineBreak + sLineBreak +
                  'Flávio Motta( www.mikromundo.com )');

end;

procedure TfrmMain.ButtonStartClick(Sender: TObject);
var

   _frameBarraSup ,
   _rzButton,
   _panel,
   _rzlistbox,


   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, linha3, linhaSQL, linhaDataSource, linhaLeft, linhaTop, NewFileName : string;

   logfile : textfile;


   espacos : string;

   _pular,

   i, t, a, s, d,

   _itens_descartar, // dependendo da Engine de origem. Para evitar conflito de propriedades com nomes em comum entre Engines

   _itens_composto, _itens_uses, _itens_alt_dfm, _itens_add_dfm, _itens_pas, _itens_filtros, _itens_add_dfm_PropRestDataBase,

   contadorTfrm  : Integer;

   _TextColors_DisabledHighlight : integer;

   bBlocoQuery : Boolean;

   aDescartar,    // dependendo da Engine de origem. Para evitar conflito de propriedades com nomes em comum entre Engines

   aEngineOrigem,
   aEngineOrigemComposto,
   aRestDW   ,
   aNovos ,
   aUses   ,
   aCode_EngineOrigem ,
   aCode_RestDW ,
   aAddPropRestDataBase : array[0..50] of String;

   aFiltroArqs  : array[1..2] of String;


   aArquivos    : array[1..5000] of String;

   strArqOrigem,
   strArqDestino,
   strArqTemp      : TStringList;

begin

   _itens_composto   := 0;
   _itens_alt_dfm    := 0;
   _itens_add_dfm    := 0;
   _itens_pas        := 0;
   _itens_filtros    := 0;
   _itens_add_dfm_PropRestDataBase := 0;
   _itens_uses      := 0;

   _itens_Descartar := 0;


   Inc( _itens_filtros );
   aFiltroArqs[ _itens_filtros ] := '*.dfm';
   Inc( _itens_filtros );
   aFiltroArqs[ _itens_filtros ] := '*.pas';

   // DFMs
   //

   // as criticas a seguir( de descarte ) foram adicionadas pq INFELIZMENTE
   // tinha no meu projeto um misto de conexoes( estava fazendo testes )
   // foi essa situacao que me fez criar o MIGRADOR
   //
   if cbxEngine.Text = 'Zeos' then
   begin

        // RestDW
        Inc( _itens_descartar );
        aDescartar  [ _itens_descartar ] := ': TREST';//'TRESTDataBase';

        // FireDac
        Inc( _itens_descartar );
        aDescartar  [ _itens_descartar ] := ': TFD';//'TFDQuery';

        //IBX
        Inc( _itens_descartar );
        aDescartar  [ _itens_descartar ] := ': TIB';//'TIBDataBase';

   end
   else
   if cbxEngine.Text = 'FireDac' then
   begin

        // RestDW
        Inc( _itens_descartar );
        aDescartar  [ _itens_descartar ] := ': TREST';//'TRESTDataBase';

        // Zeos
        Inc( _itens_descartar );
        aDescartar  [ _itens_descartar ] := ': TZ';//'TFDQuery';

        //IBX
        Inc( _itens_descartar );
        aDescartar  [ _itens_descartar ] := ': TIB';//'TIBDataBase';

   end;
   //----------------------------------------------------------------------------------------------------------


   //----------------------------------------------------------------------------------------------------------
   // os 3 primeiros itens serao trocados por stringreplace para manter o NOME dos componentes
   // o restante será substtuido toda a linha ou REMOVIDO
   //
   // com destino para RestDW
   //

   if cbxEngine.Text = 'Zeos' then
   begin

       // propriedades q serão substituidas parcial para manter o NOME do componente original
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ': TZConnection';
       aRestDW[ _itens_alt_dfm ]         := ': TRESTDataBase';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ': TZQuery';
       aRestDW[ _itens_alt_dfm ]         := ': TRESTClientSQL';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' Connection =';       // altere pra suas definicoes de conexao da ZEOS
       aRestDW[ _itens_alt_dfm ]         := ' DataBase =';

       // propriedades q serão removidas / substituidas integralmente
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' CachedUpdates = True';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' CachedUpdates = False';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' ReadOnly = True';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' ControlsCodePage';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' Catalog';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' Properties.Strings';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' ''controls_cp=GET_ACP'')';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' AutoCommit';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' TransactIsolationLevel';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' Connected';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' SQLHourGlass';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' HostName';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' Port';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' Database = ''';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' User = ''';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' Password = ''';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' Protocol = ''';
       aRestDW[ _itens_alt_dfm ]         := '';
       Inc( _itens_alt_dfm );
       aEngineOrigem  [ _itens_alt_dfm ] := ' DataSource =';
       aRestDW[ _itens_alt_dfm ]         := '';

       //propriedades compostas
       //
       // Ex: ParamData = <
       //     end>
       //
       Inc( _itens_composto );
       aEngineOrigemComposto  [ _itens_composto ] := 'Params =';
       Inc( _itens_composto );
       aEngineOrigemComposto  [ _itens_composto ] := 'ParamData =';

   end;

   //----------------------------------------------------------------------------------------------------------
   // propriedades da ENGINE DE DESTINO( no caso RestDW ) a serem adicionadas
   //
   // com destino para RestDW
   //
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'IndexDefs = <>';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'FetchOptions.AssignedValues = [evMode]';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'FetchOptions.Mode = fmAll';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'FormatOptions.MaxBcdPrecision = 2147483647';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'FormatOptions.MaxBcdScale = 2147483647';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'ResourceOptions.AssignedValues = [rvSilentMode]';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'ResourceOptions.SilentMode = True';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'UpdateOptions.LockWait = True';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'UpdateOptions.FetchGeneratorsPoint = gpNone';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'UpdateOptions.CheckRequired = False';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'UpdateOptions.AutoCommitUpdates = True';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'StoreDefs = True';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'MasterCascadeDelete = True';
   Inc( _itens_add_dfm );
   aNovos[ _itens_add_dfm ] := 'DataCache = False';
   //Inc( _itens_add_dfm );
   //aNovos[ _itens_add_dfm ] := 'Params = <>';

   //----------------------------------------------------------------------------------------------------------
   //propriedades novas para adicionar ao RestDataBase em troca ao ZConnection
   //
   // com destino para RestDW
   //
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'Active = False';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'Compression = True';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'Login = ''testserver''';    // altere para seu login
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'Password = ''testserver'''; // altere para seu usuario
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'Proxy = False';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'ProxyOptions.Port = 8888';
      Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'PoolerService = ''127.0.0.1''';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'PoolerPort = 8082';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'PoolerName = ''ServerMethods1.RESTPoolerDB''';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'RestModule = ''TServerMethods1''';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'StateConnection.AutoCheck = False';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'StateConnection.InTime = 1000';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'RequestTimeOut = 10000';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'Encoding = esUtf8';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'Context = ''Datasnap''';
   Inc( _itens_add_dfm_PropRestDataBase );
   aAddPropRestDataBase[ _itens_add_dfm_PropRestDataBase ] := 'RESTContext = ''rest/''';
   //----------------------------------------------------------------------------------------------------------

   //----------------------------------------------------------------------------------------------------------
   //PAS
   //
   // com destino para RestDW
   //
   // uses
   Inc( _itens_uses );
   aUses [ _itens_uses ] := 'uRestPoolerDB';
   // retirei as linhas abaixo pois mesmo adcionando, ao abrir um DM convertido e clicar em SALVAR
   // o delphi adicionava novamente as declaracoes
   {
   //Inc( _itens_uses );
   aUses [ _itens_uses ] := 'FireDAC.UI.Intf';
   Inc( _itens_uses );
   aUses [ _itens_uses ] := 'FireDAC.FMXUI.Wait';
   Inc( _itens_uses );
   aUses [ _itens_uses ] := 'FireDAC.Comp.UI';
   Inc( _itens_uses );
   aUses [ _itens_uses ] := 'FireDAC.Stan.Intf';
   Inc( _itens_uses );
   aUses [ _itens_uses ] := 'FireDAC.Comp.Client';
   Inc( _itens_uses );
   aUses [ _itens_uses ] := 'FireDAC.Stan.StorageJSON';
   Inc( _itens_uses );
   aUses [ _itens_uses ] := 'FireDAC.Stan.StorageBin';
   }
   //----------------------------------------------------------------------------------------------------------

   //----------------------------------------------------------------------------------------------------------
   // partes de codigo q poder ser substituidas( aqui era minha necessidade, mude de acordo com a sua...
   //
   // com destino para RestDW
   //
   Inc( _itens_pas );
   aCode_EngineOrigem   [ _itens_pas ] := '.ExecSql;';  //Quaquer query...
   aCode_RestDW [ _itens_pas ]         := '.ExecSql( _Erro_DW ) then ShowMessage( _Erro_DW );'; // acrescentar if not antes
   Inc( _itens_pas );
   aCode_EngineOrigem   [ _itens_pas ] := 'TZQuery';  //Quaquer query...
   aCode_RestDW [ _itens_pas ]         := 'TRESTClientSQL'; // acrescentar if not antes
   //----------------------------------------------------------------------------------------------------------



   if cbxEngine.Text <> 'Zeos' then
   begin

        ShowMessage( 'Ajude o projeto. A conversão é feita apenas de ZEOS para RestDW por enquanto.' );
        Exit

   end;

   if not DirectoryExists( edPastaOriginal.text ) then
   begin

        MkDir( edPastaOriginal.text );
        ShowMessage( 'A pasta de arqs. a serem convertidos( ORIGINAL ) foi criada em : ' + sLineBreak +
                     edPastaOriginal.text + sLineBreak + sLineBreak +
                     'Copie os arquivos que deseja converter para essa pasta' );

   end;

   if not DirectoryExists( edPastaConvertido.text ) then
   begin

        MkDir( edPastaConvertido.text );
        ShowMessage( 'A pasta de arqs. migrados( CONVERTIDOS ) foi criada em : ' + sLineBreak +
                     edPastaConvertido.text + sLineBreak + sLineBreak +
                     'Os arquivos migrados serão copiados para essa pasta.' );

   end;

     //contar os arquivos definidos no Array
     //
     _tot := 0;
     for a := 1 to _itens_filtros do
     begin

         if FindFirst( edPastaOriginal.text + aFiltroArqs[ a ], faAnyFile, SearchRec) = 0 then
         begin
            Inc(_tot);
            aArquivos[ _tot ] := SearchRec.Name;
         end;

         While ( FindNext( SearchRec ) = 0 ) do
         begin

              Inc(_tot);
              aArquivos[ _tot ] := SearchRec.Name;

         end;

         FindClose(SearchRec);

     end;

     // progresso geral
     pg.Max  := _tot;
     pg.Step := 1;//Trunc(_tot/100);
     pg.Position := 0;

     // processar DFM's
     //-----------------------
     //procura pelo primeiro programa
     //

     for t := 1 to _tot do
     begin

         Filename    := edPastaOriginal.text + aArquivos[ t ];
         NewFileName := edPastaConvertido.text  + aArquivos[ t ];

         //memo_Convertido.Lines.Clear;
         memo_Original.lines.clear;

         //falha com formato stream...
         if Filename <> '' then
         begin

              memo_Original.Lines.LoadFromFile( Filename );
              memo_Original.lines.clear;

         end;

         pg.Position := pg.Position + 1;

         labArq.Caption := 'Processando: ' + ExtractFileName( Filename );

         labTotArqs.Caption := 'Processado(s) ' + pg.Position.ToString + ' de ' + _tot.ToString;

         Application.ProcessMessages;

         //apaga o arq. de destino caso tenha sido processado anteriormente
         DeleteFile( NewFileName );

         //carrega arq. original
         memo_Original.Lines.LoadFromFile( Filename );

         linha := '';

         strArqDestino := TStringList.Create;
         strArqTemp    := TStringList.Create;

         // detalhes relativos apenas a arquivos DFM
         if ( Pos( '.dfm' , labArq.Caption ) > 0 ) then
         begin

             // verificar se existe partes de CODIGO pra substituir( EXECSQL por ex. )
             f := memo_Original.Lines.Count - 1;

                     (*
             // limpar todo o DFM de OBJETOS descartaveis
                          //fazer critica de substituicao/adicao de codigo
             //
             r := -1;
             while r <= f do //for r := 0 to f do
             begin

                 inc( r );
                 linha := memo_Original.Lines.Strings[ r ];

                 // fazer a critica de descarte..componentes q nao devem ser processados...
                 for I := 1 to _itens_descartar do
                 begin

                       // se o objeto atual for descarte, pula até o 'end' do objeto
                       if Pos( aDescartar[ I ] , linha ) > 0 then
                       begin

                           repeat

                                 // marcar linha para nao ser processada
                                 strArqTemp.Add( r.ToString + '.' + linha );

                                 Inc( r );
                                 linha := memo_Original.Lines.Strings[ r ];


                           until ( Copy( linha , 1, 3 ) = 'end' ) and ( Pos( '>' , linha ) = 0 );

                           // marcar linha para nao ser processada
                           strArqTemp.Add( r.ToString + '.' + linha );

                       end;

                 end;

             end;

             memo_Original.Lines.Text := strArqTemp.Text;

             strArqTemp.SaveToFile( ExtractFileDir( ParamStr(0)) + '\descarte.txt' );

             //strArqTemp.Free;

*)
             // verificar se existe partes de CODIGO pra substituir( EXECSQL por ex. )

             //fazer critica de substituicao/adicao de codigo
             //
             r := -1;
             while r <= f do //for r := 0 to f do
             begin

                 inc( r );

                 linha := memo_Original.Lines.Strings[ r ];

                 //verificar se esta linha pode ser processada...
                 //if Pos( r.ToString + '.' + linha , strArqTemp.Text ) = 0 then
                 begin

                     //fazer critica de adicao de propriedades( inserir logo abaixo de Objetc TRestSql )
                     //
                     for I := 1 to _itens_alt_dfm do
                     begin

                         try

                            linha2 := aEngineOrigem[ i ];

                            if ( Pos( aEngineOrigem[ i ] ,  linha ) > 0 ) then
                            begin

                                 // até a prop. CONNECTION
                                 if i <= 3 then
                                    linha := StringReplace( linha, aEngineOrigem[ I ] , aRestDw[ i ] , [ rfReplaceAll , rfIgnoreCase] )
                                 else
                                    linha := aRestDw[ i ];

                            end;

                         except

                         end;

                     end;

                     // adicionar controles FireDac caso nao existam ANTES da declaracao do RestDABASE
                     //
                     // into pq o RestDW usa FireDac, entao dependendo do Destino pode se mudar..
                     //
                     // nosso destino padrão será o RestDW
                     //
                     if ( Pos( 'TRESTDataBase' , linha ) > 0 ) then
                     begin

                           if ( Pos( 'TFDTransaction' , linha ) = 0 ) then
                           begin

                                strArqDestino.Add( '    ' + 'object FDTransaction: TFDTransaction' );
                                strArqDestino.Add( '  ' + '  Connection = sqlLocalDBC' );
                                strArqDestino.Add( '  ' + '  Left = 5' );
                                strArqDestino.Add( '  ' + '  Top = 5' );
                                strArqDestino.Add( '  ' + 'end' );

                           end;
                           if ( Pos( 'TFDGUIxWaitCursor' , linha ) = 0 ) then
                           begin

                                strArqDestino.Add( '  ' + 'object FDGUIxWaitCursor: TFDGUIxWaitCursor' );
                                strArqDestino.Add( '  ' + '  Provider = ''FMX''' );
                                strArqDestino.Add( '  ' + '  Left = 10' );
                                strArqDestino.Add( '  ' + '  Top = 10' );
                                strArqDestino.Add( '  ' + 'end' );

                           end;
                           if ( Pos( 'TFDStanStorageJSONLink' , linha ) = 0 ) then
                           begin

                                strArqDestino.Add( '  ' + 'object FDStanStorageJSONLink: TFDStanStorageJSONLink' );
                                strArqDestino.Add( '  ' + '  Left = 15' );
                                strArqDestino.Add( '  ' + '  Top = 15' );
                                strArqDestino.Add( '  ' + 'end' );

                           end;
                           if ( Pos( 'TFDStanStorageBinLink' , linha ) = 0 ) then
                           begin

                                strArqDestino.Add( '  ' + 'object FDStanStorageBinLink: TFDStanStorageBinLink' );
                                strArqDestino.Add( '  ' + '  Left = 20' );
                                strArqDestino.Add( '  ' + '  Top = 20' );
                                strArqDestino.Add( '  ' + 'end' );

                           end;


                     end;

                     if ( Trim( linha ) <> '' ) then
                        strArqDestino.Add( linha );

                      //fazer critica de adicao de propriedades
                      //
                      // só adiciona se a linha atual for a de declaracao do TRESTClientSQL
                      //
                      if ( Pos( 'DataBase =' , linha ) > 0 ) then
                      begin

                           // apos a declaraco da QUERY vem o CONNECTION

                           for a := 1 to _itens_add_dfm do
                               strArqDestino.Add( '    ' + aNovos[ a ] );

                           linhaSQL := '';

                           // processar até o fim do objeto
                           //
                           // No caso da ZEOS, a propriedade Param e ParamData tem q ser removida
                           //
                           // outras engines podem ter algo semelhante...
                           repeat

                                 Inc( r );
                                 linha := memo_Original.Lines.Strings[ r ];

                                 for I := 1 to _itens_composto do
                                 begin

                                     if ( Pos( aEngineOrigemComposto[ I ] , linha ) > 0 ) and
                                        ( Pos( '<>' , linha ) = 0 )  then
                                     begin

                                        Dec( r );
                                        repeat

                                              Inc( r );
                                              linha := memo_Original.Lines.Strings[ r ];

                                        until ( Pos( 'end>' , linha ) > 0 );

                                        Inc( r );
                                        linha := memo_Original.Lines.Strings[ r ];

                                     end;

                                 end;

                                 strArqDestino.Add( linha );

                           until ( Pos( ' end' , linha ) > 0 ) and ( Pos( '>' , linha ) = 0 );

                      end;

                      if ( Pos( 'TRESTDataBase' , linha ) > 0 ) then
                      begin

                           for a := 1 to _itens_add_dfm_PropRestDataBase do
                               strArqDestino.Add( '    ' + aAddPropRESTDataBase[ a ] );

                      end;

                 end;

             end;

         end
         else
         // detalhes relativos apenas a arquivos DFM
         //
         // para os .pas apenas substituir TZQuery( pelo menos por enquanto... )
         begin

             //------------------------------------------------------
             // transfere o arquvo original para o que vai ser convertido
             strArqDestino.Text := memo_Original.Lines.Text;

             strArqDestino.Text := StringReplace( memo_Original.Lines.Text, aEngineOrigem[ 1 ] , aRestDw[ 1 ] , [ rfReplaceAll, rfIgnoreCase ] ) ;

             //------------------------------------------------------
             //uses  ( acrescentar uRestPoolerDB.pas ou outras...
             //
             // unit contem TRestSQL, acrescentar a USES
             //
             // a linha abaixo foi comentada para ganho de performance. H;a um atraso em unis grandes...
             //if Pos( aRestDw[ 1 ] , memo_Convertido.Lines.Text ) > 0 then
             begin
                 s := Pos( 'uses'+#13#10 , strArqDestino.Text ) - 1;

                 if ( s > 0 ) then
                 begin

                     linha2 := Copy( strArqDestino.Text , 1, s + 4) + #13#10 + '  ';

                     linha3 := Copy( strArqDestino.Text , s + 5, Length( strArqDestino.Text ) );

                     for I := 1 to _itens_uses do
                     begin

                         try

                            // se nao houver a declaracao, adiciona...
                            if ( Pos( aUses[ i ] , strArqDestino.Text ) = 0 ) then
                            begin

                                 linha2 := linha2 + aUses[ I ] + ', ' ;

                            end;

                         except

                         end;

                     end;

                     strArqDestino.Text := linha2 + linha3;

                 end;

             end;
             //
             //------------------------------------------------------

             //------------------------------------------------------
             //Migrar EXECSql da Zeos/outros para RestDW
             //
             memo_Original.Lines.Clear;
             memo_Original.Lines.Text := strArqDestino.Text;

             strArqDestino.Clear;


             // verificar se existe partes de CODIGO pra substituir( EXECSQL por ex. )
             f := memo_Original.Lines.Count - 1;


             //fazer critica de substituicao/adicao de codigo
             //
             for r := 0 to f do
             begin

                 linha := memo_Original.Lines.Strings[ r ];

                 // para ACELERAR o processo de migracao, primeiro vericamos em todo o MEMO a existencia de conteudo a
                 // ser migrado, caso haja, entao prorcessamos LINHA a LINHA
                 for I := 1 to _itens_pas do
                 begin

                     try

                        //linha := memo_Original.Lines.Strings[ r ];

                        if ( Pos( aCode_EngineOrigem[ i ] , linha ) > 0 ) then
                        begin

                             //podemos substituir parte da linha de codigo ou a linha inteira
                             //
                             // no meu caso como tenho varias querys com EXECSQL, deixei a
                             // posicao 1 como sendo padrao pra substituir qualquer query
                             //
                             // adicione outras ocorrencias de acordo com sua necessidade
                             //
                             // as demais, serao substituicao de linha inteira( o q o gReplace, cnPack poderia fazer... )
                             //
                             if i = 1 then
                             begin

                                 //pegar o nome da QUERY
                                 linha2 := Copy( linha, 1, Pos( '.' , linha ) - 1 );

                                 // caso a linha esteja indentada...
                                 espacos := '';
                                 s := 1;
                                 while Copy( linha2 , s , 1 ) = ' '  do
                                 begin

                                   espacos := espacos + ' ';
                                   Inc( s );

                                 end;

                                 // monta a linha com a nova estrutura
                                 linha := espacos + 'if not ' + Trim( linha2 ) + aCode_RestDw[ i ];

                             end
                             else
                                linha := StringReplace( linha, aCode_EngineOrigem[ I ] , aCode_RestDw[ i ] , [ rfReplaceAll , rfIgnoreCase] ) ;

                        end;

                     except

                     end;

                 end;

                 strArqDestino.Add( linha );

             end;

             if strArqDestino.Text.IsEmpty then
                strArqDestino.Text := memo_Original.Lines.Text;

             //------------------------------------------------------

         end;

         //salva novo arq. convertido
         strArqDestino.SaveToFile( NewFileName );

         //Break;

         strArqDestino.Clear;

         strArqDestino.Free;
         strArqTemp.Free;

         memo_Original.lines.clear;

     end;

     ShowMessage( 'Processo Finalizado !' );

end;


procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmMain := Nil;
 Release;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

     Self.Left := Trunc( screen.Width / 2 ) - trunc( Self.Width / 2 );
     Self.Top  := Trunc( screen.Height / 2 ) - trunc( Self.Height / 2 );

     edPastaOriginal.Text := ExtractFilePath( ParamStr( 0 )) + 'original\';

     edPastaConvertido.Text := ExtractFilePath( ParamStr( 0 )) + 'convertido\';
end;

end.
