object RestDWForm: TRestDWForm
  Left = 271
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Server REST Dataware'
  ClientHeight = 95
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 8
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Label2: TLabel
    Left = 66
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 191
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object ButtonStart: TButton
    Left = 38
    Top = 59
    Width = 121
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 165
    Top = 59
    Width = 121
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 11
    Top = 27
    Width = 49
    Height = 21
    TabOrder = 2
    Text = '8082'
  end
  object eUserName: TEdit
    Left = 66
    Top = 27
    Width = 119
    Height = 21
    TabOrder = 3
    Text = 'testserver'
  end
  object ePassword: TEdit
    Left = 191
    Top = 27
    Width = 119
    Height = 21
    TabOrder = 4
    Text = 'testserver'
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 163
    Top = 2
  end
end
