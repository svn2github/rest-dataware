unit uEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uRestPoolerDB, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfEmployee = class(TForm)
    RESTDataBase: TRESTDataBase;
    rEmployee: TRESTClientSQL;
    dsEmployee: TDataSource;
    rEmployeeEMP_NO: TSmallintField;
    rEmployeeFIRST_NAME: TStringField;
    rEmployeeLAST_NAME: TStringField;
    rEmployeePHONE_EXT: TStringField;
    rEmployeeHIRE_DATE: TSQLTimeStampField;
    rEmployeeDEPT_NO: TStringField;
    rEmployeeJOB_CODE: TStringField;
    rEmployeeJOB_GRADE: TSmallintField;
    rEmployeeJOB_COUNTRY: TStringField;
    rEmployeeSALARY: TFloatField;
    rEmployeeFULL_NAME: TStringField;
    rDepartment: TRESTClientSQL;
    dsDepartment: TDataSource;
    rDepartmentDEPT_NO: TStringField;
    rDepartmentDEPARTMENT: TStringField;
    rDepartmentHEAD_DEPT: TStringField;
    rDepartmentMNGR_NO: TSmallintField;
    rDepartmentBUDGET: TFloatField;
    rDepartmentLOCATION: TStringField;
    rDepartmentPHONE_NO: TStringField;
    fJob: TRESTClientSQL;
    fJobJOB_CODE: TStringField;
    fJobJOB_GRADE: TSmallintField;
    fJobJOB_COUNTRY: TStringField;
    fJobJOB_TITLE: TStringField;
    fJobMIN_SALARY: TFloatField;
    fJobMAX_SALARY: TFloatField;
    fJobJOB_REQUIREMENT: TMemoField;
    fJobLANGUAGE_REQ: TArrayField;
    dsJob: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBNavigator1: TDBNavigator;
    DBText4: TDBText;
    procedure rEmployeeBeforePost(DataSet: TDataSet);
    procedure rEmployeeAfterInsert(DataSet: TDataSet);
    procedure rEmployeeAfterDelete(DataSet: TDataSet);
    procedure rEmployeeAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   Function GetGenID(GenName  : String;
                     DataBase : TRESTDataBase): Integer;
  public
    { Public declarations }
  end;

var
  fEmployee: TfEmployee;

implementation

{$R *.dfm}

Function TfEmployee.GetGenID(GenName  : String;
                             DataBase : TRESTDataBase): Integer;
Var
 vTempClient : TRESTClientSQL;
Begin
 vTempClient := TRESTClientSQL.Create(Nil);
 Result      := -1;
 Try
  vTempClient.DataBase := DataBase;
  vTempClient.SQL.Add(Format('select gen_id(%s, 1)GenID From rdb$database', [GenName]));
  vTempClient.Active := True;
  Result := vTempClient.FindField('GenID').AsInteger;
 Except

 End;
 vTempClient.Free;
End;

procedure TfEmployee.FormCreate(Sender: TObject);
begin
 rDepartment.Open;
 fJob.Open;
 rEmployee.Open;
end;

procedure TfEmployee.rEmployeeAfterDelete(DataSet: TDataSet);
Var
 vError : String;
begin
 If Not (TRESTClientSQL(DataSet).ApplyUpdates(vError)) Then
  MessageDlg(vError, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
end;

procedure TfEmployee.rEmployeeAfterInsert(DataSet: TDataSet);
begin
 rEmployeeEMP_NO.AsInteger     := GetGenID('EMP_NO_GEN', rEmployee.DataBase);
 rEmployeeHIRE_DATE.AsDateTime := Now;
end;

procedure TfEmployee.rEmployeeAfterPost(DataSet: TDataSet);
Var
 vError : String;
begin
 If Not (TRESTClientSQL(DataSet).ApplyUpdates(vError)) Then
  Begin
   MessageDlg(vError, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
   Dataset.Edit;
  End;
end;

procedure TfEmployee.rEmployeeBeforePost(DataSet: TDataSet);
begin
 rEmployeeJOB_GRADE.AsInteger  := fJobJOB_GRADE.AsInteger;
 rEmployeeJOB_COUNTRY.AsString := fJobJOB_COUNTRY.AsString;
end;

end.
