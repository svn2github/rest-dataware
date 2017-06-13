// Para Funcionar o Servidor é necessário que todos os Métodos declarados em PUBLIC sejam
//adicionados em seus Projetos.
//Gilberto Rocha da Silva

unit ServerMethodsUnit1;

interface

uses System.SysUtils,         System.Classes,           Datasnap.DSServer,  Datasnap.DSAuth,
     FireDAC.Stan.Intf,       FireDAC.Stan.Option,      FireDAC.Stan.Param,
     FireDAC.Stan.Error,      FireDAC.DatS,             FireDAC.Phys.Intf,  FireDAC.DApt.Intf,
     FireDAC.Stan.Async,      FireDAC.DApt,             FireDAC.UI.Intf,    FireDAC.VCLUI.Wait,
     FireDAC.Stan.Def,        FireDAC.Stan.Pool,        FireDAC.Phys,       Data.DB,
     FireDAC.Comp.Client,     FireDAC.Phys.IBBase,      FireDAC.Phys.IB,    FireDAC.Comp.UI,
     FireDAC.Comp.DataSet,    Data.FireDACJSONReflect,  System.JSON,
     FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FireDAC.Phys.IBDef,
     WebModuleUnit1,          Vcl.Dialogs,              TypInfo,
     IniFiles,  Vcl.Forms,    uRestPoolerDB, URestPoolerDBMethod, FireDAC.Phys.FBDef, FireDAC.Phys.FB;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDGUIxWaitCursor1      : TFDGUIxWaitCursor;
    FDStanStorageJSONLink1 : TFDStanStorageJSONLink;
    Server_FDConnection: TFDConnection;
    RESTPoolerDB: TRESTPoolerDB;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    RESTPoolerDB_Backup: TRESTPoolerDB;
    procedure Server_FDConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$METHODINFO OFF}

Var
 UserName,
 Password      : String;
 vDatabaseName : String;


implementation

{$R *.dfm}

uses System.StrUtils, System.Generics.Collections, RestDWServerFormU;

procedure TServerMethods1.DataModuleCreate(Sender: TObject);
begin
 UserName := RestDWForm.Username;
 Password := RestDWForm.Password;
end;

procedure TServerMethods1.Server_FDConnectionBeforeConnect(Sender: TObject);
Var
 fname,
 porta_BD,
 porta_DW,
 servidor,
 database,
 pasta,
 usuario_DW,
 senha_DW,
 usuario_BD,
 senha_BD     : String;
 ini       : TIniFile;

  Function GetServer(Value : String) : String;
 Begin
  If Pos('/', Value) = 0 Then
   Result := Value
  Else
   Result := Copy(Value, 1, Pos('/', Value) -1);
 End;
 Function GetPort(Value : String) : String;
 Begin
  If Pos('/', Value) = 0 Then
   Result := '3050'
  Else
   Result := Copy(Value, Pos('/', Value) + 1, Length(Value));
 End;

begin

  servidor   := RestDWForm.DatabaseIP;
  database   := RestDWForm.edBD.Text;
  pasta      := RestDWForm.edPasta.Text;

  if Copy( pasta, Length(pasta) , 1 ) <> '\' then
     pasta := pasta + '\';

  porta_BD   := RestDWForm.edPortaBD.Text ;
  usuario_BD := RestDWForm.edUserNameBD.Text;
  senha_BD   := RestDWForm.edPasswordBD.Text;

  //vDatabaseName  := Format('%s/' + porta_BD + ':%s', [servidor, pasta + database]);
  vDatabaseName  := pasta + database ;// Format('%s:' + '%s', [servidor, pasta + database]);

  //If Pos('/', servidor) = 0 Then
  // vDatabaseName  := Format('%s/' + porta_fb + ':%s', [servidor, database])
  //Else
  // vDatabaseName  := Format('%s:%s', [servidor, database]);




 Server_FDConnection.Params.Clear;
 Server_FDConnection.Params.Add( 'DriverID=FB');
 Server_FDConnection.Params.Add( 'Server=' + servidor );// GetServer(servidor));
 Server_FDConnection.Params.Add( 'Port=' + porta_BD ) ;//GetPort(servidor));
 Server_FDConnection.Params.Add( 'Database=' + vDatabaseName );//servidor + ':' + pasta + database ); // 'Database='
 Server_FDConnection.Params.Add( 'User_Name=' + usuario_BD);
 Server_FDConnection.Params.Add( 'Password=' + senha_BD);
 Server_FDConnection.Params.Add( 'Protocol=TCPIP');
 //Server_FDConnection.Params.Add( 'CharacterSet=ISO8859_1');

 //TFDConnection(Sender).
  Server_FDConnection.UpdateOptions.CountUpdatedRecords := False;

end;
{
begin

 Server_FDConnection.Params.Clear;

 Server_FDConnection.Params.Add( 'DriverID=FB' ); // IB
 Server_FDConnection.Params.Add( 'Database=localhost: ' + 'c:\mkmdados\' + 'MKMDATAFILE.FDB' );//  ExtractFilePath(ParamSTR(0)) + 'MKMDATAFILE.FDB' );
 Server_FDConnection.Params.Add( 'User_Name=sysdba' );
 Server_FDConnection.Params.Add( 'password=masterkey' );

 Server_FDConnection.UpdateOptions.CountUpdatedRecords := False;

end;
  }
end.

