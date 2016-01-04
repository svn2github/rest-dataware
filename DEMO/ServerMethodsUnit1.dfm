object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 335
  Width = 514
  object FDQueryDepartmentEmployees: TFDQuery
    Connection = FDConnectionEMPLOYEE
    SQL.Strings = (
      'select * from employee where dept_no = :DEPT'
      '')
    Left = 288
    Top = 200
    ParamData = <
      item
        Name = 'DEPT'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = '000'
      end>
  end
  object FDQueryDepartment: TFDQuery
    Connection = FDConnectionEMPLOYEE
    SQL.Strings = (
      'select * from department where DEPT_NO = :DEPT')
    Left = 288
    Top = 112
    ParamData = <
      item
        Name = 'DEPT'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = '000'
      end>
  end
  object FDQueryDepartmentNames: TFDQuery
    Connection = FDConnectionEMPLOYEE
    SQL.Strings = (
      'select dept_no, department  from department')
    Left = 288
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 200
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 55
    Top = 112
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
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 392
    Top = 264
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=IB'
      
        'Database=localhost:C:\Program Files (x86)\Common Files\Borland S' +
        'hared\Data\employee.gdb'
      'User_Name=sysdba'
      'password=masterkey')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 151
    Top = 104
  end
end
