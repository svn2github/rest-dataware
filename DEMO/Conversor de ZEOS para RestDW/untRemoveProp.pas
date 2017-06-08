unit untRemoveProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ComCtrls;

type
  TForm1 = class(TForm)
    btnPas: TButton;
    edPasta: TEdit;
    labProg: TLabel;
    Memo1: TMemo;
    labLinhas: TLabel;
    btnDFM: TButton;
    Button3: TButton;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pg: TProgressBar;
    edFiltro: TEdit;
    Label4: TLabel;
    btnPasFormShow: TButton;
    Memo3: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    edProp: TEdit;
    Label5: TLabel;
    Memo4: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    edProp2: TEdit;
    Button11: TButton;
    Button12: TButton;
    OpenDialog1: TOpenDialog;
    procedure btnPasClick(Sender: TObject);
    procedure btnDFMClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnPasFormShowClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Dfm2Txt(Src, Dest: string): boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnPasClick(Sender: TObject);

var

   NumLinhas, f, r : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, NewFileName : string;

   logfile : textfile;

   palavra : string;


begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end

}
     NumLinhas := 0;
     labProg.tag := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.pas', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'dfm';

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     memo1.Lines.Clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               Inc ( NumLinhas );
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               // procura por USES para achar ZDATASET
               begin

                    if edPasta.tag = 0 then
                    begin

                        for r := 1 to length( linha ) do
                        begin

                             palavra := '';
                             palavra := palavra + copy( linha, r , 8 );

                             if lowercase( palavra ) = '.FormShow' then
                                edPasta.tag := 1;

                        end;

                    end;

               end;

          end;

          Reset( LogFile );

          if edPasta.tag = 1 then
          begin

              while not eof( logfile ) do
              begin

                   ReadLn( logfile, linha );

                   if ( Copy( lowercase( trim( linha ) ), 1, 9 )  = 'begin' ) and
                      ( labProg.tag = 0  ) then
                   begin

                        ReadLn( logfile, linha );

                        labProg.tag := 1;
                        memo1.lines.Add( '    ZQuery99 : TZquery ;' );

                   end;

                   memo1.lines.Add( linha );

              end;

          end;

          CloseFile( LogFile );

     end;


     //salvar o arquivo
     DeleteFile( NewFileName );

     if edPasta.tag = 1 then
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

     end;

     edPasta.tag := 0;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               Inc( NumLinhas );

               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               // procura por USES para achar ZDATASET
               begin

                    if edPasta.tag = 0 then
                    begin

                        for r := 1 to length( linha ) do
                        begin

                             palavra := '';
                             palavra := palavra + copy( linha, r , 8 );

                             if lowercase( palavra ) = 'zdataset' then
                                edPasta.tag := 1;

                        end;

                    end;

               end;

          end;

          Reset( LogFile );

          if edPasta.tag = 1 then
          begin

              while not eof( logfile ) do
              begin

                   ReadLn( logfile, linha );

                   if ( Copy( lowercase( trim( linha ) ), 1, 9 )  = 'procedure' ) and
                      ( labProg.tag = 0  ) then
                   begin

                        labProg.tag := 1;
                        memo1.lines.Add( '    ZQuery99 : TZquery ;' );

                   end;

                   memo1.lines.Add( linha );

              end;

          end;

          CloseFile( LogFile );


           //salvar o arquivo
           DeleteFile( NewFileName );

          if edPasta.tag = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

          end;

     End;

     FindClose(SearchRec);

end;

procedure TForm1.btnDFMClick(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

begin
{

Anchors = [akLeft, akTop, akRight, akBottom]


  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc
     NumLinhas := 0;
     labProg.tag := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );





               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;


                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                      //  showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA

                                     if ( Pos( 'HotTrackColor', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clBlack';

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'TextColors.Selected', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clAqua';

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'TextColors.Unselected', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clSilver';

                                          Alterou := 1;

                                     end ;

                                     //TabColors.HighlightBar
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and  ( Pos( 'TabColors.Shadow', linha ) = 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Shadow = clNavy'  );

                                          Alterou := 1;

                                     end
                                     else
                                     if ( Pos( 'TabColors.Shadow', linha ) > 0 ) then
                                     begin

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clNavy';

                                          Alterou := 1;

                                     end;

                                     if ( Pos( 'UseColoredTabs', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := '    UseColoredTabs = False';

                                          Alterou := 1;

                                     end ;


                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          if Pos( 'untMenuRel', FileName ) > 0 then
             memo1.lines.Add( 'end'  );

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );


               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                      //  showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA

                                     if ( Pos( 'HotTrackColor', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clBlack';

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'TextColors.Selected', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clAqua';

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'TextColors.Unselected', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clSilver';

                                          Alterou := 1;

                                     end ;

                                     //TabColors.HighlightBar
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and  ( Pos( 'TabColors.Shadow', linha ) = 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Shadow = clNavy'  );

                                          Alterou := 1;

                                     end
                                     else
                                     if ( Pos( 'TabColors.Shadow', linha ) > 0 ) then
                                     begin

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clNavy';

                                          Alterou := 1;

                                     end;

                                     if ( Pos( 'UseColoredTabs', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := '    UseColoredTabs = False';

                                          Alterou := 1;

                                     end ;


                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );


          end;

          if Pos( 'untMenuRel', FileName ) > 0 then
             memo1.lines.Add( 'end'  );

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);

end;

// convert a binary dfm file to a text dfm file
function TForm1.Dfm2Txt(Src, Dest: string): boolean;
var
  SrcS, DestS: TFileStream;
begin
  if Src = Dest then
  begin
    MessageDlg('Error converting dfm file to binary!. '
      + 'The source file and destination file names are the same.',
      mtError, [mbOK], 0);
    result := False;
    exit;
  end;
  SrcS := TFileStream.Create(Src, fmOpenRead);
  DestS := TFileStream.Create(Dest, fmCreate);
  try
    ObjectResourceToText(SrcS, DestS);
    if FileExists(Src) and FileExists(Dest) then
      Result := True
    else
      Result := False;
  finally
    SrcS.Free;
    DestS.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin

     //btnPas.Click;
     btnDfm.Click;

end;

procedure TForm1.btnPasFormShowClick(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;



   contadorTfrm  : Integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc
     NumLinhas := 0;
     labProg.tag := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.PAS', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.PAS', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     if Filename <> ''  then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;

          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.pas' then
                  showmessage( filename );

               Inc ( NumLinhas );

                if ( Pos( 'RLLabel3', linha ) > 0 ) then // 'MikroMundo Solu'#231#245'es Espec'#237'ficas em Sistemas ( 85 9135.1948 / 883' then
                  numlinhas := NumLinhas;

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                if ( Pos( '.FormShow', linha ) > 0 ) then // 'MikroMundo Solu'#231#245'es Espec'#237'ficas em Sistemas ( 85 9135.1948 / 883' then
                begin
                  memo1.Tag := 2;
                end;


                {         PAfundo
	height		768( variavel )
	color		$00464646
	width		1024( variavel )
                }

                //Tfrm
                If ( Memo1.Tag = 2 ) and ( contadorTabOrder = 2 ) then
                begin

                     memo1.lines.Add( '//====================================================');

                     memo1.lines.Add( 'for r := 0 to dm.ComponentCount -1 do');
                     memo1.lines.Add( 'if ( dm.Components[r] is TRzPanel ) then');
                     memo1.lines.Add( 'begin');

                     memo1.lines.Add( '   if ( TRzPanel( Screen.Components[r] ).Width > 700 ) and');
                     memo1.lines.Add( '      ( TRzPanel( Screen.Components[r] ).Height > 400 ) then');
                     memo1.lines.Add( '   begin');
                     memo1.lines.Add( '      ( TRzPanel( Screen.Components[r] ).Align := alClient;');
                     memo1.lines.Add( '      ( TRzPanel( Screen.Components[r] ).Align := alBottom;');
                     memo1.lines.Add( '      Application.ProcessMessages;');
                     memo1.lines.Add( '      ( TRzPanel( Screen.Components[r] ).Height := ( TRzPanel( Screen.Components[r] ).Height - 4;');
                     memo1.lines.Add( '   end;');

                     memo1.lines.Add( 'end;');
                     memo1.lines.Add( '//====================================================');

                   Memo2.Lines.Add( labProg.Caption + ' Alterado - Arquivo: ' + filename );
                   Alterou     := 1;
                   memo1.Tag := 0;
                   contadorTabOrder := 0;
                end;

               // Achou o componente, vai pulando as linhas até a propriedade desejada....

                if Memo1.Tag = 1 then   //paFundo = 1
                   inc(contadorTabOrder )
                else
                if Memo1.Tag = 2 then   //Tfrm = 2
                   inc(contadorTabOrder )
                else
                if Memo1.Tag = 3 then   //frame_sup = 2
                   inc(contadorTabOrder );

                if btnDFM.Tag = 1 then
                   inc( contadorRzButton );

          end;

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               Inc( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;


                if ( Pos( '.FormShow', linha ) > 0 ) then // 'MikroMundo Solu'#231#245'es Espec'#237'ficas em Sistemas ( 85 9135.1948 / 883' then
                begin
                  memo1.Tag := 2;
                end;


                {         PAfundo
	height		768( variavel )
	color		$00464646
	width		1024( variavel )
                }

                //Tfrm
                If ( Memo1.Tag = 2 ) and ( contadorTabOrder = 2 ) then
                begin

                     memo1.lines.Add( '//====================================================');

                     memo1.lines.Add( 'for r := 0 to dm.ComponentCount -1 do');
                     memo1.lines.Add( 'if ( dm.Components[r] is TRzPanel ) then');
                     memo1.lines.Add( 'begin');

                     memo1.lines.Add( '   if ( TRzPanel( Screen.Components[r] ).Width > 700 ) and');
                     memo1.lines.Add( '      ( TRzPanel( Screen.Components[r] ).Height > 400 ) then');
                     memo1.lines.Add( '   begin');
                     memo1.lines.Add( '      ( TRzPanel( Screen.Components[r] ).Align := alClient;');
                     memo1.lines.Add( '      ( TRzPanel( Screen.Components[r] ).Align := alBottom;');
                     memo1.lines.Add( '      Application.ProcessMessages;');
                     memo1.lines.Add( '      ( TRzPanel( Screen.Components[r] ).Height := ( TRzPanel( Screen.Components[r] ).Height - 4;');
                     memo1.lines.Add( '   end;');

                     memo1.lines.Add( 'end;');
                     memo1.lines.Add( '//====================================================');

                   Memo2.Lines.Add( labProg.Caption + ' Alterado - Arquivo: ' + filename );
                   Alterou     := 1;
                   memo1.Tag := 0;
                   contadorTabOrder := 0;
                end;

               // Achou o componente, vai pulando as linhas até a propriedade desejada....

                if Memo1.Tag = 1 then   //paFundo = 1
                   inc(contadorTabOrder )
                else
                if Memo1.Tag = 2 then   //Tfrm = 2
                   inc(contadorTabOrder )
                else
                if Memo1.Tag = 3 then   //frame_sup = 2
                   inc(contadorTabOrder );

                if btnDFM.Tag = 1 then
                   inc( contadorRzButton );

          end;

          Reset( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

          end;

     End;

     FindClose(SearchRec);


end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc
     NumLinhas := 0;
     labProg.tag := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );





               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                      //  showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA
                                     if ( Pos( 'Height = 41', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 41', 'Height = 597', [rfReplaceAll] );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'Height = 55', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 55', 'Height = 81', [rfReplaceAll] );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'Height = 67', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 67', 'Height = 54', [rfReplaceAll] );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( ' Width', linha2 ) > 0 ) and  ( Pos( ' Color', linha ) > 0 )  then
                                     begin

                                          memo1.lines.Add( 'Height = 597'  );
                                          //memo1.lines.Add( linha  );
                                          Alterou := 1;

                                     end ;

                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          memo1.lines.Add( 'end'  );

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                     //   showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA
                                     if ( Pos( 'Height = 41', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 41', 'Height = 597', [rfReplaceAll] );
                                          Alterou := 1;
                                          
                                     end ;

                                     if ( Pos( 'Height = 55', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 55', 'Height = 81', [rfReplaceAll] );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'Height = 67', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 67', 'Height = 54', [rfReplaceAll] );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( ' Width', linha2 ) > 0 ) and  ( Pos( ' Color', linha ) > 0 )  then
                                     begin

                                          memo1.lines.Add( 'Height = 597'  );
                                          //memo1.lines.Add( linha  );
                                          Alterou := 1;

                                     end ;

                               memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

          end;

          memo1.lines.Add( 'end'  );

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);

end;

procedure TForm1.Button2Click(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc
     NumLinhas := 0;
     labProg.tag := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );





               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                      //  showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA
                                     //Anchors = [akLeft, akTop, akRight, akBottom]
                                     if ( Pos( 'Align = alBottom', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'Anchors = [akLeft, akTop, akRight, akBottom]'  );
                                          Alterou := 1;

                                     end ;

                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          memo1.lines.Add( 'end'  );

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                     //   showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA
                                     //Anchors = [akLeft, akTop, akRight, akBottom]
                                     if ( Pos( 'Align = alBottom', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'Anchors = [akLeft, akTop, akRight, akBottom]'  );
                                          Alterou := 1;

                                     end ;

                               memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

          end;

          memo1.lines.Add( 'end'  );

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);

end;

procedure TForm1.Button4Click(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc


     edFiltro.Text := 'untMenuRel';
     
     NumLinhas     := 0;
     labProg.tag   := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );





               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                      //  showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA
                                     //Anchors = [akLeft, akTop, akRight, akBottom]
                                     if ( Pos( 'Align = alBottom', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'Anchors = [akLeft, akTop, akRight, akBottom]'  );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'Height = 41', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 41', 'Height = 597', [rfReplaceAll] );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'Height = 55', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 55', 'Height = 81', [rfReplaceAll] );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'Height = 67', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 67', 'Height = 54', [rfReplaceAll] );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( ' Width', linha2 ) > 0 ) and  ( Pos( ' Color', linha ) > 0 )  then
                                     begin

                                          memo1.lines.Add( 'Height = 597'  );
                                          //memo1.lines.Add( linha  );
                                          Alterou := 1;

                                     end ;

                                     if ( Pos( '$00F0F0F0', linha ) > 0 ) or ( Pos( '15790320', linha ) > 0 ) then
                                     begin

                                          linha := StringReplace( linha, '$00F0F0F0', '$00D8D8D8', [rfReplaceAll] );
                                          linha := StringReplace( linha, '15790320', '$00D8D8D8', [rfReplaceAll] );

                                     end ;

                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          memo1.lines.Add( 'end'  );

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                     //   showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA
                                     //Anchors = [akLeft, akTop, akRight, akBottom]
                                     if ( Pos( 'Align = alBottom', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'Anchors = [akLeft, akTop, akRight, akBottom]'  );
                                          Alterou := 1;

                                     end ;

                               memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

          end;

          memo1.lines.Add( 'end'  );

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);

end;

procedure TForm1.Button5Click(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc


     //edFiltro.Text := 'untMenuRel';
     
     NumLinhas     := 0;
     labProg.tag   := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );





               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                      //  showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA

                                     if ( Pos( 'HotTrackColor', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clBlack';

                                          Alterou := 1;

                                     end ;

                                     {
                                      TextColors.Selected = clMaroon
                                      TextColors.Unselected = clGray

                                      ou

                                      TextColors.Selected = clWhite
                                      TextColors.Unselected = clGray
                                      TextColors.DisabledHighlight = clNavy
                                      TextColors.DisabledShadow = clBlack
                                     }
                                     if ( Pos( 'TextColors.Selected', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clAqua';

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'TextColors.Unselected', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clSilver';

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'TextColors.Unselected', linha2 ) > 0 ) and ( Pos( 'TextColors.DisabledHighlight', linha ) = 0 ) then
                                     begin

                                          memo1.lines.Add( 'TextColors.DisabledHighlight = clNavy'  );
                                          memo1.lines.Add( 'TextColors.DisabledShadow = clBlack'  );

                                          //Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clSilver';

                                          Alterou := 1;

                                     end ;

                                     //TabColors.HighlightBar

                                     {
                                      TabColors.HighlightBar = 33023
                                      TabIndex = 0

                                      ou

                                      TabColors.HighlightBar = $00804000
                                      TabColors.Unselected   = clBlack
                                      TabIndex = 0
                                     }
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and  ( Pos( 'TabColors.Unselected', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Shadow = clNavy'  );

                                          Alterou := 1;

                                     end
                                     else
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and  ( Pos( 'TabIndex = 0', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Shadow = clNavy'  );

                                          Alterou := 1;

                                     end
                                     else
                                     if ( Pos( 'TabColors.Shadow', linha ) > 0 ) then
                                     begin

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clNavy';

                                          Alterou := 1;

                                     end;

                                     if ( Pos( 'UseColoredTabs', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := '    UseColoredTabs = False';

                                          Alterou := 1;

                                     end ;


                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          if Pos( 'untMenuRel', FileName ) > 0 then
             memo1.lines.Add( 'end'  );

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );


               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                    //memo3.Lines.Add( 'Processando restante das linhas do arquivo: ' + FileName );
                                    //memo3.Lines.Add( '------------------------------------------------------' );
                                    //memo3.Lines.Add( '' );
                                    //memo3.Lines.Add( linha );

                                     //if ( Pos( 'TRzPanel', linha ) > 0 ) then
                                      //  showmessage('TRzPanel');

                                     //TROCAR AS ANTIGAS CORES CINZAS PELA NOVA

                                     if ( Pos( 'HotTrackColor', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clBlack';

                                          Alterou := 1;

                                     end ;

                                     {
                                      TextColors.Selected = clMaroon
                                      TextColors.Unselected = clGray

                                      ou

                                      TextColors.Selected = clWhite
                                      TextColors.Unselected = clGray
                                      TextColors.DisabledHighlight = clNavy
                                      TextColors.DisabledShadow = clBlack
                                     }
                                     if ( Pos( 'TextColors.Selected', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clAqua';

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'TextColors.Unselected', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clSilver';

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'TextColors.Unselected', linha2 ) > 0 ) and ( Pos( 'TextColors.DisabledHighlight', linha ) = 0 ) then
                                     begin

                                          memo1.lines.Add( 'TextColors.DisabledHighlight = clNavy'  );
                                          memo1.lines.Add( 'TextColors.DisabledShadow = clBlack'  );

                                          //Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clSilver';

                                          Alterou := 1;

                                     end ;

                                     //TabColors.HighlightBar

                                     {
                                      TabColors.HighlightBar = 33023
                                      TabIndex = 0

                                      ou

                                      TabColors.HighlightBar = $00804000
                                      TabColors.Unselected   = clBlack
                                      TabIndex = 0
                                     }
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and  ( Pos( 'TabColors.Unselected', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Shadow = clNavy'  );

                                          Alterou := 1;

                                     end
                                     else
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and  ( Pos( 'TabIndex = 0', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Shadow = clNavy'  );

                                          Alterou := 1;

                                     end
                                     else
                                     if ( Pos( 'TabColors.Shadow', linha ) > 0 ) then
                                     begin

                                          Linha := Copy( linha, 1, Pos( '=', linha ) + 1 ) + ' clNavy';

                                          Alterou := 1;

                                     end;

                                     if ( Pos( 'UseColoredTabs', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          Linha := '    UseColoredTabs = False';

                                          Alterou := 1;

                                     end ;


                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );


          end;

          if Pos( 'untMenuRel', FileName ) > 0 then
             memo1.lines.Add( 'end'  );

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);
end;

procedure TForm1.Button6Click(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc


     //edFiltro.Text := 'untMenuRel';
     
     NumLinhas     := 0;
     labProg.tag   := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );





               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat


                                     if ( Pos( '85 3094', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, '3094.5931', '3023-5931 / 3082.5758', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'MIKROMUNDO Sistemas', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'MIKROMUNDO Sistemas', ' Sistema NAUTILUS - MIKROMUNDO Sistemas', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'com.br', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          linha := StringReplace( linha, 'com.br', 'com', [rfReplaceAll] );
                                          //Linha := '    labRodape = ''MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';

                                          Alterou := 1;

                                     end ;


                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          if ( Pos( 'untMenuRel', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
             memo1.lines.Add( 'end'  );

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );


               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                     if ( Pos( '85 3094', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, '3094.5931', '3023-5931 / 3082.5758', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'MIKROMUNDO Sistemas', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'MIKROMUNDO Sistemas', ' Sistema NAUTILUS - MIKROMUNDO Sistemas', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     if ( Pos( 'com.br', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          linha := StringReplace( linha, 'com.br', 'com', [rfReplaceAll] );
                                          //Linha := '    labRodape = ''MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';

                                          Alterou := 1;

                                     end ;


                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );


          end;

          if ( Pos( 'untMenuRel', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
             memo1.lines.Add( 'end'  );

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);
end;

procedure TForm1.Button7Click(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

   _TextColors_DisabledHighlight : integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc


     //edFiltro.Text := 'untMenuRel';
     
     NumLinhas     := 0;
     labProg.tag   := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          _TextColors_DisabledHighlight :=0;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );





               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                     // procura por DisableHighlights
                                     if ( Pos( 'TextColors.DisabledHighlight = clNavy', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          _TextColors_DisabledHighlight := 1;

                                     end ;

                                     // cinza claro dos panels
                                     //========================
                                     if ( Pos( '15790320', linha ) > 0 ) or ( Pos( '15263976', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, '15790320', '4605510', [rfReplaceAll] );
                                          linha := StringReplace( linha, '15790320', '4605510', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //cor dos tabsheets
                                     //=================
                                     if ( Pos( 'Color = clWhite', linha ) > 0 ) and ( Pos( 'TRzTabSheet', linha2 ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'clWhite', '8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //pagecontrols
                                     //============
                                     if ( Pos( 'TabColors.HighlightBar = 33023', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TabColors.HighlightBar = 33023', 'TabColors.HighlightBar = 8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //Add  UnSelect ?
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and ( Pos( 'TabIndex = 0', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Unselected = clBlack'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          //linha := StringReplace( linha, 'TabColors.HighlightBar = 33023', 'TabColors.HighlightBar = 8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;


                                     //textcolors
                                     //============
                                     if ( Pos( 'TextColors.Selected = clMaroon', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;
                                     if ( Pos( 'TextColors.Selected = clMaroon', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;
                                     if ( Pos( 'OnChange = pgGeralChange', linha ) > 0 ) and ( _TextColors_DisabledHighlight = 0 ) then
                                     begin

                                          memo1.lines.Add( '      TextColors.DisabledHighlight = clNavy' );
                                          memo1.lines.Add( '      TextColors.DisabledShadow = clBlack'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          //linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
             memo1.lines.Add( 'end'  );

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          _TextColors_DisabledHighlight :=0;
          
          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );


               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      //processa o restante do DFM
                      repeat

                                     // procura por DisableHighlights
                                     if ( Pos( 'TextColors.DisabledHighlight = clNavy', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          _TextColors_DisabledHighlight := 1;

                                     end ;

                                     // cinza claro dos panels
                                     //========================
                                     if ( Pos( '15790320', linha ) > 0 ) or ( Pos( '$00F0F0F0', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, '15790320', '14211288', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //cor dos tabsheets
                                     //=================
                                     if ( Pos( 'Color = clWhite', linha ) > 0 ) and ( Pos( 'TRzTabSheet', linha2 ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'clWhite', '8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //pagecontrols
                                     //============
                                     if ( Pos( 'TabColors.HighlightBar = 33023', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TabColors.HighlightBar = 33023', 'TabColors.HighlightBar = 8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //Add  UnSelect ?
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and ( Pos( 'TabIndex = 0', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Unselected = clBlack'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          //linha := StringReplace( linha, 'TabColors.HighlightBar = 33023', 'TabColors.HighlightBar = 8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;


                                     //textcolors
                                     //============
                                     if ( Pos( 'TextColors.Selected = clMaroon', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;
                                     if ( Pos( 'TextColors.Selected = clMaroon', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;
                                     if ( Pos( 'OnChange = pgGeralChange', linha ) > 0 ) and ( _TextColors_DisabledHighlight = 0 ) then
                                     begin

                                          memo1.lines.Add( '      TextColors.DisabledHighlight = clNavy' );
                                          memo1.lines.Add( '      TextColors.DisabledShadow = clBlack'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          //linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );


          end;

          if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
             memo1.lines.Add( 'end'  );

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);
end;

procedure TForm1.Button8Click(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra, _nomeForm : string;

   _jaTemSetas,
   _pular : Integer;

   contadorTfrm  : Integer;

   _TextColors_DisabledHighlight : integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc


     //edFiltro.Text := 'untMenuRel';
     
     NumLinhas     := 0;
     labProg.tag   := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.pas', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.pas', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     _jaTemSetas := 0;
     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          _TextColors_DisabledHighlight :=0;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;


                      //processa o restante do DFM
                      repeat
                            //type
                            //  TfrmCadOSes_HAIR

                           //1a. Linha = NOME DA UNIT
                           if ( Pos('type', lowercase(linha2) ) > 0 ) and ( Pos('Tfrm',linha ) > 0 ) then
                           begin
                               _nomeForm := Copy( Trim(linha), 2, Pos( '=' , linha ) - 1 );
                               _nomeForm := Trim( _nomeForm ) ;//, 1, Length( _nomeForm ) - 1 );
                           end;

                           if _NomeForm <> '' then
                           begin


                                     if ( Pos( 'frameBotoesbtnLeftClick', linha ) > 0 ) or
                                        ( Pos( 'frameBotoesbtnRightClick', linha ) > 0 ) or
                                        ( Pos( 'frameBotoesbtnFirstClick', linha ) > 0 ) or
                                        ( Pos( 'frameBotoesbtnLastClick', linha ) > 0 ) then
                                        _jaTemSetas := 1;

                                     // procura por DisableHighlights
                                     if ( Pos( 'private', linha ) > 0 ) and ( _jaTemSetas = 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          memo1.lines.Add( 'procedure frameBotoesbtnLeftClick(Sender: TObject);' );
                                          memo1.lines.Add( 'procedure frameBotoesbtnRightClick(Sender: TObject);' );
                                          memo1.lines.Add( 'procedure frameBotoesbtnFirstClick(Sender: TObject);' );
                                          memo1.lines.Add( 'procedure frameBotoesbtnLastClick(Sender: TObject);' );
                                          Alterou := 1;
                                          _jaTemSetas := 2;

                                     end ;

                                     if ( Pos( 'end.', linha ) > 0 ) and ( _jaTemSetas = 2 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( 'procedure T' + _NomeForm + '.frameBotoesbtnLeftClick(Sender: TObject);' );
                                          memo1.lines.Add( 'begin' );
                                          memo1.lines.Add( '     if edCodigo.text <> '''' then' );
                                          memo1.lines.Add( '     begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          edCodigo.Tag := StrToInt( edCodigo.text );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if Pos( ''CODIEMP'', UpperCase( varC_QueryAtualizaDados ) ) > 0 then');
                                          memo1.lines.Add( '             varC_TempString := '' And codiemp = '' + IntToStr( varI_Empresa )');
                                          memo1.lines.Add( '          else');
                                          memo1.lines.Add( '             varC_TempString := '''';');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.Sql.Text := '' Select first 1 codigo '' +');
                                          memo1.lines.Add( '                                   '' from '' + varC_TableName +');
                                          memo1.lines.Add( '                                   '' where codigo < '' + edCodigo.Text +');
                                          memo1.lines.Add( '                                   varC_TempString +');
                                          memo1.lines.Add( '                                   ''order by codigo desc'';');
                                          memo1.lines.Add( '          dm.zQrySetas.open;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if dm.zQrySetas.recordcount > 0 then');
                                          memo1.lines.Add( '          begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '               varC_Where := '' Where Codigo = '' + dm.zQrySetas.FieldByName(''Codigo'').AsString +');
                                          memo1.lines.Add( '                              varC_TempString ;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '               Atualiza_Botoes( True );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.close;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     Application.ProcessMessages;');
                                          memo1.lines.Add( 'end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( 'procedure T' + _NomeForm + '.frameBotoesbtnRightClick(Sender: TObject);');
                                          memo1.lines.Add( 'begin');
                                          memo1.lines.Add( '     if edCodigo.text <> '''' then');
                                          memo1.lines.Add( '     begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          edCodigo.Tag := StrToInt( edCodigo.text );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if Pos( ''CODIEMP'', UpperCase( varC_QueryAtualizaDados ) ) > 0 then');
                                          memo1.lines.Add( '             varC_TempString := '' And codiemp = '' + IntToStr( varI_Empresa )');
                                          memo1.lines.Add( '          else');
                                          memo1.lines.Add( '             varC_TempString := '''';');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          dm.zQrySetas.Sql.Text := '' Select first 1 codigo '' +');
                                          memo1.lines.Add( '                                   '' from '' + varC_TableName +');
                                          memo1.lines.Add( '                                   '' where codigo > '' + edCodigo.Text +');
                                          memo1.lines.Add( '                                   varC_TempString +');
                                          memo1.lines.Add( '                                   ''order by codigo'';');
                                          memo1.lines.Add( '          dm.zQrySetas.open;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          if dm.zQrySetas.recordcount > 0 then');
                                          memo1.lines.Add( '          begin');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '               varC_Where := '' Where Codigo = '' + dm.zQrySetas.FieldByName(''Codigo'').AsString +');
                                          memo1.lines.Add( '                              varC_TempString ;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '               Atualiza_Botoes( True );');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          end;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          dm.zQrySetas.close;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '     end;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '     Application.ProcessMessages;');
                                          memo1.lines.Add( 'end;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( 'procedure T' + _NomeForm + '.frameBotoesbtnFirstClick(Sender: TObject);');
                                          memo1.lines.Add( 'begin');
                                          memo1.lines.Add( '     if edCodigo.text <> '''' then');
                                          memo1.lines.Add( '     begin');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          edCodigo.Tag := StrToInt( edCodigo.text );');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          if Pos( ''CODIEMP'', UpperCase( varC_QueryAtualizaDados ) ) > 0 then');
                                          memo1.lines.Add( '             varC_TempString := '' And codiemp = '' + IntToStr( varI_Empresa )');
                                          memo1.lines.Add( '          else');
                                          memo1.lines.Add( '             varC_TempString := '''';');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          dm.zQrySetas.Sql.Text := '' Select first 1 codigo '' +');
                                          memo1.lines.Add( '                                   '' from '' + varC_TableName +');
                                          memo1.lines.Add( '                                   '' where codigo > 0 '' +');
                                          memo1.lines.Add( '                                   varC_TempString +');
                                          memo1.lines.Add( '                                   ''order by codigo'';');
                                          memo1.lines.Add( '          dm.zQrySetas.open;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          if dm.zQrySetas.recordcount > 0 then');
                                          memo1.lines.Add( '          begin');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '               varC_Where := '' Where Codigo = '' + dm.zQrySetas.FieldByName(''Codigo'').AsString +');
                                          memo1.lines.Add( '                              varC_TempString ;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '               Atualiza_Botoes( True );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.close;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     Application.ProcessMessages;');
                                          memo1.lines.Add( 'end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( 'procedure T' + _NomeForm + '.frameBotoesbtnLastClick(Sender: TObject);');
                                          memo1.lines.Add( 'begin');
                                          memo1.lines.Add( '     if edCodigo.text <> '''' then');
                                          memo1.lines.Add( '     begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          edCodigo.Tag := StrToInt( edCodigo.text );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if Pos( ''CODIEMP'', UpperCase( varC_QueryAtualizaDados ) ) > 0 then');
                                          memo1.lines.Add( '             varC_TempString := '' And codiemp = '' + IntToStr( varI_Empresa )');
                                          memo1.lines.Add( '          else');
                                          memo1.lines.Add( '             varC_TempString := '''';');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.Sql.Text := '' Select first 1 codigo '' +');
                                          memo1.lines.Add( '                                   '' from '' + varC_TableName +');
                                          memo1.lines.Add( '                                   '' where codigo > 0 '' +');
                                          memo1.lines.Add( '                                   varC_TempString +');
                                          memo1.lines.Add( '                                   ''order by codigo DESC '';');
                                          memo1.lines.Add( '          dm.zQrySetas.open;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if dm.zQrySetas.recordcount > 0 then');
                                          memo1.lines.Add( '          begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '               varC_Where := '' Where Codigo = '' + dm.zQrySetas.FieldByName(''Codigo'').AsString +');
                                          memo1.lines.Add( '                              varC_TempString ;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '               Atualiza_Botoes( True );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.close;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     Application.ProcessMessages;');
                                          memo1.lines.Add( 'end;');
                                          memo1.lines.Add( '');

                                          _jaTemSetas := 3;

                                     end ;

                                memo1.lines.Add( linha  );


                           end;

                           //pega a linha anterior
                           linha2 := linha;

                           //lê a prox. linha
                           ReadLn( logfile, linha );

                           labLinhas.caption := IntToStr( NumLinhas );
                           application.ProcessMessages;

                           if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                           begin

                                linha := linha;

                           end;

                      until  (eof( logfile ) );

                      //=======

          end;

          //if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
          //   memo1.lines.Add( 'end'  );

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          _jaTemSetas := 0;

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          _TextColors_DisabledHighlight :=0;
          
          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               //1a. Linha = NOME DA UNIT
               if  Pos('Unit unt', linha ) > 0 then
               begin
                   _nomeForm := 'frm' + Copy( linha, 8, 40 );
                   _nomeForm := Copy( _nomeForm, 1, Length( _nomeForm ) - 1 );
               end;

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;


                      //processa o restante do DFM
                      repeat

                           //1a. Linha = NOME DA UNIT
                           //if  Pos('unit unt', lowercase(linha) ) > 0 then
                           //begin
                           //    _nomeForm := 'frm' + Copy( linha, 9, 40 );
                           //    _nomeForm := Copy( _nomeForm, 1, Length( _nomeForm ) - 1 );
                           //end;
                           if ( Pos('type', lowercase(linha2) ) > 0 ) and ( Pos('Tfrm',linha ) > 0 ) then
                           begin
                               _nomeForm := Copy( Trim(linha), 2, Pos( '=' , linha ) - 1 );
                               _nomeForm := Trim( _nomeForm ) ;//, 1, Length( _nomeForm ) - 1 );
                           end;
                           
                           if _NomeForm <> '' then
                           begin


                                     if ( Pos( 'frameBotoesbtnLeftClick', linha ) > 0 ) or
                                        ( Pos( 'frameBotoesbtnRightClick', linha ) > 0 ) or
                                        ( Pos( 'frameBotoesbtnFirstClick', linha ) > 0 ) or
                                        ( Pos( 'frameBotoesbtnLastClick', linha ) > 0 ) then
                                        _jaTemSetas := 1;

                                     // procura por DisableHighlights
                                     if ( Pos( 'private', linha ) > 0 ) and ( _jaTemSetas = 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          memo1.lines.Add( '    procedure frameBotoesbtnLeftClick(Sender: TObject);' );
                                          memo1.lines.Add( '    procedure frameBotoesbtnRightClick(Sender: TObject);' );
                                          memo1.lines.Add( '    procedure frameBotoesbtnFirstClick(Sender: TObject);' );
                                          memo1.lines.Add( '    procedure frameBotoesbtnLastClick(Sender: TObject);' );
                                          Alterou := 1;
                                          _jaTemSetas := 2;

                                     end ;

                                     if ( Pos( 'end.', linha ) > 0 ) and ( _jaTemSetas = 2 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( 'procedure T' + _NomeForm + '.frameBotoesbtnLeftClick(Sender: TObject);' );
                                          memo1.lines.Add( 'begin' );
                                          memo1.lines.Add( '     if edCodigo.text <> '''' then' );
                                          memo1.lines.Add( '     begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          edCodigo.Tag := StrToInt( edCodigo.text );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if Pos( ''CODIEMP'', UpperCase( varC_QueryAtualizaDados ) ) > 0 then');
                                          memo1.lines.Add( '             varC_TempString := '' And codiemp = '' + IntToStr( varI_Empresa )');
                                          memo1.lines.Add( '          else');
                                          memo1.lines.Add( '             varC_TempString := '''';');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.Sql.Text := '' Select first 1 codigo '' +');
                                          memo1.lines.Add( '                                   '' from '' + varC_TableName +');
                                          memo1.lines.Add( '                                   '' where codigo < '' + edCodigo.Text +');
                                          memo1.lines.Add( '                                   varC_TempString +');
                                          memo1.lines.Add( '                                   ''order by codigo desc'';');
                                          memo1.lines.Add( '          dm.zQrySetas.open;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if dm.zQrySetas.recordcount > 0 then');
                                          memo1.lines.Add( '          begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '               varC_Where := '' Where Codigo = '' + dm.zQrySetas.FieldByName(''Codigo'').AsString +');
                                          memo1.lines.Add( '                              varC_TempString ;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '               Atualiza_Botoes( True );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.close;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     Application.ProcessMessages;');
                                          memo1.lines.Add( 'end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( 'procedure T' + _NomeForm + '.frameBotoesbtnRightClick(Sender: TObject);');
                                          memo1.lines.Add( 'begin');
                                          memo1.lines.Add( '     if edCodigo.text <> '''' then');
                                          memo1.lines.Add( '     begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          edCodigo.Tag := StrToInt( edCodigo.text );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if Pos( ''CODIEMP'', UpperCase( varC_QueryAtualizaDados ) ) > 0 then');
                                          memo1.lines.Add( '             varC_TempString := '' And codiemp = '' + IntToStr( varI_Empresa )');
                                          memo1.lines.Add( '          else');
                                          memo1.lines.Add( '             varC_TempString := '''';');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          dm.zQrySetas.Sql.Text := '' Select first 1 codigo '' +');
                                          memo1.lines.Add( '                                   '' from '' + varC_TableName +');
                                          memo1.lines.Add( '                                   '' where codigo > '' + edCodigo.Text +');
                                          memo1.lines.Add( '                                   varC_TempString +');
                                          memo1.lines.Add( '                                   ''order by codigo'';');
                                          memo1.lines.Add( '          dm.zQrySetas.open;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          if dm.zQrySetas.recordcount > 0 then');
                                          memo1.lines.Add( '          begin');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '               varC_Where := '' Where Codigo = '' + dm.zQrySetas.FieldByName(''Codigo'').AsString +');
                                          memo1.lines.Add( '                              varC_TempString ;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '               Atualiza_Botoes( True );');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          end;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          dm.zQrySetas.close;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '     end;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '     Application.ProcessMessages;');
                                          memo1.lines.Add( 'end;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( 'procedure T' + _NomeForm + '.frameBotoesbtnFirstClick(Sender: TObject);');
                                          memo1.lines.Add( 'begin');
                                          memo1.lines.Add( '     if edCodigo.text <> '''' then');
                                          memo1.lines.Add( '     begin');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          edCodigo.Tag := StrToInt( edCodigo.text );');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          if Pos( ''CODIEMP'', UpperCase( varC_QueryAtualizaDados ) ) > 0 then');
                                          memo1.lines.Add( '             varC_TempString := '' And codiemp = '' + IntToStr( varI_Empresa )');
                                          memo1.lines.Add( '          else');
                                          memo1.lines.Add( '             varC_TempString := '''';');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          dm.zQrySetas.Sql.Text := '' Select first 1 codigo '' +');
                                          memo1.lines.Add( '                                   '' from '' + varC_TableName +');
                                          memo1.lines.Add( '                                   '' where codigo > 0 '' +');
                                          memo1.lines.Add( '                                   varC_TempString +');
                                          memo1.lines.Add( '                                   ''order by codigo'';');
                                          memo1.lines.Add( '          dm.zQrySetas.open;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '          if dm.zQrySetas.recordcount > 0 then');
                                          memo1.lines.Add( '          begin');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '               varC_Where := '' Where Codigo = '' + dm.zQrySetas.FieldByName(''Codigo'').AsString +');
                                          memo1.lines.Add( '                              varC_TempString ;');
                                          memo1.lines.Add('');
                                          memo1.lines.Add( '               Atualiza_Botoes( True );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.close;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     Application.ProcessMessages;');
                                          memo1.lines.Add( 'end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( 'procedure T' + _NomeForm + '.frameBotoesbtnLastClick(Sender: TObject);');
                                          memo1.lines.Add( 'begin');
                                          memo1.lines.Add( '     if edCodigo.text <> '''' then');
                                          memo1.lines.Add( '     begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          edCodigo.Tag := StrToInt( edCodigo.text );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if Pos( ''CODIEMP'', UpperCase( varC_QueryAtualizaDados ) ) > 0 then');
                                          memo1.lines.Add( '             varC_TempString := '' And codiemp = '' + IntToStr( varI_Empresa )');
                                          memo1.lines.Add( '          else');
                                          memo1.lines.Add( '             varC_TempString := '''';');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.Sql.Text := '' Select first 1 codigo '' +');
                                          memo1.lines.Add( '                                   '' from '' + varC_TableName +');
                                          memo1.lines.Add( '                                   '' where codigo > 0 '' +');
                                          memo1.lines.Add( '                                   varC_TempString +');
                                          memo1.lines.Add( '                                   ''order by codigo DESC '';');
                                          memo1.lines.Add( '          dm.zQrySetas.open;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          if dm.zQrySetas.recordcount > 0 then');
                                          memo1.lines.Add( '          begin');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '               varC_Where := '' Where Codigo = '' + dm.zQrySetas.FieldByName(''Codigo'').AsString +');
                                          memo1.lines.Add( '                              varC_TempString ;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '               Atualiza_Botoes( True );');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '          dm.zQrySetas.close;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     end;');
                                          memo1.lines.Add( '');
                                          memo1.lines.Add( '     Application.ProcessMessages;');
                                          memo1.lines.Add( 'end;');
                                          memo1.lines.Add( '');

                                          _jaTemSetas := 3;

                                     end ;

                                memo1.lines.Add( linha  );


                           end;

                           //pega a linha anterior
                           linha2 := linha;

                           //lê a prox. linha
                           ReadLn( logfile, linha );

                           labLinhas.caption := IntToStr( NumLinhas );
                           application.ProcessMessages;

                           if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                           begin

                                linha := linha;

                           end;

                      until  (eof( logfile ) );

          end;

          //if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
          //   memo1.lines.Add( 'end'  );

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);
end;

procedure TForm1.Button9Click(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

   TRzPageControl,
   paFundo,
   frameBarraSup : integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc


     //edFiltro.Text := 'untMenuRel';
     
     NumLinhas     := 0;
     labProg.tag   := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          TRzPageControl := 0;
          frameBarraSup  := 0;
          paFundo        := 0;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );





               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      repeat

                                     // procura por DisableHighlights

                                     if ( Pos( 'paFundo', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          paFundo := 1;

                                     end ;

                                     if ( Pos( 'TRzPageControl', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          TRzPageControl := 1;

                                     end ;

                                     if ( Pos( 'frameBarraSup', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          frameBarraSup := 1;

                                     end ;

                                     // Ajusta nova altura do frameSUP
                                     if ( ( Pos( 'Height = 56', linha ) > 0 ) or ( Pos( 'Height = 81', linha ) > 0 ) ) and ( frameBarraSup = 1 ) then
                                     begin

                                          linha := StringReplace( linha, 'Height = 56', 'Height = 92', [rfReplaceAll] );
                                          linha := StringReplace( linha, 'Height = 81', 'Height = 92', [rfReplaceAll] );

                                          Alterou := 1;
                                          frameBarraSup := 2;

                                     end ;

                                     //pafundo - Tira borda BRaNCA
                                     if ( ( Pos( 'BevelOuter', linha ) > 0 ) ) and ( paFundo = 1 ) then
                                     begin

                                          linha := StringReplace( linha, 'BevelOuter = bvRaised', 'BevelOuter = bvNone', [rfReplaceAll] );


                                          Alterou := 1;
                                          paFundo := 2;

                                     end ;

                                     //Ajusta font das ABAS e align = alClient
                                     if ( ( Pos( 'Font.Name = ''Tahoma''', linha ) > 0 ) ) and ( TRzPageControl = 1 ) then
                                     begin

                                          linha := StringReplace( linha, 'Font.Name = ''Tahoma''', 'Font.Name = ''Trebuchet MS''', [rfReplaceAll] );


                                          Alterou := 1;
                                          TRzPageControl := 2;

                                     end ;

                                     

                                     // cinza claro dos panels
                                     //========================
                                     if ( Pos( '15790320', linha ) > 0 ) or ( Pos( '15263976', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, '15790320', '4605510', [rfReplaceAll] );
                                          linha := StringReplace( linha, '15790320', '4605510', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //cor dos tabsheets
                                     //=================
                                     if ( Pos( 'Color = clWhite', linha ) > 0 ) and ( Pos( 'TRzTabSheet', linha2 ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'clWhite', '8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //pagecontrols
                                     //============
                                     if ( Pos( 'TabColors.HighlightBar = 33023', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TabColors.HighlightBar = 33023', 'TabColors.HighlightBar = 8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //Add  UnSelect ?
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and ( Pos( 'TabIndex = 0', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Unselected = clBlack'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          //linha := StringReplace( linha, 'TabColors.HighlightBar = 33023', 'TabColors.HighlightBar = 8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;


                                     //textcolors
                                     //============
                                     if ( Pos( 'TextColors.Selected = clMaroon', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;
                                     if ( Pos( 'TextColors.Selected = clMaroon', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;
                                     if ( Pos( 'OnChange = pgGeralChange', linha ) > 0 ) and ( TRzPageControl = 0 ) then
                                     begin

                                          memo1.lines.Add( '      TextColors.DisabledHighlight = clNavy' );
                                          memo1.lines.Add( '      TextColors.DisabledShadow = clBlack'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          //linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
             memo1.lines.Add( 'end'  );

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;

          TRzPageControl :=0;
          
          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );


               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      //processa o restante do DFM
                      repeat

                                     // procura por DisableHighlights
                                     if ( Pos( 'TextColors.DisabledHighlight = clNavy', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          TRzPageControl := 1;

                                     end ;

                                     // cinza claro dos panels
                                     //========================
                                     if ( Pos( '15790320', linha ) > 0 ) or ( Pos( '$00F0F0F0', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, '15790320', '14211288', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //cor dos tabsheets
                                     //=================
                                     if ( Pos( 'Color = clWhite', linha ) > 0 ) and ( Pos( 'TRzTabSheet', linha2 ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'clWhite', '8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //pagecontrols
                                     //============
                                     if ( Pos( 'TabColors.HighlightBar = 33023', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TabColors.HighlightBar = 33023', 'TabColors.HighlightBar = 8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                     //Add  UnSelect ?
                                     if ( Pos( 'TabColors.HighlightBar', linha2 ) > 0 ) and ( Pos( 'TabIndex = 0', linha ) > 0 ) then
                                     begin

                                          memo1.lines.Add( 'TabColors.Unselected = clBlack'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          //linha := StringReplace( linha, 'TabColors.HighlightBar = 33023', 'TabColors.HighlightBar = 8404992', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;


                                     //textcolors
                                     //============
                                     if ( Pos( 'TextColors.Selected = clMaroon', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;
                                     if ( Pos( 'TextColors.Selected = clMaroon', linha ) > 0 ) then
                                     begin

                                          //memo1.lines.Add( 'TextColors.Selected'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;
                                     if ( Pos( 'OnChange = pgGeralChange', linha ) > 0 ) and ( TRzPageControl = 0 ) then
                                     begin

                                          memo1.lines.Add( '      TextColors.DisabledHighlight = clNavy' );
                                          memo1.lines.Add( '      TextColors.DisabledShadow = clBlack'  );

                                          //Linha := '    labRodape = ''Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3023-5931 / 3082.5758 - www.mikromundo.com )''';
                                          //linha := StringReplace( linha, 'TextColors.Selected = clMaroon', 'TextColors.Selected = clWhite', [rfReplaceAll] );

                                          Alterou := 1;

                                     end ;

                                memo1.lines.Add( linha  );

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );


          end;

          if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
             memo1.lines.Add( 'end'  );

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);
end;

procedure TForm1.Button10Click(Sender: TObject);
var

   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;

   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

   _TextColors_DisabledHighlight : integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc


     //edFiltro.Text := 'untMenuRel';
     
     NumLinhas     := 0;
     labProg.tag   := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;
          memo4.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          _TextColors_DisabledHighlight :=0;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;

                      //processa o restante do DFM
                      repeat

                            memo4.lines.Add( linha  );

                           // procura por DisableHighlights
                           if ( Pos( LowerCase( edProp.text ) , LowerCase( linha ) ) > 0 ) or
                              ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                           begin

                                if ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                                   memo2.lines.Add( edProp2.text + ' removido em ' + FileName  )
                                else
                                   memo2.lines.Add( edProp.text + ' removido em ' + FileName  );

                                alterou := 1;

                           end
                           {
                                                      else
                           if ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                           begin

                                memo2.lines.Add( edProp2.text + ' removido em ' + FileName  );
                                alterou := 1;

                           end

                           }
                           else
                           begin


                                memo1.lines.Add( linha  );


                           end;

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          //if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
          begin
             memo1.lines.Add( 'end'  );
             memo4.lines.Add( 'end'  );
          end;

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;
          Memo4.Lines.Clear;

          _TextColors_DisabledHighlight :=0;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );


               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      //processa o restante do DFM
                      repeat

                            memo4.lines.Add( linha  );

                                       // procura por DisableHighlights
                           if ( Pos( LowerCase( edProp.text ) , LowerCase( linha ) ) > 0 ) or
                              ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                           begin

                                if ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                                   memo2.lines.Add( edProp2.text + ' removido em ' + FileName  )
                                else
                                   memo2.lines.Add( edProp.text + ' removido em ' + FileName  );

                                alterou := 1;

                           end
                           {
                                                      else
                           if ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                           begin

                                memo2.lines.Add( edProp2.text + ' removido em ' + FileName  );
                                alterou := 1;

                           end

                           }
                           else
                           begin


                                memo1.lines.Add( linha  );


                           end;

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );


          end;

          //if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
          begin
             memo1.lines.Add( 'end'  );
             memo4.lines.Add( 'end'  );
          end;

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);
end;

procedure TForm1.Button11Click(Sender: TObject);
var

   _frameBarraSup ,
   _rzButton,
   _panel,
   _rzlistbox,


   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;


   palavra : string;

   _pular : Integer;

   contadorTfrm  : Integer;

   _TextColors_DisabledHighlight : integer;

begin
{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc


     //edFiltro.Text := 'untMenuRel';

     _frameBarraSup := 0;
     _rzButton      := 0;
     _panel         := 0;
     _rzlistbox     := 0;

     NumLinhas     := 0;
     labProg.tag   := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\'+SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     //if Fileexists( Filename ) then
     //   Dfm2Txt( Filename, DfmFilename );

     memo1.Lines.Clear;

     memo3.lines.clear;

     if Filename <> '' then
     begin

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;
          memo4.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          _TextColors_DisabledHighlight :=0;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;

                      //processa o restante do DFM
                      repeat

                            memo4.lines.Add( linha  );

                           // procura por frameBarraSup
                           if ( Pos( 'frameBarraSup', linha ) > 0 ) and ( _frameBarraSup = 0 ) then
                           begin

                                _frameBarraSup := 1;

                           end ;

                           // procura por RzButton
                           if ( Pos( 'object', linha ) > 0 ) and  ( Pos( 'RzButton', linha ) > 0 ) and ( _rzButton = 0 ) then
                           begin

                                _rzButton := 1;

                           end ;

                           // procura por DisableHighlights
                           if ( Pos( LowerCase( edProp.text ) , LowerCase( linha ) ) > 0 ) or
                              ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                           begin

                                if ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                                   memo2.lines.Add( edProp2.text + ' removido em ' + FileName  )
                                else
                                   memo2.lines.Add( edProp.text + ' removido em ' + FileName  );

                                alterou := 1;

                           end
                           else
                           // se achou o frameBarraSup ajusta o Height = 81
                           if ( Pos( 'Height', linha ) > 0 ) and ( _frameBarraSup = 1 ) then
                           begin

                                memo1.lines.Add( '      Height = 81');
                                _frameBarraSup := 0;

                                alterou := 1;

                           end
                           else
                           begin


                                memo1.lines.Add( linha  );


                           end;

                           // se achou o RzButton e a linha atual não é TRzButton adiciona o ThemeAware = False
                           if ( Pos( 'RzButton', linha ) = 0 ) and ( _rzButton = 1 ) then
                           begin

                                memo1.lines.Add( '            ThemeAware = False');
                                _rzButton := 0;

                                alterou := 1;

                           end;

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          //if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
          begin
             memo1.lines.Add( 'end'  );
             memo4.lines.Add( 'end'  );
          end;

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          _frameBarraSup := 0;
          _rzButton := 0;
          _panel         := 0;
          _rzlistbox     := 0;

          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;
          Memo4.Lines.Clear;

          _TextColors_DisabledHighlight :=0;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );


               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      //processa o restante do DFM
                      repeat

                            memo4.lines.Add( linha  );

                           // procura por frameBarraSup
                           if ( Pos( 'frameBarraSup', linha ) > 0 ) and ( _frameBarraSup = 0 ) then
                           begin

                                _frameBarraSup := 1;

                           end ;

                           // procura por RzButton
                           if ( Pos( 'object', linha ) > 0 ) and  ( Pos( 'RzButton', linha ) > 0 ) and ( _rzButton = 0 ) then
                           begin

                                _rzButton := 1;

                           end ;

                           // procura por RzListBox
                           if ( Pos( 'object', linha ) > 0 ) and  ( Pos( 'RzListBox', linha ) > 0 ) and ( _rzlistbox = 0 ) then
                           begin

                                _rzlistbox := 1;

                           end ;

                           // procura por TPanel
                           if ( Pos( 'object', linha ) > 0 ) and  ( Pos( 'TPanel', linha ) > 0 ) and ( _panel = 0 ) then
                           begin

                                _panel := 1;

                           end ;

                           // procura por DisableHighlights
                           if ( Pos( LowerCase( edProp.text ) , LowerCase( linha ) ) > 0 ) or
                              ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                           begin

                                if ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                                   memo2.lines.Add( edProp2.text + ' removido em ' + FileName  )
                                else
                                   memo2.lines.Add( edProp.text + ' removido em ' + FileName  );

                                alterou := 1;

                           end
                           else
                           // se achou o frameBarraSup ajusta o Height = 81
                           if ( Pos( 'Height', linha ) > 0 ) and ( _frameBarraSup = 1 ) then
                           begin

                                memo1.lines.Add( '      Height = 81');
                                _frameBarraSup := 0;

                                alterou := 1;

                           end
                           else
                           begin


                                memo1.lines.Add( linha  );


                           end;

                           // se achou o RzButton e a linha atual não é TRzButton adiciona o ThemeAware = False
                           if ( Pos( 'RzButton', linha ) = 0 ) and ( _rzButton = 1 ) then
                           begin

                                memo1.lines.Add( '            ThemeAware = False');
                                _rzButton := 0;

                                alterou := 1;

                           end;

                           // se achou o RzListBox e a linha atual não é TRzButton adiciona o ThemeAware = False
                           if ( Pos( 'GroupColor', linha ) > 0 ) and ( _rzlistbox = 1 ) then
                           begin

                                memo1.lines.Add( linha  );
                                memo1.lines.Add( '        GroupColorFromTheme = False');
                                _rzlistbox := 0;

                                alterou := 1;

                           end;

                           // se achou o TPanel e a
                           if ( Pos( 'Color', linha ) > 0 ) and ( _panel = 1 ) then
                           begin

                                memo1.lines.Add( linha  );
                                memo1.lines.Add( '      ParentBackground = False');
                                _panel := 0;

                                alterou := 1;

                           end;



                           // se achou o RzListBox e a linha atual não é TRzButton adiciona o ThemeAware = False
                           if ( Pos( 'FrameVisible', linha ) > 0 ) then
                           begin

                                memo1.lines.Add( linha  );
                                memo1.lines.Add( '                  FramingPreference = fpCustomFraming');

                                alterou := 1;

                           end;


                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );


          end;

          //if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
          begin
             memo1.lines.Add( 'end'  );
             memo4.lines.Add( 'end'  );
          end;

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);
end;

procedure TForm1.Button12Click(Sender: TObject);
var

   _frameBarraSup ,
   _rzButton,
   _panel,
   _rzlistbox,


   _StoreProc,_StoreProcLin, _tot,Alterou, NumLinhas, f, r, contadorTabOrder, contadorRzButton : Integer;

   SearchRec : TSearchRec;

   DfmFilename, Filename, linha, linha2, NewFileName : string;

   logfile : textfile;


   palavra : string;

   _pular,

   i,

   _itens, _itens_add,
   contadorTfrm  : Integer;

   _TextColors_DisabledHighlight : integer;

   bBlocoQuery : Boolean;

   aZeos   : array[0..50] of String;
   aRestDW : array[0..50] of String;

   aNovos  : array[0..50] of String;

begin

   _itens     := 0;
   _itens_add := 0;

   Inc( _itens );
   aZeos  [ _itens ] := 'TZQuery';
   aRestDW[ _itens ] := 'TRESTClientSQL';
   Inc( _itens );
   aZeos  [ _itens ] := 'Connection = dm.ZConnection';
   aRestDW[ _itens ] := 'DataBase = dm_rest.RESTDataBase';
   Inc( _itens );
   aZeos  [ _itens ] := 'Connection = dm.ZConnectionCeps';
   aRestDW[ _itens ] := 'DataBase = dm_rest.RESTDataBaseCEPS';
   Inc( _itens );
   aZeos  [ _itens ] := 'Connection = ZConnection';
   aRestDW[ _itens ] := 'DataBase = RESTDataBase';
   Inc( _itens );
   aZeos  [ _itens ] := 'Connection = ZConnectionCeps';
   aRestDW[ _itens ] := 'DataBase = RESTDataBaseCEPS';
   Inc( _itens );
   aZeos  [ _itens ] := 'CachedUpdates = True';
   aRestDW[ _itens ] := '';
   Inc( _itens );
   aZeos  [ _itens ] := 'CachedUpdates = False';
   aRestDW[ _itens ] := '';
   Inc( _itens );
   aZeos  [ _itens ] := 'ReadOnly = True';
   aRestDW[ _itens ] := '';

   Inc( _itens_add );
   aNovos[ _itens_add ] := ' IndexDefs = <>';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' FetchOptions.AssignedValues = [evMode]';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' FetchOptions.Mode = fmAll';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' FormatOptions.MaxBcdPrecision = 2147483647';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' FormatOptions.MaxBcdScale = 2147483647';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' ResourceOptions.AssignedValues = [rvSilentMode]';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' ResourceOptions.SilentMode = True';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' UpdateOptions.LockWait = True';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' UpdateOptions.FetchGeneratorsPoint = gpNone';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' UpdateOptions.CheckRequired = False';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' UpdateOptions.AutoCommitUpdates = True';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' StoreDefs = True';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' MasterCascadeDelete = True';
   Inc( _itens_add );
   aNovos[ _itens_add ] := ' DataCache = False';





{
  object ZQuery1: TZQuery
    Params = <>
    Left = 428
    Top = 40
  end
}

 //TZStoredProc


     //edFiltro.Text := 'untMenuRel';

     _frameBarraSup := 0;
     _rzButton      := 0;
     _panel         := 0;
     _rzlistbox     := 0;

     NumLinhas     := 0;
     labProg.tag   := 0;

     _StoreProc    := 0;
     _StoreProcLin := 0;

     labLinhas.caption := IntToStr( NumLinhas );
     application.ProcessMessages;

     //somar a qtde de units para o progresso
     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     _tot := 0;

     if ( FindNext( SearchRec ) = 0 ) then
        _tot := 1;

     While ( FindNext( SearchRec ) = 0 ) do
     begin

          Inc(_tot);

     end;

     FindClose(SearchRec);

     pg.Max  := _tot;
     pg.Step := Trunc(_tot/100);
     pg.Position := 0;

     //procura pelo primeiro programa
     FindFirst( edPasta.text + '\' + edFiltro.Text + '*.dfm', faAnyFile, SearchRec);

     CopyFile( PChar( edPasta.text + '\' + SearchRec.Name) ,
               PChar( edPasta.text + '\backup\' + SearchRec.Name ), False);

     labProg.Caption := SearchRec.Name;

     Application.ProcessMessages;

     Filename := edPasta.text + '\' + SearchRec.Name;

     NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

     DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

     memo1.Lines.Clear;

     memo3.lines.clear;

     memo4.lines.clear;

     if Filename <> '' then
     begin

          //carrega arq. original
          Memo4.Lines.LoadFromFile( Filename );

          linha := '';

          f := Memo4.Lines.Count - 1;


          //fazer critica de adicao de propriedades( inserir logo abaixo de Objetc TRestSql )
          //
          for r := 0 to f do
            begin

              try
                 linha := Memo4.Lines.Strings[ r ];

                 bBlocoQuery := ( Pos( 'TZQuery', linha ) > 0 );

                 // por enquanto substituir apenas os objetos TZQuery
                 //if bBlocoQuery then
                 begin


                     //fazer criticas de substituicao( linha a linha )
                     //
                     for I := 1 to _itens do
                     begin

                          if ( Pos( aZeos[ i ] , linha ) > 0 ) then
                          begin
                             linha := StringReplace( linha, aZeos[ I ] , aRestDw[ i ] , [ rfReplaceAll ] ) ;
                             Break;
                          end;

                     end;

                 end;

                 if ( Trim( linha ) <> '' ) then
                    Memo1.Lines.Add( linha );

                 //fazer critica de adicao de propriedades
                 //
                 // só adiciona se a linha atual for a de declaracao do TRESTClientSQL
                 if ( Pos( 'TRESTClientSQL', linha ) > 0 ) then
                 begin

                      for i := 1 to _itens_add do
                          Memo1.Lines.Add( '    ' + aNovos[ i ] );


                 end;

              except

              end;

            end;

          //salva novo arq. convertido
          Memo4.Lines.SaveToFile( Filename );


     end;


 Exit;



     if Filename <> '' then
     begin


          //AssignFile( LogFile, FileName );
          //Re//set( LogFile );
          Memo1.Lines.LoadFromFile( Filename );

          labProg.tag := 0;
          edPasta.tag := 0;
          Alterou     := 0;
          memo1.lines.clear;
          memo4.lines.clear;


          memo1.tag := 0;
          btnDFM.tag := 0;

          contadorTabOrder := 0;
          contadorRzButton := 0;

          linha := '';

          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          _TextColors_DisabledHighlight :=0;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );

               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );

               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;

                      //processa o restante do DFM
                      repeat

                            memo4.lines.Add( linha  );

                           // procura por frameBarraSup
                           if ( Pos( 'TZQuery', linha ) > 0 ) and ( _frameBarraSup = 0 ) then
                           begin

                                //linha := StringReplace( 'TZQ');

                           end ;

                           // procura por RzButton
                           if ( Pos( 'object', linha ) > 0 ) and  ( Pos( 'RzButton', linha ) > 0 ) and ( _rzButton = 0 ) then
                           begin

                                _rzButton := 1;

                           end ;

                           // procura por DisableHighlights
                           if ( Pos( LowerCase( edProp.text ) , LowerCase( linha ) ) > 0 ) or
                              ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                           begin

                                if ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                                   memo2.lines.Add( edProp2.text + ' removido em ' + FileName  )
                                else
                                   memo2.lines.Add( edProp.text + ' removido em ' + FileName  );

                                alterou := 1;

                           end
                           else
                           // se achou o frameBarraSup ajusta o Height = 81
                           if ( Pos( 'Height', linha ) > 0 ) and ( _frameBarraSup = 1 ) then
                           begin

                                memo1.lines.Add( '      Height = 81');
                                _frameBarraSup := 0;

                                alterou := 1;

                           end
                           else
                           begin


                                memo1.lines.Add( linha  );


                           end;

                           // se achou o RzButton e a linha atual não é TRzButton adiciona o ThemeAware = False
                           if ( Pos( 'RzButton', linha ) = 0 ) and ( _rzButton = 1 ) then
                           begin

                                memo1.lines.Add( '            ThemeAware = False');
                                _rzButton := 0;

                                alterou := 1;

                           end;

                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );

                      //=======

          end;

          //if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
          begin
             memo1.lines.Add( 'end'  );
             memo4.lines.Add( 'end'  );
          end;

          CloseFile( LogFile );

     end;
     //Exit;
     pg.Position := pg.Position + 1;

     //salvar o arquivo
     DeleteFile( NewFileName );

     if Alterou = 1 then //só grava se houver alterado algo
     begin

         AssignFile( LogFile, NewFileName );
         Rewrite( LogFile );

         for r := 0 to memo1.Lines.Count - 1 do
         begin

              WriteLn( logfile, memo1.lines[r] );

         end;

         closefile( logfile );

          memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );


     end;

     edPasta.tag := 0;


     While ( FindNext( SearchRec ) = 0 ) do
     begin

          labProg.Caption := SearchRec.Name;
          Application.ProcessMessages;

          pg.Position := pg.Position + 1;

          Alterou  := 0;
          _frameBarraSup := 0;
          _rzButton := 0;
          _panel         := 0;
          _rzlistbox     := 0;

          Filename := edPasta.text + '\' + SearchRec.Name;
          NewFileName := edPasta.text + '\backup\' + SearchRec.Name;

           DfmFilename := edPasta.text + '\' + Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 3 ) + 'txt';

           //if Fileexists( Filename ) then
           //   Dfm2Txt( Filename, DfmFilename );


          memo3.Lines.Add( 'Processando arquivo: ' + FileName );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '' );
          memo3.Lines.Add( '------------------------------------------------------' );

          AssignFile( LogFile, FileName );
          Reset( LogFile );

          labProg.tag := 0;
          edPasta.tag := 0;

          memo1.lines.clear;
          Memo4.Lines.Clear;

          _TextColors_DisabledHighlight :=0;

          //verificar se é pra inserir ou nao zquery
          while not eof( logfile ) do
          begin

               _pular := 0;

               //if LowerCase( FileName ) <> 'c:\mkmsistemas\mkmnautilus_commerce_erp\untcadacertoestoque.dfm' then
               //   showmessage( filename );

               Inc ( NumLinhas );


               //pega a linha anterior
               linha2 := linha;

               //lê a prox. linha
               ReadLn( logfile, linha );


               labLinhas.caption := IntToStr( NumLinhas );
               application.ProcessMessages;

               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
               begin

                    linha := linha;

               end;



                      //processa o restante do DFM
                      //processa o restante do DFM
                      repeat

                            memo4.lines.Add( linha  );

                           // procura por frameBarraSup
                           if ( Pos( 'frameBarraSup', linha ) > 0 ) and ( _frameBarraSup = 0 ) then
                           begin

                                _frameBarraSup := 1;

                           end ;

                           // procura por RzButton
                           if ( Pos( 'object', linha ) > 0 ) and  ( Pos( 'RzButton', linha ) > 0 ) and ( _rzButton = 0 ) then
                           begin

                                _rzButton := 1;

                           end ;

                           // procura por RzListBox
                           if ( Pos( 'object', linha ) > 0 ) and  ( Pos( 'RzListBox', linha ) > 0 ) and ( _rzlistbox = 0 ) then
                           begin

                                _rzlistbox := 1;

                           end ;

                           // procura por TPanel
                           if ( Pos( 'object', linha ) > 0 ) and  ( Pos( 'TPanel', linha ) > 0 ) and ( _panel = 0 ) then
                           begin

                                _panel := 1;

                           end ;

                           // procura por DisableHighlights
                           if ( Pos( LowerCase( edProp.text ) , LowerCase( linha ) ) > 0 ) or
                              ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                           begin

                                if ( Pos( LowerCase( edProp2.text ) , LowerCase( linha ) ) > 0 ) then
                                   memo2.lines.Add( edProp2.text + ' removido em ' + FileName  )
                                else
                                   memo2.lines.Add( edProp.text + ' removido em ' + FileName  );

                                alterou := 1;

                           end
                           else
                           // se achou o frameBarraSup ajusta o Height = 81
                           if ( Pos( 'Height', linha ) > 0 ) and ( _frameBarraSup = 1 ) then
                           begin

                                memo1.lines.Add( '      Height = 81');
                                _frameBarraSup := 0;

                                alterou := 1;

                           end
                           else
                           begin


                                memo1.lines.Add( linha  );


                           end;

                           // se achou o RzButton e a linha atual não é TRzButton adiciona o ThemeAware = False
                           if ( Pos( 'RzButton', linha ) = 0 ) and ( _rzButton = 1 ) then
                           begin

                                memo1.lines.Add( '            ThemeAware = False');
                                _rzButton := 0;

                                alterou := 1;

                           end;

                           // se achou o RzListBox e a linha atual não é TRzButton adiciona o ThemeAware = False
                           if ( Pos( 'GroupColor', linha ) > 0 ) and ( _rzlistbox = 1 ) then
                           begin

                                memo1.lines.Add( linha  );
                                memo1.lines.Add( '        GroupColorFromTheme = False');
                                _rzlistbox := 0;

                                alterou := 1;

                           end;

                           // se achou o TPanel e a
                           if ( Pos( 'Color', linha ) > 0 ) and ( _panel = 1 ) then
                           begin

                                memo1.lines.Add( linha  );
                                memo1.lines.Add( '      ParentBackground = False');
                                _panel := 0;

                                alterou := 1;

                           end;



                           // se achou o RzListBox e a linha atual não é TRzButton adiciona o ThemeAware = False
                           if ( Pos( 'FrameVisible', linha ) > 0 ) then
                           begin

                                memo1.lines.Add( linha  );
                                memo1.lines.Add( '                  FramingPreference = fpCustomFraming');

                                alterou := 1;

                           end;


                               //pega a linha anterior
                               linha2 := linha;

                               //lê a prox. linha
                               ReadLn( logfile, linha );

                               labLinhas.caption := IntToStr( NumLinhas );
                               application.ProcessMessages;

                               if  (eof( logfile ) ) then // and ( lowercase(copy(trim(linha2),1,3) ) = 'end' ) then
                               begin

                                    linha := linha;

                               end;

                      until  (eof( logfile ) );


          end;

          //if ( Pos( 'untMenu', FileName ) > 0 ) or ( Pos( '\rel', lowercase(FileName) ) > 0 ) then
          begin
             memo1.lines.Add( 'end'  );
             memo4.lines.Add( 'end'  );
          end;

          //Reset( LogFile );
          CloseFile( LogFile );

           //salvar o arquivo
           DeleteFile( NewFileName );

          if Alterou = 1 then
          begin

               AssignFile( LogFile, NewFileName );
               Rewrite( LogFile );

               for r := 0 to memo1.Lines.Count - 1 do
               begin

                    WriteLn( logfile, memo1.lines[r] );

               end;

               closefile( logfile );

               memo3.Lines.Add( 'Salvando arquivo: ' + FileName );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '' );
               memo3.Lines.Add( '------------------------------------------------------' );

          end;

     End;

     FindClose(SearchRec);
end;
end.
