unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvMemoryDataset, uRESTDWPoolerDB, JvDataEmbedded, frxExportImage,
  frxExportMail, frxExportText, frxChBox, frxClass, frxCrypt, frxExportXLSX,
  frxGZip, frxDCtrl, frxCross, frxExportHTML, frxExportRTF, frxExportPDF,
  frxExportBIFF, uRESTDWBase;

type
  TDM = class(TDataModule)
    Coneccao: TRESTDWDataBase;
    CdsConfig: TRESTDWClientSQL;
    Ret_sql: TRESTDWClientSQL;
    CdsEmpresa: TRESTDWClientSQL;
    ssleay32: TJvDataEmbedded;
    libeay32: TJvDataEmbedded;
    frxBIFFExport1: TfrxBIFFExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxCrossObject1: TfrxCrossObject;
    frxDialogControls1: TfrxDialogControls;
    frxGZipCompressor1: TfrxGZipCompressor;
    frxXLSXExport1: TfrxXLSXExport;
    frxCrypt1: TfrxCrypt;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxMailExport1: TfrxMailExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxBMPExport1: TfrxBMPExport;
    RunSql: TRESTDWClientSQL;
    RESTClientPooler1: TRESTClientPooler;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure SetUsuario(const Value: string);
    procedure Setsenha(const Value: string);
    procedure Setporta(const Value: integer);
    procedure Setservidor(const Value: string);
    { Private declarations }

  public
    { Public declarations }
    Fcnpj: string;
    Fusuario: string;
    Fsenha: string;
    Fporta: integer;
    Fservidor: string;

    property cnpj: string read Fcnpj write Fcnpj;
    property porta: integer read Fporta write Setporta;
    property usuario: string read Fusuario write SetUsuario;
    property senha: string read Fsenha write Setsenha;
    property servidor: string read Fservidor write Setservidor;
    Constructor Create;
    Destructor  Destroy;Override;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

constructor TDM.Create;
begin


end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
    Fusuario:=  'point';
    Fsenha:= 'gadu!@##@!';
    Fporta:= 8080;
    Fservidor:= 'localhost';
end;

destructor TDM.Destroy;
begin

  inherited;
end;

procedure TDM.Setporta(const Value: integer);
begin
  Fporta := value;
end;

procedure TDM.Setsenha(const Value: string);
begin
  Fsenha := value;
end;

procedure TDM.Setservidor(const Value: string);
begin
  Fservidor := value;
end;

procedure TDM.SetUsuario(const Value: string);
begin
  Fusuario := value;
end;

end.
