unit ServerMethodsUnit1;

interface

uses SysUtils, Classes, uDWConsts,
     fpjson, Dialogs, ServerUtils, SysTypes,
     uDWJSONObject, sqldb, uDWJSONTools;

Type
{$METHODINFO ON}
  {TServerMethods1}
  TServerMethods1 = class(TServerMethods)
  Private
   Function ConsultaBanco(Var Params : TDWParams) : String;Overload;
  public
   { Public declarations }
   Constructor Create    (aOwner : TComponent); Override;
   Destructor  Destroy; Override;
   Function    ReplyEvent(SendType   : TSendEvent;
                          Context    : String;
                          Var Params : TDWParams)  : String;Override;
  End;
{$METHODINFO OFF}

implementation


uses StrUtils, formMain;

Constructor TServerMethods1.Create (aOwner : TComponent);
Begin
 Inherited Create (aOwner);
End;

Destructor TServerMethods1.Destroy;
Begin
 Inherited Destroy;
End;

Function TServerMethods1.ReplyEvent(SendType   : TSendEvent;
                                    Context    : String;
                                    Var Params : TDWParams) : String;
Var
 JSONObject : uDWJSONObject.TJSONValue;
Begin
 JSONObject := uDWJSONObject.TJSONValue.Create;
 Case SendType Of
  sePOST   :
   Begin
    If UpperCase(Context) = Uppercase('ConsultaBanco') Then
     Result := ConsultaBanco(Params)
    Else
     Begin
//      JSONObject.AddPair(TJSONPair.Create('STATUS',   'NOK'));
//      JSONObject.AddPair(TJSONPair.Create('MENSAGEM', 'Método não encontrado'));
      Result := JSONObject.ToJSON;
     End;
   End;
 End;
 JSONObject.Free;
End;

Function TServerMethods1.ConsultaBanco(Var Params : TDWParams) : String;
Var
 vSQL : String;
 JSONValue : TJSONValue;
 fdQuery   : TSQLQuery;
Begin
 If Params.ItemsString['SQL'] <> Nil Then
  Begin
   fdQuery            := TSQLQuery.Create(Nil);
   JSONValue          := uDWJSONObject.TJSONValue.Create;
   JSONValue.Encoding := GetEncoding(frmMain.RESTServicePooler1.Encoding);
   If Params.ItemsString['SQL'].value <> '' Then
    Begin
     If Params.ItemsString['TESTPARAM'] <> Nil Then
      Params.ItemsString['TESTPARAM'].SetValue('OK');
     vSQL      := Params.ItemsString['SQL'].value;
     Try
      fdQuery.DataBase := frmMain.IBConnection1;
      fdQuery.SQL.Add(vSQL);
      JSONValue.Encoding := GetEncoding(frmMain.RESTServicePooler1.Encoding);
      JSONValue.LoadFromDataset('sql', fdQuery, frmMain.cbEncode.Checked);
      Result             := JSONValue.ToJSON;
     Finally
      JSONValue.Free;
      fdQuery.Free;
     End;
    End;
  End;
End;

End.




