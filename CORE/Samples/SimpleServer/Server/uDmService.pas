unit uDmService;

interface

uses
  SysUtils, Classes, SysTypes, uDWDatamodule, System.JSON, uDWJSONObject,
  Dialogs, ServerUtils, uDWConsts, FireDAC.Dapt, uDWConstsData,
  FireDAC.Phys.FBDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Stan.StorageJSON, RestDWServerFormU, uRESTDWPoolerDB, uRestDWDriverFD;


type
  TServerMethodDM = class(TServerMethodDataModule)
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    RESTDWDriverFD1: TRESTDWDriverFD;
    procedure ServerMethodDataModuleReplyEvent(SendType: TSendEvent;
      Context: string; var Params: TDWParams; var Result: string);
    procedure ServerMethodDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
   Function ConsultaBanco(Var Params : TDWParams) : String;Overload;
  public
    { Public declarations }
  end;

var
  ServerMethodDM: TServerMethodDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Function TServerMethodDM.ConsultaBanco(Var Params : TDWParams) : String;
Var
 vSQL      : String;
 JSONValue : TJSONValue;
 fdQuery   : TFDQuery;
Begin
 If Params.ItemsString['SQL'] <> Nil Then
  Begin
   JSONValue          := uDWJSONObject.TJSONValue.Create;
   JSONValue.Encoding := GetEncoding(RestDWForm.RESTServicePooler1.Encoding);
   If Params.ItemsString['SQL'].value <> '' Then
    Begin
     If Params.ItemsString['TESTPARAM'] <> Nil Then
      Params.ItemsString['TESTPARAM'].SetValue('OK, OK');
     vSQL      := Params.ItemsString['SQL'].value;
     {$IFDEF FPC}
     {$ELSE}
      fdQuery   := TFDQuery.Create(Nil);
      Try
       fdQuery.Connection := RestDWForm.Server_FDConnection;
       fdQuery.SQL.Add(vSQL);
       JSONValue.LoadFromDataset('sql', fdQuery, RestDWForm.cbEncode.Checked);
       Result             := JSONValue.ToJSON;
      Finally
       JSONValue.Free;
       fdQuery.Free;
      End;
     {$ENDIF}
    End;
  End;
End;

procedure TServerMethodDM.ServerMethodDataModuleCreate(Sender: TObject);
begin
 RESTDWPoolerDB1.Active := True;
end;

procedure TServerMethodDM.ServerMethodDataModuleReplyEvent(SendType: TSendEvent;
  Context: string; var Params: TDWParams; var Result: string);
Var
 JSONObject : TJSONObject;
Begin
 JSONObject := TJSONObject.Create;
 Case SendType Of
  sePOST   :
   Begin
    If UpperCase(Context) = Uppercase('ConsultaBanco') Then
     Result := ConsultaBanco(Params)
    Else
     Begin
      JSONObject.AddPair(TJSONPair.Create('STATUS',   'NOK'));
      JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Método não encontrado'));
      Result := JSONObject.ToJSON;
     End;
   End;
 End;
 JSONObject.Free;
End;

end.
