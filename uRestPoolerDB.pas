{
 Esse pacote de Componentes foi desenhado com o Objetivo de ajudar as pessoas a desenvolverem
com WebServices REST o mais próximo possível do desenvolvimento local DB, com componentes de
fácil configuração para que todos tenham acesso as maravilhas dos WebServices REST/JSON DataSnap.

Desenvolvedor Principal : Gilberto Rocha da Silva (XyberX)
Empresa : XyberPower Desenvolvimento
}

unit uRestPoolerDB;

interface

uses System.SysUtils,         System.Classes,
     FireDAC.Stan.Intf,       FireDAC.Stan.Option,     FireDAC.Stan.Param,
     FireDAC.Stan.Error,      FireDAC.DatS,            FireDAC.Stan.Async,
     FireDAC.DApt,            FireDAC.UI.Intf,         FireDAC.Stan.Def,
     FireDAC.Stan.Pool,       FireDAC.Comp.Client,     FireDAC.Comp.UI,
     FireDAC.Comp.DataSet,    System.JSON,             FireDAC.DApt.Intf,
     Data.DB,                 Data.FireDACJSONReflect, Data.DBXJSONReflect,
     IPPeerClient,            Datasnap.DSClientRest,   System.SyncObjs,
     uPoolerMethod,           FireDAC.Stan.StorageBin, Data.DBXPlatform,
     FireDAC.Stan.StorageJSON {$IFDEF MSWINDOWS},      Datasnap.DSServer,
     Datasnap.DSAuth,         Datasnap.DSProxyRest{$ENDIF},
     Soap.EncdDecd,           System.NetEncoding,      DesignEditors,
     DesignIntf;

Type
 TOnEventDB = Procedure (DataSet: TDataSet) of Object;

Type
 TExecuteProc       = Reference to Procedure;

Type
 TOnEventConnection = Procedure (Sucess : Boolean; Const Error : String) of Object;

Type
 TOnEventBeforeConnection = Procedure (Sender : TComponent) of Object;

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
 TAutoCheckData = Class(TPersistent)
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
  Procedure   Assign(Source : TPersistent); Override;
 Published
  Property AutoCheck    : Boolean       Read vAutoCheck Write SetState;      //Se tem Autochecagem
  Property InTime       : Integer       Read vInTime    Write SetInTime;     //Em milisegundos o timer
  Property OnEventTimer : TOnEventTimer Read vEvent     Write SetEventTimer; //Evento a executar
End;

Type
 TProxyOptions = Class(TPersistent)
 Private
  vServer,              //Servidor Proxy na Rede
  vLogin,               //Login do Servidor Proxy
  vPassword : String;   //Senha do Servidor Proxy
  vPort     : Integer;  //Porta do Servidor Proxy
 Public
  Constructor Create;
  Procedure   Assign(Source : TPersistent); Override;
 Published
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
  vConnected           : Boolean;                    //Diz o Estado da Conexão
  vOnEventConnection   : TOnEventConnection;         //Evento de Estado da Conexão
  vOnBeforeConnection  : TOnEventBeforeConnection;   //Evento antes de Connectar o Database
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
  Procedure ApplyUpdates(Var SQL          : TStringList;
                         Var Params       : TParams;
                         ADeltaList       : TFDJSONDeltas;
                         TableName        : String;
                         Var Error        : Boolean;
                         Var MessageError : String);
  Function InsertMySQLReturnID(Var SQL          : TStringList;
                               Var Params       : TParams;
                               Var Error        : Boolean;
                               Var MessageError : String) : Integer;
 Public
  Function    GetRestPoolers : TStringList;          //Retorna a Lista de DataSet Sources do Pooler
  Constructor Create(AOwner  : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                      //Destroy a Classe
 Published
  Property OnConnection       : TOnEventConnection       Read vOnEventConnection  Write vOnEventConnection; //Evento relativo a tudo que acontece quando tenta conectar ao Servidor
  Property OnBeforeConnect    : TOnEventBeforeConnection Read vOnBeforeConnection Write vOnBeforeConnection; //Evento antes de Connectar o Database
  Property Active             : Boolean                  Read vConnected          Write SetConnection;      //Seta o Estado da Conexão
  Property MyIP               : String                   Read vMyIP;
  Property Login              : String                   Read vLogin              Write vLogin;             //Login do Usuário caso haja autenticação
  Property Password           : String                   Read vPassword           Write vPassword;          //Senha do Usuário caso haja autenticação
  Property Proxy              : Boolean                  Read vProxy              Write vProxy;             //Diz se tem servidor Proxy
  Property ProxyOptions       : TProxyOptions            Read vProxyOptions       Write vProxyOptions;      //Se tem Proxy diz quais as opções
  Property PoolerService      : String                   Read vRestWebService     Write vRestWebService;    //Host do WebService REST
  Property PoolerURL          : String                   Read vRestURL            Write vRestURL;           //URL do WebService REST
  Property PoolerPort         : Integer                  Read vPoolerPort         Write SetPoolerPort;      //A Porta do Pooler do DataSet
  Property PoolerName         : String                   Read vRestPooler         Write SetRestPooler;      //Qual o Pooler de Conexão ligado ao componente
  Property RestModule         : String                   Read vRestModule         Write vRestModule;        //Classe do Servidor REST Principal
  Property StateConnection    : TAutoCheckData           Read vAutoCheckData      Write vAutoCheckData;     //Autocheck da Conexão
End;

Type
 TPoolersList = Class(TStringProperty)
 Public
  Function  GetAttributes  : TPropertyAttributes; Override;
  Procedure GetValues(Proc : TGetStrProc);        Override;
  Procedure Edit;                                 Override;
End;

Type
 TRESTClientSQL   = Class(TFDMemTable)              //Classe com as funcionalidades de um DBQuery
 Private
  Owner               : TComponent;
  vUpdateTableName    : String;                     //Tabela que será feito Update no Servidor se for usada Reflexão de Dados
  vDataCache,                                       //Se usa cache local
  vConnectedOnce,                                   //Verifica se foi conectado ao Servidor
  vCommitUpdates,
  vErrorBefore,
  vActive              : Boolean;                   //Estado do Dataset
  vSQL                 : TStringList;               //SQL a ser utilizado na conexão
  vParams              : TParams;                 //Parametros de Dataset
  vCacheDataDB         : TFDDataset;                //O Cache de Dados Salvo para utilização rápida
  vOnGetDataError      : TOnEventConnection;        //Se deu erro na hora de receber os dados ou não
  vRESTDataBase        : TRESTDataBase;             //RESTDataBase do Dataset
  vOnAfterDelete,
  vOnAfterPost         : TDataSetNotifyEvent;
  Procedure CloneDefinitions(Source : TFDMemTable;
                             aSelf  : TRESTClientSQL); //Fields em Definições
  Procedure OnChangingSQL(Sender: TObject);         //Quando Altera o SQL da Lista
  Procedure SetActiveDB(Value : Boolean);           //Seta o Estado do Dataset
  Procedure SetSQL(Value : TStringList);            //Seta o SQL a ser usado
  Procedure CreateParams;                           //Cria os Parametros na lista de Dataset
  Procedure SetDataBase(Value : TRESTDataBase);     //Diz o REST Database
  Function  GetData : Boolean;                      //Recebe os Dados da Internet vindo do Servidor REST
  Procedure SetUpdateTableName(Value : String);     //Diz qual a tabela que será feito Update no Banco
  Procedure OldAfterPost(DataSet: TDataSet);        //Eventos do Dataset para realizar o AfterPost
  Procedure OldAfterDelete(DataSet: TDataSet);      //Eventos do Dataset para realizar o AfterDelete
 Protected
  Function CanObserve(const ID: Integer): Boolean; Override;                       { declaration is in System.Classes }
 Public
  //Métodos
  Procedure   Open;                                 //Método Open que será utilizado no Componente
  Procedure   Close;                                //Método Close que será utilizado no Componente
  Procedure   ExecSQL;                              //Método ExecSQL que será utilizado no Componente
  Function    InsertMySQLReturnID : Integer;        //Método de ExecSQL com retorno de Incremento
  Function    ParamByName(Value : String) : TParam; //Retorna o Parametro de Acordo com seu nome
  Function    ApplyUpdates(var Error : String) : Boolean;
  Constructor Create(AOwner : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                     //Destroy a Classe
  Procedure   Loaded; Override;
  {$IFDEF FMX} //Se é FMX
  {$ENDIF}
 Published
  Property AfterDelete     : TDataSetNotifyEvent Read vOnAfterDelete            Write vOnAfterDelete;
  Property AfterPost       : TDataSetNotifyEvent Read vOnAfterPost              Write vOnAfterPost;
  Property OnGetDataError  : TOnEventConnection  Read vOnGetDataError           Write vOnGetDataError;         //Recebe os Erros de ExecSQL ou de GetData
  Property Active          : Boolean             Read vActive                   Write SetActiveDB;             //Estado do Dataset
  Property DataCache       : Boolean             Read vDataCache                Write vDataCache;              //Diz se será salvo o último Stream do Dataset
  Property Params          : TParams             Read vParams                   Write vParams;                 //Parametros de Dataset
  Property DataBase        : TRESTDataBase       Read vRESTDataBase             Write SetDataBase;             //Database REST do Dataset
  Property SQL             : TStringList         Read vSQL                      Write SetSQL;                  //SQL a ser Executado
  Property UpdateTableName : String              Read vUpdateTableName          Write SetUpdateTableName;      //Tabela que será usada para Reflexão de Dados
End;


Type
 TRESTPoolerList = Class(TComponent)
 Private
  Owner                : TComponent;                 //Proprietario do Componente
  vPoolerPrefix,                                     //Prefixo do WS
  vLogin,                                            //Login do Usuário caso haja autenticação
  vPassword,                                         //Senha do Usuário caso haja autenticação
  vRestWebService,                                   //Rest WebService para consultas
  vRestURL             : String;                     //Qual o Pooler de Conexão do DataSet
  vPoolerPort          : Integer;                    //A Porta do Pooler
  vConnected,
  vProxy               : Boolean;                    //Diz se tem servidor Proxy
  vProxyOptions        : TProxyOptions;              //Se tem Proxy diz quais as opções
  vPoolerList          : TStringList;
  Procedure SetConnection(Value : Boolean);          //Seta o Estado da Conexão
  Procedure SetPoolerPort(Value : Integer);          //Seta a Porta do Pooler a ser usada
  Function  TryConnect : Boolean;                    //Tenta Conectar o Servidor para saber se posso executar comandos
  Procedure SetConnectionOptions(Var Value : TDSRestConnection); //Seta as Opções de Conexão
 Public
  Constructor Create(AOwner  : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                      //Destroy a Classe
 Published
  Property Active             : Boolean                  Read vConnected          Write SetConnection;      //Seta o Estado da Conexão
  Property Login              : String                   Read vLogin              Write vLogin;             //Login do Usuário caso haja autenticação
  Property Password           : String                   Read vPassword           Write vPassword;          //Senha do Usuário caso haja autenticação
  Property Proxy              : Boolean                  Read vProxy              Write vProxy;             //Diz se tem servidor Proxy
  Property ProxyOptions       : TProxyOptions            Read vProxyOptions       Write vProxyOptions;      //Se tem Proxy diz quais as opções
  Property PoolerService      : String                   Read vRestWebService     Write vRestWebService;    //Host do WebService REST
  Property PoolerURL          : String                   Read vRestURL            Write vRestURL;           //URL do WebService REST
  Property PoolerPort         : Integer                  Read vPoolerPort         Write SetPoolerPort;      //A Porta do Pooler do DataSet
  Property PoolerPrefix       : String                   Read vPoolerPrefix       Write vPoolerPrefix;      //Prefixo do WebService REST
  Property Poolers            : TStringList              Read vPoolerList;
End;

{$IFDEF MSWINDOWS}
Type
 TRESTPoolerDBP = ^TComponent;
 TRESTPoolerDB  = Class(TComponent)
 Private
  Owner          : TComponent;
  FLock          : TCriticalSection;
  vFDConnectionBack,
  vFDConnection  : TFDConnection;
  Procedure SetConnection(Value : TFDConnection);
  Function  GetConnection : TFDConnection;
 Public
  Procedure ApplyChanges(TableName,
                         SQL        : String;
                         Params     : TParams;
                         Var Error  : Boolean;
                         Var MessageError : String;
                         Const ADeltaList: TFDJSONDeltas);Overload;
  Procedure ApplyChanges(TableName,
                         SQL        : String;
                         Var Error  : Boolean;
                         Var MessageError : String;
                         Const ADeltaList: TFDJSONDeltas);Overload;
  Function ExecuteCommand(SQL        : String;
                          Var Error  : Boolean;
                          Var MessageError : String;
                          Execute    : Boolean = False) : TFDJSONDataSets;Overload;
  Function ExecuteCommand(SQL              : String;
                          Params           : TParams;
                          Var Error        : Boolean;
                          Var MessageError : String;
                          Execute          : Boolean = False) : TFDJSONDataSets;Overload;
  Function InsertMySQLReturnID(SQL              : String;
                               Var Error        : Boolean;
                               Var MessageError : String) : Integer;Overload;
  Function InsertMySQLReturnID(SQL              : String;
                               Params           : TParams;
                               Var Error        : Boolean;
                               Var MessageError : String) : Integer;Overload;
 Published
  Property    Database : TFDConnection Read GetConnection Write SetConnection;
  Constructor Create(AOwner : TComponent);Override; //Cria o Componente
  Destructor  Destroy;Override;                     //Destroy a Classe
End;
{$ENDIF}

Procedure Register;

implementation

{$IFDEF MSWINDOWS}
Procedure Register;
Begin
 RegisterComponents('REST Dataware',     [TRESTPoolerDB, TRESTDataBase, TRESTClientSQL, TRESTPoolerList]);
 RegisterPropertyEditor(TypeInfo(String), TRESTDataBase, 'PoolerName', TPoolersList);
End;
{$ENDIF}
{$IFNDEF MSWINDOWS}
Procedure Register;
Begin
 RegisterComponents('REST Dataware',      [TRESTDataBase, TRESTClientSQL, TRESTPoolerList]);
 RegisterPropertyEditor(TypeInfo(String),  TRESTDataBase, 'PoolerName',  TPoolersList);
End;
{$ENDIF}

Function EncodeStrings(Value : String) : String;
Var
 Input,
 Output : TStringStream;
Begin
 Input := TStringStream.Create(Value, TEncoding.ASCII);
 Try
  Input.Position := 0;
  Output := TStringStream.Create('', TEncoding.ASCII);
  Try
   Soap.EncdDecd.EncodeStream(Input, Output);
   Result := Output.DataString;
  Finally
   Output.Free;
  End;
 Finally
  Input.Free;
 End;
End;

Function DecodeStrings(Value : String) : String;
Var
 Input,
 Output : TStringStream;
Begin
 If Length(Value) > 0 Then
  Begin
   Input := TStringStream.Create(Value, TEncoding.ASCII);
   Try
    Output := TStringStream.Create('', TEncoding.ASCII);
    Try
     Soap.EncdDecd.DecodeStream(Input, Output);
     Output.Position := 0;
     Try
      Result := Output.DataString;
     Except
      Raise;
     End;
    Finally
     Output.Free;
    End;
   Finally
    Input.Free;
   End;
  End;
End;

Procedure TAutoCheckData.Assign(Source: TPersistent);
Var
 Src : TAutoCheckData;
Begin
 If Source is TAutoCheckData Then
  Begin
   Src        := TAutoCheckData(Source);
   vAutoCheck := Src.AutoCheck;
   vInTime    := Src.InTime;
//   vEvent     := Src.OnEventTimer;
  End
 Else
  Inherited;
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

{$IFDEF MSWINDOWS}
Function  TRESTPoolerDB.GetConnection : TFDConnection;
Begin
 Result := vFDConnectionBack;
End;

Procedure TRESTPoolerDB.SetConnection(Value : TFDConnection);
Begin
 vFDConnectionBack := Value;
 If Value <> Nil Then
  vFDConnection     := vFDConnectionBack
 Else
  Begin
   If vFDConnection <> Nil Then
    vFDConnection.Close;
  End;
End;

Function TRESTPoolerDB.InsertMySQLReturnID(SQL              : String;
                                           Var Error        : Boolean;
                                           Var MessageError : String) : Integer;
Var
 oTab        : TFDDatStable;
 A, I        : Integer;
 fdCommand   : TFDCommand;
Begin
 Result := -1;
 Error  := False;
 fdCommand := TFDCommand.Create(Owner);
 Try
  fdCommand.Connection := vFDConnection;
  fdCommand.CommandText.Clear;
  fdCommand.CommandText.Add(DecodeStrings(SQL) + '; SELECT LAST_INSERT_ID()ID');
  fdCommand.Open;
  oTab := fdCommand.Define;
  fdCommand.Fetch(oTab, True);
  If oTab.Rows.Count > 0 Then
   Result := StrToInt(oTab.Rows[0].AsString['ID']);
  vFDConnection.CommitRetaining;
 Except
  On E : Exception do
   Begin
    vFDConnection.RollbackRetaining;
    Error        := True;
    MessageError := E.Message;
   End;
 End;
 fdCommand.Close;
 FreeAndNil(fdCommand);
 FreeAndNil(oTab);
 GetInvocationMetaData.CloseSession := True;
End;

Function TRESTPoolerDB.InsertMySQLReturnID(SQL              : String;
                                           Params           : TParams;
                                           Var Error        : Boolean;
                                           Var MessageError : String) : Integer;
Var
 oTab        : TFDDatStable;
 A, I        : Integer;
 vParamName  : String;
 fdCommand   : TFDCommand;
 Function GetParamIndex(Params : TFDParams; ParamName : String) : Integer;
 Var
  I : Integer;
 Begin
  Result := -1;
  For I := 0 To Params.Count -1 Do
   Begin
    If UpperCase(Params[I].Name) = UpperCase(ParamName) Then
     Begin
      Result := I;
      Break;
     End;
   End;
 End;
Begin
 Result := -1;
 Error  := False;
 fdCommand := TFDCommand.Create(Owner);
 Try
  fdCommand.Connection := vFDConnection;
  fdCommand.CommandText.Clear;
  fdCommand.CommandText.Add(DecodeStrings(SQL) + '; SELECT LAST_INSERT_ID()ID');
  If Params <> Nil Then
   Begin
    For I := 0 To Params.Count -1 Do
     Begin
      If fdCommand.Params.Count > I Then
       Begin
        vParamName := Copy(StringReplace(Params[I].Name, ',', '', []), 1, Length(Params[I].Name));
        A          := GetParamIndex(fdCommand.Params, vParamName);
        If A > -1 Then
         fdCommand.Params[A].Value := Params[I].Value;
       End
      Else
       Break;
     End;
   End;
  fdCommand.Open;
  oTab := fdCommand.Define;
  fdCommand.Fetch(oTab, True);
  If oTab.Rows.Count > 0 Then
   Result := StrToInt(oTab.Rows[0].AsString['ID']);
  vFDConnection.CommitRetaining;
 Except
  On E : Exception do
   Begin
    vFDConnection.RollbackRetaining;
    Error        := True;
    MessageError := E.Message;
   End;
 End;
 fdCommand.Close;
 FreeAndNil(fdCommand);
 FreeAndNil(oTab);
 GetInvocationMetaData.CloseSession := True;
End;

Function TRESTPoolerDB.ExecuteCommand(SQL        : String;
                                      Var Error  : Boolean;
                                      Var MessageError : String;
                                      Execute    : Boolean = False) : TFDJSONDataSets;
Var
 vTempQuery  : TFDQuery;
 vTempWriter : TFDJSONDataSetsWriter;
Begin
 Result := Nil;
 Error  := False;
 vTempQuery               := TFDQuery.Create(Owner);
 Try
  vTempQuery.Connection   := vFDConnection;
  vTempQuery.SQL.Clear;
  vTempQuery.SQL.Add(DecodeStrings(SQL));
  If Not Execute Then
   Begin
//    vTempQuery.Active := True;
    Result            := TFDJSONDataSets.Create;
    vTempWriter       := TFDJSONDataSetsWriter.Create(Result);
    Try
     vTempWriter.ListAdd(Result, vTempQuery);
    Finally
     vTempWriter := Nil;
     vTempWriter.DisposeOf;
    End;
   End
  Else
   Begin
    vTempQuery.ExecSQL;
    vFDConnection.CommitRetaining;
   End;
 Except
  On E : Exception do
   Begin
    vFDConnection.RollbackRetaining;
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
 vTempQuery  : TFDQuery;
 A, I        : Integer;
 vTempWriter : TFDJSONDataSetsWriter;
 vParamName  : String;
// vLogErro    : TStringList;
 Function GetParamIndex(Params : TFDParams; ParamName : String) : Integer;
 Var
  I : Integer;
 Begin
  Result := -1;
  For I := 0 To Params.Count -1 Do
   Begin
    If UpperCase(Params[I].Name) = UpperCase(ParamName) Then
     Begin
      Result := I;
      Break;
     End;
   End;
 End;
Begin
 Result := Nil;
 Error  := False;
 vTempQuery               := TFDQuery.Create(Owner);
 Try
  vTempQuery.Connection   := vFDConnection;
  vTempQuery.SQL.Clear;
  vTempQuery.SQL.Add(DecodeStrings(SQL));
  If Params <> Nil Then
   Begin
    For I := 0 To Params.Count -1 Do
     Begin
      If vTempQuery.ParamCount > I Then
       Begin
        vParamName := Copy(StringReplace(Params[I].Name, ',', '', []), 1, Length(Params[I].Name));
        A          := GetParamIndex(vTempQuery.Params, vParamName);
        If A > -1 Then//vTempQuery.ParamByName(vParamName) <> Nil Then
         vTempQuery.Params[A].Value := Params[I].Value;
       End
      Else
       Break;
     End;
   End;
  If Not Execute Then
   Begin
//    vTempQuery.Active := True;
    Result            := TFDJSONDataSets.Create;
    vTempWriter       := TFDJSONDataSetsWriter.Create(Result);
    Try
     vTempWriter.ListAdd(Result, vTempQuery);
    Finally
     vTempWriter := Nil;
     vTempWriter.DisposeOf;
    End;
   End
  Else
   Begin
    vTempQuery.ExecSQL;
    vFDConnection.CommitRetaining;
   End;
 Except
  On E : Exception do
   Begin
    vFDConnection.RollbackRetaining;
    Error := True;
    MessageError := E.Message;
{
    vLogErro := TStringList.Create;
    vLogErro.Add(MessageError);
    vLogErro.SaveToFile(ExtractFilePath(ParamSTR(0)) + '..\LogErr.Text');
    vLogErro.DisposeOf;
}
   End;
 End;
 GetInvocationMetaData.CloseSession := True;
End;

Procedure TRESTPoolerDB.ApplyChanges(TableName,
                                     SQL              : String;
                                     Var Error        : Boolean;
                                     Var MessageError : String;
                                     Const ADeltaList : TFDJSONDeltas);
Var
 vTempQuery : TFDQuery;
 LApply     : IFDJSONDeltasApplyUpdates;
begin
 Error                    := False;
 vTempQuery               := TFDQuery.Create(Owner);
 vTempQuery.CachedUpdates := True;
 Try
  vTempQuery.Connection   := vFDConnection;
  vTempQuery.SQL.Clear;
  vTempQuery.SQL.Add(DecodeStrings(SQL));
  vTempQuery.Active := True;
 Except
  On E : Exception do
   Begin
    Error := True;
    MessageError := E.Message;
    vTempQuery.DisposeOf;
    Exit;
   End;
 End;
 LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
 vTempQuery.UpdateOptions.UpdateTableName := TableName;
 Try
  LApply.ApplyUpdates(0,  vTempQuery.Command);
 Except

 End;
 If LApply.Errors.Count > 0 then
  Begin
   Error := True;
   MessageError := LApply.Errors.Strings.Text;
  End;
 If Not Error Then
  Begin
   Try
    Database.CommitRetaining;
   Except
    On E : Exception do
     Begin
      Database.RollbackRetaining;
      Error := True;
      MessageError := E.Message;
     End;
   End;
  End;
 vTempQuery.DisposeOf;
end;

Procedure TRESTPoolerDB.ApplyChanges(TableName,
                                     SQL              : String;
                                     Params           : TParams;
                                     Var Error        : Boolean;
                                     Var MessageError : String;
                                     Const ADeltaList : TFDJSONDeltas);
Var
 I          : Integer;
 vTempQuery : TFDQuery;
 LApply     : IFDJSONDeltasApplyUpdates;
begin
 Error  := False;
 vTempQuery               := TFDQuery.Create(Owner);
 vTempQuery.CachedUpdates := True;
 Try
  vTempQuery.Connection   := vFDConnection;
  vTempQuery.SQL.Clear;
  vTempQuery.SQL.Add(DecodeStrings(SQL));
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
  vTempQuery.Active := True;
 Except
  On E : Exception do
   Begin
    Error := True;
    MessageError := E.Message;
    vTempQuery.DisposeOf;
    Exit;
   End;
 End;
 LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
 vTempQuery.UpdateOptions.UpdateTableName := TableName;
 Try
//  If Database.Transaction <> Nil Then
//   Database.Transaction.StartTransaction;
  LApply.ApplyUpdates(0,  vTempQuery.Command);
 Except

 End;
 If LApply.Errors.Count > 0 then
  Begin
   Error := True;
   MessageError := LApply.Errors.Strings.Text;
  End;
 Try
 // If Database.Transaction <> Nil Then
//   Database.Transaction.Commit
//  Else
  Database.CommitRetaining;
 Except
  On E : Exception do
   Begin
 //   If Database.Transaction <> Nil Then
 //    Database.Transaction.Rollback
 //   Else
    Database.RollbackRetaining;
    Error := True;
    MessageError := E.Message;
   End;
 End;
 vTempQuery.DisposeOf;
end;

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
{$ENDIF}

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

Procedure TRESTPoolerList.SetConnectionOptions(Var Value : TDSRestConnection);
Begin
 Value                   := TDSRestConnection.Create(Nil);
 Value.LoginPrompt       := False;
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

Procedure TRESTDataBase.SetConnectionOptions(Var Value : TDSRestConnection);
Begin
 Value                   := TDSRestConnection.Create(Nil);
 Value.LoginPrompt       := False;
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

Procedure TRESTDataBase.ApplyUpdates(Var SQL          : TStringList;
                                     Var Params       : TParams;
                                     ADeltaList       : TFDJSONDeltas;
                                     TableName        : String;
                                     Var Error        : Boolean;
                                     Var MessageError : String);
Var
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
 if vRestPooler = '' then
  Exit;
 SetConnectionOptions(vDSRConnection);
 vRESTConnectionDB := TSMPoolerMethodClient.Create(vDSRConnection, True);
 Try
  If Params.Count > 0 Then
   vRESTConnectionDB.ApplyChanges(vRestPooler,
                                  vRestModule,
                                  TableName,
                                  GetLineSQL(SQL),
                                  Params,
                                  ADeltaList,
                                  Error,
                                  MessageError)
  Else
   vRESTConnectionDB.ApplyChangesPure(vRestPooler,
                                      vRestModule,
                                      TableName,
                                      GetLineSQL(SQL),
                                      ADeltaList,
                                      Error,
                                      MessageError);
  If Assigned(vOnEventConnection) Then
   vOnEventConnection(True, 'ApplyUpdates Ok')
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

Function TRESTDataBase.InsertMySQLReturnID(Var SQL          : TStringList;
                                           Var Params       : TParams;
                                           Var Error        : Boolean;
                                           Var MessageError : String) : Integer;
Var
 vDSRConnection    : TDSRestConnection;
 vRESTConnectionDB : TSMPoolerMethodClient;
 oJsonObject       : Integer;
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
 Result := -1;
 Error  := False;
 if vRestPooler = '' then
  Exit;
 SetConnectionOptions(vDSRConnection);
 vRESTConnectionDB := TSMPoolerMethodClient.Create(vDSRConnection, True);
 Try
  If Params.Count > 0 Then
   oJsonObject := vRESTConnectionDB.InsertValue(vRestPooler,
                                                vRestModule,
                                                GetLineSQL(SQL),
                                                Params,
                                                Error, MessageError)
  Else
   oJsonObject := vRESTConnectionDB.InsertValuePure(vRestPooler,
                                                    vRestModule,
                                                    GetLineSQL(SQL),
                                                    Error, MessageError);
  Result := oJsonObject;
  If Assigned(vOnEventConnection) Then
   vOnEventConnection(True, 'ExecuteCommand Ok');
 Except
  On E : Exception do
   Begin
    vDSRConnection.SessionID := '';
    Error                    := True;
    MessageError             := E.Message;
    if Assigned(vOnEventConnection) then
     vOnEventConnection(False, E.Message);
   End;
 End;
 vDSRConnection.DisposeOf;
 vRESTConnectionDB.DisposeOf;
End;

Function TRESTDataBase.ExecuteCommand(Var SQL    : TStringList;
                                      Var Params : TParams;
                                      Var Error  : Boolean;
                                      Var MessageError : String;
                                      Execute    : Boolean = False) : TFDJSONDataSets;
Var
 vDSRConnection    : TDSRestConnection;
 vRESTConnectionDB : TSMPoolerMethodClient;
 oJsonObject       : TJSONObject;
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
 if vRestPooler = '' then
  Exit;
 SetConnectionOptions(vDSRConnection);
 vRESTConnectionDB := TSMPoolerMethodClient.Create(vDSRConnection, True);
 Try
  If Params.Count > 0 Then
   oJsonObject := vRESTConnectionDB.ExecuteCommandJSON(vRestPooler,
                                                       vRestModule, GetLineSQL(SQL),
                                                       Params, Error,
                                                       MessageError, Execute)
  Else
   oJsonObject := vRESTConnectionDB.ExecuteCommandPureJSON(vRestPooler,
                                                           vRestModule,
                                                           GetLineSQL(SQL), Error,
                                                           MessageError, Execute);
  Result := TFDJSONDataSets.Create;
  If (oJsonObject <> Nil) Then
   TFDJSONInterceptor.JSONObjectToDataSets(oJsonObject, Result);
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

Constructor TRESTPoolerList.Create(AOwner : TComponent);
Begin
 Inherited;
 Owner                     := AOwner;
 vLogin                    := '';
 vPassword                 := vLogin;
 vPoolerPort               := 8082;
 vProxy                    := False;
 vProxyOptions             := TProxyOptions.Create;
 vPoolerList               := TStringList.Create;
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
 vAutoCheckData.vInTime    := 1000;
 vAutoCheckData.vEvent     := CheckConnection;
End;

Destructor  TRESTPoolerList.Destroy;
Begin
 vProxyOptions.DisposeOf;
 If vPoolerList <> Nil Then
  vPoolerList.DisposeOf;
 Inherited;
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

procedure TPoolersList.Edit;
Var
 vTempData : String;
Begin
 Inherited Edit;
 Try
  vTempData := GetValue;
  SetValue(vTempData);
 Finally
 End;
end;

Procedure TPoolersList.GetValues(Proc : TGetStrProc);
Var
 vLista : TStringList;
 I      : Integer;
Begin
 //Provide a list of Poolers
 With GetComponent(0) as TRESTDataBase Do
  Begin
   Try
    vLista := TRESTDataBase(GetComponent(0)).GetRestPoolers;
    For I := 0 To vLista.Count -1 Do
     Proc (vLista[I]);
   Except
   End;
   If vLista <> Nil Then
    vLista.DisposeOf;
  End;
End;

Function TPoolersList.GetAttributes : TPropertyAttributes;
Begin
  // editor, sorted list, multiple selection
 Result := Inherited GetAttributes + [paValueList, paSortList];
End;

Function  TRESTPoolerList.TryConnect : Boolean;
Var
 vTempSend,
 vTempResult       : String;
 vDSRConnection    : TDSRestConnection;
 vRESTConnectionDB : TSMPoolerMethodClient;
Begin
 Result := False;
 SetConnectionOptions(vDSRConnection);
 vRESTConnectionDB := TSMPoolerMethodClient.Create(vDSRConnection, True);
 Try
  vPoolerList.Clear;
  vPoolerList.Assign(vRESTConnectionDB.PoolersDataSet(vPoolerPrefix));
  Result      := True;
 Except
  On E : Exception do
   Begin
    vDSRConnection.SessionID := '';
   End;
 End;
 vDSRConnection.DisposeOf;
 vRESTConnectionDB.DisposeOf;
End;

Function  TRESTDataBase.TryConnect : Boolean;
Var
 vTempSend,
 vTempResult       : String;
 vDSRConnection    : TDSRestConnection;
 vRESTConnectionDB : TSMPoolerMethodClient;
Begin
 Result := False;
 If vRestPooler = '' Then
  vTempSend := 'ping'
 Else
  vTempSend := vRestPooler;
 SetConnectionOptions(vDSRConnection);
 vRESTConnectionDB := TSMPoolerMethodClient.Create(vDSRConnection, True);
 Try
  vTempResult := vRESTConnectionDB.EchoPooler(vTempSend, vRestModule);
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
 If (Value) And
    (Trim(vRestPooler) = '') Then
  Exit;
 if (Value) And Not(vConnected) then
  If Assigned(vOnBeforeConnection) Then
   vOnBeforeConnection(Self);
 vConnected := Value;
 if vConnected then
  vConnected := TryConnect
 Else
  vMyIP := '';
End;

Procedure TRESTPoolerList.SetConnection(Value : Boolean);
Begin
 If (Value) And Not(vConnected) then
 vConnected := Value;
 If vConnected Then
  vConnected := TryConnect;
End;

Procedure TRESTDataBase.SetPoolerPort(Value : Integer);
Begin
 vPoolerPort := Value;
End;

Procedure TRESTPoolerList.SetPoolerPort(Value : Integer);
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
  vRESTDataBase := Value
 Else
  vRESTDataBase := Nil;
End;

Constructor TRESTClientSQL.Create(AOwner : TComponent);
Begin
 Inherited;
 Owner                             := AOwner;
 vDataCache                        := False;
 vConnectedOnce                    := True;
 vActive                           := False;
 UpdateOptions.CountUpdatedRecords := False;
 vSQL                              := TStringList.Create;
 vSQL.OnChange                     := OnChangingSQL;
 vParams                           := TParams.Create;
 vCacheDataDB                      := Self.CloneSource;
 vUpdateTableName                  := '';
 Inherited AfterPost               := OldAfterPost;
 Inherited AfterDelete             := OldAfterDelete;
End;

Destructor  TRESTClientSQL.Destroy;
Begin
 vSQL.DisposeOf;
 vParams.DisposeOf;
 If vCacheDataDB <> Nil Then
  vCacheDataDB.DisposeOf;
 Inherited;
End;

Function ReturnParams(SQL : String) : TStringList;
Var
 InitStr,
 FinalStr    : Integer;
 vTempString : String;
 Function CreateParamS(Var Value : String) : String;
 Var
  I      : Integer;
  vTempS : String;
 Begin
  I      := InitStr;
  vTempS := Value;
  Result := '';
  While (vTempS <> '') Do
   Begin
    If vTempS[I] in ['0'..'9', 'a'..'z', 'A'..'Z', '_'] then
     Result := Result + vTempS[I]
    Else
     Break;
    {$IFDEF MSWINDOWS}
    If I = Length(Value) Then
     Break;
    {$ELSE}
    If I = Length(Value) -1 Then
     Break;
    {$ENDIF}
    Inc(I);
   End;
  If (I = Length(Value)) Or (Length(Value) = 1) Then
   Value := ''
  Else
   Value := Copy(Value, Length(Result) + 1, Length(Value));
 End;
Begin
 {$IFDEF MSWINDOWS}
 InitStr   := 1;
 FinalStr  := 0;
 {$ELSE}
 InitStr   := 0;
 FinalStr  := 1;
 {$ENDIF}
 Result := Nil;
 vTempString := StringReplace(SQL, #12, '', [rfReplaceAll]);
 If Pos(':', SQL) > 0 Then
  Begin
   vTempString := Copy(vTempString, Pos(':', vTempString) + 1, Length(vTempString));
   Result := TStringList.Create;
   While vTempString <> '' Do
    Begin
     Result.Add(CreateParamS(vTempString));
     vTempString := Copy(vTempString, Pos(':', vTempString), Length(vTempString));
     If Pos(':', vTempString) = 0 Then
      Break
     Else
      vTempString := Copy(vTempString, Pos(':', vTempString) + 1, Length(vTempString));
    End;
  End;
End;

Procedure TRESTClientSQL.CreateParams;
Var
 I         : Integer;
 ParamList : TStringList;
 Procedure CreateParam(Value : String);
 Begin
  vParams.CreateParam(ftUnknown, Value, ptUnknown);
 End;
Begin
 vParams.Clear;
 ParamList := ReturnParams(vSQL.Text);
 If ParamList <> Nil Then
 For I := 0 to ParamList.Count -1 Do
  CreateParam(ParamList[I]);
End;

Function  TRESTClientSQL.ApplyUpdates(Var Error : String) : Boolean;
var
 LDeltaList    : TFDJSONDeltas;
 vError        : Boolean;
 vMessageError : String;
 Function GetDeltas : TFDJSONDeltas;
 Begin
  TFDMemTable(Self).UpdateOptions.CountUpdatedRecords := False;
  If TFDMemTable(Self).State In [dsEdit, dsInsert] Then
   TFDMemTable(Self).Post;
  Result := TFDJSONDeltas.Create;
  TFDJSONDeltasWriter.ListAdd(Result, vUpdateTableName, TFDMemTable(Self));
  TFDMemTable(Self).ApplyUpdates(-1);
 End;
Begin
 LDeltaList := GetDeltas;
 If Assigned(vRESTDataBase) And (Trim(UpdateTableName) <> '') Then
  vRESTDataBase.ApplyUpdates(vSQL, vParams, LDeltaList, Trim(vUpdateTableName), vError, vMessageError)
 Else
  Begin
   vError := True;
   If Not Assigned(vRESTDataBase) Then
    vMessageError := 'No RESTDatabase defined'
   Else
    vMessageError := 'No UpdateTableName defined';
  End;
 Result       := Not vError;
 Error        := vMessageError;
 vErrorBefore := vError;
End;

Function  TRESTClientSQL.ParamByName(Value : String) : TParam;
Var
 I : Integer;
 vParamName,
 vTempParam : String;
 Function CompareValue(Value1, Value2 : String) : Boolean;
 Var
  InitStr,
  FinalStr,
  I         : Integer;
 Begin
  Result := False;
  {$IFDEF MSWINDOWS}
  InitStr   := 1;
  FinalStr  := 0;
  {$ELSE}
  InitStr   := 0;
  FinalStr  := 1;
  {$ENDIF}
  For I := InitStr To Length(Value1) - FinalStr Do
   Begin
    Result := Value1[I] = Value2[I];
    If Not Result Then
     Break;
   End;
 End;
Begin
 Result := Nil;
 For I := 0 to vParams.Count -1 do
  Begin
   vParamName := UpperCase(vParams[I].Name);
   vTempParam := UpperCase(Trim(Value));
   if CompareValue(vTempParam, vParamName) then
    Begin
     Result := vParams[I];
     Break;
    End;
  End;
End;

Procedure TRESTClientSQL.ExecSQL;
Var
 vError        : Boolean;
 vMessageError : String;
Begin
 Try
  vRESTDataBase.ExecuteCommand(vSQL, vParams, vError, vMessageError, True);
 Except
 End;
End;

Function TRESTClientSQL.InsertMySQLReturnID : Integer;
Var
 vError        : Boolean;
 vMessageError : String;
Begin
 Try
  Result := vRESTDataBase.InsertMySQLReturnID(vSQL, vParams, vError, vMessageError);
 Except
  Result := -1;
 End;
End;

Procedure TRESTClientSQL.OnChangingSQL(Sender: TObject);
Begin
 CreateParams;
End;

Procedure TRESTClientSQL.SetSQL(Value : TStringList);
Var
 I : Integer;
Begin
 vSQL.Clear;
 For I := 0 To Value.Count -1 do
  vSQL.Add(Value[I]);
End;

Procedure TRESTClientSQL.Close;
Begin
 TFDMemTable(Self).Close;
 If TFDMemTable(Self).Fields.Count = 0 Then
  TFDMemTable(Self).FieldDefs.Clear;
End;

Function TRESTClientSQL.CanObserve(const ID: Integer): Boolean;
{ Controls which implement observers always override TComponent.CanObserve(const ID: Integer). }
{ This method identifies the type of observers supported by TObservableTrackbar. }
begin
  case ID of
    TObserverMapping.EditLinkID,      { EditLinkID is the observer that is used for control-to-field links }
    TObserverMapping.ControlValueID:
      Result := True;
  else
    Result := False;
  end;
end;

Procedure TRESTClientSQL.Open;
Begin
 TFDMemTable(Self).Open;
End;

Procedure TRESTClientSQL.OldAfterPost(DataSet: TDataSet);
Begin
 vErrorBefore := False;
 if Assigned(vOnAfterPost) then
  vOnAfterPost(Self);
 if Not vErrorBefore then
  TFDMemTable(Self).CommitUpdates;
End;

Procedure TRESTClientSQL.OldAfterDelete(DataSet: TDataSet);
Begin
 vErrorBefore := False;
 If Assigned(vOnAfterDelete) Then
  vOnAfterDelete(Self);
 If Not vErrorBefore Then
  TFDMemTable(Self).CommitUpdates;
End;

Procedure TRESTClientSQL.SetUpdateTableName(Value : String);
Begin
 vCommitUpdates                  := Trim(Value) <> '';
 TFDMemTable(Self).CachedUpdates := vCommitUpdates;
 vUpdateTableName                := Value;
End;

Procedure TRESTClientSQL.Loaded;
Begin
 Inherited Loaded;
{
 If (csDesigning in ComponentState) then
    RebuildTabs;
 }
End;

Procedure ExecMethod(Execute : TExecuteProc = Nil);
Var
 EffectThread : TThread;
Begin
 EffectThread.CreateAnonymousThread(Procedure
                                    Begin
                                     //Se precisar interagir com a Thread da Interface
                                     If Assigned(Execute) Then
                                      TThread.Synchronize (TThread.CurrentThread,
                                                           Procedure
                                                           Begin
                                                            Execute;
                                                            EffectThread.DisposeOf;
                                                           End);
                                    End).Start;
End;

Procedure TRESTClientSQL.CloneDefinitions(Source : TFDMemTable; aSelf : TRESTClientSQL);
Var
 I, A : Integer;
Begin
 aSelf.Close;
 For I := 0 to Source.FieldDefs.Count -1 do
  Begin
   For A := 0 to aSelf.FieldDefs.Count -1 do
    If Uppercase(Source.FieldDefs[I].Name) = Uppercase(aSelf.FieldDefs[A].Name) Then
     Begin
      aSelf.FieldDefs.Delete(A);
      Break;
     End;
  End;
 For I := 0 to Source.FieldDefs.Count -1 do
  Begin
   With aSelf.FieldDefs.AddFieldDef Do
    Begin
     Name     := Source.FieldDefs[I].Name;
     DataType := Source.FieldDefs[I].DataType;
     Size     := Source.FieldDefs[I].Size;
     Required := Source.FieldDefs[I].Required;
    End;
  End;
 If aSelf.FieldDefs.Count > 0 Then
  aSelf.CreateDataSet;
End;

Function TRESTClientSQL.GetData : Boolean;
Var
 LDataSetList  : TFDJSONDataSets;
 vError        : Boolean;
 vMessageError : String;
 vTempTable    : TFDMemTable;
Begin
 Result := False;
 Self.Close;
 If Assigned(vRESTDataBase) Then
  Begin
   Try
    LDataSetList := vRESTDataBase.ExecuteCommand(vSQL, vParams, vError, vMessageError, False);
    If LDataSetList <> Nil Then
     Begin
      vTempTable := TFDMemTable.Create(Nil);
      vTempTable.UpdateOptions.CountUpdatedRecords := False;
      Try
       Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);
       vTempTable.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
       CloneDefinitions(vTempTable, Self);
       If LDataSetList <> Nil Then
        Begin
         AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
         Result := True;
        End;
      Except
      End;
      vTempTable.DisposeOf;
     End;
   Except
    If LDataSetList <> Nil Then
     LDataSetList.DisposeOf;
   End;
  End;
End;

Procedure TRESTClientSQL.SetActiveDB(Value : Boolean);
Begin
 vActive := False;
 if (vRESTDataBase <> Nil) And (Value) Then
  Begin
   if Not vRESTDataBase.Active then
    Exit;
   Try
    vActive := GetData;
    If Assigned(vOnGetDataError) Then
     vOnGetDataError(True, '');
   Except
    On E : Exception do
     Begin
      if Assigned(vOnGetDataError) then
       vOnGetDataError(False, E.Message);
     End;
   End;
  End
 Else
  Close;
End;

end.
