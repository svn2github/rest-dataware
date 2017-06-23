unit formMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, fpjson, jsonparser,
  DB, BufDataset, memds, Grids, DBGrids, ExtCtrls, uRESTDWBase,
  uDWConsts;

type

  { TForm2 }

  TForm2 = class(TForm)
    Bevel1: TBevel;
    btnDelete: TButton;
    btnGet: TButton;
    btnIDHttpGetTest: TButton;
    btnIDHttpPostTeste: TButton;
    btnPost: TButton;
    btnPut: TButton;
    DBGrid1: TDBGrid;
    edPasswordDW: TEdit;
    edUserNameDW: TEdit;
    eHost: TEdit;
    ePort: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MemDataset1: TMemDataset;
    DataSource1: TDataSource;
    Memo1: TMemo;
    Memo2: TMemo;
    RESTClientPooler1: TRESTClientPooler;
    procedure btnPutClick(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnIDHttpGetTestClick(Sender: TObject);
    procedure btnIDHttpPostTesteClick(Sender: TObject);
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

procedure TForm2.ListAlunos(Value : String);
Var
 s, lResponse : String;
 LJsonObject  : TJSONData;
 Parser       : TJSONParser;
 jsPair       : TJSONData;
 Arr          : TJSONArray;
 I            : Integer;
begin
 Try
  Try
   lResponse := RESTClientPooler1.SendEvent('GetListaAlunos/' + Value);
  Except
   Exit;
  End;
  Memo1.Lines.Clear;
  Memo1.Lines.add(lResponse);
 Finally
  If lResponse <> '' Then
   Begin
    Parser      := TJSONParser.Create(lResponse);
    LJsonObject := Parser.Parse As TJSONData;
    If LJsonObject <> Nil Then
     Begin
      If LJsonObject.Count > 0 Then
       Begin
        MemDataset1.DisableControls;
        MemDataset1.Close;
        MemDataset1.CreateTable;
        MemDataset1.Open;
        Arr   := LJsonObject.Items[0] As TJSONArray;
        For I := 0 To Arr.Count -1 Do
         Begin
          MemDataset1.Insert;
          jsPair    := Arr.Objects[I];
          s := jsPair.GetPath('NomeAluno').AsString;
          MemDataset1.FieldByName('Alunos').AsString := s;
          MemDataset1.Post;
         End;
        MemDataset1.EnableControls;
       End;
     End;
   End;
  LJsonObject.Free;
  MemDataset1.First;
 end;
end;


procedure TForm2.btnGetClick(Sender: TObject);
Var
 lResponse,
 Aluno : String;
Begin
 Aluno := InputBox('Rest Client', 'Nome do aluno', '');
 If Aluno <> '' Then
  Begin
   Try
    RESTClientPooler1.Host     := eHost.Text;
    RESTClientPooler1.Port     := StrToInt(ePort.Text);
    RESTClientPooler1.UserName := edUserNameDW.Text;
    RESTClientPooler1.Password := edPasswordDW.Text;
    lResponse := RESTClientPooler1.SendEvent('ConsultaAluno/' + Aluno);
    Memo2.Lines.Clear;
    Memo2.Lines.add(lResponse);
    ListAlunos(Aluno);
   Except
   End;
  End;
End;

procedure TForm2.btnPostClick(Sender: TObject);
Var
 eventData,
 lResponse,
 Aluno,
 NomeNovo  : String;
 RBody     : TStringList;
 SendEvent : TSendEvent;
Begin
 RBody := TStringList.Create;
 RBody.Add('json');
 Aluno := InputBox('Rest Client', 'Nome do aluno', '');
 If Aluno <> '' Then
  Begin
   NomeNovo := InputBox('Rest Client', 'Alterar Nome para', '');
   If NomeNovo <> '' Then
    Begin
     Try
      RESTClientPooler1.Host     := eHost.Text;
      RESTClientPooler1.Port     := StrToInt(ePort.Text);
      RESTClientPooler1.UserName := edUserNameDW.Text;
      RESTClientPooler1.Password := edPasswordDW.Text;
      eventData              := 'AtualizaAluno/' + Aluno + '/' + NomeNovo;
      SendEvent              := sePost;
      lResponse              := RESTClientPooler1.SendEvent(eventData, RBody, SendEvent);
      ListAlunos(lResponse);
     Except
     End;
    End;
  End;
 RBody.Free;
End;

procedure TForm2.btnPutClick(Sender: TObject);
Var
 lResponse,
 Aluno : String;
 RBody : TStringList;
Begin
 RBody := TStringList.Create;
 RBody.Add('json');
 Aluno := InputBox('Rest Client', 'Nome do aluno', '');
 If Aluno <> '' Then
  Begin
   Try
    RESTClientPooler1.Host     := eHost.Text;
    RESTClientPooler1.Port     := StrToInt(ePort.Text);
    RESTClientPooler1.UserName := edUserNameDW.Text;
    RESTClientPooler1.Password := edPasswordDW.Text;
    lResponse := RESTClientPooler1.SendEvent('InsereAluno/' + Aluno, RBody, sePut);
    ListAlunos(lResponse);
   Except
   End;
  End;
 RBody.Free;
End;


procedure TForm2.btnDeleteClick(Sender: TObject);
Var
 lResponse,
 Aluno : String;
Begin
 Aluno := InputBox('Rest Client', 'Nome do aluno', '');
 If Aluno <> '' Then
  Begin
   Try
    RESTClientPooler1.Host     := eHost.Text;
    RESTClientPooler1.Port     := StrToInt(ePort.Text);
    RESTClientPooler1.UserName := edUserNameDW.Text;
    RESTClientPooler1.Password := edPasswordDW.Text;
    lResponse       := RESTClientPooler1.SendEvent('ExcluiAluno/' + Aluno, Nil, seDelete);
    ListAlunos(lResponse);
   Except
   End;
  End;
End;

procedure TForm2.btnIDHttpGetTestClick(Sender: TObject);
Var
 Response : String;
Begin
 Memo2.Lines.Clear;
 Try
  // Passando parâmetros no formato antigo (QueryString)
  RESTClientPooler1.Host     := eHost.Text;
  RESTClientPooler1.Port     := StrToInt(ePort.Text);
  RESTClientPooler1.UserName := edUserNameDW.Text;
  RESTClientPooler1.Password := edPasswordDW.Text;
  Response        := RESTClientPooler1.SendEvent('ConsultaAluno?Nome=AlunoTeste');
  Memo2.Lines.Add(Response);
  // Passando parâmetros no formato novo (REST URL)
  Response        := RESTClientPooler1.SendEvent('ConsultaAluno/AlunoTeste');
  Memo2.Lines.Add(Response);
  ListAlunos(Response);
 Finally
 End;
End;

procedure TForm2.btnIDHttpPostTesteClick(Sender: TObject);
Var
 Response : String;
 lParams  : TStringList;
Begin
 Memo2.Lines.Clear;
 lParams := TStringList.Create;
 Try
  //Aqui o parâmetro é passado no header da requisição e não na URL
  //da mesma forma que todos os navegadores o fazem
  //ou seja é possivel que voce tenha um client em HTML puro
  //dando POST no navegador num WebService em Lazarus
  lParams.Add('NomeAtual=Fulano');
  lParams.Add('NomeNovo=Cicrano');
  RESTClientPooler1.Host     := eHost.Text;
  RESTClientPooler1.Port     := StrToInt(ePort.Text);
  RESTClientPooler1.UserName := edUserNameDW.Text;
  RESTClientPooler1.Password := edPasswordDW.Text;
  Response        := RESTClientPooler1.SendEvent('AtualizaAluno', lParams, sePOST);
  Memo2.Lines.Add(Response);
  ListAlunos(Response);
 Finally
  lParams.Free;
 End;
End;


end.
