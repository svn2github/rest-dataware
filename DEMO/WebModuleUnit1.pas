//
// FireDACJSONReflect demo
// Copyright (c) 1995-2013 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//
unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Datasnap.DSAuth, IPPeerServer, Datasnap.DSCommonServer, Datasnap.DSHTTP,
  Datasnap.DSSession;

type
  TWebModule1 = class(TWebModule)
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    DSServer1: TDSServer;
    DSServerClass1: TDSServerClass;
    DSAuthenticationManager1: TDSAuthenticationManager;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure DSServer1Connect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;
  threadvar remoteIP : AnsiString;

implementation

uses ServerMethodsUnit1, Web.WebReq;

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<html><heading/><body>DataSnap Server</body></html>';
end;

procedure TWebModule1.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
 remoteIP := Request.RemoteAddr;
end;

procedure TWebModule1.DSAuthenticationManager1UserAuthenticate(Sender: TObject;
  const Protocol, Context, User, Password: string; var valid: Boolean;
  UserRoles: TStrings);
begin
 //Adicionada Autenticação de Usuário
 valid := (User = 'testserver') and (Password = 'testserver');
end;

procedure TWebModule1.DSServer1Connect(
  DSConnectEventObject: TDSConnectEventObject);
begin
 TDSSessionManager.GetThreadSession.PutData('RemoteAddr', String(remoteIP));
end;

procedure TWebModule1.DSServer1Disconnect(
  DSConnectEventObject: TDSConnectEventObject);
begin
 remoteIP := '';
end;

procedure TWebModule1.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit1.TServerMethods1;
end;

initialization
finalization
  Web.WebReq.FreeWebModules;

end.

