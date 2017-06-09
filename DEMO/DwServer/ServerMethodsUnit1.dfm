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
    Left = 83
    Top = 18
  end
  object RESTPoolerDB: TRESTPoolerDB
    Database = Server_FDConnection
    Compression = True
    Encoding = esUtf8
    Left = 116
    Top = 72
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 200
    Top = 72
  end
  object RESTPoolerDB_Backup: TRESTPoolerDB
    Database = Server_FDConnection
    Compression = True
    Encoding = esUtf8
    Left = 52
    Top = 72
  end
end
