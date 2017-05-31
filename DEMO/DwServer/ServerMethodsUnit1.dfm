object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 144
  Width = 222
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 75
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 112
    Top = 75
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 84
    Top = 75
  end
  object FDConnectionEMPLOYEE: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=..\EMPLOYEE.FDB'
      'User_Name=sysdba'
      'password=masterkey')
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords, uvFetchGeneratorsPoint]
    UpdateOptions.CountUpdatedRecords = False
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = FDConnectionEMPLOYEEBeforeConnect
    Left = 68
    Top = 29
  end
  object RESTPoolerDB: TRESTPoolerDB
    Database = FDConnectionEMPLOYEE
    Compression = True
    Encoding = esUtf8
    Left = 96
    Top = 29
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 140
    Top = 75
  end
end
