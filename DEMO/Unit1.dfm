object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Edit1
  BorderIcons = [biSystemMenu]
  Caption = 'Cliente de Testes Utilizando o PoolerDB'
  ClientHeight = 304
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
    Width = 133
    Height = 13
    Caption = 'Lista de Poolers no Servidor'
  end
  object Label2: TLabel
    Left = 315
    Top = 3
    Width = 74
    Height = 13
    Caption = 'SQL a Executar'
  end
  object Label3: TLabel
    Left = 9
    Top = 3
    Width = 81
    Height = 13
    Caption = 'Caminho do Host'
  end
  object Label4: TLabel
    Left = 315
    Top = 41
    Width = 87
    Height = 13
    Caption = 'Par'#226'metro do SQL'
  end
  object Label5: TLabel
    Left = 9
    Top = 41
    Width = 66
    Height = 13
    Caption = 'Porta do Host'
  end
  object Label6: TLabel
    Left = 428
    Top = 41
    Width = 111
    Height = 13
    Caption = 'Valor para o Par'#226'metro'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 82
    Width = 652
    Height = 222
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 315
    Top = 18
    Width = 247
    Height = 21
    TabOrder = 3
    Text = 'SELECT * FROM EMPLOYEE WHERE FIRST_NAME = :FIRST_NAME'
  end
  object Button1: TButton
    Left = 568
    Top = 18
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 428
    Top = 56
    Width = 134
    Height = 21
    TabOrder = 5
    Text = 'Robert'
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
    Height = 59
    ItemHeight = 13
    TabOrder = 2
    OnClick = ListBox1Click
  end
  object Button2: TButton
    Left = 568
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 7
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
  object DataSource1: TDataSource
    DataSet = RESTClientSQL
    Left = 280
    Top = 240
  end
  object RESTClientSQL: TRESTClientSQL
    AutoCalcFields = False
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
    AutoCommit = True
    DataCache = False
    Params = <
      item
        DataType = ftUnknown
        Name = 'FIRST_NAME'
        ParamType = ptUnknown
      end>
    DataBase = RESTDataBase
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE WHERE FIRST_NAME = :FIRST_NAME')
    Left = 252
    Top = 240
  end
  object RESTDataBase: TRESTDataBase
    OnConnection = RESTDataBaseConnection
    Active = False
    Login = 'testserver'
    Password = 'testserver'
    Proxy = False
    PoolerService = '127.0.0.1'
    PoolerPort = 8080
    PoolerName = 'ServerMethods1.RESTPoolerDB'
    RestModule = 'TServerMethods1'
    TimeOut = 0
    Left = 224
    Top = 240
  end
end
