unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRESTDWPoolerDB, Data.DB, Vcl.StdCtrls,
  uRESTDWBase, Vcl.Grids, Vcl.DBGrids, uDWConstsData, uDWJSONObject, uDWConsts,
  kbmMemTable, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Protocol, RequestFrameUnit,
  Vcl.Samples.Spin, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    RESTClientPooler1: TRESTClientPooler;
    SqlPageControl: TPageControl;
    Button3: TButton;
    Label5: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    eHost: TEdit;
    ePort: TEdit;
    edPasswordDW: TEdit;
    edUserNameDW: TEdit;
    SqlAddLotMemo: TMemo;
    Button1: TButton;
    HowManySqlSpinEdit: TSpinEdit;
    Label1: TLabel;
    Button2: TButton;
    Button4: TButton;
    Label2: TLabel;
    Label3: TLabel;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    LastPage: Integer;
    procedure AddLog(Text: string; ShowTime: Boolean = True);
    procedure RaiseServerException(const Response: string;
      const DWParams: TDWParams);
    procedure AddSql(SQL: string = ''; DMLType: TDMLType = dtSelect);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AddLog(Text: string; ShowTime: Boolean);
begin
  if ShowTime then begin
    ListBox1.Items.Add(Text);

  end else begin

  end;
end;

procedure TForm1.AddSql(SQL: string; DMLType: TDMLType);
var
  TabSheet: TTabSheet;
  RequestFrame: TRequestFrame;
begin
  TabSheet := TTabSheet.Create(Self);
  TabSheet.PageControl := SqlPageControl;
  TabSheet.Caption := IntToStr(SqlPageControl.PageCount);
  TabSheet.Tag := LastPage;

  RequestFrame := TRequestFrame.Create(Self);
  RequestFrame.Name := RequestFrame.Name +
    IntToStr(LastPage);
  RequestFrame.Parent := TabSheet;
  RequestFrame.Align := alClient;

  RequestFrame.SqlMemo.Text := SQL;
  RequestFrame.DMLTypeRadioGroup.ItemIndex := Ord(DMLType);

  LastPage := LastPage + 1;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to HowManySqlSpinEdit.Value do begin
    AddSql(SqlAddLotMemo.Lines.Text);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  sResponseStatus: string;
  DWParams: TDWParams;
  DataBaseRequest: TDataBaseRequest;
  JSONValue: uDWJSONObject.TJSONValue;
  I: Integer;
  RequestFrame: TRequestFrame;
  BeforeTime, AfterTime: TDateTime;

begin
  RESTClientPooler1.Port := StrToInt(ePort.Text);
  RESTClientPooler1.Host := eHost.Text;
  RESTClientPooler1.UserName := edUserNameDW.Text;
  RESTClientPooler1.Password := edPasswordDW.Text;

  DataBaseRequest := TDataBaseRequest.Create(RESTClientPooler1.Encoding);
  DataBaseRequest.AddJSONParam(SqlPageControl.PageCount, 'Total SQL');

  for I := 0 to SqlPageControl.PageCount - 1 do begin
    if not SqlPageControl.Pages[I].TabVisible then
      Continue;

    RequestFrame := TRequestFrame(FindComponent('RequestFrame' + IntToStr(SqlPageControl.Pages[I].Tag)));
    if Trim(RequestFrame.SqlMemo.Lines.Text) = '' then
      Continue;
    { Sql sentence }
    DataBaseRequest.AddJSONParam(RequestFrame.SqlMemo.Lines.Text,
      RequestFrame.Name);
    { DML Type }
    DataBaseRequest.AddJSONParam(RequestFrame.DMLTypeRadioGroup.ItemIndex);
    { Number of params }
    DataBaseRequest.AddJSONParam(RequestFrame.ParamsDataSet.RecordCount);
    if RequestFrame.ParamsDataSet.RecordCount > 0 then begin
      RequestFrame.ParamsDataSet.First;
      while not RequestFrame.ParamsDataSet.Eof do begin
        { Param name }
        DataBaseRequest.AddJSONParam
          (RequestFrame.ParamsDataSetPARAM_NAME.AsString);
        { Param type }
        DataBaseRequest.AddJSONParam
          (RequestFrame.ParamsDataSetPARAM_TYPE.AsInteger);
        { Param value }
        DataBaseRequest.AddJSONParam
          (RequestFrame.ParamsDataSetPARAM_VALUE.AsString);
        RequestFrame.ParamsDataSet.Next;
      end;
    end;

  end;
  BeforeTime := Now;
  sResponseStatus := RESTClientPooler1.SendEvent('ExecuteDML',
    TDWParams(DataBaseRequest));
  AfterTime := Now;
  AddLog('After receive response: ' + DateTimeToStr(AfterTime - BeforeTime));
  RaiseServerException(sResponseStatus, DataBaseRequest);

  for I := 0 to SqlPageControl.PageCount - 1 do begin
    JSONValue := uDWJSONObject.TJSONValue.Create;
    try
      RequestFrame := TRequestFrame
        (FindComponent('RequestFrame' + IntToStr(SqlPageControl.Pages[I].Tag)));
      JSONValue.WriteToDataset(dtFull, DataBaseRequest.ItemsString
        [RequestFrame.Name].Value, RequestFrame.ResponseDataSet);
    finally
      JSONValue.Free;
    end;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  sResponseStatus: string;
  DWParams: TDWParams;
  DataBaseRequest: TDataBaseRequest;
  JSONValue: uDWJSONObject.TJSONValue;
  I: Integer;
  RequestFrame: TRequestFrame;
  AfterTime, BeforeTime: TDateTime;
begin
  RESTClientPooler1.Port := StrToInt(ePort.Text);
  RESTClientPooler1.Host := eHost.Text;
  RESTClientPooler1.UserName := edUserNameDW.Text;
  RESTClientPooler1.Password := edPasswordDW.Text;

  DataBaseRequest := TDataBaseRequest.Create(RESTClientPooler1.Encoding);
  DataBaseRequest.AddJSONParam(1, 'Total SQL');
  RequestFrame := TRequestFrame
    (FindComponent('RequestFrame' + IntToStr(SqlPageControl.ActivePage.Tag)));
  if Trim(RequestFrame.SqlMemo.Lines.Text) = '' then
    Exit;
  { Sql sentence }
  DataBaseRequest.AddJSONParam(RequestFrame.SqlMemo.Lines.Text,
    RequestFrame.Name);
  { DML Type }
  DataBaseRequest.AddJSONParam(RequestFrame.DMLTypeRadioGroup.ItemIndex);
  { Number of params }
  DataBaseRequest.AddJSONParam(RequestFrame.ParamsDataSet.RecordCount);
  if RequestFrame.ParamsDataSet.RecordCount > 0 then begin
    RequestFrame.ParamsDataSet.First;
    while not RequestFrame.ParamsDataSet.Eof do begin
      { Param name }
      DataBaseRequest.AddJSONParam
        (RequestFrame.ParamsDataSetPARAM_NAME.AsString);
      { Param type }
      DataBaseRequest.AddJSONParam
        (RequestFrame.ParamsDataSetPARAM_TYPE.AsInteger);
      { Param value }
      DataBaseRequest.AddJSONParam
        (RequestFrame.ParamsDataSetPARAM_VALUE.AsString);
      RequestFrame.ParamsDataSet.Next;
    end;
  end;

  BeforeTime := Now;
  sResponseStatus := RESTClientPooler1.SendEvent('ExecuteDML',
    TDWParams(DataBaseRequest));
  AfterTime := Now;
  AddLog('Server response: ' + TimeToStr(AfterTime-BeforeTime));
  RaiseServerException(sResponseStatus, DataBaseRequest);

  JSONValue := uDWJSONObject.TJSONValue.Create;
  try
    BeforeTime := Now;
    JSONValue.WriteToDataset(dtFull, DataBaseRequest.ItemsString
      [RequestFrame.Name].Value, RequestFrame.ResponseDataSet);
    AfterTime := Now;
    AddLog('Load to dataset: ' + TimeToStr(AfterTime-BeforeTime));
  finally
    JSONValue.Free;
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
var
  I: Integer;
  RequestFrame: TRequestFrame;
begin
  RequestFrame := TRequestFrame(FindComponent('RequestFrame' + IntToStr(SqlPageControl.ActivePage.Tag)));
  FreeAndNil(RequestFrame);
  SqlPageControl.ActivePage.Free;
//  SqlPageControl.ActivePage.TabVisible := False;
//  { Procurando a proxima tabshhet para frente }
//  for I := SqlPageControl.ActivePage.PageIndex to SqlPageControl.PageCount - 1 do begin
//    if SqlPageControl.Pages[I].TabVisible then begin
//      SqlPageControl.ActivePageIndex := I;
//      Break;
//    end;
//  end;
//  { Se não encontrou procura para trás }
//  for
//
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LastPage := 0;
  RESTClientPooler1.Host := '127.0.0.1';
  RESTClientPooler1.Port := 8082;
  RESTClientPooler1.UserName := 'testserver';
  RESTClientPooler1.Password := 'testserver';
  RESTClientPooler1.DataCompression := True;

  AddSql;

  // AddSql('select * from EMPLOYEE where first_name like :FNAME');
  // AddSql('select * from JOB_CODE from JOB');
  // AddSql('select * from CUSTOMER');
  // AddSql('select * from DEPARTMENT');
  // AddSql('select * from EMPLOYEE');
  // AddSql('select * from EMPLOYEE_PROJECT');
  // AddSql('select * from ITEMS');
  // AddSql('select * from PROJECT');
  // AddSql('select * from PROJ_DEPT_BUDGET');
  // AddSql('select * from SALARY_HISTORY');
  // AddSql('select * from SALES');
end;

procedure TForm1.RaiseServerException(const Response: string;
  const DWParams: TDWParams);
var
  sExceptionClassName, sExceptionMessage: string;
begin
  if Response = 'EXCEPTION' then begin
    sExceptionClassName := DWParams.ItemsString['ClassName'].Value;
    sExceptionMessage := DWParams.ItemsString['Message'].Value;
    raise Exception.Create(sExceptionClassName + #13#10 + #13#10 +
      sExceptionMessage);
  end;
end;

end.
