object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Edit1
  BorderIcons = [biSystemMenu]
  Caption = 'Client for Test of PoolerDB'
  ClientHeight = 331
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 121
    Top = 3
    Width = 117
    Height = 13
    Caption = 'List of Poolers on Server'
  end
  object Label2: TLabel
    Left = 315
    Top = 3
    Width = 74
    Height = 13
    Caption = 'SQL to Execute'
  end
  object Label3: TLabel
    Left = 9
    Top = 3
    Width = 52
    Height = 13
    Caption = 'Host Name'
  end
  object Label4: TLabel
    Left = 315
    Top = 41
    Width = 65
    Height = 13
    Caption = 'Param of SQL'
  end
  object Label5: TLabel
    Left = 9
    Top = 41
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Label6: TLabel
    Left = 428
    Top = 41
    Width = 62
    Height = 13
    Caption = 'Param Value '
  end
  object Label7: TLabel
    Left = 315
    Top = 79
    Width = 150
    Height = 13
    Caption = 'Tablename to use ApplyUpdate'
  end
  object Edit1: TEdit
    Left = 315
    Top = 18
    Width = 247
    Height = 21
    TabOrder = 3
    Text = 'SELECT * FROM EMPLOYEE WHERE FIRST_NAME like :FIRST_NAME'
  end
  object Button1: TButton
    Left = 568
    Top = 21
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 7
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 428
    Top = 56
    Width = 134
    Height = 21
    TabOrder = 5
    Text = 'Robert%'
  end
  object Edit3: TEdit
    Left = 315
    Top = 56
    Width = 107
    Height = 21
    TabOrder = 4
    Text = 'FIRST_NAME'
  end
  object ListBox1: TListBox
    Left = 119
    Top = 18
    Width = 193
    Height = 97
    ItemHeight = 13
    TabOrder = 2
    OnClick = ListBox1Click
  end
  object Button2: TButton
    Left = 568
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Execute'
    TabOrder = 8
    OnClick = Button2Click
  end
  object Edit4: TEdit
    Left = 9
    Top = 18
    Width = 107
    Height = 21
    TabOrder = 0
    Text = '127.0.0.1'
  end
  object Edit5: TEdit
    Left = 9
    Top = 56
    Width = 45
    Height = 21
    TabOrder = 1
    Text = '8082'
  end
  object Edit6: TEdit
    Left = 315
    Top = 94
    Width = 107
    Height = 21
    TabOrder = 6
    Text = 'EMPLOYEE'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 119
    Width = 652
    Height = 212
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = RESTClientSQL
    Left = 280
    Top = 168
  end
  object RESTClientSQL: TRESTClientSQL
    AfterOpen = RESTClientSQLAfterOpen
    AfterPost = RESTClientSQLAfterPost
    AfterDelete = RESTClientSQLAfterDelete
    FieldDefs = <>
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
    OnGetDataError = RESTClientSQLGetDataError
    DataCache = False
    Params = <>
    DataBase = RESTDataBase
    SQL.Strings = (
      'select * from employee')
    Left = 224
    Top = 189
    object RESTClientSQLEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Required = True
    end
    object RESTClientSQLFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object RESTClientSQLLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Required = True
    end
    object RESTClientSQLPHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object RESTClientSQLHIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      Required = True
    end
    object RESTClientSQLDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object RESTClientSQLJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object RESTClientSQLJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object RESTClientSQLJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object RESTClientSQLSALARY: TFloatField
      FieldName = 'SALARY'
      Required = True
    end
    object RESTClientSQLFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Size = 37
    end
  end
  object RESTDataBase: TRESTDataBase
    OnConnection = RESTDataBaseConnection
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
    Encoding = esUtf8
    Context = 'datasnap'
    RESTContext = 'rest/'
    Left = 226
    Top = 144
  end
end
