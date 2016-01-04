{
 Esse pacote de Componentes foi desenhado com o Objetivo de ajudar as pessoas a desenvolverem
com WebServices REST o mais próximo possível do desenvolvimento local DB, com componentes de
fácil configuração para que todos tenham acesso as maravilhas dos WebServices REST/JSON DataSnap.

Desenvolvedor Principal : Gilberto Rocha da Silva (XyberX)
Empresa : XyberPower Desenvolvimento
}

unit uRestPoolerDB;

interface

uses System.SysUtils,         System.Classes,           Datasnap.DSProxyRest, Datasnap.DSServer,
     FireDAC.Stan.Intf,       FireDAC.Stan.Option,      FireDAC.Stan.Param,   Datasnap.DSAuth,
     FireDAC.Stan.Error,      FireDAC.DatS,             FireDAC.Phys.Intf,    FireDAC.DApt.Intf,
     FireDAC.Stan.Async,      FireDAC.DApt,             FireDAC.UI.Intf,      FireDAC.VCLUI.Wait,
     FireDAC.Stan.Def,        FireDAC.Stan.Pool,        FireDAC.Phys,         Data.DB,
     FireDAC.Comp.Client,     FireDAC.Comp.UI,          FireDAC.Comp.DataSet, Data.FireDACJSONReflect,
     System.JSON,             FireDAC.Stan.StorageBin,  FireDAC.Stan.StorageJSON,
     FireDAC.Phys.IBDef,      IPPeerClient,             Datasnap.DSClientRest,
     System.SyncObjs,         Data.DBXJSONReflect,      uPoolerMethod,        System.TypInfo;

Type
 TOnEventDB = Procedure (DataSet: TDataSet) of Object;

Type
 TOnEventConnection = Procedure (Sucess : Boolean; Const Error : String) of Object;

Type
 TOnEventTimer = Procedure of Object;

Type
 TTimerData = Class(TThread)
 Private
  FValue : Integer;          //Milisegundos para execução
  FLock  : TCriticalSection; //Seção crítica
  vEvent : TOnEventTimer;    //Evento a ser executado
 Public
  Property OnEventTimer : TOnEventTimer Read vEvent Write vEvent; //Evento a ser executado
 Protected
  Constructor Create(AValue: Integer; ALock: TCriticalSection);   //Construtor do Evento
  Procedure   Execute; Override;                                  //Procedure de Execução automática
End;

Type
 TAutoCheckData = Class(TObject)
 Private
  vAutoCheck : Boolean;                            //Se tem Autochecagem
  vInTime    : Integer;                            //Em milisegundos o timer
  Timer      : TTimerData;                         //Thread do temporizador
  vEvent     : TOnEventTimer;                      //Evento a executar
  FLock      : TCriticalSection;                   //CriticalSection para execução segura
  Procedure  SetState(Value : Boolean);            //Ativa ou desativa a classe
  Procedure  SetInTime(Value : Integer);           //Diz o Timeout
  Procedure  SetEventTimer(Value : TOnEventTimer); //Seta o Evento a ser executado
 Public
  Constructor Create; //Cria o Componente
  Destructor  Destroy;Override;//Destroy a Classe
  Property AutoCheck    : Boolean       Read vAutoCheck Write SetState;      //Se tem Autochecagem
  Property InTime       : Integer       Read vInTime    Write SetInTime;     //Em milisegundos o timer
  Property OnEventTimer : TOnEventTimer Read vEvent     Write SetEventTimer; //Evento a executar
End;

Type
 TProxyOptions = Class(TObject)
 Private
  vServer,              //Servidor Proxy na Rede
  vLogin,               //Login do Servidor Proxy
  vPassword : String;   //Senha do Servidor Proxy
  vPort     : Integer;  //Porta do Servidor Proxy
 Public
  Constructor Create;   //Cria o Componente
  Property Server   : String  Read vServer   Write vServer;   //Servidor Proxy na Rede
  Property Port     : Integer Read vPort     Write vPort;     //Porta do Servidor Proxy
  Property Login    : String  Read vLogin    Write vLogin;    //Login do Servidor Proxy
  Property Password : String  Read vPassword Write vPassword; //Senha do Servidor Proxy
End;

Type
 TRESTDataBase = Class(TComponent)
 Private
  Owner                : TComponent;                 //Proprietario do Componente
  vLogin,                                            //Login do Usuário caso haja autenticação
  vPassword,                                         //Senha do Usuário caso haja autenticação
  vRestWebService,                                   //Rest WebService para consultas
  vRestURL,                                          //URL do WebService REST
  vRestModule,                                       //Classe Principal do Servidor a ser utilizada
  vMyIP,                                             //Meu IP vindo do Servidor
  vRestPooler          : String;                     //Qual o Pooler de Conexão do DataSet
  vPoolerPort          : Integer;                    //A Porta do Pooler
  vProxy               : Boolean;                    //Diz se tem servidor Proxy
  vProxyOptions        : TProxyOptions;              //Se tem Proxy diz quais as opções
  vTimeOut             : Integer;                    //Tempo de espera por conexão ao Servidor
  vConnected           : Boolean;                    //Diz o Estado da Conexão
  vOnEventConnection   : TOnEventConnection;         //Evento de Estado da Conexão
  vAutoCheckData       : TAutoCheckData;             //Autocheck de Conexão
  Procedure SetConnection(Value : Boolean);          //Seta o Estado da Conexão
  Procedure SetRestPooler(Value : String);           //Seta o Restpooler a ser utilizado
  Procedure SetPoolerPort(Value : Integer);          //Seta a Porta do Pooler a ser usada
  Procedure CheckConnection;                         //Checa o Estado automatico da Conexão
  Function  TryConnect : Boolean;                    //Tenta Conectar o Servidor para saber se posso executar comandos
  Procedure SetConnectionOptions(Var Value : TDSRestConnection); //Seta as Opções de Conexão
  Function ExecuteCommand(Var SQL    : TStringList;
                          Var Params : TParams;
                          Var Error  : Boolean;
                          Var MessageError : String;
                          Execute    : Boolean = False) : TFDJSONDataSets;
 Public
  Function    GetRestPoolers : TStringList;          //Retorna a Lista de DataSet Sources do Pooler
  Constructor Create(AOwner  : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                      //Destroy a Classe
 Published
  Property OnConnection    : TOnEventConnection Read vOnEventConnection Write vOnEventConnection; //Evento relativo a tudo que acontece quando tenta conectar ao Servidor
  Property Active          : Boolean            Read vConnected         Write SetConnection;      //Seta o Estado da Conexão
  Property MyIP            : String             Read vMyIP;
  Property Login           : String             Read vLogin             Write vLogin;             //Login do Usuário caso haja autenticação
  Property Password        : String             Read vPassword          Write vPassword;          //Senha do Usuário caso haja autenticação
  Property Proxy           : Boolean            Read vProxy             Write vProxy;             //Diz se tem servidor Proxy
  Property ProxyOptions    : TProxyOptions      Read vProxyOptions      Write vProxyOptions;      //Se tem Proxy diz quais as opções
  Property PoolerService   : String             Read vRestWebService    Write vRestWebService;    //Host do WebService REST
  Property PoolerURL       : String             Read vRestURL           Write vRestURL;           //URL do WebService REST
  Property PoolerPort      : Integer            Read vPoolerPort        Write SetPoolerPort;      //A Porta do Pooler do DataSet
  Property PoolerName      : String             Read vRestPooler        Write SetRestPooler;      //Qual o Pooler de Conexão ligado ao componente
  Property RestModule      : String             Read vRestModule        Write vRestModule;        //Classe do Servidor REST Principal
  Property StateConnection : TAutoCheckData     Read vAutoCheckData     Write vAutoCheckData;     //Autocheck da Conexão
  Property TimeOut         : Integer            Read vTimeOut           Write vTimeOut;           //Tempo de espera por conexão ao Servidor
End;

Type
 TRESTClientSQL   = Class(TFDMemTable)              //Classe com as funcionalidades de um DBQuery
 Private
  Owner           : TComponent;
  vAutoCommit,                                      //Se manda o Comando de AutoSalvar a Reflexão no Banco de Dados
  vDataCache,                                       //Se usa cache local
  vConnectedOnce,                                   //Verifica se foi conectado ao Servidor
  vActive         : Boolean;                        //Estado do Dataset
  vSQL            : TStringList;                    //SQL a ser utilizado na conexão
  vParams         : TParams;                        //Parametros de Dataset
  vCacheDataDB    : TFDDataset;                     //O Cache de Dados Salvo para utilização rápida
  vOnBeforePost,                                    //Variável do Evento BeforePost
  vOnBeforeDelete : TOnEventDB;                     //Variável do Evento BeforeDelete
  vOnGetDataError : TOnEventConnection;             //Se deu erro na hora de receber os dados ou não
  vRESTDataBase   : TRESTDataBase;                  //RESTDataBase do Dataset
  Procedure SetActiveDB(Value : Boolean);           //Seta o Estado do Dataset
  Procedure SetSQL(Value : TStringList);            //Seta o SQL a ser usado
  Function  CreateOnlineConnection : Boolean;       //Cria a Conexão Online com o Servidor
  Function  NegociateTransaction : Boolean;         //Envia o comando de criação o Fluxo de Controle da Transação no Pooler
//  Procedure ReleaseConnection;                      //Finaliza a Conexão
  Procedure SetOnBeforePost(Value : TOnEventDB);    //Seta o Evento de Before Post do Componente
  Procedure SetOnBeforeDelete(Value : TOnEventDB);  //Seta o Evento de Before Delete do Componente
  Procedure CreateParams;                           //Cria os Parametros na lista de Dataset
  Procedure SetDataBase(Value : TRESTDataBase);     //Diz o REST Database
  Procedure GetData;
 Public
  //Métodos
  Procedure   Open;                                 //Método Open que será utilizado no Componente
  Procedure   Close;                                //Método Close que será utilizado no Componente
  Procedure   ExecSQL;                              //Método ExecSQL que será utilizado no Componente
  Procedure   Commit;                               //Força a Gravação de Dados Online
  Function    ParamByName(Value : String) : TParam; //Retorna o Parametro de Acordo com seu nome
  Constructor Create(AOwner : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                     //Destroy a Classe
 Published
  Property OnBeforePost   : TOnEventDB         Read vOnBeforePost   Write SetOnBeforePost;   //Evento de Before Post, esse é essencial para o Componente
  Property OnBeforeDelete : TOnEventDB         Read vOnBeforeDelete Write SetOnBeforeDelete; //Evento de Before Delete, esse é essencial para o Componente
  Property OnGetDataError : TOnEventConnection Read vOnGetDataError Write vOnGetDataError;
  Property Active         : Boolean            Read vActive         Write SetActiveDB;       //Estado do Dataset
  Property AutoCommit     : Boolean            Read vAutoCommit     Write vAutoCommit;       //Se executa o Commit Automáticamente
  Property DataCache      : Boolean            Read vDataCache      Write vDataCache;        //Diz se será salvo o último Stream do Dataset
  Property Params         : TParams            Read vParams         Write vParams;           //Parametros de Dataset
  Property DataBase       : TRESTDataBase      Read vRESTDataBase   Write SetDataBase;       //Database REST do Dataset
  Property SQL            : TStringList        Read vSQL            Write SetSQL;            //SQL a ser Executado
End;

Type
 TRESTPoolerDB = Class(TComponent)
 Private
  Owner          : TComponent;
  FLock          : TCriticalSection;
  vFDConnection  : TFDConnection;
  vFDTransaction : TFDTransaction;
  Procedure CopyConnection(CopyDBConnection : TFDConnection;
                           Var DBConnection : TFDConnection;
                           Var WriteTrans   : TFDTransaction);
  Procedure SetConnection(Value : TFDConnection);
  Function  GetConnection : TFDConnection;
 Public
  Function ExecuteCommand(SQL        : String;
                          Var Error  : Boolean;
                          Var MessageError : String;
                          Execute    : Boolean = False) : TFDJSONDataSets;Overload;
  Function ExecuteCommand(SQL              : String;
                          Params           : TParams;
                          Var Error        : Boolean;
                          Var MessageError : String;
                          Execute          : Boolean = False) : TFDJSONDataSets;Overload;
 Published
  Property    Database : TFDConnection Read GetConnection Write SetConnection;
  Constructor Create(AOwner : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                     //Destroy a Classe
End;

implementation

Function  TRESTPoolerDB.GetConnection : TFDConnection;
Begin
 Result := vFDConnection;
End;

Procedure TRESTPoolerDB.SetConnection(Value : TFDConnection);
Begin
 If Value <> Nil Then
  CopyConnection(Value, vFDConnection, vFDTransaction)
 Else
  Begin
   if vFDConnection <> Nil then
    Begin
     vFDConnection.Close;
     vFDTransaction.DisposeOf;
     vFDConnection.DisposeOf;
    End;
  End;
End;

Procedure TRESTPoolerDB.CopyConnection(CopyDBConnection : TFDConnection;
                                       Var DBConnection : TFDConnection;
                                       Var WriteTrans   : TFDTransaction);
Var
 I : Integer;
Begin
 If CopyDBConnection <> Nil Then
  Begin
   DBConnection              := TFDConnection.Create(Nil);
   WriteTrans                := TFDTransaction.Create(Nil);
   DBConnection.LoginPrompt  := False;
   DBConnection.DriverName   := CopyDBConnection.DriverName;
   For I := 0 to CopyDBConnection.Params.Count -1 do
    DBConnection.Params.Add(CopyDBConnection.Params[I]);
   DBConnection.Transaction  := WriteTrans;
   WriteTrans.Connection     := DBConnection;
   Try
    DBConnection.Connected   := True;
   Except
   End;
  End;
End;

Function TRESTPoolerDB.ExecuteCommand(SQL        : String;
                                      Var Error  : Boolean;
                                      Var MessageError : String;
                                      Execute    : Boolean = False) : TFDJSONDataSets;
Var
 vTempQuery : TFDQuery;
 I          : Integer;
Begin
 Result := Nil;
 Error  := False;
 vTempQuery               := TFDQuery.Create(Owner);
 Try
  vTempQuery.Connection   := vFDConnection;
  vTempQuery.SQL.Clear;
  vTempQuery.SQL.Add(SQL);
  If Not Execute Then
   Begin
    vTempQuery.Active := True;
    Result            := TFDJSONDataSets.Create;
    TFDJSONDataSetsWriter.ListAdd(Result, vTempQuery);
   End
  Else
   Begin
    vTempQuery.ExecSQL;
    vFDConnection.CommitRetaining;
   End;
 Except
  On E : Exception do
   Begin
    Error := True;
    MessageError := E.Message;
   End;
 End;
End;

Function TRESTPoolerDB.ExecuteCommand(SQL        : String;
                                      Params     : TParams;
                                      Var Error  : Boolean;
                                      Var MessageError : String;
                                      Execute    : Boolean = False) : TFDJSONDataSets;
Var
 vTempQuery : TFDQuery;
 I          : Integer;
Begin
 Result := Nil;
 Error  := False;
 vTempQuery               := TFDQuery.Create(Owner);
 Try
  vTempQuery.Connection   := vFDConnection;
  vTempQuery.SQL.Clear;
  vTempQuery.SQL.Add(SQL);
  If Params <> Nil Then
   Begin
    For I := 0 To Params.Count -1 Do
     Begin
      If vTempQuery.ParamCount > I Then
       Begin
        If vTempQuery.ParamByName(Params[I].Name) <> Nil Then
         vTempQuery.ParamByName(Params[I].Name).Value := Params[I].Value;
       End
      Else
       Break;
     End;
   End;
  If Not Execute Then
   Begin
    vTempQuery.Active := True;
    Result            := TFDJSONDataSets.Create;
    TFDJSONDataSetsWriter.ListAdd(Result, vTempQuery);
   End
  Else
   Begin
    vTempQuery.ExecSQL;
    vFDConnection.CommitRetaining;
   End;
 Except
  On E : Exception do
   Begin
    Error := True;
    MessageError := E.Message;
   End;
 End;
End;

Constructor TRESTPoolerDB.Create(AOwner : TComponent);
Begin
 Inherited;
 Owner := aOwner;
 FLock := TCriticalSection.Create;
End;

Destructor  TRESTPoolerDB.Destroy;
Begin
 FLock.Release;
 FLock.DisposeOf;
 Inherited;
End;

Constructor TAutoCheckData.Create;
Begin
 Inherited;
 vAutoCheck := False;
 vInTime    := 1000;
 vEvent     := Nil;
 Timer      := Nil;
 FLock      := TCriticalSection.Create;
End;

Destructor  TAutoCheckData.Destroy;
Begin
 SetState(False);
 FLock.Release;
 FLock.DisposeOf;
 Inherited;
End;

Procedure  TAutoCheckData.SetState(Value : Boolean);
Begin
 vAutoCheck := Value;
 If vAutoCheck Then
  Begin
   If Timer <> Nil Then
    Begin
     Timer.Terminate;
     Timer := Nil;
    End;
   Timer              := TTimerData.Create(vInTime, FLock);
   Timer.OnEventTimer := vEvent;
  End
 Else
  Begin
   If Timer <> Nil Then
    Begin
     Timer.Terminate;
     Timer := Nil;
    End;
  End;
End;

Procedure  TAutoCheckData.SetInTime(Value : Integer);
Begin
 vInTime    := Value;
 SetState(vAutoCheck);
End;

Procedure  TAutoCheckData.SetEventTimer(Value : TOnEventTimer);
Begin
 vEvent := Value;
 SetState(vAutoCheck);
End;

Constructor TTimerData.Create(AValue: Integer; ALock: TCriticalSection);
Begin
 FValue := AValue;
 FLock := ALock;
 Inherited Create(False);
End;

Procedure TTimerData.Execute;
Begin
 While Not Terminated do
  Begin
   Sleep(FValue);
   FLock.Acquire;
   if Assigned(vEvent) then
    vEvent;
   FLock.Release;
  End;
End;

Constructor TProxyOptions.Create;
Begin
 Inherited;
 vServer   := '';
 vLogin    := vServer;
 vPassword := vLogin;
 vPort     := 8888;
End;

Procedure TRESTDataBase.SetConnectionOptions(Var Value : TDSRestConnection);
Begin
 Value                   := TDSRestConnection.Create(Owner);
 Value.PreserveSessionID := False;
 Value.Protocol          := 'http';
 Value.Host              := vRestWebService;
 Value.Port              := vPoolerPort;
 Value.UrlPath           := vRestURL;
 Value.UserName          := vLogin;
 Value.Password          := vPassword;
 if vProxy then
  Begin
   Value.ProxyHost     := vProxyOptions.vServer;
   Value.ProxyPort     := vProxyOptions.vPort;
   Value.ProxyUsername := vProxyOptions.vLogin;
   Value.ProxyPassword := vProxyOptions.vPassword;
  End
 Else
  Begin
   Value.ProxyHost     := '';
   Value.ProxyPort     := 0;
   Value.ProxyUsername := '';
   Value.ProxyPassword := '';
  End;
End;

Function TRESTDataBase.ExecuteCommand(Var SQL    : TStringList;
                                      Var Params : TParams;
                                      Var Error  : Boolean;
                                      Var MessageError : String;
                                      Execute    : Boolean = False) : TFDJSONDataSets;
Var
 I                 : Integer;
 vDSRConnection    : TDSRestConnection;
 vRESTConnectionDB : TSMPoolerMethodClient;
 Function GetLineSQL(Value : TStringList) : String;
 Var
  I : Integer;
 Begin
  Result := '';
  If Value <> Nil Then
   For I := 0 To Value.Count -1 do
    Begin
     If I = 0 then
      Result := Value[I]
     Else
      Result := Result + ' ' + Value[I];
    End;
 End;
Begin
 Result := Nil;
 SetConnectionOptions(vDSRConnection);
 vRESTConnectionDB := TSMPoolerMethodClient.Create(vDSRConnection, True);
 Try
  If Params.Count > 0 Then
   Result := vRESTConnectionDB.ExecuteCommand(vRestModule, GetLineSQL(SQL),
                                              Params, Error,
                                              MessageError, Execute)
  Else
   Result := vRESTConnectionDB.ExecuteCommandPure(vRestModule,
                                                  GetLineSQL(SQL), Error,
                                                  MessageError, Execute);
  If Assigned(vOnEventConnection) Then
   vOnEventConnection(True, 'ExecuteCommand Ok');
 Except
  On E : Exception do
   Begin
    vDSRConnection.SessionID := '';
    if Assigned(vOnEventConnection) then
     vOnEventConnection(False, E.Message);
   End;
 End;
 vDSRConnection.DisposeOf;
 vRESTConnectionDB.DisposeOf;
End;

Function TRESTDataBase.GetRestPoolers : TStringList;
Var
 I                 : Integer;
 vTempList         : TStringList;
 vDSRConnection    : TDSRestConnection;
 vRESTConnectionDB : TSMPoolerMethodClient;
Begin
 Result := Nil;
 SetConnectionOptions(vDSRConnection);
 vRESTConnectionDB := TSMPoolerMethodClient.Create(vDSRConnection, True);
 Try
  vTempList        := vRESTConnectionDB.PoolersDataSet(vRestModule);
  Result           := TStringList.Create;
  For I := 0 To vTempList.Count -1 do
   Result.Add(vTempList[I]);
  If Assigned(vOnEventConnection) Then
   vOnEventConnection(True, 'GetRestPoolers Ok');
 Except
  On E : Exception do
   Begin
    vDSRConnection.SessionID := '';
    if Assigned(vOnEventConnection) then
     vOnEventConnection(False, E.Message);
   End;
 End;
 vDSRConnection.DisposeOf;
 vRESTConnectionDB.DisposeOf;
End;

Constructor TRESTDataBase.Create(AOwner : TComponent);
Begin
 Inherited;
 Owner                     := AOwner;
 vLogin                    := '';
 vMyIP                     := '0.0.0.0';
 vPassword                 := vLogin;
 vRestModule               := 'TServerMethods1';
 vRestPooler               := vPassword;
 vPoolerPort               := 8081;
 vProxy                    := False;
 vProxyOptions             := TProxyOptions.Create;
 vAutoCheckData            := TAutoCheckData.Create;
 vAutoCheckData.vAutoCheck := False;
 vAutoCheckData.vEvent     := CheckConnection;
End;

Destructor  TRESTDataBase.Destroy;
Begin
 vAutoCheckData.vAutoCheck := False;
 vProxyOptions.DisposeOf;
 vAutoCheckData.DisposeOf;
 Inherited;
End;

Procedure TRESTDataBase.CheckConnection;
Begin
 vConnected := TryConnect;
End;

Function  TRESTDataBase.TryConnect : Boolean;
Var
 vTempResult       : String;
 vDSRConnection    : TDSRestConnection;
 vRESTConnectionDB : TSMPoolerMethodClient;
Begin
 Result := False;
 SetConnectionOptions(vDSRConnection);
 vRESTConnectionDB := TSMPoolerMethodClient.Create(vDSRConnection, True);
 Try
  vTempResult := vRESTConnectionDB.EchoPooler('ping', vRestModule);
  vMyIP       := vTempResult;
  Result      := True;
  If Assigned(vOnEventConnection) Then
   vOnEventConnection(True, 'TryConnect Ok');
 Except
  On E : Exception do
   Begin
    vDSRConnection.SessionID := '';
    if Assigned(vOnEventConnection) then
     vOnEventConnection(False, E.Message);
   End;
 End;
 vDSRConnection.DisposeOf;
 vRESTConnectionDB.DisposeOf;
End;

Procedure TRESTDataBase.SetConnection(Value : Boolean);
Begin
 vConnected := Value;
 if vConnected then
  vConnected := TryConnect;
End;

Procedure TRESTDataBase.SetPoolerPort(Value : Integer);
Begin
 vPoolerPort := Value;
End;

Procedure TRESTDataBase.SetRestPooler(Value : String);
Begin
 vRestPooler := Value;
End;

Procedure TRESTClientSQL.SetDataBase(Value : TRESTDataBase);
Begin
 if Value is TRESTDataBase then
  vRESTDataBase := Value;
End;

Constructor TRESTClientSQL.Create(AOwner : TComponent);
Begin
 Inherited;
 Owner           := AOwner;
 vAutoCommit     := True;
 vDataCache      := False;
 vConnectedOnce  := True;
 vActive         := False;
 vSQL            := TStringList.Create;
 vParams         := TParams.Create(Self);
 vCacheDataDB    := Self.CloneSource;
End;

Destructor  TRESTClientSQL.Destroy;
Begin
 vSQL.DisposeOf;
 vParams.DisposeOf;
 If vCacheDataDB <> Nil Then
  vCacheDataDB.DisposeOf;
 Inherited;
End;

Procedure TRESTClientSQL.CreateParams;
Begin

End;

Function  TRESTClientSQL.ParamByName(Value : String) : TParam;
Begin
 Result := Nil;

End;

Procedure TRESTClientSQL.SetOnBeforePost(Value : TOnEventDB);
Begin

End;

Procedure TRESTClientSQL.SetOnBeforeDelete(Value : TOnEventDB);
Begin

End;

Function  TRESTClientSQL.NegociateTransaction : Boolean;
Begin
 Result := False;

End;

Function  TRESTClientSQL.CreateOnlineConnection : Boolean;
Begin
 Result := False;

End;

{
Procedure TRESTClientSQL.ReleaseConnection;
Begin

End;
}

Procedure TRESTClientSQL.Commit;
Begin

End;

Procedure TRESTClientSQL.ExecSQL;
Begin

End;

Procedure TRESTClientSQL.SetSQL(Value : TStringList);
Var
 I : Integer;
Begin
 vSQL.Clear;
 For I := 0 To Value.Count -1 do
  vSQL.Add(Value[I]);
 CreateParams;
End;

Procedure TRESTClientSQL.Close;
Begin
 TFDMemTable(Self).Close;
End;

Procedure TRESTClientSQL.Open;
Begin
 TFDMemTable(Self).Open;
End;

Procedure TRESTClientSQL.GetData;
Var
 LDataSetList  : TFDJSONDataSets;
 vError        : Boolean;
 vMessageError : String;
Begin
 Close;
 If Assigned(vRESTDataBase) Then
  Begin
   Try
    LDataSetList := vRESTDataBase.ExecuteCommand(vSQL, vParams, vError, vMessageError, False);
    if LDataSetList <> Nil then
     Begin
      Self.Close;
      Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);
      AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
     End;
    If Assigned(vOnGetDataError) Then
     vOnGetDataError(True, '');
   Except
    On E : Exception do
     Begin
      if Assigned(vOnGetDataError) then
       vOnGetDataError(False, E.Message);
     End;
   End;
  End;
End;

Procedure TRESTClientSQL.SetActiveDB(Value : Boolean);
Begin
 vActive := False;
 If Value Then
  Begin
   Try
    GetData;
    vActive := True;
   Except

   End;
  End
 Else
  Close;
End;

end.
