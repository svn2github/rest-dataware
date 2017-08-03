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
 Cristiano Barbosa       - Admin - Administrador do CORE do pacote.
 Giovani da Cruz         - Admin - Administrador do CORE do pacote.
 Alexandre Abbade        - Admin - Administrador do desenvolvimento de DEMOS, coordenador do Grupo.
 Mizael Rocha            - Member Tester and DEMO Developer.
 Flávio Motta            - Member Tester and DEMO Developer.
 Itamar Gaucho           - Member Tester and DEMO Developer.
}

interface

Uses
     {$IFDEF FPC}
     SysUtils,                      Classes,            ServerUtils, {$IFDEF WINDOWS}Windows,{$ENDIF}
     IdContext, IdTCPConnection,    IdHTTPServer,       IdCustomHTTPServer,  IdSSLOpenSSL,    IdSSL,
     IdAuthentication,              IdTCPClient,        IdHTTPHeaderInfo,    IdComponent, IdBaseComponent,
     IdHTTP,                        uDWConstsData,      IdMultipartFormData, IdMessageCoder,
     IdMessageCoderMIME, IdMessage, uDWJSONObject, IdGlobal, uDWJSON, IdGlobalProtocols;
     {$ELSE}
     {$IF CompilerVersion < 21}
     SysUtils, Classes, EncdDecd,
     {$ELSE}
     System.SysUtils, System.Classes,
     {$IFEND}
     ServerUtils, Windows,  uDWConstsData,       IdTCPClient, uDWJSON,  IdMultipartFormData,
     IdContext,             IdHTTPServer,        IdCustomHTTPServer,    IdSSLOpenSSL,    IdSSL,
     IdAuthentication,      IdHTTPHeaderInfo,    IdComponent, IdBaseComponent, IdTCPConnection,
     IdHTTP,                uDWJSONObject,       IdMessageCoder,
     IdMessageCoderMIME,    IdMessage,           IdGlobalProtocols,     IdGlobal;
     {$ENDIF}

Type
 TLastRequest  = Procedure (Value             : String)              Of Object;
 TLastResponse = Procedure (Value             : String)              Of Object;
 TEventContext = Procedure (AContext          : TIdContext;
                            ARequestInfo      : TIdHTTPRequestInfo;
                            AResponseInfo     : TIdHTTPResponseInfo) Of Object;
 TOnWork       = Procedure (ASender           : TObject;
                            AWorkMode         : TWorkMode;
                            AWorkCount        : Int64)               Of Object;
 TOnWorkBegin  = Procedure (ASender           : TObject;
                            AWorkMode         : TWorkMode;
                            AWorkCountMax     : Int64)               Of Object;
 TOnWorkEnd    = Procedure (ASender           : TObject;
                            AWorkMode         : TWorkMode)           Of Object;
 TOnStatus     = Procedure (ASender           : TObject;
                            Const AStatus     : TIdStatus;
                            Const AStatusText : String)              Of Object;

Type
 TCallBack     = Procedure (JSon : String; DWParams : TDWParams) Of Object;

Type
 TServerMethodClass = Class(TComponent)
End;

TThread_Request = class(TThread)
  FHttpRequest      : TIdHTTP;
  vUserName,
  vPassword,
  vHost             : String;
  vUrlPath          : String;
  vPort             : Integer;
  vAutenticacao     : Boolean;
  vTransparentProxy : TIdProxyConnectionInfo;
  vRequestTimeOut   : Integer;
  vTypeRequest      : TTypeRequest;
  vRSCharset        : TEncodeSelect;

  EventData : String;
  //RBody     : TStringStream;
  Params : TDWParams;

  EventType : TSendEvent ;
  FCallBack:TCallBack;
private
  Procedure SetParams(HttpRequest:TIdHTTP);
  function GetHttpRequest(): TIdHTTP;
protected
  procedure Execute; override;

public
  constructor Create;
  destructor Destroy; override;
  property CallBack:TCallBack read FCallBack write FCallBack;
  property HttpRequest:TIdHTTP read GetHttpRequest;

end;

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
  vDataCompress,
  vEncodeStrings,
  vActive          : Boolean;
  vProxyOptions    : TProxyOptions;
  HTTPServer       : TIdHTTPServer;
  vServicePort     : Integer;
  vServerBaseMethod,
  vServerMethod    : TComponentClass;
  vServerParams    : TServerParams;
  vLastRequest     : TLastRequest;
  vLastResponse    : TLastResponse;
  lHandler         : TIdServerIOHandlerSSLOpenSSL;
  aSSLVersion      : TIdSSLVersion;
  vServerContext,
  ASSLPrivateKeyFile,
  ASSLPrivateKeyPassword,
  ASSLCertFile     : String;
  VEncondig        : TEncodeSelect;              //Enconding se usar CORS usar UTF8 - Alexandre Abade
  FRootPath : String;
  Procedure GetSSLPassWord(Var Password: String);
  Procedure SetActive(Value : Boolean);
  Function  GetSecure : Boolean;
  Procedure SetServerMethod(Value : TComponentClass);
  Procedure GetPoolerList(ServerMethodsClass : TComponent;
                          Var PoolerList     : String);
  Function  ServiceMethods(BaseObject   : TComponent;
                           AContext     : TIdContext;
                           UrlMethod    : String;
                           Var DWParams : TDWParams;
                           Var JSONStr  : String) : Boolean;
  Procedure EchoPooler(ServerMethodsClass : TComponent;
                       AContext           : TIdContext;
                       Var Pooler, MyIP   : String);
  Procedure ExecuteCommandPureJSON(ServerMethodsClass : TComponent;
                                   Var Pooler         : String;
                                   Var DWParams       : TDWParams);
  Procedure ExecuteCommandJSON(ServerMethodsClass     : TComponent;
                               Var Pooler             : String;
                               Var DWParams           : TDWParams);
 Public
  Constructor Create(AOwner  : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                      //Destroy a Classe
 Published
  Property Active                : Boolean         Read vActive                Write SetActive;
  Property DataCompression       : Boolean         Read vDatacompress          Write vDatacompress;
  Property Secure                : Boolean         Read GetSecure;
  Property EncodeStrings         : Boolean         Read vEncodeStrings         Write vEncodeStrings;
  Property ServicePort           : Integer         Read vServicePort           Write vServicePort;  //A Porta do Serviço do DataSet
  Property ProxyOptions          : TProxyOptions   Read vProxyOptions          Write vProxyOptions; //Se tem Proxy diz quais as opções
  Property ServerParams          : TServerParams   Read vServerParams          Write vServerParams;
  Property ServerMethodClass     : TComponentClass Read vServerMethod          Write SetServerMethod;
  Property SSLPrivateKeyFile     : String          Read aSSLPrivateKeyFile     Write aSSLPrivateKeyFile;
  Property SSLPrivateKeyPassword : String          Read aSSLPrivateKeyPassword Write aSSLPrivateKeyPassword;
  Property SSLCertFile           : String          Read aSSLCertFile           Write aSSLCertFile;
  Property SSLVersion            : TIdSSLVersion   Read aSSLVersion            Write aSSLVersion;
  Property OnLastRequest         : TLastRequest    Read vLastRequest           Write vLastRequest;
  Property OnLastResponse        : TLastResponse   Read vLastResponse          Write vLastResponse;
  Property Encoding              : TEncodeSelect   Read VEncondig              Write VEncondig;          //Encoding da string
  Property ServerContext         : String          Read vServerContext         Write vServerContext;
  {TODO CRISTIANO BARBOSA}
  Property RootPath              : String         Read FRootPath              Write FRootPath ;
End;

Type
 TRESTClientPooler = Class(TComponent) //Novo Componente de Acesso a Requisições REST para o RESTDataware
 Protected
  //Variáveis, Procedures e  Funções Protegidas
  HttpRequest       : TIdHTTP;
  Procedure SetParams;
  Procedure SetOnWork     (Value : TOnWork);
  Procedure SetOnWorkBegin(Value : TOnWorkBegin);
  Procedure SetOnWorkEnd  (Value : TOnWorkEnd);
  Procedure SetOnStatus   (Value : TOnStatus);
 Private
  //Variáveis, Procedures e Funções Privadas
  vOnWork           : TOnWork;
  vOnWorkBegin      : TOnWorkBegin;
  vOnWorkEnd        : TOnWorkEnd;
  vOnStatus         : TOnStatus;
  vTypeRequest      : TTypeRequest;
  vRSCharset        : TEncodeSelect;
  vUrlPath,
  vUserName,
  vPassword,
  vHost             : String;
  vPort             : Integer;
  vDatacompress,
  vThreadRequest,
  vAutenticacao     : Boolean;
  vTransparentProxy : TIdProxyConnectionInfo;
  vRequestTimeOut   : Integer;
  Procedure SetUserName(Value : String);
  Procedure SetPassword(Value : String);
  Procedure SetUrlPath(Value  : String);
 Public
  //Métodos, Propriedades, Variáveis, Procedures e Funções Publicas
  Function    SendEvent(EventData  : String;
                        CallBack   : TCallBack = Nil) : String;Overload;
  Function    SendEvent(EventData  : String;
                        Var Params : TDWParams;
                        EventType  : TSendEvent = sePOST;
                        CallBack   : TCallBack = Nil) : String;Overload;
  Constructor Create(AOwner: TComponent);Override;
  Destructor  Destroy;Override;
 Published
  //Métodos e Propriedades
  Property DataCompression  : Boolean                Read vDatacompress     Write vDatacompress;
  Property UrlPath          : String                 Read vUrlPath          Write SetUrlPath;
  Property Encoding         : TEncodeSelect          Read vRSCharset        Write vRSCharset;
  Property TypeRequest      : TTypeRequest           Read vTypeRequest      Write vTypeRequest       Default trHttp;
  Property Host             : String                 Read vHost             Write vHost;
  Property Port             : Integer                Read vPort             Write vPort              Default 8082;
  Property UserName         : String                 Read vUserName         Write SetUserName;
  Property Password         : String                 Read vPassword         Write SetPassword;
  Property Autenticacao     : Boolean                Read vAutenticacao     Write vAutenticacao      Default True;
  Property ProxyOptions     : TIdProxyConnectionInfo Read vTransparentProxy Write vTransparentProxy;
  Property RequestTimeOut   : Integer                Read vRequestTimeOut   Write vRequestTimeOut;
  Property ThreadRequest    : Boolean                Read vThreadRequest    Write vThreadRequest;
  Property OnWork           : TOnWork                Read vOnWork           Write SetOnWork;
  Property OnWorkBegin      : TOnWorkBegin           Read vOnWorkBegin      Write SetOnWorkBegin;
  Property OnWorkEnd        : TOnWorkEnd             Read vOnWorkEnd        Write SetOnWorkEnd;
  Property OnStatus         : TOnStatus              Read vOnStatus         Write SetOnStatus;
End;

implementation

Uses uDWDatamodule, uRESTDWPoolerDB, SysTypes, uDWConsts, uDWJSONTools;

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
 vRSCharset                      := esASCII;
 vAutenticacao                   := True;
 vRequestTimeOut                 := 10000;
 vThreadRequest                  := False;
 vDatacompress                   := True;
End;

Destructor  TRESTClientPooler.Destroy;
Begin
 HttpRequest.Free;
 vTransparentProxy.Free;
 Inherited;
End;

Function TRESTClientPooler.SendEvent(EventData  : String;
                                     Var Params : TDWParams;
                                     EventType  : TSendEvent = sePOST;
                  									 CallBack   : TCallBack= nil) : String;
Var
 vResult,
 vResultSTR,
 vURL,
 vTpRequest    : String;
 vResultParams : TMemoryStream;
 StringStream  : TStringStream;
 SendParams    : TIdMultipartFormDataStream;
 ss            : TStringStream;
 thd : TThread_Request;
 Procedure SetData(InputValue     : String;
                   Var ParamsData : TDWParams;
                   Var ResultJSON : String);
 Var
  bJsonOBJ,
  bJsonValue    : TJsonObject;
  bJsonOBJTemp  : TJSONArray;
  JSONParam     : TJSONParam;
  JSONParamNew  : TJSONParam;
  A, I, InitPos : Integer;
  vValue,
  vTempValue    : String;
 Begin
  Try
   InitPos    := Pos('"RESULT":[', InputValue) + Length('"RESULT":[') -1;
   vTempValue := Copy(InputValue, InitPos +1, Pos(']}', InputValue) - InitPos - 1);
   InputValue := Copy(InputValue, 1, InitPos) + ']}'; //Delete(InputValue, InitPos, Pos(']}', InputValue) - InitPos);
   If Params <> Nil Then
    Begin
     bJsonValue    := TJsonObject.Create(InputValue);
     bJsonOBJTemp  := TJSONArray.Create(bJsonValue.opt(bJsonValue.names.get(0).ToString).ToString);
     If bJsonOBJTemp.length > 0 Then
      Begin
       For A := 0 To bJsonOBJTemp.length -1 Do
        Begin
         bJsonOBJ := TJsonObject.Create(bJsonOBJTemp.get(A).ToString);
         If Length(bJsonOBJ.opt(bJsonOBJ.names.get(0).ToString).ToString) = 0 Then
          Continue;
         If GetObjectName(bJsonOBJ.opt(bJsonOBJ.names.get(0).ToString).ToString) <> toParam Then
          Break;
         JSONParam := TJSONParam.Create{$IFNDEF FPC}{$if CompilerVersion > 21}(GetEncoding(TEncodeSelect(vRSCharset))){$IFEND}{$ENDIF};
         Try
          JSONParam.ParamName       := bJsonOBJ.names.get(4).ToString;
          JSONParam.ObjectValue     := GetValueType(bJsonOBJ.opt(bJsonOBJ.names.get(3).ToString).ToString);
          JSONParam.ObjectDirection := GetDirectionName(bJsonOBJ.opt(bJsonOBJ.names.get(1).ToString).ToString);
          JSONParam.Encoded         := GetBooleanFromString(bJsonOBJ.opt(bJsonOBJ.names.get(2).ToString).ToString);
          If JSONParam.Encoded Then
           vValue := DecodeStrings(bJsonOBJ.opt(bJsonOBJ.names.get(4).ToString).ToString)
          Else
           vValue := bJsonOBJ.opt(bJsonOBJ.names.get(4).ToString).ToString;
          JSONParam.SetValue(vValue);
          bJsonOBJ.Free;
          //parametro criandos no servidor
          If ParamsData.ItemsString[JSONParam.ParamName] = Nil Then
           Begin
            JSONParamNew           := TJSONParam.Create{$IFNDEF FPC}{$if CompilerVersion > 21}(ParamsData.Encoding){$IFEND}{$ENDIF};
            JSONParamNew.ParamName := JSONParam.ParamName;
            JSONParamNew.SetValue(JSONParam.Value, JSONParam.Encoded);
            ParamsData.Add(JSONParamNew);
           End
          Else
           ParamsData.ItemsString[JSONParam.ParamName].SetValue(JSONParam.Value, JSONParam.Encoded);
         Finally
          JSONParam.Free;
         End;
        End;
      End;
     bJsonValue.Free;
    End;
  Finally
   If vTempValue <> '' Then
    ResultJSON := vTempValue;
  End;
 End;
 Procedure SetParamsValues(DWParams : TDWParams; SendParamsData : TIdMultipartFormDataStream);
 Var
  I : Integer;
 Begin
  If DWParams <> Nil Then
   Begin
    For I := 0 To DWParams.Count -1 Do
     Begin
      If DWParams.Items[I].ObjectValue in [ovWideMemo, ovBytes, ovVarBytes, ovBlob,
                                           ovMemo,   ovGraphic, ovFmtMemo,  ovOraBlob, ovOraClob] Then
       Begin
        ss := TStringStream.Create(DWParams.Items[I].ToJSON);
        {$IFNDEF FPC}
         {$if CompilerVersion > 21}
          SendParamsData.AddObject(DWParams.Items[I].ParamName, 'multipart/form-data', HttpRequest.Request.Charset, ss);
         {$ELSE}
          SendParamsData.AddObject(DWParams.Items[I].ParamName, 'multipart/form-data', HttpRequest.Request.Charset, ss);
         {$IFEND}
        {$ELSE}
         SendParamsData.AddObject(DWParams.Items[I].ParamName, 'multipart/form-data', HttpRequest.Request.Charset, ss);
        {$ENDIF}
       End
      Else
       SendParamsData.AddFormField(DWParams.Items[I].ParamName, DWParams.Items[I].ToJSON);
     End;
   End;
 End;
Begin
 SendParams := Nil;
 If vThreadRequest Then
  Begin
   thd := TThread_Request.Create;
   Try
    thd.FreeOnTerminate := true;
    thd.Priority        := tpHighest;
    thd.EventData       := EventData;
    {TODO CRISTIANO}
    thd.Params.CopyFrom(Params);
    thd.EventType       := EventType;
    thd.vUserName       := vUserName;
    thd.vPassword       := vPassword;
    thd.vUrlPath        := vUrlPath;
    thd.vHost           :=   vHost;
    thd.vPort           :=   vPort;
    thd.vAutenticacao   :=   vAutenticacao;
    thd.vTransparentProxy:=   vTransparentProxy;
    thd.vRequestTimeOut :=   vRequestTimeOut;
    thd.vTypeRequest    :=   vTypeRequest;
    thd.vRSCharset      :=   vRSCharset;
    thd.FCallBack       :=  CallBack;
   Finally
    thd.Execute;
   End;
   Exit;
  End;
 ss            := Nil;
 vResultParams := TMemoryStream.Create;
 If vTypeRequest = trHttp Then
  vTpRequest := 'http'
 Else If vTypeRequest = trHttps Then
  vTpRequest := 'https';
 SetParams;
 Try
  vURL := LowerCase(Format(UrlBase, [vTpRequest, vHost, vPort, vUrlPath])) + EventData;
  If vRSCharset = esUtf8 Then
   HttpRequest.Request.Charset := 'utf-8'
  Else If vRSCharset = esASCII Then
   HttpRequest.Request.Charset := 'ansi';
  Case EventType Of
   seGET :
    Begin
     HttpRequest.Request.ContentType := 'application/json';
     Result := HttpRequest.Get(EventData);
    End;
   sePOST,
   sePUT,
   seDELETE :
    Begin;
     If EventType = sePOST Then
      Begin
       If Params <> Nil Then
        Begin
         SendParams := TIdMultiPartFormDataStream.Create;
         SetParamsValues(Params, SendParams);
        End;
       If Params <> Nil Then
        Begin
         HttpRequest.Request.ContentType     := 'application/x-www-form-urlencoded';
         HttpRequest.Request.ContentEncoding := 'multipart/form-data';
         StringStream          := TStringStream.Create('');
         If vDatacompress Then
          Begin
           vResult      := HttpRequest.Post(vURL, SendParams);
           ZDecompressStr(vResult, vResultSTR);
           StringStream := TStringStream.Create(vResultSTR);
          End
         Else
          HttpRequest.Post(vURL, SendParams, StringStream);
         StringStream.Position := 0;
        End
       Else
        Begin
         HttpRequest.Request.ContentType := 'application/json';
         HttpRequest.Request.ContentEncoding := '';
         vResult      := HttpRequest.Get(EventData);
         StringStream := TStringStream.Create(vResult);
        End;
       If SendParams <> Nil Then
        SendParams.Free;
       StringStream.Position := 0;
       Try
        SetData(StringStream.DataString, Params, Result);
       Finally
        StringStream.Free;
       End;
      End
     Else If EventType = sePUT Then
      Begin
       HttpRequest.Request.ContentType := 'application/x-www-form-urlencoded';
       StringStream  := TStringStream.Create('');
       HttpRequest.Post(vURL, SendParams, StringStream);
       StringStream.WriteBuffer(#0' ', 1);
       StringStream.Position := 0;
       Try
        SetData(StringStream.DataString, Params, Result);
       Finally
        StringStream.Free;
       End;
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
  On E : Exception Do
   Begin
    {Todo: Acrescentado}
    Raise Exception.Create(e.Message);
   End;
 End;
 vResultParams.Free;
End;

Function TRESTClientPooler.SendEvent(EventData : String;
                                     CallBack  : TCallBack = Nil) : String;
Var
 RBody      : TStringStream;
 vTpRequest : String;
 Params     : TDWParams;
Begin
 Params  := Nil;
 RBody   := TStringStream.Create('');
 Try
  If vTypeRequest = trHttp Then
   vTpRequest := 'http'
  Else If vTypeRequest = trHttps Then
   vTpRequest := 'https';
  Result := SendEvent(LowerCase(Format(UrlBase, [vTpRequest, vHost, vPort, vUrlPath])) + EventData, Params, sePOST, CallBack);
 Except
 End;
 RBody.Free;
End;

Procedure TRESTClientPooler.SetOnStatus(Value : TOnStatus);
Begin
 {$IFDEF FPC}
  vOnStatus            := Value;
  HttpRequest.OnStatus := vOnStatus;
 {$ELSE}
  vOnStatus            := Value;
  HttpRequest.OnStatus := vOnStatus;
 {$ENDIF}
End;

Procedure TRESTClientPooler.SetOnWork(Value : TOnWork);
Begin
 {$IFDEF FPC}
  vOnWork            := Value;
  HttpRequest.OnWork := vOnWork;
 {$ELSE}
  vOnWork            := Value;
  HttpRequest.OnWork := vOnWork;
 {$ENDIF}
End;

Procedure TRESTClientPooler.SetOnWorkBegin(Value : TOnWorkBegin);
Begin
 {$IFDEF FPC}
  vOnWorkBegin            := Value;
  HttpRequest.OnWorkBegin := vOnWorkBegin;
 {$ELSE}
  vOnWorkBegin            := Value;
  HttpRequest.OnWorkBegin := vOnWorkBegin;
 {$ENDIF}
End;

Procedure TRESTClientPooler.SetOnWorkEnd(Value : TOnWorkEnd);
Begin
 {$IFDEF FPC}
  vOnWorkEnd            := Value;
  HttpRequest.OnWorkEnd := vOnWorkEnd;
 {$ELSE}
  vOnWorkEnd            := Value;
  HttpRequest.OnWorkEnd := vOnWorkEnd;
 {$ENDIF}
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

Procedure TRESTClientPooler.SetUrlPath(Value : String);
Begin
 vUrlPath := Value;
 If Length(vUrlPath) > 0 Then
  If vUrlPath[Length(vUrlPath)] <> '/' Then
   vUrlPath := vUrlPath + '/';
End;

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

Procedure TRESTServicePooler.GetPoolerList(ServerMethodsClass : TComponent;
                                           Var PoolerList     : String);
Var
 I : Integer;
Begin
 If ServerMethodsClass <> Nil Then
  Begin
   For I := 0 To ServerMethodsClass.ComponentCount -1 Do
    Begin
     If ServerMethodsClass.Components[i] is TRESTDWPoolerDB Then
      Begin
       If PoolerList = '' then
        PoolerList := Format('%s.%s', [ServerMethodsClass.ClassName, ServerMethodsClass.Components[i].Name])
       Else
        PoolerList := PoolerList + '|' + Format('%s.%s', [ServerMethodsClass.ClassName, ServerMethodsClass.Components[i].Name]);
      End;
    End;
  End;
End;

Procedure TRESTServicePooler.EchoPooler(ServerMethodsClass : TComponent;
                                        AContext           : TIdContext;
                                        Var Pooler,
                                            MyIP           : String);
Var
 I : Integer;
Begin
 If ServerMethodsClass <> Nil Then
  Begin
   For I := 0 To ServerMethodsClass.ComponentCount -1 Do
    Begin
     If ServerMethodsClass.Components[i] is TRESTDWPoolerDB Then
      Begin
       If Pooler = Format('%s.%s', [ServerMethodsClass.ClassName, ServerMethodsClass.Components[i].Name]) Then
        Begin
         MyIP := AContext.Connection.Socket.Binding.IP;
         Break;
        End;
      End;
    End;
  End;
End;

Procedure TRESTServicePooler.ExecuteCommandPureJSON(ServerMethodsClass : TComponent;
                                                    Var Pooler         : String;
                                                    Var DWParams       : TDWParams);
Var
 I         : Integer;
 vTempJSON : TJSONValue;
 vError,
 vExecute  : Boolean;
 vMessageError : String;
Begin
 If ServerMethodsClass <> Nil Then
  Begin
   For I := 0 To ServerMethodsClass.ComponentCount -1 Do
    Begin
     If ServerMethodsClass.Components[i] is TRESTDWPoolerDB Then
      Begin
       If UpperCase(Pooler) = UpperCase(Format('%s.%s', [ServerMethodsClass.ClassName, ServerMethodsClass.Components[i].Name])) then
        Begin
         If TRESTDWPoolerDB(ServerMethodsClass.Components[i]).RESTDriver <> Nil Then
          Begin
           vExecute := StringToBoolean(DWParams.ItemsString['Execute'].Value);
           vError   := StringToBoolean(DWParams.ItemsString['Error'].Value);
           TRESTDWPoolerDB(ServerMethodsClass.Components[i]).RESTDriver.EncodeStringsJSON := vEncodeStrings;
           vTempJSON := TRESTDWPoolerDB(ServerMethodsClass.Components[i]).RESTDriver.ExecuteCommand(DWParams.ItemsString['SQL'].Value,
                                                                                                    vError,
                                                                                                    vMessageError,
                                                                                                    vExecute);
           DWParams.ItemsString['MessageError'].SetValue(vMessageError);
           DWParams.ItemsString['Error'].SetValue(BooleanToString(vError));
           If DWParams.ItemsString['Result'] <> Nil Then
            Begin
             If vTempJSON <> Nil Then
              DWParams.ItemsString['Result'].SetValue(vTempJSON.ToJSON)
             Else
              DWParams.ItemsString['Result'].SetValue('');
            End;
          End;
         Break;
        End;
      End;
    End;
  End;
End;

Procedure TRESTServicePooler.ExecuteCommandJSON(ServerMethodsClass : TComponent;
                                                Var Pooler         : String;
                                                Var DWParams       : TDWParams);
Var
 I         : Integer;
 vTempJSON : TJSONValue;
 vError,
 vExecute  : Boolean;
 vMessageError : String;
 DWParamsD     : TDWParams;
Begin
 DWParamsD := Nil;
 If ServerMethodsClass <> Nil Then
  Begin
   For I := 0 To ServerMethodsClass.ComponentCount -1 Do
    Begin
     If ServerMethodsClass.Components[i] is TRESTDWPoolerDB Then
      Begin
       If UpperCase(Pooler) = UpperCase(Format('%s.%s', [ServerMethodsClass.ClassName, ServerMethodsClass.Components[i].Name])) then
        Begin
         If TRESTDWPoolerDB(ServerMethodsClass.Components[i]).RESTDriver <> Nil Then
          Begin
           vExecute := StringToBoolean(DWParams.ItemsString['Execute'].Value);
           vError   := StringToBoolean(DWParams.ItemsString['Error'].Value);
           TRESTDWPoolerDB(ServerMethodsClass.Components[i]).RESTDriver.EncodeStringsJSON := vEncodeStrings;
           If DWParams.ItemsString['Params'] <> Nil Then
            Begin
             DWParamsD := TDWParams.Create;
             DWParamsD.FromJSON(DWParams.ItemsString['Params'].Value);
            End;
           If DWParamsD <> Nil Then
            Begin
             vTempJSON := TRESTDWPoolerDB(ServerMethodsClass.Components[i]).RESTDriver.ExecuteCommand(DWParams.ItemsString['SQL'].Value,
                                                                                                      DWParamsD, vError, vMessageError,
                                                                                                      vExecute);
             DWParamsD.Free;
            End
           Else
            vTempJSON := TRESTDWPoolerDB(ServerMethodsClass.Components[i]).RESTDriver.ExecuteCommand(DWParams.ItemsString['SQL'].Value,
                                                                                                     vError,
                                                                                                     vMessageError,
                                                                                                     vExecute);
           DWParams.ItemsString['MessageError'].SetValue(vMessageError);
           DWParams.ItemsString['Error'].SetValue(BooleanToString(vError));
           If DWParams.ItemsString['Result'] <> Nil Then
            Begin
             If vTempJSON <> Nil Then
              DWParams.ItemsString['Result'].SetValue(vTempJSON.ToJSON)
             Else
              DWParams.ItemsString['Result'].SetValue('');
            End;
          End;
         Break;
        End;
      End;
    End;
  End;
End;

Function TRESTServicePooler.ServiceMethods(BaseObject   : TComponent;
                                           AContext     : TIdContext;
                                           UrlMethod    : String;
                                           Var DWParams : TDWParams;
                                           Var JSONStr  : String) : Boolean;
Var
 vResult,
 vResultIP,
 vUrlMethod   :  String;
 PoolerList   :  TStringList;
Begin
 Result       := False;
 vUrlMethod   := UpperCase(UrlMethod);
 If vUrlMethod = UpperCase('GetPoolerList') Then
  Begin
   Result     := True;
   GetPoolerList(BaseObject, vResult);
   DWParams.ItemsString['Result'].SetValue(vResult);
   JSONStr    := TReplyOK;
  End
 Else If vUrlMethod = UpperCase('EchoPooler') Then
  Begin
   vResult    := DWParams.ItemsString['Pooler'].Value;
   EchoPooler(BaseObject, AContext, vResult, vResultIP);
   DWParams.ItemsString['Result'].SetValue(vResultIP);
   Result     := vResultIP <> '';
   If Result Then
    JSONStr    := TReplyOK
   Else
    JSONStr    := TReplyNOK;
  End
 Else If vUrlMethod = UpperCase('ExecuteCommandPureJSON') Then
  Begin
   vResult    := DWParams.ItemsString['Pooler'].Value;
   ExecuteCommandPureJSON(BaseObject, vResult, DWParams);
   Result     := True;
   If Not(StringToBoolean(DWParams.ItemsString['Error'].Value)) Then
    JSONStr    := TReplyOK
   Else
    JSONStr    := TReplyNOK;
  End
 Else If vUrlMethod = UpperCase('ExecuteCommandJSON') Then
  Begin
   vResult    := DWParams.ItemsString['Pooler'].Value;
   ExecuteCommandJSON(BaseObject, vResult, DWParams);
   Result     := True;
   If Not(StringToBoolean(DWParams.ItemsString['Error'].Value)) Then
    JSONStr    := TReplyOK
   Else
    JSONStr    := TReplyNOK;
  End;
End;

Procedure TRESTServicePooler.aCommandGet(AContext      : TIdContext;
                                         ARequestInfo  : TIdHTTPRequestInfo;
                                         AResponseInfo : TIdHTTPResponseInfo);
Var
 {$IFNDEF UNIX}
  vCriticalSection : TRTLCriticalSection;
 {$ENDIF}
 DWParams           : TDWParams;
 boundary,
 startboundary,
 vReplyString,
 vReplyStringResult,
 Cmd , UrlMethod,
 tmp, JSONStr,
 sFile, sContentType, sCharSet       : String;
 vTempServerMethods : TObject;
 newdecoder,
 Decoder            : TIdMessageDecoder;
 JSONParam          : TJSONParam;
 msgEnd             : Boolean;
 I                  : Integer;
 mb,
 ms                 : TStringStream;
 Function GetParamsReturn(Params : TDWParams) : String;
 Var
  A, I : Integer;
 Begin
  A := 0;
  For I := 0 To Params.Count -1 Do
   Begin
    If TJSONParam(TList(Params).Items[I]^).ObjectDirection in [odOUT, odINOUT] Then
     Begin
      If A = 0 Then
       Result := TJSONParam(TList(Params).Items[I]^).ToJSON
      Else
       Result := Result + ', ' + TJSONParam(TList(Params).Items[I]^).ToJSON;
      Inc(A);
     End;
   End;
 End;
Begin
 vTempServerMethods := Nil;
 Cmd := Trim(ARequestInfo.RawHTTPCommand);
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   AResponseInfo.CustomHeaders.AddValue ('Access-Control-Allow-Origin','*');
  {$ELSE}
   AResponseInfo.CustomHeaders.Add('Access-Control-Allow-Origin=*');
  {$IFEND}
 {$ELSE}
  AResponseInfo.CustomHeaders.AddValue ('Access-Control-Allow-Origin','*');
 {$ENDIF}
 sCharSet:='';
 If (UpperCase(Copy (Cmd, 1, 3)) = 'GET') Then
  Begin
   If (Pos ('.HTML',UpperCase(Cmd))>0 ) Then
    Begin
     sContentType:='text/html';
	   sCharSet := 'utf-8';
    End
   Else If (Pos ('.PNG', UpperCase(Cmd)) > 0) Then
    sContentType := 'image/png'
   Else If (Pos ('.ICO', UpperCase(Cmd)) > 0) Then
    sContentType := 'image/ico'
   Else If (Pos ('.GIF', UpperCase(Cmd)) > 0) Then
    sContentType := 'image/gif'
   Else If (Pos ('.JPG', UpperCase(Cmd)) > 0) Then
    sContentType := 'image/jpg'
   Else If (Pos ('.JS', UpperCase(Cmd)) > 0)  Then
    sContentType := 'application/javascript'
   Else If (Pos ('.PDF', UpperCase(Cmd)) > 0) Then
    sContentType := 'application/pdf'
   Else If (Pos ('.CSS',UpperCase(Cmd)) > 0) Then
    sContentType:='text/css';
   {$IFNDEF FPC}
    {$if CompilerVersion > 21}
     sFile := FRootPath+ARequestInfo.URI;
    {$ELSE}
     sFile := FRootPath+ARequestInfo.Command;
    {$IFEND}
   {$ELSE}
    sFile := FRootPath+ARequestInfo.URI;
   {$ENDIF}
   If FileExists(sFile) then
    Begin
     AResponseInfo.ContentType := sContentType;
     {$IFNDEF FPC}
      {$if CompilerVersion > 21}
     	 If (sCharSet <> '') Then
        AResponseInfo.CharSet := sCharSet;
      {$IFEND}
     {$ENDIF}
     AResponseInfo.ContentStream := TIdReadFileExclusiveStream.Create(sFile);
     AResponseInfo.WriteContent;
     Exit;
    End;
  End;
 DWParams           := TDWParams.Create;
 {$IFNDEF FPC}
  {$if CompilerVersion > 21}
   DWParams.Encoding  := GetEncoding(TEncodeSelect(VEncondig));
  {$IFEND}
 {$ENDIF}
 If ARequestInfo.PostStream <> Nil Then
  Begin
   ARequestInfo.PostStream.Position := 0;
   msgEnd   := False;
   boundary := ExtractHeaderSubItem(ARequestInfo.ContentType, 'boundary', QuoteHTTP);
   startboundary := '--' + boundary;
   Repeat
    tmp := ReadLnFromStream(ARequestInfo.PostStream, -1, True);
   until tmp = startboundary;
  End;
 Try
  Cmd := Trim(ARequestInfo.RawHTTPCommand);
  Cmd := StringReplace(Cmd, ' HTTP/1.0', '', [rfReplaceAll]);
  Cmd := StringReplace(Cmd, ' HTTP/1.1', '', [rfReplaceAll]);
  Cmd := StringReplace(Cmd, ' HTTP/2.0', '', [rfReplaceAll]);
  Cmd := StringReplace(Cmd, ' HTTP/2.1', '', [rfReplaceAll]);
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
       DWParams  := TServerUtils.ParseWebFormsParams (ARequestInfo.Params, ARequestInfo.URI,
                                                      UrlMethod{$IFNDEF FPC}{$if CompilerVersion > 21}, GetEncoding(TEncodeSelect(VEncondig)){$IFEND}{$ENDIF})
      Else
       Begin
        If Copy(Cmd, 1, 3) = 'GET' Then
         DWParams  := TServerUtils.ParseRESTURL (ARequestInfo.URI{$IFNDEF FPC}{$if CompilerVersion > 21},GetEncoding(TEncodeSelect(VEncondig)){$IFEND}{$ENDIF})
        Else
         Begin
          Try
           Repeat
            decoder              := TIdMessageDecoderMIME.Create(nil);
            TIdMessageDecoderMIME(decoder).MIMEBoundary := boundary;
            decoder.SourceStream := ARequestInfo.PostStream;
            decoder.FreeSourceStream := False;
            decoder.ReadHeader;
            Inc(I);
            Case Decoder.PartType of
             mcptAttachment,
             mcptText :
              Begin
               ms          := TStringStream.Create('');
               ms.Position := 0;
               newdecoder  := Decoder.ReadBody(ms, msgEnd);
               tmp         := Decoder.Headers.Text;
  //             fname       := decoder.Filename;
               Decoder.Free;
               Decoder     := newdecoder;
               If Decoder <> Nil Then
                TIdMessageDecoderMIME(Decoder).MIMEBoundary := Boundary;
               JSONParam   := TJSONParam.Create{$IFNDEF FPC}{$if CompilerVersion > 21}(DWParams.Encoding){$IFEND}{$ENDIF};
               JSONParam.FromJSON(ms.DataString);
               DWParams.Add(JSONParam);
               FreeAndNil(ms);
              End;
             mcptIgnore :
              Begin
               Try
                If decoder <> Nil Then
                 FreeAndNil(decoder);
                decoder := TIdMessageDecoderMIME.Create(Nil);
                TIdMessageDecoderMIME(decoder).MIMEBoundary := boundary;
               Finally
               End;
              End;
             mcptEOF:
              Begin
               FreeAndNil(decoder);
               msgEnd := True
              End;
             End;
           Until (Decoder = Nil) Or (msgEnd);
          Finally
           If decoder <> nil then
            decoder.Free;
          End;
         End;
       End;
      If Assigned(vServerMethod) Then
       vTempServerMethods := vServerMethod.Create(Nil)
      Else
       JSONStr := GetPairJSON(-5, 'Server Methods Cannot Assigned');
      Try
       If Assigned(vLastRequest) Then
        Begin
         {$IFNDEF UNIX}
          InitializeCriticalSection(vCriticalSection);
          EnterCriticalSection(vCriticalSection);
         {$ENDIF}
         Try
          vLastRequest(ARequestInfo.UserAgent + #13#10 +
                      ARequestInfo.RawHTTPCommand);
         Finally
          {$IFNDEF UNIX}
           LeaveCriticalSection(vCriticalSection);
           DeleteCriticalSection(vCriticalSection);
          {$ENDIF}
         End;
        End;
       If Assigned(vServerMethod) Then
        Begin
         If UrlMethod = '' Then
          Begin
           UrlMethod := Cmd;
           While (Length(UrlMethod) > 0) Do
            Begin
             If Pos('/', UrlMethod) > 0 then
              Delete(UrlMethod, 1, 1)
             Else
              Begin
               UrlMethod := Trim(UrlMethod);
               Break;
              End;
            End;
          End;
         If vTempServerMethods <> Nil Then
          Begin
           If Not ServiceMethods(TComponent(vTempServerMethods), AContext, UrlMethod, DWParams, JSONStr) Then
            Begin
             If UpperCase(Copy (Cmd, 1, 3)) = 'GET' Then
              Begin
               If vServerBaseMethod = TServerMethods Then
                Begin
                 If Assigned(TServerMethods(vTempServerMethods).ReplyEvent) then
                  TServerMethods(vTempServerMethods).ReplyEvent(seGET, UrlMethod, DWParams, JSONStr);
                End
               Else If vServerBaseMethod = TServerMethodDatamodule Then
                Begin
                 If Assigned(TServerMethodDatamodule(vTempServerMethods).OnReplyEvent) then
                  TServerMethodDatamodule(vTempServerMethods).OnReplyEvent(seGET, UrlMethod, DWParams, JSONStr);
                End;
              End
             Else If UpperCase(Copy (Cmd, 1, 4)) = 'POST' Then
              Begin
               If vServerBaseMethod = TServerMethods Then
                Begin
                 If Assigned(TServerMethods(vTempServerMethods).ReplyEvent) then
                  TServerMethods(vTempServerMethods).ReplyEvent(sePOST, UrlMethod, DWParams, JSONStr);
                End
               Else If vServerBaseMethod = TServerMethodDatamodule Then
                Begin
                 If Assigned(TServerMethodDatamodule(vTempServerMethods).OnReplyEvent) then
                  TServerMethodDatamodule(vTempServerMethods).OnReplyEvent(sePOST, UrlMethod, DWParams, JSONStr);
                End;
              End;
            End;
          End;
        End;
       Try
        vReplyString                         := Format(TValueDisp, [GetParamsReturn(DWParams), JSONStr]);
        If vDataCompress Then
         Begin
          ZCompressStr(vReplyString, vReplyStringResult);
          mb                                 := TStringStream.Create(vReplyStringResult);
         End
        Else
         mb                                  := TStringStream.Create(vReplyString{$IFNDEF FPC}{$if CompilerVersion > 21}, GetEncoding(TEncodeSelect(VEncondig)){$IFEND}{$ENDIF});
        mb.Position                          := 0;
        AResponseInfo.ContentStream          := mb;
        AResponseInfo.ContentStream.Position := 0;
        AResponseInfo.ContentLength          := mb.Size;
        AResponseInfo.ContentType            := 'application/octet-stream';
        AResponseInfo.ResponseNo             := 200;
        AResponseInfo.WriteHeader;
        AResponseInfo.WriteContent;
        AResponseInfo.ContentStream          := Nil;
        AResponseInfo.ContentStream.Free;
       Finally
//        mb.Free;
       End;
       If Assigned(vLastResponse) Then
        Begin
         {$IFNDEF UNIX}
          InitializeCriticalSection(vCriticalSection);
          EnterCriticalSection(vCriticalSection);
         {$ENDIF}
         Try
          vLastResponse(vReplyString);
         Finally
          {$IFNDEF UNIX}
           LeaveCriticalSection(vCriticalSection);
           DeleteCriticalSection(vCriticalSection);
          {$ENDIF}
         End;
        End;
      Finally
       If Assigned(vServerMethod) Then
        vTempServerMethods.Free;
      End;
     End;
   End;
 Finally
  DWParams.Free;
 End;
End;

Procedure TRESTServicePooler.aCommandOther(AContext      : TIdContext;
                                           ARequestInfo  : TIdHTTPRequestInfo;
                                           AResponseInfo : TIdHTTPResponseInfo);
Var
 {$IFNDEF UNIX}
  vCriticalSection : TRTLCriticalSection;
 {$ENDIF}
 DWParams           : TDWParams;
 vReplyString,
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
   DWParams := TServerUtils.ParseRESTURL (ARequestInfo.URI{$IFNDEF FPC}{$if CompilerVersion > 21}, GetEncoding(TEncodeSelect(VEncondig)){$IFEND}{$ENDIF});
   If Assigned(vServerMethod) Then
    vTempServerMethods := vServerMethod.Create(Nil)
   Else
    JSONStr := GetPairJSON(-5, 'Server Methods Cannot Assigned');
   Try
    If Assigned(vLastRequest) Then
     Begin
      {$IFNDEF UNIX}
       InitializeCriticalSection(vCriticalSection);
       EnterCriticalSection(vCriticalSection);
      {$ENDIF}
      Try
       vLastRequest(ARequestInfo.UserAgent + #13#10 +
                    ARequestInfo.RawHTTPCommand);
      Finally
       {$IFNDEF UNIX}
        LeaveCriticalSection(vCriticalSection);
        DeleteCriticalSection(vCriticalSection);
       {$ENDIF}
      End;
     End;
    If Assigned(vServerMethod) Then
     Begin
      If vTempServerMethods <> Nil Then
       Begin
        If UpperCase(Copy (Cmd, 1, 3)) = 'PUT' Then
         TServerMethods(vTempServerMethods).ReplyEvent(sePUT, '', DWParams, JSONStr);
        If UpperCase(Copy (Cmd, 1, 6)) = 'DELETE' Then
         TServerMethods(vTempServerMethods).ReplyEvent(seDELETE, '', DWParams, JSONStr);
       End;
     End;
    Try
     vReplyString                    := Format(TValueDisp, ['', JSONStr]);
     AResponseInfo.FreeContentStream := True;
     AResponseInfo.ContentStream     := TStringStream.Create(vReplyString);
     AResponseInfo.ContentStream.Position := 0;
     AResponseInfo.ContentLength     := AResponseInfo.ContentStream.Size;
     AResponseInfo.WriteHeader;
    Finally
    End;
    If Assigned(vLastResponse) Then
     Begin
      {$IFNDEF UNIX}
       InitializeCriticalSection(vCriticalSection);
       EnterCriticalSection(vCriticalSection);
      {$ENDIF}
      Try
       vLastResponse(DecodeStrings(JSONStr));
      Finally
       {$IFNDEF UNIX}
        LeaveCriticalSection(vCriticalSection);
        DeleteCriticalSection(vCriticalSection);
       {$ENDIF}
      End;
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
 vEncodeStrings                  := True;
 vServerParams.HasAuthentication := True;
 vServerParams.UserName          := 'testserver';
 vServerParams.Password          := 'testserver';
 vServerContext                  := 'restdataware';
 VEncondig                       := esASCII;
 vServicePort                    := 8082;
 vDataCompress                   := True;
End;

Destructor TRESTServicePooler.Destroy;
Begin
 vProxyOptions.Free;
 HTTPServer.Active := False;
 HTTPServer.Free;
 vServerParams.Free;
 lHandler.Free;
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


Procedure TRESTServicePooler.SetServerMethod(Value : TComponentClass);
Begin
 If (Value.ClassParent      = TServerMethods) Or
    (Value                  = TServerMethods) Then
  Begin
   vServerMethod     := Value;
   vServerBaseMethod := TServerMethods;
  End
 Else If (Value.ClassParent = TServerMethodDatamodule) Or
         (Value             = TServerMethodDatamodule) Then
  Begin
   vServerMethod := Value;
   vServerBaseMethod := TServerMethodDatamodule;
  End;
End;

{TThread_Request}
constructor TThread_Request.Create;
begin
inherited Create(True);
FHttpRequest:=TIdHTTP.Create(NIL);
FreeOnTerminate := True;
vTransparentProxy               := TIdProxyConnectionInfo.Create;
//RBody :=TStringStream.Create;
Params := TDWParams.Create;
end;

destructor TThread_Request.Destroy; //override;
begin
  FHttpRequest.Free;
  //RBody.free;
  Params.Free;
  //vTransparentProxy.Free;
  //vTransparentProxy:=nil;
  inherited Destroy;

end;


Procedure TThread_Request.SetParams(HttpRequest:TIdHTTP);
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

function TThread_Request.GetHttpRequest(): TIdHTTP;
begin
  result :=FHttpRequest;
end;

procedure TThread_Request.Execute;
VAR SResult ,
 vResult,
 vURL,
 vTpRequest    : String;
 vResultParams : TMemoryStream;
 StringStream  : TStringStream;
 SendParams    : TIdMultipartFormDataStream;
 ss            : TStringStream;
 thd           : TThread_Request;
 Procedure SetData(InputValue     : String;
                   Var ParamsData : TDWParams;
                   Var ResultJSON : String);
 Var
  bJsonOBJ,
  bJsonValue    : TJsonObject;
  bJsonOBJTemp  : TJSONArray;
  JSONParam     : TJSONParam;
  JSONParamNew  : TJSONParam;
  A, I, InitPos : Integer;
  vValue,
  vTempValue  : String;
 Begin
  Try
   InitPos    := Pos('"RESULT":[', InputValue) + 10;
   vTempValue := Copy(InputValue, InitPos, Pos(']}', InputValue) - InitPos);
   Delete(InputValue, InitPos, Pos(']}', InputValue) - InitPos);
   If Params <> Nil Then
    Begin
     bJsonValue    := TJsonObject.Create(InputValue);
     bJsonOBJTemp  := TJSONArray.Create(bJsonValue.opt(bJsonValue.names.get(0).ToString).ToString);
     If bJsonOBJTemp.length > 0 Then
      Begin
       For A := 0 To bJsonValue.names.length -1 Do
        Begin
         bJsonOBJ := TJsonObject.Create(bJsonOBJTemp.get(A).ToString);
         If Length(bJsonOBJ.opt(bJsonOBJ.names.get(0).ToString).ToString) = 0 Then
          Continue;
         JSONParam := TJSONParam.Create{$IFNDEF FPC}{$if CompilerVersion > 21}(GetEncoding(TEncodeSelect(vRSCharset))){$IFEND}{$ENDIF};
         Try
          JSONParam.ParamName       := bJsonOBJ.names.get(4).ToString;
          JSONParam.ObjectValue     := GetValueType(bJsonOBJ.opt(bJsonOBJ.names.get(3).ToString).ToString);
          JSONParam.ObjectDirection := GetDirectionName(bJsonOBJ.opt(bJsonOBJ.names.get(1).ToString).ToString);
          JSONParam.Encoded         := GetBooleanFromString(bJsonOBJ.opt(bJsonOBJ.names.get(2).ToString).ToString);
          If JSONParam.Encoded Then
           vValue := DecodeStrings(bJsonOBJ.opt(bJsonOBJ.names.get(4).ToString).ToString)
          Else
           vValue := bJsonOBJ.opt(bJsonOBJ.names.get(4).ToString).ToString;
          JSONParam.SetValue(vValue);
          bJsonOBJ.Free;
          //parametro criandos no servidor
          If ParamsData.ItemsString[JSONParam.ParamName] = Nil Then
           Begin
            JSONParamNew           := TJSONParam.Create{$IFNDEF FPC}{$if CompilerVersion > 21}(ParamsData.Encoding){$IFEND}{$ENDIF};
            JSONParamNew.ParamName := JSONParam.ParamName;
            JSONParamNew.SetValue(JSONParam.Value, JSONParam.Encoded);
            ParamsData.Add(JSONParamNew);
           End
          Else
           ParamsData.ItemsString[JSONParam.ParamName].SetValue(JSONParam.Value, JSONParam.Encoded);
         Finally
          JSONParam.Free;
         End;
        End;
      End;
     bJsonValue.Free;
    End;
  Finally
   If vTempValue <> '' Then
    Begin
     ResultJSON := vTempValue;
    End;
  End;
 End;
 Procedure SetParamsValues(DWParams : TDWParams; SendParamsData : TIdMultipartFormDataStream);
 Var
  I : Integer;
 Begin
  If DWParams <> Nil Then
   Begin
    For I := 0 To DWParams.Count -1 Do
     Begin
      If DWParams.Items[I].ObjectValue in [ovWideMemo, ovBytes, ovVarBytes, ovBlob,
                                           ovMemo,   ovGraphic, ovFmtMemo,  ovOraBlob, ovOraClob] Then
       Begin
        ss := TStringStream.Create(DWParams.Items[I].ToJSON);
        SendParamsData.AddObject(DWParams.Items[I].ParamName, 'multipart/form-data', HttpRequest.Request.Charset, ss);
       End
      Else
       SendParamsData.AddFormField(DWParams.Items[I].ParamName, DWParams.Items[I].ToJSON);
     End;
   End;
 End;
Begin

ss            := Nil;
 vResultParams := TMemoryStream.Create;
 If vTypeRequest = trHttp Then
  vTpRequest := 'http'
 Else If vTypeRequest = trHttps Then
  vTpRequest := 'https';
 SetParams(FHttpRequest);
 Try
  vURL := LowerCase(Format(UrlBase, [vTpRequest, vHost, vPort, vUrlPath])) + EventData;
  If vRSCharset = esUtf8 Then
   HttpRequest.Request.Charset := 'utf-8'
  Else If vRSCharset = esASCII Then
   HttpRequest.Request.Charset := 'ansi';
  Case EventType Of
   seGET :
    Begin
     HttpRequest.Request.ContentType := 'application/json';
     SResult := HttpRequest.Get(EventData);
     If Assigned(FCallBack) Then
      {$IFDEF FPC}
       FCallBack(SResult, Params);
      {$ELSE}
       {$if CompilerVersion > 21}
        Synchronize(CurrentThread, Procedure ()
                                 Begin
                                  FCallBack(SResult,Params)
                                 End);
       {$ELSE}
        FCallBack(SResult, Params);
       {$IFEND}
      {$ENDIF}
     Terminate;
    End;
   sePOST,
   sePUT,
   seDELETE :
    Begin;
     If EventType = sePOST Then
      Begin
       If Params <> Nil Then
        Begin
         SendParams := TIdMultiPartFormDataStream.Create;
         SetParamsValues(Params, SendParams);
        End;
       If Params <> Nil Then
        Begin
         HttpRequest.Request.ContentType     := 'application/x-www-form-urlencoded';
         HttpRequest.Request.ContentEncoding := 'multipart/form-data';
         StringStream          := TStringStream.Create('');
         HttpRequest.Post(vURL, SendParams, StringStream);
         StringStream.Position := 0;
        End
       Else
        Begin
         HttpRequest.Request.ContentType := 'application/json';
         HttpRequest.Request.ContentEncoding := '';
         vResult      := HttpRequest.Get(EventData);
         StringStream := TStringStream.Create(vResult);
        End;
//       StringStream.WriteBuffer(#0' ', 1);
       StringStream.Position := 0;
       Try
        SetData(StringStream.DataString, Params, SResult);
        If Assigned(FCallBack) Then
         {$IFDEF FPC}
          FCallBack(SResult, Params);
         {$ELSE}
          {$if CompilerVersion > 21}
           Synchronize(CurrentThread, Procedure
                                      Begin
                                       FCallBack(SResult,Params)
                                      End);
          {$ELSE}
           FCallBack(SResult, Params);
          {$IFEND}
         {$ENDIF}
        Terminate;
       Finally
        StringStream.Free;
       End;
      End
     Else If EventType = sePUT Then
      Begin
       HttpRequest.Request.ContentType := 'application/x-www-form-urlencoded';
       StringStream  := TStringStream.Create('');
       HttpRequest.Post(vURL, SendParams, StringStream);
       StringStream.WriteBuffer(#0' ', 1);
       StringStream.Position := 0;
       Try
        SetData(StringStream.DataString, Params, SResult);
        If Assigned(FCallBack) Then
         {$IFDEF FPC}
          FCallBack(SResult, Params);
         {$ELSE}
          {$if CompilerVersion > 21}
           Synchronize(CurrentThread, Procedure
                                      Begin
                                       FCallBack(SResult,Params)
                                      End);
          {$ELSE}
           FCallBack(SResult, Params);
          {$IFEND}
         {$ENDIF}
        Terminate;
       Finally
        StringStream.Free;
       End;
      End
     Else If EventType = seDELETE Then
      Begin
       Try
         HttpRequest.Request.ContentType := 'application/json';
         HttpRequest.Delete(vURL);
         SResult := GetPairJSON('OK', 'DELETE COMMAND OK');
         If Assigned(FCallBack) Then
          {$IFDEF FPC}
           FCallBack(SResult, Params);
          {$ELSE}
           {$if CompilerVersion > 21}
            Synchronize(CurrentThread, Procedure
                                       Begin
                                        FCallBack(SResult,Params)
                                       End);
           {$IFEND}
          {$ENDIF}
         Terminate;
       Except
        On e:exception Do
         Begin
          SResult := GetPairJSON('NOK', e.Message);
          If Assigned(FCallBack) Then
           {$IFDEF FPC}
            FCallBack(SResult, Params);
           {$ELSE}
            {$if CompilerVersion > 21}
             Synchronize(CurrentThread, Procedure
                                        Begin
                                         FCallBack(SResult,Params);
                                        End);
            {$IFEND}
           {$ENDIF}
          Terminate;
         End;
       End;
      End;
    End;
  End;
 Except
  On E : Exception Do
   Begin
    {Todo: Acrescentado}
    Raise Exception.Create(e.Message);
   End;
 End;
 vResultParams.Free;

end;

end.

