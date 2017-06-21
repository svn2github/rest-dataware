unit uRESTDWBase;

{
  REST Dataware versão CORE.
  Criado por XyberX (Gilbero Rocha da Silva), o REST Dataware tem como objetivo o uso de REST/JSON
 de maneira simples, em qualquer Compilador Pascal (Delphi, Lazarus e outros...).
  O REST Dataware também tem por objetivo levar componentes compatíveis entre o Delphi e outros Compiladores
 Pascal e com compatibilidade entre sistemas operacionais.
  Desenvolvido para ser usado de Maneira RAD, o REST Dataware tem como objetivo principal você usuário que precisa
 de produtividade e flexibilidade para produção de Serviços REST/JSON, simplificando o processo para você programador.

 Membros do Grupo :

 XyberX (Gilberto Rocha) - Admin - Criador e Administrador do CORE do pacote.
 Ivan Cesar              - Admin - Administrador do CORE do pacote.
 Giovani da Cruz         - Admin - Administrador do CORE do pacote.
 Alexandre Abbade        - Admin - Administrador do desenvolvimento de DEMOS, coordenador do Grupo.
 Mizael Rocha            - Member Tester and DEMO Developer.
 Flávio Motta            - Member Tester and DEMO Developer.
 Itamar Gaucho           - Member Tester and DEMO Developer.
}

interface

Uses System.SysUtils, System.Classes, SysTypes, ServerUtils, Windows,
     IdContext, IdHTTPServer, IdCustomHTTPServer, IdSSLOpenSSL, IdSSL,
     uDWJSONTools, uDWConsts;

Type
 TLastRequest  = Procedure (Value : String) of Object;
 TLastResponse = Procedure (Value : String) of Object;

Type
 TProxyOptions = Class(TPersistent)
 Private
  vServer,                  //Servidor Proxy na Rede
  vLogin,                   //Login do Servidor Proxy
  vPassword     : String;   //Senha do Servidor Proxy
  vPort         : Integer;  //Porta do Servidor Proxy
 Public
  Constructor Create;
  Procedure   Assign(Source : TPersistent); Override;
 Published
  Property Server        : String  Read vServer   Write vServer;   //Servidor Proxy na Rede
  Property Port          : Integer Read vPort     Write vPort;     //Porta do Servidor Proxy
  Property Login         : String  Read vLogin    Write vLogin;    //Login do Servidor
  Property Password      : String  Read vPassword Write vPassword; //Senha do Servidor
End;

Type
 TRESTServicePooler = Class(TComponent)
 Private
  vActive          : Boolean;
  vProxyOptions    : TProxyOptions;
  HTTPServer       : TIdHTTPServer;
  vServicePort     : Integer;
  vServerMethod    : TClass;
  vServerParams    : TServerParams;
  vLastRequest     : TLastRequest;
  vLastResponse    : TLastResponse;
  vCriticalSection : TRTLCriticalSection;
  lHandler         : TIdServerIOHandlerSSLOpenSSL;
  aSSLVersion      : TIdSSLVersion;
  vServerContext,
  ASSLPrivateKeyFile,
  ASSLPrivateKeyPassword,
  ASSLCertFile     : String;
  VEncondig        : TEncodeSelect;              //Enconding se usar CORS usar UTF8 - Alexandre Abade
  Procedure GetSSLPassWord(Var Password: String);
  Procedure CommandGet  (AContext      : TIdContext;
                         ARequestInfo  : TIdHTTPRequestInfo;
                         AResponseInfo : TIdHTTPResponseInfo);
  Procedure CommandOther(AContext      : TIdContext;
                         ARequestInfo  : TIdHTTPRequestInfo;
                         AResponseInfo : TIdHTTPResponseInfo);
  Procedure SetActive(Value : Boolean);
  Function  GetSecure : Boolean;
 Public
  Constructor Create(AOwner  : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                      //Destroy a Classe
 Published
  Property Active                : Boolean         Read vActive                Write SetActive;
  Property Secure                : Boolean         Read GetSecure;
  Property ServicePort           : Integer         Read vServicePort           Write vServicePort;  //A Porta do Serviço do DataSet
  Property ProxyOptions          : TProxyOptions   Read vProxyOptions          Write vProxyOptions; //Se tem Proxy diz quais as opções
  Property ServerParams          : TServerParams   Read vServerParams          Write vServerParams;
  Property ServerMethodClass     : TClass          Read vServerMethod          Write vServerMethod;
  Property SSLPrivateKeyFile     : String          Read aSSLPrivateKeyFile     Write aSSLPrivateKeyFile;
  Property SSLPrivateKeyPassword : String          Read aSSLPrivateKeyPassword Write aSSLPrivateKeyPassword;
  Property SSLCertFile           : String          Read aSSLCertFile           Write aSSLCertFile;
  Property SSLVersion            : TIdSSLVersion   Read aSSLVersion            Write aSSLVersion;
  Property OnLastRequest         : TLastRequest    Read vLastRequest           Write vLastRequest;
  Property OnLastResponse        : TLastResponse   Read vLastResponse          Write vLastResponse;
  Property Encoding              : TEncodeSelect   Read VEncondig              Write VEncondig;          //Encoding da string
  Property ServerContext         : String          Read vServerContext         Write vServerContext;
End;

implementation

Constructor TProxyOptions.Create;
Begin
 Inherited;
 vServer   := '';
 vLogin    := vServer;
 vPassword := vLogin;
 vPort     := 8888;
End;

Procedure TProxyOptions.Assign(Source: TPersistent);
Var
 Src : TProxyOptions;
Begin
 If Source is TProxyOptions Then
  Begin
   Src := TProxyOptions(Source);
   vServer := Src.Server;
   vLogin  := Src.Login;
   vPassword := Src.Password;
   vPort     := Src.Port;
  End
 Else
  Inherited;
End;

{ TRESTServicePooler }

Procedure TRESTServicePooler.CommandGet(AContext      : TIdContext;
                                        ARequestInfo  : TIdHTTPRequestInfo;
                                        AResponseInfo : TIdHTTPResponseInfo);
Var
 Cmd           : String;
 Argumentos    : TArguments;
 JSONStr       : String;
 vTempServerMethods : TObject;
Begin
 Cmd := Trim(ARequestInfo.RawHTTPCommand);
 If (vServerParams.HasAuthentication) Then
  Begin
   If Not ((ARequestInfo.AuthUsername = vServerParams.Username)  And
           (ARequestInfo.AuthPassword = vServerParams.Password)) Then
    Begin
     AResponseInfo.AuthRealm := AuthRealm;
     AResponseInfo.WriteContent;
     Exit;
    End;
  End;
 If (UpperCase(Copy (Cmd, 1, 3)) = 'GET' ) OR
    (UpperCase(Copy (Cmd, 1, 4)) = 'POST') OR
    (UpperCase(Copy (Cmd, 1, 3)) = 'HEAD') Then
  Begin
   If ARequestInfo.URI <> '/favicon.ico' Then
    Begin
     If ARequestInfo.Params.Count > 0 Then
      Argumentos := TServerUtils.ParseWebFormsParams (ARequestInfo.Params, ARequestInfo.URI)
     Else
      Argumentos := TServerUtils.ParseRESTURL (ARequestInfo.URI);
     If Assigned(vServerMethod) Then
      vTempServerMethods := vServerMethod.Create
     Else
      JSONStr := GetPairJSON(-5, 'Server Methods Cannot Assigned');
     Try
      If Assigned(vLastRequest) Then
       Begin
        EnterCriticalSection(vCriticalSection);
        vLastRequest(ARequestInfo.UserAgent + #13#10 +
                     ARequestInfo.RawHTTPCommand);
        LeaveCriticalSection(vCriticalSection);
       End;
      If Assigned(vServerMethod) Then
       Begin
        If UpperCase(Copy (Cmd, 1, 3)) = 'GET' Then
         JSONStr := TServerMethods(vTempServerMethods).CallGETServerMethod(Argumentos);
        If UpperCase(Copy (Cmd, 1, 4)) = 'POST' Then
         JSONStr := TServerMethods(vTempServerMethods).CallPOSTServerMethod(Argumentos);
       End;
      AResponseInfo.ContentText := JSONStr;
      If Assigned(vLastResponse) Then
       Begin
        EnterCriticalSection(vCriticalSection);
        vLastResponse(AResponseInfo.ContentText);
        LeaveCriticalSection(vCriticalSection);
       End;
      AResponseInfo.WriteContent;
     Finally
      If Assigned(vServerMethod) Then
       vTempServerMethods.Free;
     End;
    End;
  End;
End;

Procedure TRESTServicePooler.CommandOther(AContext      : TIdContext;
                                          ARequestInfo  : TIdHTTPRequestInfo;
                                          AResponseInfo : TIdHTTPResponseInfo);
Var
 Argumentos         : TArguments;
 Cmd, JSONStr       : String;
 vTempServerMethods : TObject;
Begin
 Cmd := ARequestInfo.RawHTTPCommand;
 If (vServerParams.HasAuthentication) Then
  Begin
   If Not ((ARequestInfo.AuthUsername = vServerParams.Username)  And
           (ARequestInfo.AuthPassword = vServerParams.Password)) Then
    Begin
     AResponseInfo.AuthRealm := AuthRealm;
     AResponseInfo.WriteContent;
     Exit;
    End;
  End;
 If (UpperCase(Copy (Cmd, 1, 3)) = 'PUT')    OR
    (UpperCase(Copy (Cmd, 1, 6)) = 'DELETE') Then
  Begin
   Argumentos    := TServerUtils.ParseRESTURL (ARequestInfo.URI);
   If Assigned(vServerMethod) Then
    vTempServerMethods := vServerMethod.Create
   Else
    JSONStr := GetPairJSON(-5, 'Server Methods Cannot Assigned');
   Try
    If Assigned(vLastRequest) Then
     Begin
      EnterCriticalSection(vCriticalSection);
      vLastRequest(ARequestInfo.UserAgent + #13#10 +
                   ARequestInfo.RawHTTPCommand);
      LeaveCriticalSection(vCriticalSection);
     End;
    If Assigned(vServerMethod) Then
     Begin
      If UpperCase(Copy (Cmd, 1, 3)) = 'PUT' Then
       JSONStr := TServerMethods(vTempServerMethods).CallPUTServerMethod(Argumentos);
      If UpperCase(Copy (Cmd, 1, 6)) = 'DELETE' Then
       JSONStr := TServerMethods(vTempServerMethods).CallDELETEServerMethod(Argumentos);
     End;
    AResponseInfo.ContentText := JSONStr;
    If Assigned(vLastResponse) Then
     Begin
      EnterCriticalSection(vCriticalSection);
      vLastResponse(AResponseInfo.ContentText);
      LeaveCriticalSection(vCriticalSection);
     End;
    AResponseInfo.WriteContent;
   Finally
    If Assigned(vServerMethod) Then
     vTempServerMethods.Free;
   End;
  End;
end;

Constructor TRESTServicePooler.Create(AOwner: TComponent);
Begin
 Inherited;
 vProxyOptions                   := TProxyOptions.Create;
 HTTPServer                      := TIdHTTPServer.Create(Nil);
 lHandler                        := TIdServerIOHandlerSSLOpenSSL.Create;
 HTTPServer.OnCommandGet         := CommandGet;
 HTTPServer.OnCommandOther       := CommandOther;
 vServerParams                   := TServerParams.Create;
 vActive                         := False;
 vServerParams.HasAuthentication := True;
 vServerParams.UserName          := 'testserver';
 vServerParams.Password          := 'testserver';
 vServerContext                  := 'restdataware';
 VEncondig                       := esUtf8;
 InitializeCriticalSection(vCriticalSection);
End;

Destructor TRESTServicePooler.Destroy;
Begin
 vProxyOptions.Free;
 HTTPServer.Active := False;
 HTTPServer.Free;
 vServerParams.Free;
 lHandler.Free;
 DeleteCriticalSection(vCriticalSection);
 Inherited;
End;

Function TRESTServicePooler.GetSecure : Boolean;
Begin
 Result:= vActive And (HTTPServer.IOHandler is TIdServerIOHandlerSSLBase);
End;

Procedure TRESTServicePooler.GetSSLPassWord(var Password: String);
Begin
 Password := aSSLPrivateKeyPassword;
End;

Procedure TRESTServicePooler.SetActive(Value : Boolean);
Begin
 If (Value)                   And
    (Not (HTTPServer.Active)) Then
  Begin
   Try
    If (ASSLPrivateKeyFile <> '')     And
       (ASSLPrivateKeyPassword <> '') And
       (ASSLCertFile <> '')           Then
     Begin
      lHandler.SSLOptions.Method                := aSSLVersion;
      lHandler.OnGetPassword                    := GetSSLPassword;
      lHandler.SSLOptions.CertFile              := ASSLCertFile;
      lHandler.SSLOptions.KeyFile               := ASSLPrivateKeyFile;
      HTTPServer.IOHandler := lHandler;
     End
    Else
     HTTPServer.IOHandler  := Nil;
    HTTPServer.DefaultPort := vServicePort;
    HTTPServer.Active      := True;
   Except
    On E : Exception do
     Begin
      Raise Exception.Create(PChar(E.Message));
     End;
   End;
  End
 Else If Not(Value) Then
  HTTPServer.Active := False;
 vActive := HTTPServer.Active;
End;

end.
