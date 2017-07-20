object ServerMethodDM: TServerMethodDM
  OldCreateOrder = False
  OnCreate = ServerMethodDataModuleCreate
  OnReplyEvent = ServerMethodDataModuleReplyEvent
  Height = 255
  Width = 366
  object RESTDWPoolerDB1: TRESTDWPoolerDB
    RESTDriver = RESTDWDriverFD1
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler not active.'
    Left = 152
    Top = 64
  end
  object RESTDWDriverFD1: TRESTDWDriverFD
    Connection = RestDWForm.Server_FDConnection
    Left = 152
    Top = 120
  end
end
