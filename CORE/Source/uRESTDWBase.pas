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

Uses
     {$IFDEF FPC}
     SysUtils,         Classes, SysTypes, ServerUtils, {$IFDEF WINDOWS}Windows,{$ENDIF}
     IdContext,        IdHTTPServer,      IdCustomHTTPServer,    IdSSLOpenSSL, IdSSL,
     IdAuthentication, IdHTTPHeaderInfo,  uDWJSONTools,          uDWConsts,    IdHTTP,
     uDWJSONObject;
     {$ELSE}
     System.SysUtils,  System.Classes,   SysTypes, ServerUtils, Windows,
     IdContext,        IdHTTPServer,     IdCustomHTTPServer,    IdSSLOpenSSL, IdSSL,
     IdAuthentication, IdHTTPHeaderInfo, uDWJSONTools,          uDWConsts,    IdHTTP,
     uDWJSONObject;
     {$ENDIF}

Type
 TLastRequest  = Procedure (Value     : String)                  Of Object;
 TLastResponse = Procedure (Value     : String)                  Of Object;
 TReplyEvent   = Procedure (SendType  : TSendEvent;
                            Arguments : TArguments)              Of Object;
 TEventContext = Procedure (AContext      : TIdContext;
                            ARequestInfo  : TIdHTTPRequestInfo;
                            AResponseInfo : TIdHTTPResponseInfo) Of Object;

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
 Protected
  Procedure aCommandGet  (AContext      : TIdContext;
                          ARequestInfo  : TIdHTTPRequestInfo;
                          AResponseInfo : TIdHTTPResponseInfo);
  Procedure aCommandOther(AContext      : TIdContext;
                          ARequestInfo  : TIdHTTPRequestInfo;
                          AResponseInfo : TIdHTTPResponseInfo);
 Private
  vActive          : Boolean;
  vProxyOptions    : TProxyOptions;
  HTTPServer       : TIdHTTPServer;
  vServicePort     : Integer;
  vServerMethod    : TClass;
  vServerParams    : TServerParams;
  vLastRequest     : TLastRequest;
  vLastResponse    : TLastResponse;
  {$IFDEF FPC} {$IFDEF WINDOWS}
  vCriticalSection : TRTLCriticalSection;
  {$ENDIF}{$ENDIF}
  lHandler         : TIdServerIOHandlerSSLOpenSSL;
  aSSLVersion      : TIdSSLVersion;
  vServerContext,
  ASSLPrivateKeyFile,
  ASSLPrivateKeyPassword,
  ASSLCertFile     : String;
  VEncondig        : TEncodeSelect;              //Enconding se usar CORS usar UTF8 - Alexandre Abade
  Procedure GetSSLPassWord(Var Password: String);
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

Type
 TRESTClientPooler = Class(TComponent) //Novo Componente de Acesso a Requisições REST para o RESTDataware
 Protected
  //Variáveis, Procedures e  Funções Protegidas
  HttpRequest       : TIdHTTP;
  Procedure SetParams;
 Private
  //Variáveis, Procedures e Funções Privadas
  vTypeRequest      : TTypeRequest;
  vRSCharset        : TEncodeSelect;
  vUserName,
  vPassword,
  vHost             : String;
  vPort             : Integer;
  vAutenticacao     : Boolean;
  vTransparentProxy : TIdProxyConnectionInfo;
  vRequestTimeOut   : Integer;
  Procedure SetUserName(Value : String);
  procedure SetPassword(Value : String);
 Public
  //Métodos, Propriedades, Variáveis, Procedures e Funções Publicas
  Function    SendEvent(EventData : String)              : String;Overload;
  Function    SendEvent(EventData : String;
                        RBody     : TStringList;
                        EventType : TSendEvent = sePOST) : String;Overload;
  Function    SendEvent(EventData : String;
                        Params    : TDWParams)         : String;Overload;
  Constructor Create(AOwner: TComponent);Override;
  Destructor  Destroy;Override;
 Published
  //Métodos e Propriedades
  Property Encoding         : TEncodeSelect          Read vRSCharset        Write vRSCharset;
  Property TypeRequest      : TTypeRequest           Read vTypeRequest      Write vTypeRequest       Default trHttp;
  Property Host             : String                 Read vHost             Write vHost;
  Property Port             : Integer                Read vPort             Write vPort              Default 8082;
  Property UserName         : String                 Read vUserName         Write SetUserName;
  Property Password         : String                 Read vPassword         Write SetPassword;
  Property Autenticacao     : Boolean                Read vAutenticacao     Write vAutenticacao      Default True;
  Property ProxyOptions     : TIdProxyConnectionInfo Read vTransparentProxy Write vTransparentProxy;
  Property RequestTimeOut   : Integer                Read vRequestTimeOut   Write vRequestTimeOut;
End;

implementation

Constructor TRESTClientPooler.Create(AOwner: TComponent);
Begin
 Inherited;
 HttpRequest                     := TIdHTTP.Create(Nil);
 HttpRequest.Request.ContentType := 'application/json';
 vTransparentProxy               := TIdProxyConnectionInfo.Create;
 vHost                           := 'localhost';
 vPort                           := 8082;
 vUserName                       := 'testserver';
 vPassword                       := 'testserver';
 vRSCharset                      := esUtf8;
 vAutenticacao                   := True;
 vRequestTimeOut                 := 10000;
End;

Destructor  TRESTClientPooler.Destroy;
Begin
 HttpRequest.Free;
 vTransparentProxy.Free;
 Inherited;
End;

Function TRESTClientPooler.SendEvent(EventData : String;
                                     RBody     : TStringList;
                                     EventType : TSendEvent = sePOST) : String;
Var
 StringStream : TStringStream;
 vURL         : String;
 vTpRequest : String;
Begin
 If vTypeRequest = trHttp Then
  vTpRequest := 'http'
 Else If vTypeRequest = trHttps Then
  vTpRequest := 'https';
 SetParams;
 Try
  If Pos(Uppercase(Format(UrlBase, [vTpRequest, vHost, vPort])), Uppercase(EventData)) = 0 Then
   vURL := LowerCase(Format(UrlBase, [vTpRequest, vHost, vPort])) + EventData
  Else
   vURL := EventData;
  If vRSCharset = esUtf8 Then
   HttpRequest.Request.Charset := 'utf-8'
  Else If vRSCharset = esASCII Then
   HttpRequest.Request.Charset := 'ansi';
  Case EventType Of
   seGET :
    Begin
     HttpRequest.Request.ContentType := 'application/json';
     Result := HttpRequest.Get(vURL);
    End;
   sePOST,
   sePUT,
   seDELETE :
    Begin;
     If EventType = sePOST Then
      Begin
       HttpRequest.Request.ContentType := 'application/x-www-form-urlencoded';
       Result := HttpRequest.Post(vURL, RBody);
      End
     Else If EventType = sePUT Then
      Begin
       HttpRequest.Request.ContentType := 'application/x-www-form-urlencoded';
       StringStream := TStringStream.Create(RBody.Text);
       Result := HttpRequest.Put(vURL, StringStream);
       StringStream.Free;
      End
     Else If EventType = seDELETE Then
      Begin
       Try
         HttpRequest.Request.ContentType := 'application/json';
         HttpRequest.Delete(vURL);
         Result := GetPairJSON('OK', 'DELETE COMMAND OK');
       Except
        On e:exception Do
         Begin
          Result := GetPairJSON('NOK', e.Message);
         End;
       End;
      End;
    End;
  End;
 Except

 End;
End;

Function TRESTClientPooler.SendEvent(EventData : String) : String;
Var
 RBody      : TStringList;
 vTpRequest : String;
Begin
 RBody   := TStringList.Create;
 Try
  If vTypeRequest = trHttp Then
   vTpRequest := 'http'
  Else If vTypeRequest = trHttps Then
   vTpRequest := 'https';
  Result := SendEvent(Format(UrlBase, [vTpRequest, vHost, vPort]) + EventData, RBody, seGET);
 Except
 End;
 RBody.Free;
End;

Procedure TRESTClientPooler.SetParams;
Begin
 HttpRequest.Request.BasicAuthentication := vAutenticacao;
 If HttpRequest.Request.BasicAuthentication Then
  Begin
   If HttpRequest.Request.Authentication = Nil Then
    HttpRequest.Request.Authentication         := TIdBasicAuthentication.Create;
   HttpRequest.Request.Authentication.Password := vPassword;
   HttpRequest.Request.Authentication.Username := vUserName;
  End;
 HttpRequest.ProxyParams := vTransparentProxy;
 HttpRequest.ReadTimeout := vRequestTimeout;
End;

procedure TRESTClientPooler.SetPassword(Value : String);
begin
 vPassword := Value;
 HttpRequest.Request.Password := vPassword;
end;

procedure TRESTClientPooler.SetUserName(Value : String);
begin
 vUsername := Value;
end;

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

Procedure TRESTServicePooler.aCommandGet(AContext      : TIdContext;
                                         ARequestInfo  : TIdHTTPRequestInfo;
                                         AResponseInfo : TIdHTTPResponseInfo);
Var
 Cmd           : String;
 Argumentos    : TArguments;
 JSONStr       : String;
 vTempServerMethods : TObject;
Begin
 vTempServerMethods := Nil;
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
        {$IFDEF FPC} {$IFDEF WINDOWS}
        EnterCriticalSection(vCriticalSection);
        {$ENDIF}{$ENDIF}
        vLastRequest(ARequestInfo.UserAgent + #13#10 +
                     ARequestInfo.RawHTTPCommand);
        {$IFDEF FPC} {$IFDEF WINDOWS}
        LeaveCriticalSection(vCriticalSection);
        {$ENDIF}{$ENDIF}
       End;
      If Assigned(vServerMethod) Then
       Begin
        If vTempServerMethods <> Nil Then
         Begin
          If UpperCase(Copy (Cmd, 1, 3)) = 'GET' Then
           JSONStr := TServerMethods(vTempServerMethods).ReplyEvent(seGET, Argumentos);
          If UpperCase(Copy (Cmd, 1, 4)) = 'POST' Then
           JSONStr := TServerMethods(vTempServerMethods).ReplyEvent(sePOST, Argumentos);
         End;
       End;
      AResponseInfo.ContentText := JSONStr;
      If Assigned(vLastResponse) Then
       Begin
        {$IFDEF FPC} {$IFDEF WINDOWS}
        EnterCriticalSection(vCriticalSection);
        {$ENDIF}{$ENDIF}
        vLastResponse(AResponseInfo.ContentText);
        {$IFDEF FPC} {$IFDEF WINDOWS}
        LeaveCriticalSection(vCriticalSection);
        {$ENDIF}{$ENDIF}
       End;
      AResponseInfo.WriteContent;
     Finally
      If Assigned(vServerMethod) Then
       vTempServerMethods.Free;
     End;
    End;
  End;
End;

Procedure TRESTServicePooler.aCommandOther(AContext      : TIdContext;
                                          ARequestInfo  : TIdHTTPRequestInfo;
                                          AResponseInfo : TIdHTTPResponseInfo);
Var
 Argumentos         : TArguments;
 Cmd, JSONStr       : String;
 vTempServerMethods : TObject;
Begin
 vTempServerMethods := Nil;
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
      {$IFDEF FPC} {$IFDEF WINDOWS}
      EnterCriticalSection(vCriticalSection);
      {$ENDIF}{$ENDIF}
      vLastRequest(ARequestInfo.UserAgent + #13#10 +
                   ARequestInfo.RawHTTPCommand);
      {$IFDEF FPC} {$IFDEF WINDOWS}
      LeaveCriticalSection(vCriticalSection);
      {$ENDIF}{$ENDIF}
     End;
    If Assigned(vServerMethod) Then
     Begin
      If vTempServerMethods <> Nil Then
       Begin
        If UpperCase(Copy (Cmd, 1, 3)) = 'PUT' Then
         JSONStr := TServerMethods(vTempServerMethods).ReplyEvent(sePUT, Argumentos);
        If UpperCase(Copy (Cmd, 1, 6)) = 'DELETE' Then
         JSONStr := TServerMethods(vTempServerMethods).ReplyEvent(seDELETE, Argumentos);
       End;
     End;
    AResponseInfo.ContentText := JSONStr;
    If Assigned(vLastResponse) Then
     Begin
      {$IFDEF FPC} {$IFDEF WINDOWS}
      EnterCriticalSection(vCriticalSection);
      {$ENDIF}{$ENDIF}
      vLastResponse(AResponseInfo.ContentText);
      {$IFDEF FPC} {$IFDEF WINDOWS}
      LeaveCriticalSection(vCriticalSection);
      {$ENDIF}{$ENDIF}
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
 {$IFDEF FPC}
 HTTPServer.OnCommandGet         := @aCommandGet;
 HTTPServer.OnCommandOther       := @aCommandOther;
 {$ELSE}
 HTTPServer.OnCommandGet         := aCommandGet;
 HTTPServer.OnCommandOther       := aCommandOther;
 {$ENDIF}
 vServerParams                   := TServerParams.Create;
 vActive                         := False;
 vServerParams.HasAuthentication := True;
 vServerParams.UserName          := 'testserver';
 vServerParams.Password          := 'testserver';
 vServerContext                  := 'restdataware';
 VEncondig                       := esUtf8;
 {$IFDEF FPC} {$IFDEF WINDOWS}
 InitializeCriticalSection(vCriticalSection);
 {$ENDIF}{$ENDIF}
End;

Destructor TRESTServicePooler.Destroy;
Begin
 vProxyOptions.Free;
 HTTPServer.Active := False;
 HTTPServer.Free;
 vServerParams.Free;
 lHandler.Free;
 {$IFDEF FPC}{$IFDEF WINDOWS}DeleteCriticalSection(vCriticalSection);{$ENDIF}{$ENDIF}
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
      {$IFDEF FPC}
      lHandler.OnGetPassword                    := @GetSSLPassword;
      {$ELSE}
      lHandler.OnGetPassword                    := GetSSLPassword;
      {$ENDIF}
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

Function TRESTClientPooler.SendEvent(EventData : String;
                                     Params    : TDWParams): String;
Var
 I : Integer;
 vStringList : TStringList;
Begin
 vStringList := TStringList.Create;
 Try
  For I := 0 To Params.Count -1 Do
   vStringList.Add(Format('%s=%s', [Params[I].ParamName, Params[I].Value]));
  Result := SendEvent(EventData, vStringList, sePOST);
 Finally
  vStringList.Free;
 End;
End;

end.
