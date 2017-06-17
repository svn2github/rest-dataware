object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 196
  Width = 293
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 200
    Top = 19
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 201
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
    UpdateOptions.CountUpdatedRecords = False
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = Server_FDConnectionBeforeConnect
    Left = 59
    Top = 26
  end
  object RESTPoolerDB: TRESTPoolerDB
    Database = RESTDriverFD1
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Left = 60
    Top = 128
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 200
    Top = 72
  end
  object RESTDriverFD1: TRESTDriverFD
    Connection = Server_FDConnection
    Left = 61
    Top = 80
  end
end
