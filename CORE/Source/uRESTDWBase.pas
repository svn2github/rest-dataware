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
     SysUtils,           Classes, SysTypes,   ServerUtils, {$IFDEF WINDOWS}Windows,{$ENDIF}
     IdContext,          IdHTTPServer,        IdCustomHTTPServer,    IdSSLOpenSSL, IdSSL,
     IdAuthentication,   IdHTTPHeaderInfo,    uDWJSONTools,          uDWConsts,    IdHTTP,
     uDWJSONObject,      IdMultipartFormData, IdMessageCoder,        IdMessageCoderMIME,
     IdMessage,          IdGlobal,            IdGlobalProtocols;
     {$ELSE}
     System.SysUtils,    System.Classes,      SysTypes, ServerUtils, Windows,
     IdContext,          IdHTTPServer,        IdCustomHTTPServer,    IdSSLOpenSSL, IdSSL,
     IdAuthentication,   IdHTTPHeaderInfo,    uDWJSONTools,          uDWConsts,    IdHTTP,
     uDWJSONObject,      IdMultipartFormData, IdMessageCoder,        IdMessageCoderMIME,
     IdMessage,          IdGlobal,            IdGlobalProtocols;
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
 TCallBack =Procedure (JSon:String;DWParams:TDWParams) of Object;

TThread_Request = class(TThread)
  FHttpRequest :TIdHTTP;
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
  FRootPath : String;
  Procedure GetSSLPassWord(Var Password: String);
  Procedure SetActive(Value : Boolean);
  Function  GetSecure : Boolean;
 Public
  Constructor Create(AOwner  : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                      //Destroy a Classe
 Published
  Property Active                : Boolean         Read vActive                Write SetActive;
  Property DataCompression       : Boolean         Read vDatacompress          Write vDatacompress;
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
  {TODO CRISTIANO BARBOSA}
  Property RootPath              : String         Read FRootPath              Write FRootPath ;
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
  Procedure SetUrlPath(Value : String);
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
End;

implementation

Uses uDWJSONParser;

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
                                     EventType : TSendEvent = sePOST;
									 CallBack : TCallBack= nil) : String;
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
  JsonParser  : TJsonParser;
  bJsonValue  : TJsonObject;
  JSONParam   : TJSONParam;
  JSONParamNew: TJSONParam;
  A, I, InitPos : Integer;
  vValue,
  vTempValue    : String;
 Begin
  ClearJsonParser(JsonParser);
  Try
   InitPos    := Pos('"RESULT":[', InputValue) + Length('"RESULT":[') -1;
   vTempValue := Copy(InputValue, InitPos +1, Pos(']}', InputValue) - InitPos - 1);
   InputValue := Copy(InputValue, 1, InitPos) + ']}'; //Delete(InputValue, InitPos, Pos(']}', InputValue) - InitPos);
   If Params <> Nil Then
//   If Params.ParamsReturn Then  //testar parametro de retorno
    Begin
     ParseJson(JsonParser, InputValue);
     If Length(JsonParser.Output.Objects) > 0 Then
      Begin
       For A := 1 To Length(JsonParser.Output.Objects) -1 Do
        Begin
         bJsonValue := JsonParser.Output.Objects[A];
         If Length(bJsonValue) = 0 Then
          Continue;
         If GetObjectName(bJsonValue[0].Value.Value) <> toParam Then
          Break;
         JSONParam := TJSONParam.Create(GetEncoding(vRSCharset));
         Try
          JSONParam.ParamName       := bJsonValue[4].Key;
          JSONParam.ObjectValue     := GetValueType(bJsonValue[3].Value.Value);
          JSONParam.ObjectDirection := GetDirectionName(bJsonValue[1].Value.Value);
          JSONParam.Encoded         := GetBooleanFromString(bJsonValue[2].Value.Value);
          If JSONParam.Encoded Then
           vValue := DecodeStrings(bJsonValue[4].Value.Value{$IFNDEF FPC}, GetEncoding(vRSCharset){$ENDIF})
          Else
           vValue := bJsonValue[4].Value.Value;
          JSONParam.SetValue(vValue);
          {TODO CRISTIANO BAROBSA}  //parametro criandos no servidor
          If ParamsData.ItemsString[JSONParam.ParamName] = Nil Then
          begin
            JSONParamNew           := TJSONParam.Create(ParamsData.Encoding);
            JSONParamNew.ParamName := JSONParam.ParamName;
            JSONParamNew.SetValue(JSONParam.Value, JSONParam.Encoded);
            ParamsData.Add(JSONParamNew);
          end
          else
            ParamsData.ItemsString[JSONParam.ParamName].SetValue(JSONParam.Value, JSONParam.Encoded);
  //        ParamsData.WriteString(Format('%s=%s', [JSONParam.ParamName, JSONParam.ToJSON]) + TSepParams);
         Finally
          JSONParam.Free;
         End;
        End;
      End;
    End;
  Finally
   If vTempValue <> '' Then
    Begin
//     ResultJSON := DecodeStrings(vTempValue{$IFNDEF FPC}, GetEncoding(vRSCharset){$ENDIF});
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
    thd.START;
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
//       StringStream.WriteBuffer(#0' ', 1);
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

{ TRESTServicePooler }

Procedure TRESTServicePooler.aCommandGet(AContext      : TIdContext;
                                         ARequestInfo  : TIdHTTPRequestInfo;
                                         AResponseInfo : TIdHTTPResponseInfo);
Var
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

  AResponseInfo.CustomHeaders.AddValue ('Access-Control-Allow-Origin','*');
  sCharSet:='';

 If (UpperCase(Copy (Cmd, 1, 3)) = 'GET' ) then
 begin
   if (Pos ('.HTML',UpperCase(Cmd))>0 ) then
   begin
     sContentType:='text/html';
	 sCharSet := 'utf-8';
   end 
   else if (Pos ('.PNG',UpperCase(Cmd))>0 ) then  sContentType:='image/png'
   else if (Pos ('.ICO',UpperCase(Cmd))>0 ) then  sContentType:='image/ico'
   else if (Pos ('.GIF',UpperCase(Cmd))>0 ) then  sContentType:='image/gif'
   else if (Pos ('.JPG',UpperCase(Cmd))>0 ) then  sContentType:='image/jpg'
   else if (Pos ('.JS',UpperCase(Cmd))>0 ) then   sContentType:='application/javascript'
   else if (Pos ('.PDF',UpperCase(Cmd))>0 ) then   sContentType:='application/pdf'
   else if (Pos ('.CSS',UpperCase(Cmd))>0 ) then  sContentType:='text/css';

   sFile:=FRootPath+ARequestInfo.URI;
   if FileExists(sFile) then
   begin
      AResponseInfo.ContentType :=sContentType ;
  	  if (sCharSet<>'') then
      AResponseInfo.CharSet := sCharSet;
      AResponseInfo.ContentStream := TIdReadFileExclusiveStream.Create(sFile);
      AResponseInfo.WriteContent;
      exit;
   end;  
 end;

 DWParams           := TDWParams.Create;
 DWParams.Encoding  := GetEncoding(VEncondig);
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
                                                      UrlMethod, GetEncoding(VEncondig))
      Else
       Begin
        If Copy(Cmd, 1, 3) = 'GET' Then
         DWParams  := TServerUtils.ParseRESTURL (ARequestInfo.URI, GetEncoding(VEncondig))
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
               JSONParam   := TJSONParam.Create(DWParams.Encoding);
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
           If UpperCase(Copy (Cmd, 1, 3)) = 'GET' Then
            JSONStr := TServerMethods(vTempServerMethods).ReplyEvent(seGET, UrlMethod, DWParams);
           If UpperCase(Copy (Cmd, 1, 4)) = 'POST' Then
            JSONStr := TServerMethods(vTempServerMethods).ReplyEvent(sePOST, UrlMethod, DWParams);
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
         mb                                  := TStringStream.Create(vReplyString{$IFNDEF FPC}, GetEncoding(VEncondig){$ENDIF});
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
         {$IFDEF FPC} {$IFDEF WINDOWS}
         EnterCriticalSection(vCriticalSection);
         {$ENDIF}{$ENDIF}
         vLastResponse(vReplyString);
         {$IFDEF FPC} {$IFDEF WINDOWS}
         LeaveCriticalSection(vCriticalSection);
         {$ENDIF}{$ENDIF}
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
   DWParams := TServerUtils.ParseRESTURL (ARequestInfo.URI, GetEncoding(VEncondig));
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
         JSONStr := TServerMethods(vTempServerMethods).ReplyEvent(sePUT, '', DWParams);
        If UpperCase(Copy (Cmd, 1, 6)) = 'DELETE' Then
         JSONStr := TServerMethods(vTempServerMethods).ReplyEvent(seDELETE, '', DWParams);
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
      {$IFDEF FPC} {$IFDEF WINDOWS}
      EnterCriticalSection(vCriticalSection);
      {$ENDIF}{$ENDIF}
      vLastResponse(DecodeStrings(JSONStr{$IFNDEF FPC}, GetEncoding(VEncondig){$ENDIF}));
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
 VEncondig                       := esASCII;
 vServicePort                    := 8082;
 vDataCompress                   := True;
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
 thd : TThread_Request;

 Procedure SetData(InputValue     : String;
                   Var ParamsData : TDWParams;
                   Var ResultJSON : String);
 Var
  JsonParser  : TJsonParser;
  bJsonValue  : TJsonObject;
  JSONParam   : TJSONParam;
  JSONParamNew: TJSONParam;
  A, I, InitPos : Integer;
  vValue,
  vTempValue  : String;
 Begin
  ClearJsonParser(JsonParser);
  Try
   InitPos    := Pos('"RESULT":[', InputValue) + 10;
   vTempValue := Copy(InputValue, InitPos, Pos(']}', InputValue) - InitPos);
   Delete(InputValue, InitPos, Pos(']}', InputValue) - InitPos);
   If Params <> Nil Then
    Begin
     ParseJson(JsonParser, InputValue);
     If Length(JsonParser.Output.Objects) > 0 Then
      Begin
       For A := 1 To Length(JsonParser.Output.Objects) -1 Do
        Begin
         bJsonValue := JsonParser.Output.Objects[A];
         If GetObjectName(bJsonValue[0].Value.Value) <> toParam Then
          Break;
         JSONParam := TJSONParam.Create(GetEncoding(vRSCharset));
         Try
          JSONParam.ParamName       := bJsonValue[4].Key;
          JSONParam.ObjectValue     := GetValueType(bJsonValue[3].Value.Value);
          JSONParam.ObjectDirection := GetDirectionName(bJsonValue[1].Value.Value);
          JSONParam.Encoded         := GetBooleanFromString(bJsonValue[2].Value.Value);
          If JSONParam.Encoded Then
           vValue := DecodeStrings(bJsonValue[4].Value.Value{$IFNDEF FPC}, GetEncoding(vRSCharset){$ENDIF})
          Else
           vValue := bJsonValue[4].Value.Value;
          JSONParam.SetValue(vValue);
          {TODO CRISTIANO BAROBSA}  //parametro criandos no servidor
          If ParamsData.ItemsString[JSONParam.ParamName] = Nil Then
          begin
            JSONParamNew           := TJSONParam.Create(ParamsData.Encoding);
            JSONParamNew.ParamName := JSONParam.ParamName;
            JSONParamNew.SetValue(JSONParam.Value, JSONParam.Encoded);
            ParamsData.Add(JSONParamNew);
          end
          else
            ParamsData.ItemsString[JSONParam.ParamName].SetValue(JSONParam.Value, JSONParam.Encoded);
  //        ParamsData.WriteString(Format('%s=%s', [JSONParam.ParamName, JSONParam.ToJSON]) + TSepParams);
         Finally
          JSONParam.Free;
         End;
        End;
      End;
    End;
  Finally
   If vTempValue <> '' Then
    Begin
//     ResultJSON := DecodeStrings(vTempValue{$IFNDEF FPC}, GetEncoding(vRSCharset){$ENDIF});
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
      {$IFDEF FPC}FCallBack(SResult, Params);{$ELSE}
      Synchronize(CurrentThread, Procedure ()
                                 Begin
                                  FCallBack(SResult,Params)
                                 End);
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
         {$IFDEF FPC}FCallBack(SResult, Params);{$ELSE}
         Synchronize(CurrentThread, Procedure ()
                                    Begin
                                     FCallBack(SResult,Params)
                                    End);
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
         {$IFDEF FPC}FCallBack(SResult, Params);{$ELSE}
         Synchronize(CurrentThread, Procedure ()
                                    Begin
                                     FCallBack(SResult,Params)
                                    End);
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
         {$IFDEF FPC}FCallBack(SResult, Params);{$ELSE}
         Synchronize(CurrentThread, Procedure ()
                                    Begin
                                     FCallBack(SResult,Params)
                                    End);
         {$ENDIF}
         Terminate;
       Except
        On e:exception Do
         Begin
          SResult := GetPairJSON('NOK', e.Message);
          If Assigned(FCallBack) Then
          {$IFDEF FPC}FCallBack(SResult, Params);{$ELSE}
          Synchronize(CurrentThread, Procedure ()
                                     Begin
                                      FCallBack(SResult,Params)
                                     End);
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
