unit uDmClientDW;

interface

uses
  System.SysUtils, System.Classes, uRESTDWPoolerDB;

type
  TDataModule2 = class(TDataModule)
    RESTDWDataBase1: TRESTDWDataBase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
