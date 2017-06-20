object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 196
  Width = 483
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 336
    Top = 19
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 337
    Top = 125
  end
  object Server_FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\mkmDados\MKMDATAFILE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'CharacterSet='
      'DriverID=FB')
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords]
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = Server_FDConnectionBeforeConnect
    Left = 59
    Top = 26
  end
  object RESTPoolerDB: TRESTPoolerDB
    RESTDriver = RESTDriverFD1
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Left = 60
    Top = 128
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 336
    Top = 72
  end
  object RESTDriverFD1: TRESTDriverFD
    Connection = Server_FDConnection
    Left = 61
    Top = 80
  end
  object RESTDriverZEOS1: TRESTDriverZEOS
    Connection = ZConnection1
    Left = 136
    Top = 80
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    BeforeConnect = ZConnection1BeforeConnect
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'firebird-2.5'
    Left = 136
    Top = 28
  end
  object RESTPoolerDBZEOS: TRESTPoolerDB
    RESTDriver = RESTDriverZEOS1
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Left = 136
    Top = 128
  end
  object RESTDriverUnidac1: TRESTDriverUnidac
    Connection = UniConnection1
    Left = 208
    Top = 80
  end
  object RESTPoolerUNIDAC: TRESTPoolerDB
    RESTDriver = RESTDriverUnidac1
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Left = 208
    Top = 128
  end
  object UniConnection1: TUniConnection
    AutoCommit = False
    Port = 3050
    BeforeConnect = UniConnection1BeforeConnect
    Left = 208
    Top = 24
  end
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 256
    Top = 24
  end
end
