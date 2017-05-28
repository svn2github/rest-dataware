object fEmployee: TfEmployee
  Left = 0
  Top = 0
  Caption = 'Employee'
  ClientHeight = 319
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 41
    Height = 13
    Caption = 'EMP_NO'
  end
  object Label2: TLabel
    Left = 40
    Top = 64
    Width = 63
    Height = 13
    Caption = 'FIRST_NAME'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 245
    Top = 64
    Width = 58
    Height = 13
    Caption = 'LAST_NAME'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 40
    Top = 144
    Width = 58
    Height = 13
    Caption = 'PHONE_EXT'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 112
    Top = 144
    Width = 56
    Height = 13
    Caption = 'HIRE_DATE'
    FocusControl = DBEdit5
  end
  object Label7: TLabel
    Left = 216
    Top = 261
    Width = 38
    Height = 13
    Caption = 'SALARY'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 40
    Top = 104
    Width = 57
    Height = 13
    Caption = 'FULL_NAME'
  end
  object Label9: TLabel
    Left = 40
    Top = 184
    Width = 66
    Height = 13
    Caption = 'DEPARTMENT'
  end
  object Label10: TLabel
    Left = 40
    Top = 221
    Width = 52
    Height = 13
    Caption = 'JOB_TITLE'
  end
  object Label11: TLabel
    Left = 40
    Top = 261
    Width = 63
    Height = 13
    Caption = 'MIN_SALARY'
  end
  object Label12: TLabel
    Left = 136
    Top = 261
    Width = 65
    Height = 13
    Caption = 'MAX_SALARY'
  end
  object DBText1: TDBText
    Left = 41
    Top = 280
    Width = 41
    Height = 13
    AutoSize = True
    DataField = 'MIN_SALARY'
    DataSource = dsJob
  end
  object DBText2: TDBText
    Left = 136
    Top = 280
    Width = 41
    Height = 13
    AutoSize = True
    DataField = 'MAX_SALARY'
    DataSource = dsJob
  end
  object DBText3: TDBText
    Left = 41
    Top = 43
    Width = 41
    Height = 13
    AutoSize = True
    DataField = 'EMP_NO'
    DataSource = dsEmployee
  end
  object DBText4: TDBText
    Left = 40
    Top = 123
    Width = 41
    Height = 13
    AutoSize = True
    DataField = 'FULL_NAME'
    DataSource = dsEmployee
  end
  object DBEdit2: TDBEdit
    Left = 40
    Top = 80
    Width = 199
    Height = 21
    DataField = 'FIRST_NAME'
    DataSource = dsEmployee
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 245
    Top = 80
    Width = 264
    Height = 21
    DataField = 'LAST_NAME'
    DataSource = dsEmployee
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 40
    Top = 160
    Width = 56
    Height = 21
    DataField = 'PHONE_EXT'
    DataSource = dsEmployee
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 112
    Top = 160
    Width = 89
    Height = 21
    DataField = 'HIRE_DATE'
    DataSource = dsEmployee
    TabOrder = 3
  end
  object DBEdit7: TDBEdit
    Left = 216
    Top = 277
    Width = 105
    Height = 21
    DataField = 'SALARY'
    DataSource = dsEmployee
    TabOrder = 6
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 40
    Top = 200
    Width = 329
    Height = 21
    DataField = 'DEPT_NO'
    DataSource = dsEmployee
    KeyField = 'DEPT_NO'
    ListField = 'DEPARTMENT'
    ListSource = dsDepartment
    TabOrder = 4
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 40
    Top = 237
    Width = 329
    Height = 21
    DataField = 'JOB_CODE'
    DataSource = dsEmployee
    KeyField = 'JOB_CODE'
    ListField = 'JOB_TITLE'
    ListSource = dsJob
    TabOrder = 5
  end
  object DBNavigator1: TDBNavigator
    Left = 275
    Top = 8
    Width = 234
    Height = 25
    DataSource = dsEmployee
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    TabOrder = 7
  end
  object RESTDataBase: TRESTDataBase
    Active = False
    Compression = True
    Login = 'testserver'
    Password = 'testserver'
    Proxy = False
    ProxyOptions.Port = 8888
    PoolerService = '127.0.0.1'
    PoolerPort = 8082
    PoolerName = 'ServerMethodsUnit1.RESTPoolerDB'
    RestModule = 'TServerMethods1'
    StateConnection.AutoCheck = False
    StateConnection.InTime = 1000
    RequestTimeOut = 10000
    Encoding = esASCII
    Context = 'datasnap'
    RESTContext = 'rest/'
    Left = 392
    Top = 114
  end
  object rEmployee: TRESTClientSQL
    AfterInsert = rEmployeeAfterInsert
    BeforePost = rEmployeeBeforePost
    AfterPost = rEmployeeAfterPost
    AfterDelete = rEmployeeAfterDelete
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 2147483647
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    MasterCascadeDelete = True
    DataCache = False
    Params = <>
    DataBase = RESTDataBase
    SQL.Strings = (
      'select * from employee')
    UpdateTableName = 'EMPLOYEE'
    Left = 392
    Top = 157
    object rEmployeeEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object rEmployeeFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object rEmployeeLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Required = True
    end
    object rEmployeePHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object rEmployeeHIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object rEmployeeDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object rEmployeeJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object rEmployeeJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object rEmployeeJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object rEmployeeSALARY: TFloatField
      FieldName = 'SALARY'
      Required = True
      DisplayFormat = '###,###,###,##0.00'
    end
    object rEmployeeFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Size = 37
    end
  end
  object dsEmployee: TDataSource
    AutoEdit = False
    DataSet = rEmployee
    Left = 422
    Top = 157
  end
  object rDepartment: TRESTClientSQL
    FieldDefs = <
      item
        Name = 'DEPT_NO'
        Attributes = [faRequired, faFixed]
        DataType = ftFixedChar
        Size = 3
      end
      item
        Name = 'DEPARTMENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'HEAD_DEPT'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 3
      end
      item
        Name = 'MNGR_NO'
        DataType = ftSmallint
      end
      item
        Name = 'BUDGET'
        DataType = ftFloat
      end
      item
        Name = 'LOCATION'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PHONE_NO'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    MasterCascadeDelete = True
    DataCache = False
    Params = <>
    DataBase = RESTDataBase
    SQL.Strings = (
      'select * from DEPARTMENT')
    Left = 392
    Top = 200
    object rDepartmentDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object rDepartmentDEPARTMENT: TStringField
      FieldName = 'DEPARTMENT'
      Required = True
      Size = 25
    end
    object rDepartmentHEAD_DEPT: TStringField
      FieldName = 'HEAD_DEPT'
      FixedChar = True
      Size = 3
    end
    object rDepartmentMNGR_NO: TSmallintField
      FieldName = 'MNGR_NO'
    end
    object rDepartmentBUDGET: TFloatField
      FieldName = 'BUDGET'
    end
    object rDepartmentLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 15
    end
    object rDepartmentPHONE_NO: TStringField
      FieldName = 'PHONE_NO'
    end
  end
  object dsDepartment: TDataSource
    AutoEdit = False
    DataSet = rDepartment
    Left = 420
    Top = 200
  end
  object fJob: TRESTClientSQL
    FieldDefs = <
      item
        Name = 'JOB_CODE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'JOB_GRADE'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'JOB_COUNTRY'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'JOB_TITLE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'MIN_SALARY'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'MAX_SALARY'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'JOB_REQUIREMENT'
        DataType = ftMemo
      end
      item
        Name = 'LANGUAGE_REQ'
        DataType = ftArray
        Size = 10
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    MasterCascadeDelete = True
    DataCache = False
    Params = <>
    DataBase = RESTDataBase
    SQL.Strings = (
      'select * from job')
    Left = 392
    Top = 244
    object fJobJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object fJobJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object fJobJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object fJobJOB_TITLE: TStringField
      FieldName = 'JOB_TITLE'
      Required = True
      Size = 25
    end
    object fJobMIN_SALARY: TFloatField
      FieldName = 'MIN_SALARY'
      Required = True
      DisplayFormat = '###,###,###,##0.00'
    end
    object fJobMAX_SALARY: TFloatField
      FieldName = 'MAX_SALARY'
      Required = True
      DisplayFormat = '###,###,###,##0.00'
    end
    object fJobJOB_REQUIREMENT: TMemoField
      FieldName = 'JOB_REQUIREMENT'
      BlobType = ftMemo
    end
    object fJobLANGUAGE_REQ: TArrayField
      FieldName = 'LANGUAGE_REQ'
    end
  end
  object dsJob: TDataSource
    AutoEdit = False
    DataSet = fJob
    Left = 420
    Top = 244
  end
end
