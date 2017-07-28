unit MyServerMethods;

interface

uses Windows, SysUtils, Classes, System.JSON,
  SysTypes, uDWJSONObject, Winapi.ShellAPI, TypInfo, ServerUtils,
  uDWConstsData, uDWConsts, uDWJSONTools, ServerModuleUnit, Db,
{$IFDEF FIREDAC}
  FireDacUnit,
{$ENDIF}
{$IFDEF ZEOS}
  ZeosUnit,
{$ENDIF}
  Protocol,
  ServerDataModuleUnit;

Type
  TMyServerMethods = class(TServerMethods)
  private
    ServerDataModule: TServerDataModule;
    function ExecuteDML(var DWParams: TDWParams): string;
    function ExecuteCommand(var DWParams: TDWParams): string;

    function Download(var Params: TDWParams): string;
    function Dir(var Params: TDWParams): string;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    procedure Reply(SendType: TSendEvent; Context: string;
      var Params: TDWParams; var Result: string);
  end;

const
  INITIAL_INDEX = 2;

implementation

procedure TMyServerMethods.Reply(SendType: TSendEvent; Context: String;
  var Params: TDWParams; var Result: String);
var
  JSONParam: TJSONParam;
begin
  try
    case SendType of
      seGET:
        begin

        end;
      sePOST:
        begin
          if Context = 'ExecuteDML' then
            ExecuteDML(Params)
          else if Context = 'Download' then
            Download(Params)
          else if Context = 'Dir' then
            Dir(Params)
          else
            raise Exception.Create('Comando ' + Context + ' desconhecido!');
        end;
      sePUT:
        begin

        end;

      seDELETE:
        begin

        end;
    end;
    Result := 'OK';
  except
    on E: Exception do
    begin
      Result := 'EXCEPTION';

      JSONParam := TJSONParam.Create(Params.Encoding);
      JSONParam.ParamName := 'ClassName';
      JSONParam.SetValue(E.ClassName);
      Params.Add(JSONParam);

      JSONParam := TJSONParam.Create(Params.Encoding);
      JSONParam.ParamName := 'Message';
      JSONParam.SetValue(E.Message);
      Params.Add(JSONParam);
    end;

  end;
end;

constructor TMyServerMethods.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  ReplyEvent := Reply;
{$IFDEF FIREDAC}
  ServerDataModule := TFireDac.Create(Self);
{$ENDIF}
{$IFDEF ZEOS}
  ServerDataModule := TZeos.Create(Self); //Este ainda nao foi criado
{$ENDIF}
end;

destructor TMyServerMethods.Destroy;
begin
  inherited Destroy;
end;

function TMyServerMethods.Dir(var Params: TDWParams): string;
begin

end;

function TMyServerMethods.Download(var Params: TDWParams): string;
begin

end;

function TMyServerMethods.ExecuteCommand(var DWParams: TDWParams): string;
begin

end;

function TMyServerMethods.ExecuteDML(var DWParams: TDWParams): string;
var
  sSQL: String;
  JSONValue: TJSONValue;
  ItemNo: Integer;
  TotSql: Integer;
  TotParam: Integer;
  S, P: Integer;
  Params: TParams;
  SqlIndex: Integer;
  DMLType: TDMLType;
begin
  ItemNo := INITIAL_INDEX;
  { SGDB Driver Index }
  ServerDataModule.DataBaseIndex := StrToInt(DWParams.Items[ItemNo].Value);

  { Parâmetros de conexão - Em branco se optar por cinfiguração dentro do server }
  ItemNo := ItemNo + 1;
  ServerDataModule.DataBaseParams.Text := DWParams.Items[ItemNo].Value;

  { Quantidade de comandos SQL }
  ItemNo := ItemNo + 1;
  TotSql := StrToInt(DWParams.Items[ItemNo].Value);
  for S := 1 to TotSql do begin
    { SQL sentence }
    ItemNo := ItemNo + 1;
    sSQL := DWParams.Items[ItemNo].Value;
    SqlIndex := ItemNo;

    { DML Type }
    ItemNo := ItemNo + 1;
    DMLType := TDMLType(StrToInt(DWParams.Items[ItemNo].Value));

    { Total SQL Params }
    ItemNo := ItemNo + 1;
    TotParam := StrToInt(DWParams.Items[ItemNo].Value);
    try
      if TotParam > 0 then begin
        Params := TParams.Create(nil);
        for P := 1 to TotParam do begin
          { Add a param }
          with Params.AddParameter do begin
            { Param name }
            ItemNo := ItemNo + 1;
            Name := DWParams.Items[ItemNo].Value;

            { Param type }
            ItemNo := ItemNo + 1;
            DataType := TFieldType(StrToInt(DWParams.Items[ItemNo].Value));

            { Param value }
            ItemNo := ItemNo + 1;
            Value := DWParams.Items[ItemNo].Value;
          end;
        end;
      end;

      case DMLType of
        dtSelect: begin
            try
              JSONValue := uDWJSONObject.TJSONValue.Create;
              JSONValue.Encoding := GetEncoding(Encoding);
              JSONValue.LoadFromDataset('SQL',
                ServerDataModule.ExecuteQuery(sSQL, Params));
              DWParams.Items[SqlIndex].SetValue(JSONValue.ToJSON);
            finally
              FreeAndNil(JSONValue);
            end;
          end;

        dtCommand: begin
            ServerDataModule.ExecuteCommand(sSQL, Params);
          end;
      end;
    finally
      FreeAndNil(Params);
    end;

  end;

end;

end.
