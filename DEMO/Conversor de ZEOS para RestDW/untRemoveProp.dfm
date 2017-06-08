object Form1: TForm1
  Left = 189
  Top = 201
  Caption = 'Remover uma Linha com propriedade do DFM'
  ClientHeight = 729
  ClientWidth = 1284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object labProg: TLabel
    Left = 556
    Top = 12
    Width = 3
    Height = 13
  end
  object labLinhas: TLabel
    Left = 556
    Top = 36
    Width = 3
    Height = 13
  end
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 78
    Height = 13
    Caption = 'Pasta do Projeto'
  end
  object Label2: TLabel
    Left = 528
    Top = 12
    Width = 21
    Height = 16
    Alignment = taRightJustify
    Caption = 'Unit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 523
    Top = 36
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = 'Linha'
  end
  object Label4: TLabel
    Left = 391
    Top = 12
    Width = 22
    Height = 13
    Caption = 'Filtro'
  end
  object Label5: TLabel
    Left = 16
    Top = 72
    Width = 183
    Height = 13
    Caption = 'Propriedade a ser removida( sua linha )'
  end
  object Label6: TLabel
    Left = 8
    Top = 144
    Width = 74
    Height = 16
    Caption = 'DFM Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 607
    Top = 142
    Width = 91
    Height = 16
    Caption = 'DFM Original'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPas: TButton
    Left = 624
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Ajusta .PAS'
    TabOrder = 0
    Visible = False
    OnClick = btnPasClick
  end
  object edPasta: TEdit
    Left = 16
    Top = 28
    Width = 366
    Height = 21
    TabOrder = 1
    Text = 'C:\mkmFONTES\CONVERTER Zeos para RestDW\originais'
  end
  object Memo1: TMemo
    Left = 8
    Top = 164
    Width = 593
    Height = 350
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btnDFM: TButton
    Left = 716
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Ajusta .DFM'
    TabOrder = 3
    Visible = False
    OnClick = btnDFMClick
  end
  object Button3: TButton
    Left = 456
    Top = 224
    Width = 117
    Height = 25
    Caption = 'Executar Fase 1'
    TabOrder = 4
    Visible = False
    OnClick = Button3Click
  end
  object Memo2: TMemo
    Left = 8
    Top = 520
    Width = 497
    Height = 161
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object pg: TProgressBar
    Left = 960
    Top = 224
    Width = 150
    Height = 17
    Smooth = True
    Step = 1
    TabOrder = 6
    Visible = False
  end
  object edFiltro: TEdit
    Left = 391
    Top = 28
    Width = 101
    Height = 21
    TabOrder = 7
    Text = 'unt'
  end
  object btnPasFormShow: TButton
    Left = 820
    Top = 8
    Width = 127
    Height = 25
    Caption = 'Ajusta .PAS Form Show'
    TabOrder = 8
    Visible = False
    OnClick = btnPasFormShowClick
  end
  object Memo3: TMemo
    Left = 512
    Top = 520
    Width = 741
    Height = 161
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object Button1: TButton
    Left = 576
    Top = 224
    Width = 173
    Height = 25
    Caption = 'Fase 2: Height e Disable Buttons'
    TabOrder = 10
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 752
    Top = 224
    Width = 117
    Height = 25
    Caption = 'Fase 3: Anchors'
    TabOrder = 11
    Visible = False
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 872
    Top = 224
    Width = 173
    Height = 25
    Caption = 'Fase 4: MenuRel'
    TabOrder = 12
    Visible = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 456
    Top = 224
    Width = 241
    Height = 25
    Caption = 'Fase 5: Novas Cores TABS e GERAL FUTURO'
    TabOrder = 13
    Visible = False
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 700
    Top = 224
    Width = 241
    Height = 25
    Caption = 'Fase 6: Rodape dos Relatorios'
    TabOrder = 14
    Visible = False
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 456
    Top = 224
    Width = 241
    Height = 25
    Caption = 'Fase 7: Trocar o cinza claro dos Panels'
    TabOrder = 15
    Visible = False
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 720
    Top = 116
    Width = 141
    Height = 25
    Caption = 'Ajusta SETAS( .pas )'
    TabOrder = 16
    Visible = False
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 700
    Top = 224
    Width = 241
    Height = 25
    Caption = 'Fase 8: Novas Prop 3'
    TabOrder = 17
    Visible = False
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 286
    Top = 89
    Width = 241
    Height = 25
    Caption = '<- REMOVER Propriedade'
    TabOrder = 18
    OnClick = Button10Click
  end
  object edProp: TEdit
    Left = 16
    Top = 91
    Width = 129
    Height = 21
    TabOrder = 19
    Text = 'DisabledHighlight'
  end
  object Memo4: TMemo
    Left = 607
    Top = 164
    Width = 646
    Height = 350
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 20
  end
  object edProp2: TEdit
    Left = 151
    Top = 91
    Width = 129
    Height = 21
    TabOrder = 21
    Text = 'DisabledShadow'
  end
  object Button11: TButton
    Left = 528
    Top = 89
    Width = 241
    Height = 25
    Caption = 'Migrar ERP D7 -> DXe10'
    TabOrder = 22
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 286
    Top = 122
    Width = 241
    Height = 25
    Caption = 'Migrar ZEOS -> RestDW'
    TabOrder = 23
    OnClick = Button12Click
  end
  object OpenDialog1: TOpenDialog
    Left = 945
    Top = 75
  end
end
