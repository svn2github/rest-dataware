object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 499
  ClientWidth = 613
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 598
    Height = 169
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 183
    Width = 598
    Height = 152
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 8
    Top = 341
    Width = 598
    Height = 152
    DataSource = DataSource3
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object RESTDataBase: TRESTDataBase
    Active = True
    Compression = False
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
    Encoding = esUtf8
    Context = 'datasnap'
    RESTContext = 'rest/'
    Left = 56
    Top = 34
  end
  object RESTClientSQL1: TRESTClientSQL
    AfterPost = RESTClientSQL1AfterDelete
    AfterDelete = RESTClientSQL1AfterDelete
    FieldDefs = <>
    CachedUpdates = True
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
    UpdateTableName = 'DEPARTMENT'
    Left = 152
    Top = 40
    object RESTClientSQL1DEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object RESTClientSQL1DEPARTMENT: TStringField
      FieldName = 'DEPARTMENT'
      Required = True
      Size = 25
    end
    object RESTClientSQL1HEAD_DEPT: TStringField
      FieldName = 'HEAD_DEPT'
      FixedChar = True
      Size = 3
    end
    object RESTClientSQL1MNGR_NO: TSmallintField
      FieldName = 'MNGR_NO'
    end
    object RESTClientSQL1BUDGET: TFloatField
      FieldName = 'BUDGET'
    end
    object RESTClientSQL1LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 15
    end
    object RESTClientSQL1PHONE_NO: TStringField
      FieldName = 'PHONE_NO'
    end
  end
  object RESTClientSQL2: TRESTClientSQL
    BeforePost = RESTClientSQL2BeforePost
    AfterPost = RESTClientSQL1AfterDelete
    AfterDelete = RESTClientSQL1AfterDelete
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    MasterFields = 'DEPT_NO'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    MasterDataSet = RESTClientSQL1
    MasterCascadeDelete = True
    DataCache = False
    Params = <
      item
        DataType = ftString
        Name = 'DEPT_NO'
        ParamType = ptUnknown
        Size = 3
        Value = '000'
      end>
    DataBase = RESTDataBase
    SQL.Strings = (
      'select * from employee '
      'where DEPT_NO = :DEPT_NO')
    UpdateTableName = 'employee'
    Left = 152
    Top = 104
    object RESTClientSQL2EMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Required = True
    end
    object RESTClientSQL2FIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object RESTClientSQL2LAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Required = True
    end
    object RESTClientSQL2PHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object RESTClientSQL2HIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      Required = True
    end
    object RESTClientSQL2DEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object RESTClientSQL2JOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object RESTClientSQL2JOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object RESTClientSQL2JOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object RESTClientSQL2SALARY: TFloatField
      FieldName = 'SALARY'
      Required = True
    end
    object RESTClientSQL2FULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Size = 37
    end
  end
  object DataSource1: TDataSource
    DataSet = RESTClientSQL1
    Left = 180
    Top = 40
  end
  object DataSource2: TDataSource
    DataSet = RESTClientSQL2
    Left = 180
    Top = 104
  end
  object RESTClientSQL3: TRESTClientSQL
    AfterPost = RESTClientSQL1AfterDelete
    AfterDelete = RESTClientSQL1AfterDelete
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    MasterFields = 'EMP_NO'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    MasterDataSet = RESTClientSQL2
    MasterCascadeDelete = True
    DataCache = False
    Params = <
      item
        DataType = ftSmallint
        Name = 'EMP_NO'
        ParamType = ptUnknown
        Value = 12
      end>
    DataBase = RESTDataBase
    SQL.Strings = (
      'select * from SALARY_HISTORY'
      'where EMP_NO = :EMP_NO')
    UpdateTableName = 'SALARY_HISTORY'
    Left = 152
    Top = 160
    object RESTClientSQL3EMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Required = True
    end
    object RESTClientSQL3CHANGE_DATE: TSQLTimeStampField
      FieldName = 'CHANGE_DATE'
      Required = True
    end
    object RESTClientSQL3UPDATER_ID: TStringField
      FieldName = 'UPDATER_ID'
      Required = True
    end
    object RESTClientSQL3OLD_SALARY: TFloatField
      FieldName = 'OLD_SALARY'
      Required = True
    end
    object RESTClientSQL3PERCENT_CHANGE: TFloatField
      FieldName = 'PERCENT_CHANGE'
      Required = True
    end
    object RESTClientSQL3NEW_SALARY: TFloatField
      FieldName = 'NEW_SALARY'
    end
  end
  object DataSource3: TDataSource
    DataSet = RESTClientSQL3
    Left = 180
    Top = 160
  end
end
