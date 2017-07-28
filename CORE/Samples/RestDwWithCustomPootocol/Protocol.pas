unit Protocol;

interface

uses
  Classes, System.SysUtils, uDWJSONObject, uDWConsts, uDWConstsData;
type
  TDMLType = (dtSelect, dtCommand);

  TBasicRequest = class(TDWParams)
    constructor Create(AEncoding: TEncodeSelect); reintroduce;
  public
    function StartParamIndex: Integer;
    function AddJSONParam(ParamValue: Variant; ParamName: string = ''): TJSONParam;
    procedure AfterConstruction; override;
    procedure RaiseServerException(const Response: string);
  end;

  TDataBaseRequest = class(TBasicRequest)
  private
    FDataBaseIndex: Integer;
    FDataBaseParams: string;
    procedure SetDataBaseIndex(const Value: Integer);
    procedure SetDataBaseParams(const Value: string);
  public
    procedure AfterConstruction; override;
    property DataBaseIndex: Integer read FDataBaseIndex write SetDataBaseIndex;
    property DataBaseParams: string read FDataBaseParams write SetDataBaseParams;
  end;

const
  BASIC_REQUEST_INITIAL_INDEX = 2;
  DATA_BASE_REQUEST_INITIAL_INDEX = 4;

function Guid: string;

implementation

function Guid: string;
var
  gdStr: TGuId;
begin
  CreateGUID(gdStr);
  Result := GUIDToString(gdStr);
end;
{ TDataBaseRequest }

procedure TDataBaseRequest.AfterConstruction;
begin
  inherited;
  AddJSONParam(0, 'DataBaseIndex');
  AddJSONParam('', 'DataBaseParams');
end;

procedure TDataBaseRequest.SetDataBaseIndex(const Value: Integer);
begin
  FDataBaseIndex := Value;
  AddJSONParam(Value);
end;

procedure TDataBaseRequest.SetDataBaseParams(const Value: string);
begin
  FDataBaseParams := Value;
  AddJSONParam(Value);
end;

{ TBasicRequest }

function TBasicRequest.AddJSONParam(ParamValue: Variant; ParamName: string = ''): TJSONParam;
var
  JSONParam: TJSONParam;
  sResponse: string;
  JSONValue: uDWJSONObject.TJSONValue;
begin
  JSONParam := TJSONParam.Create(Encoding);
  if ParamName = '' then
    ParamName := IntToStr(Count);
  JSONParam.ParamName := ParamName;
  JSONParam.SetValue(ParamValue);
  Add(JSONParam);
end;

procedure TBasicRequest.AfterConstruction;
begin
  inherited;
  AddJSONParam('Guid', Guid);
  AddJSONParam('Terminal', Guid);
end;

constructor TBasicRequest.Create(AEncoding: TEncodeSelect);
begin
  inherited Create;
  Encoding := GetEncoding(AEncoding);
end;

procedure TBasicRequest.RaiseServerException(const Response: string);
var
  sExceptionClassName, sExceptionMessage: string;
begin
  if Response = 'EXCEPTION' then begin
    sExceptionClassName := ItemsString['ClassName'].Value;
    sExceptionMessage := ItemsString['Message'].Value;
    raise Exception.Create(sExceptionClassName + #13#10 + #13#10 +
      sExceptionMessage);
  end;
end;

function TBasicRequest.StartParamIndex: Integer;
begin
  Result := 2;
end;

end.
