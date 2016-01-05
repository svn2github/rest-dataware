object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 223
  Width = 232
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 88
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 111
    Top = 32
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 112
    Top = 88
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
    Left = 55
    Top = 32
  end
  object RESTPoolerDB: TRESTPoolerDB
    Database = FDConnectionEMPLOYEE
    Left = 80
    Top = 144
  end
end
