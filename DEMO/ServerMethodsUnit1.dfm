object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 144
  Width = 182
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 67
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 104
    Top = 67
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 76
    Top = 67
  end
  object FDConnectionEMPLOYEE: TFDConnection
    Params.Strings = (
      'DriverID=IB'
      
        'Database=localhost:C:\Program Files (x86)\Common Files\Borland S' +
        'hared\Data\employee.gdb'
      'User_Name=sysdba'
      'password=masterkey')
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = FDConnectionEMPLOYEEBeforeConnect
    Left = 60
    Top = 21
  end
  object RESTPoolerDB: TRESTPoolerDB
    Database = FDConnectionEMPLOYEE
    Left = 88
    Top = 21
  end
end
