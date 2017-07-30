unit ServerMethodsUnit1;

interface

uses SysUtils, Classes, uDWConsts, uDWConstsData,
     Dialogs, ServerUtils, SysTypes,
     sqldb, uDWJSONTools, uDWJSONObject;

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
   Procedure   vReplyEvent(SendType   : TSendEvent;
                           Context    : String;
                           Var Params : TDWParams;
                           Var Result : String);
  End;
{$METHODINFO OFF}

implementation


uses StrUtils, formMain;

Constructor TServerMethods1.Create (aOwner : TComponent);
Begin
 Inherited Create (aOwner);
 ReplyEvent := @vReplyEvent;
End;

Destructor TServerMethods1.Destroy;
Begin
 Inherited Destroy;
End;

Procedure TServerMethods1.vReplyEvent(SendType   : TSendEvent;
                                      Context    : String;
                                      Var Params : TDWParams;
                                      Var Result : String);
Var
 JSONObject : TJSONValue;
Begin
 JSONObject := TJSONValue.Create;
 Case SendType Of
  sePOST   :
   Begin
    If UpperCase(Context) = Uppercase('ConsultaBanco') Then
     Result := ConsultaBanco(Params)
    Else
     Result := JSONObject.ToJSON;
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
   If Params.ItemsString['SQL'].value <> '' Then
    Begin
     If Params.ItemsString['TESTPARAM'] <> Nil Then
      Params.ItemsString['TESTPARAM'].SetValue('OK');
     vSQL      := Params.ItemsString['SQL'].value;
     Try
      fdQuery.DataBase := frmMain.IBConnection1;
      fdQuery.SQL.Add(vSQL);
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




