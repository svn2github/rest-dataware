object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 317
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 3
    Top = 7
    Width = 177
    Height = 82
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 95
    Width = 812
    Height = 222
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 232
    Top = 32
    Width = 249
    Height = 21
    TabOrder = 2
    Text = 'SELECT * FROM EMPLOYEE'
  end
  object Button1: TButton
    Left = 488
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    Left = 88
    Top = 120
  end
end
