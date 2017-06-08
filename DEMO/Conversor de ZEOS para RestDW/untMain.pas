unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

 Type
  TfrmMain = class(TForm)
    edPastaOriginal: TEdit;
    Memo1: TMemo;
    pg: TProgressBar;
    Memo2: TMemo;
    OpenDialog1: TOpenDialog;
    ButtonStart: TButton;
    Image1: TImage;
    Label2: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label5: TLabel;
    labTotArqs: TLabel;
    labArq: TLabel;
    edPastaConvertido: TEdit;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonStartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
 Private
  {Private declarations}
 Public
  {Public declarations}
  Function Dfm2Txt(Src, Dest: string): boolean;
 End;

Var
 frmMain : TfrmMain;

Implementation

{$R *.dfm}

// convert a binary dfm file to a text dfm file
procedure TfrmMain.ButtonStartClick(Sender: TObject);
Var
 _pular,
 i, t,
 _itens,
 _itens_add,
 contadorTfrm,
 _TextColors_DisabledHighlight,
 _frameBarraSup,
 _rzButton,
 _panel,
 _rzlistbox,
 _StoreProc,
 _StoreProcLin,
 _tot,Alterou,
 NumLinhas,
 f, r,
 contadorTabOrder,
 contadorRzButton : Integer;
 SearchRec        : TSearchRec;
 palavra,
 DfmFilename,
 Filename,
 linha,
 linha2,
 NewFileName      : String;
 logfile          : textfile;
 bBlocoQuery      : Boolean;
 aZeos,
 aRestDW,
 aNovos           : Array[0..50] Of String;
 aArqs            : Array[1..2]  Of String;
Begin
 _itens            := 0;
 _itens_add        := 0;
 aArqs[1]          := '*.dfm';
 aArqs[2]          := '*.pas';
 Inc(_itens);
 aZeos  [_itens]   := 'TZQuery';
 aRestDW[_itens]   := 'TRESTClientSQL';
 Inc( _itens );
 aZeos  [ _itens] := 'Connection = dm.ZConnection';
 aRestDW[ _itens] := 'DataBase = dm_rest.RESTDataBase';
 Inc(_itens);
 aZeos  [_itens]  := 'Connection = dm.ZConnectionCeps';
 aRestDW[_itens]  := 'DataBase = dm_rest.RESTDataBaseCEPS';
 Inc(_itens);
 aZeos  [_itens]  := 'Connection = ZConnection';
 aRestDW[_itens]  := 'DataBase = RESTDataBase';
 Inc(_itens);
 aZeos  [_itens]  := 'Connection = ZConnectionCeps';
 aRestDW[_itens]  := 'DataBase = RESTDataBaseCEPS';
 Inc(_itens);
 aZeos  [_itens ] := 'CachedUpdates = True';
 aRestDW[_itens ] := '';
 Inc( _itens );
 aZeos  [_itens]  := 'CachedUpdates = False';
 aRestDW[_itens]  := '';
 Inc( _itens );
 aZeos  [_itens]  := 'ReadOnly = True';
 aRestDW[_itens]  := '';
 Inc(_itens_add);
 aNovos[_itens_add] := ' IndexDefs = <>';
 Inc(_itens_add);
 aNovos[_itens_add] := ' FetchOptions.AssignedValues = [evMode]';
 Inc(_itens_add);
 aNovos[_itens_add] := ' FetchOptions.Mode = fmAll';
 Inc(_itens_add);
 aNovos[_itens_add] := ' FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]';
 Inc(_itens_add);
 aNovos[_itens_add] := ' FormatOptions.MaxBcdPrecision = 2147483647';
 Inc(_itens_add);
 aNovos[_itens_add] := ' FormatOptions.MaxBcdScale = 2147483647';
 Inc(_itens_add);
 aNovos[_itens_add] := ' ResourceOptions.AssignedValues = [rvSilentMode]';
 Inc(_itens_add);
 aNovos[_itens_add] := ' ResourceOptions.SilentMode = True';
 Inc(_itens_add);
 aNovos[_itens_add] := ' UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]';
 Inc(_itens_add);
 aNovos[_itens_add] := ' UpdateOptions.LockWait = True';
 Inc(_itens_add);
 aNovos[_itens_add] := ' UpdateOptions.FetchGeneratorsPoint = gpNone';
 Inc(_itens_add);
 aNovos[_itens_add] := ' UpdateOptions.CheckRequired = False';
 Inc(_itens_add);
 aNovos[_itens_add] := ' UpdateOptions.AutoCommitUpdates = True';
 Inc(_itens_add);
 aNovos[_itens_add] := ' StoreDefs = True';
 Inc(_itens_add);
 aNovos[_itens_add] := ' MasterCascadeDelete = True';
 Inc(_itens_add);
 aNovos[_itens_add] := ' DataCache = False';
 //contar os .DFM
 If FindFirst(edPastaOriginal.text + '*.dfm', faAnyFile, SearchRec) = 0 Then
  _tot := 1;
 While (FindNext(SearchRec) = 0) Do
  Inc(_tot);
 FindClose(SearchRec);
 // contar os .PAS
 If FindFirst(edPastaOriginal.text + '*.pas', faAnyFile, SearchRec) = 0 Then
  Inc(_tot);
 While (FindNext(SearchRec) = 0) Do
  Inc(_tot);
 FindClose(SearchRec);
 pg.Max      := _tot;
 pg.Step     := Trunc(_tot/100);
 pg.Position := 0;
 labTotArqs.Caption := 'Arquivo(s) Processado(s) 0 de ' + _tot.ToString;
 // processar DFM's
 //-----------------------
 //procura pelo primeiro programa
 For t := 1 To 2 Do
  Begin
   FindFirst(edPastaOriginal.text + aArqs[t], faAnyFile, SearchRec);   //dfm e pas
   labArq.Caption := SearchRec.Name;
   Application.ProcessMessages;
   Filename    := edPastaOriginal.text    + SearchRec.Name;
   NewFileName := edPastaConvertido.text  + SearchRec.Name;
   memo1.Lines.Clear;
   memo2.lines.clear;
   While Filename <> '' do
    Begin
     DeleteFile(NewFileName);
     //carrega arq. original
     memo2.Lines.LoadFromFile(Filename);
     linha := '';
     If (Pos('.dfm', labArq.Caption) > 0) Then
      Begin
       f := memo2.Lines.Count - 1;
       //fazer critica de adicao de propriedades( inserir logo abaixo de Objetc TRestSql )
       For r := 0 to f do
        Begin
         Try
          linha := memo2.Lines.Strings[r];
          bBlocoQuery := (Pos('TZQuery', linha) > 0);
          // por enquanto substituir apenas os objetos TZQuery
          //if bBlocoQuery then
          If (Pos('.dfm' , labArq.Caption) > 0) Then
           Begin
            //fazer criticas de substituicao( linha a linha )
            For I := 1 to _itens do
             Begin
              If (Pos(aZeos[i], linha) > 0) Then
               Begin
                linha := StringReplace(linha, aZeos[I], aRestDw[i], [rfReplaceAll]) ;
                Break;
               End;
             End;
           End;
          If (Trim(linha) <> '') Then
           Memo1.Lines.Add(linha);
          //fazer critica de adicao de propriedades
          // só adiciona se a linha atual for a de declaracao do TRESTClientSQL
          If (Pos('TRESTClientSQL', linha) > 0) Then
           Begin
            For i := 1 To _itens_add Do
             Memo1.Lines.Add('    ' + aNovos[i]);
           End;
         Except
         End;
        End;
      End
     Else
      // para os .pas apenas substituir TZQuery( pelo menos por enquanto... )
      Begin
       memo1.Lines.Text := memo2.Lines.Text;
       memo1.Lines.Text := StringReplace(memo2.Lines.Text, aZeos[1], aRestDw[1], [rfReplaceAll]);
      End;
     //salva novo arq. convertido
     memo1.Lines.SaveToFile(NewFileName);
     pg.Position := pg.Position + 1;
     labTotArqs.Caption := 'Arquivo(s) Processado(s) ' + pg.Position.ToString + ' de ' + _tot.ToString;
     Application.ProcessMessages;
     If (FindNext(SearchRec) = 0) Then
      Begin
       Filename    := edPastaOriginal.text   + SearchRec.Name;
       NewFileName := edPastaConvertido.text + SearchRec.Name;
      End
     Else
      Filename     := '';
    End;
  End;
 ShowMessage('Processo Finalizado !');
End;

Function TfrmMain.Dfm2Txt(Src, Dest : String) : Boolean;
Var
 SrcS, DestS: TFileStream;
begin
 If Src = Dest Then
  Begin
   MessageDlg('Error converting dfm file to binary!. ' +
              'The source file and destination file names are the same.',
               mtError, [mbOK], 0);
   Result := False;
   Exit;
  End;
 SrcS := TFileStream.Create(Src, fmOpenRead);
 DestS := TFileStream.Create(Dest, fmCreate);
 Try
  ObjectResourceToText(SrcS, DestS);
  Result := FileExists(Src) And FileExists(Dest);
 Finally
  SrcS.Free;
  DestS.Free;
 End;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmMain := Nil;
 Release;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
 edPastaOriginal.Text   := ExtractFilePath(ParamStr(0)) + 'original\';
 edPastaConvertido.Text := ExtractFilePath(ParamStr(0)) + 'convertido\';
end;

end.
