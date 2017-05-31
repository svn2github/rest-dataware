object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 201
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 225
    Height = 185
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 288
    Top = 40
    Width = 75
    Height = 25
    Caption = 'List Poolers'
    TabOrder = 1
    OnClick = Button1Click
  end
  object RESTPoolerList1: TRESTPoolerList
    Active = False
    Login = 'testserver'
    Password = 'testserver'
    Proxy = False
    ProxyOptions.Port = 8888
    PoolerService = '127.0.0.1'
    PoolerPort = 8082
    PoolerPrefix = 'TServerMethods1'
    Left = 312
    Top = 80
  end
end
