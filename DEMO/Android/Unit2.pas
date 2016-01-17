unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uRestPoolerDB,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, MultiDetailAppearanceU,
  FMX.ListView, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Data.Bind.Controls, FMX.Layouts, Fmx.Bind.Navigator, FMX.ListBox;

type
  TForm2 = class(TForm)
    RESTClientSQL: TRESTClientSQL;
    RESTDataBase: TRESTDataBase;
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    DataSource1: TDataSource;
    ListView1: TListView;
    RESTClientSQLEMP_NO: TSmallintField;
    RESTClientSQLFIRST_NAME: TStringField;
    RESTClientSQLLAST_NAME: TStringField;
    RESTClientSQLPHONE_EXT: TStringField;
    RESTClientSQLHIRE_DATE: TSQLTimeStampField;
    RESTClientSQLDEPT_NO: TStringField;
    RESTClientSQLJOB_CODE: TStringField;
    RESTClientSQLJOB_GRADE: TSmallintField;
    RESTClientSQLJOB_COUNTRY: TStringField;
    RESTClientSQLSALARY: TFloatField;
    RESTClientSQLFULL_NAME: TStringField;
    LinkListControlToField1: TLinkListControlToField;
    procedure Button1Click(Sender: TObject);
    procedure RESTDataBaseBeforeConnect(Sender: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
Begin
 RESTDataBase.Active := True;
 If RESTDataBase.Active Then
  Begin
   RESTClientSQL.Active       := False;
   RESTClientSQL.Active       := True;
  End;
end;

procedure TForm2.RESTDataBaseBeforeConnect(Sender: TComponent);
begin
 RESTDataBase.PoolerService := Edit1.Text;
 RESTDataBase.PoolerPort    := StrToInt(Edit2.Text);
end;

end.
