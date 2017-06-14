unit Server.Containner;

interface

uses System.SysUtils, System.Classes,
    Vcl.SvcMgr,
   DataSnap.DSProviderDataModuleAdapter,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSHTTPCommon, Datasnap.DSHTTP,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSClientMetadata, Datasnap.DSHTTPServiceProxyDispatcher,
  Datasnap.DSProxyJavaAndroid, Datasnap.DSProxyJavaBlackBerry,
  Datasnap.DSProxyObjectiveCiOS, Datasnap.DSProxyCsharpSilverlight,
  Datasnap.DSProxyFreePascal_iOS,
  Datasnap.DSAuth, IPPeerServer, Datasnap.DSMetadata, Datasnap.DSServerMetadata,
  Datasnap.DSProxyJavaScript,Datasnap.DSReflect,Datasnap.DSNames,forms,
  Web.HTTPApp, Datasnap.DSHTTPWebBroker, Web.HTTPProd,Datasnap.DSSession,
  IdContext, System.JSON, Data.DBXCommon, IPPeerClient, Datasnap.DSCommon,
  Data.DB, Datasnap.DBClient, Datasnap.Win.MConnect, Datasnap.Win.SConnect, uConsts,
  URestPoolerDBMethod;

Type
  TSimpleServerClass = class(TDSServerClass)
  private
    FPersistentClass: TPersistentClass;
  protected
    function GetDSClass: TDSClass; override;
  public
    constructor Create(AOwner: TComponent; AServer: TDSCustomServer; AClass: TPersistentClass; ALifeCycle: String); reintroduce; overload;
  end;
  procedure RegisterServerClasses(AOwner: TComponent; AServer: TDSServer);

type
  TRESTDWServer = class(TService)
    DSServer: TDSServer;
    DSHTTPService1: TDSHTTPService;
    DSServerClass1: TDSServerClass;
    DSAuthenticationManager1: TDSAuthenticationManager;

    procedure ServiceCreate(Sender: TObject);
    procedure WebFileDispatcher1BeforeDispatch(Sender: TObject;
      const AFileName: string; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure DSServerConnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServerDisconnect(DSConnectEventObject: TDSConnectEventObject);
   
    procedure DoParseAuthentication(AContext: TIdContext; const AAuthType, AAuthData: String; var VUsername, VPassword: String; var VHandled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure DSHTTPService1FormatResult(Sender: TObject;
      var ResultVal: TJSONValue; const Command: TDBXCommand;
      var Handled: Boolean);
  
    procedure DSHTTPService1HTTPTrace(Sender: TObject; AContext: TDSHTTPContext;
      ARequest: TDSHTTPRequest; AResponse: TDSHTTPResponse);
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);

  private
    { Private declarations }
    LOG : TStrings;
  protected
    function DoStop: Boolean; override;
    function DoPause: Boolean; override;
    function DoContinue: Boolean; override;
    procedure DoInterrogate; override;
  public
    function GetServiceController: TServiceController; override;
    function IsTokenValid(tk:string):boolean;
  end;

var
  RESTDWServer: TRESTDWServer;
  threadvar remoteIP : AnsiString;   //Criar para retornar o IP do Cliente

implementation


{$R *.dfm}

uses Winapi.Windows, DSServerClass,
     WebModuleUnit1, ServerMethods1Unit;

Procedure ServiceController(CtrlCode: DWord); stdcall;
Begin
 RESTDWServer.Controller(CtrlCode);
End;

Function TRESTDWServer.GetServiceController: TServiceController;
Begin
 Result := ServiceController;
End;

Function TRESTDWServer.IsTokenValid(tk: string): boolean;
Begin
 Result := True;
End;

Function TRESTDWServer.DoContinue: Boolean;
Begin
 Result := inherited;
 DSHTTPService1.HttpPort := vPort;
 DSServer.Start;
End;

procedure TRESTDWServer.DoInterrogate;
begin
  inherited;
end;

procedure TRESTDWServer.DoParseAuthentication(AContext: TIdContext;
  const AAuthType, AAuthData: String; var VUsername, VPassword: String;
  var VHandled: Boolean);
Begin
 VHandled := AAuthType.Equals('Bearer') and IsTokenValid(AAuthData);
End;

Function TRESTDWServer.DoPause: Boolean;
Begin
 DSServer.Stop;
 Result := inherited;
End;

Function TRESTDWServer.DoStop: Boolean;
Begin
 DSServer.Stop;
 Result := inherited;
End;

procedure TRESTDWServer.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
 //Adicionada Autenticação de Usuário
 valid := (((User = vUsername)     And
            (vUsername <> ''))     And
           ((Password = vPassword) And
            (vPassword <> '')));
end;

procedure TRESTDWServer.DSHTTPService1FormatResult(Sender: TObject;
  var ResultVal: TJSONValue; const Command: TDBXCommand; var Handled: Boolean);
  var
  str:string;
begin
 str:= Command.Text;
end;

procedure TRESTDWServer.DSHTTPService1HTTPTrace(Sender: TObject;
  AContext: TDSHTTPContext; ARequest: TDSHTTPRequest;
  AResponse: TDSHTTPResponse);
begin
 remoteIP := (ARequest as TDSHTTPRequest).RemoteIP;
 If AResponse Is TDSHTTPResponseIndy Then
  (AResponse as TDSHTTPResponseIndy).ResponseInfo.CustomHeaders.AddValue('access-control-allow-origin', '*') ;
end;

procedure TRESTDWServer.DSServerClass1GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
Begin
 PersistentClass := ServerMethods1Unit.TServerMethods1;
End;

procedure TRESTDWServer.DSServerConnect(
  DSConnectEventObject: TDSConnectEventObject);
Begin
 TDSSessionManager.GetThreadSession.PutData('RemoteAddr', String(remoteIP));
End;

procedure TRESTDWServer.DSServerDisconnect(
  DSConnectEventObject: TDSConnectEventObject);
Begin
 remoteIP := '';
End;

procedure TRESTDWServer.ServiceCreate(Sender: TObject);
Begin
 Log := TStringList.Create;
 Try
  RegisterServerClasses(Application, DSServer);
 Except
  On E :Exception Do
   Begin
    log.Add(e.Message) ;
    log.SaveToFile(GetCurrentDir+'\Log.txt');
   End;
 End;
 Try
  DSHTTPService1.HttpPort := vPort;
  DSServer.start;
 Except
  On E :Exception Do
   Begin
    log.Add(e.Message);
    log.SaveToFile(GetCurrentDir + '\Log.txt');
   End;
 End;
 Application.ProcessMessages;
end;

Procedure TRESTDWServer.WebFileDispatcher1BeforeDispatch(Sender: TObject;
  const AFileName: string; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
Begin
 Request.WriteHeaders(200,'Access-Control-Allow-Origin','*') ;
End;

Procedure TRESTDWServer.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
Begin
 Response.SetCustomHeader('Access-Control-Allow-Origin','*');
 If Trim(Request.GetFieldByName('Access-Control-Request-Headers')) <> '' then
  begin
   Response.SetCustomHeader('Access-Control-Allow-Headers', Request.GetFieldByName('Access-Control-Request-Headers'));
   Handled := True;
  End;
end;

Constructor TSimpleServerClass.Create(AOwner: TComponent;
                                      AServer: TDSCustomServer;
                                      AClass: TPersistentClass;
                                      ALifeCycle: String);
Begin
 Inherited Create(AOwner);
 FPersistentClass := AClass;
 Self.Server := AServer;
 Self.LifeCycle := ALifeCycle;
end;

Function TSimpleServerClass.GetDSClass: TDSClass;
Begin
 Result := TDSClass.Create(FPersistentClass, False);
End;

Procedure RegisterServerClasses(AOwner: TComponent; AServer: TDSServer);
begin
// TSimpleServerClass.Create(AOwner, AServer, TDataModule, TDSLifeCycle.Session);
end;

end.

