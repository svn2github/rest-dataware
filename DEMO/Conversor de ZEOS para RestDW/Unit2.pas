object frmCadRotas: TfrmCadRotas
  Left = 195
  Top = 217
  Align = alClient
  AlphaBlend = True
  AlphaBlendValue = 240
  Position = poDesktopCenter
  BorderStyle = bsNone
  Caption = 'Mikromundo NAUTILUS - Copyright 1998-2009 by Flávio Motta'
  ClientHeight = 815
  ClientWidth = 1289
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object paFundo: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 768
    Align = alCustom
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 0
    object pgGeral: TRzPageControl
      Left = 0
      Top = 132
      Width = 1024
      Height = 636
      ActivePage = tabGeral
      ActivePageDefault = tabGeral
      Align = alBottom
      BackgroundColor = 4605510
      Color = clSkyBlue
      UseColoredTabs = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HotTrackColor = clBlack
      Margin = 5
      ParentBackgroundColor = False
      ParentColor = False
      ParentFont = False
      SoftCorners = True
      TabColors.HighlightBar = 8404992
      TabColors.Unselected = clBlack
      TabIndex = 0
      TabOrder = 0
      TextColors.DisabledHighlight = clNavy
      TextColors.DisabledShadow = clBlack
      TextColors.Selected = clWhite
      TextColors.Unselected = clGray
      FixedDimension = 19
      object tabGeral: TRzTabSheet
        Color = 8404992
        Caption = ' &1.  GERAL    '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        object paDados: TRzPanel
          Left = 0
          Top = 4
          Width = 1020
          Height = 609
          Align = alBottom
          BorderOuter = fsFlatRounded
          BorderSides = [sdTop]
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          GradientColorStyle = gcsCustom
          ParentFont = False
          TabOrder = 0
          object labSituacao: TRzLabel
            Left = 8
            Top = 11
            Width = 36
            Height = 13
            AutoSize = False
            Caption = 'Código'
            Color = 15984858
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = 14540253
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object RzLabel6: TRzLabel
            Left = 8
            Top = 60
            Width = 92
            Height = 13
            AutoSize = False
            Caption = 'Descrição'
            Color = 15984858
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = 14540253
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object RzLabel8: TRzLabel
            Left = 8
            Top = 105
            Width = 92
            Height = 13
            AutoSize = False
            Caption = 'Complemento'
            Color = 15984858
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            Visible = False
            BlinkIntervalOff = 700
            ShadowColor = 14540253
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object edCodigo: TRzDBEdit
            Left = 8
            Top = 27
            Width = 53
            Height = 21
            DataField = 'CODIGO'
            ReadOnly = True
            Alignment = taRightJustify
            AutoSize = False
            Color = clMoneyGreen
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 8404992
            FrameHotColor = clRed
            FrameHotStyle = fsFlat
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnlyColor = clMoneyGreen
            ReadOnlyColorOnFocus = True
            TabOnEnter = True
            TabOrder = 0
          end
          object edDescricao: TRzDBEdit
            Left = 8
            Top = 75
            Width = 305
            Height = 21
            DataField = 'DESCRICAO'
            AutoSize = False
            CharCase = ecUpperCase
            Color = clWhite
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 1
          end
          object edtComplemento: TRzDBEdit
            Left = 8
            Top = 120
            Width = 305
            Height = 21
            DataField = 'COMPLEMENTO'
            AutoSize = False
            CharCase = ecUpperCase
            Color = clWhite
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 2
            Visible = False
          end
        end
      end
      object tabPesquisa: TRzTabSheet
        Color = 8404992
        Caption = ' &2.  PESQUISA  '
        object paPesquisa: TRzPanel
          Left = 0
          Top = 4
          Width = 1020
          Height = 609
          Align = alBottom
          BorderOuter = fsFlatRounded
          BorderSides = [sdTop]
          Color = 14211288
          TabOrder = 0
          object Shape1: TShape
            Left = 7
            Top = 37
            Width = 990
            Height = 174
            Brush.Color = clSilver
            Pen.Color = clSilver
          end
          object Shape2: TShape
            Left = 7
            Top = 183
            Width = 990
            Height = 26
            Brush.Color = 12615680
            Pen.Color = 12615680
          end
          object labObs: TRzLabel
            Left = 49
            Top = 190
            Width = 28
            Height = 14
            Caption = 'Obs.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 16777088
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            BlinkColor = 15790320
            BlinkIntervalOff = 700
            ShadowColor = 10485760
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object labRegistros: TRzLabel
            Left = 768
            Top = 188
            Width = 223
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0 registro(s) encontrado(s)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            BlinkColor = 15790320
            BlinkIntervalOff = 700
            ShadowColor = 10485760
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object RzLabel4: TRzLabel
            Left = 17
            Top = 190
            Width = 29
            Height = 14
            Caption = 'OBS.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            BlinkColor = 15790320
            BlinkIntervalOff = 700
            ShadowColor = 10485760
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object RzLabel9: TRzLabel
            Left = 2
            Top = 21
            Width = 433
            Height = 15
            AutoSize = False
            Caption = 
              '  Dados para Pesquisa ( campo CONTEÚDO em branco = TODOS os regi' +
              'stros )'
            Color = 14211288
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            BlinkIntervalOff = 700
            ShadowColor = clSilver
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object RzLabel7: TRzLabel
            Left = 16
            Top = 50
            Width = 111
            Height = 13
            AutoSize = False
            Caption = 'Pesquisar o campo...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clSilver
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel2: TRzLabel
            Left = 188
            Top = 50
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Que seja...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clSilver
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel3: TRzLabel
            Left = 600
            Top = 98
            Width = 150
            Height = 13
            AutoSize = False
            Caption = 'Ordenar o resultado pelo(a)...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = 14540253
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel1: TRzLabel
            Left = 600
            Top = 50
            Width = 165
            Height = 13
            AutoSize = False
            Caption = 'Escopo da Pesquisa( só palavras )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clSilver
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel5: TRzLabel
            Left = 344
            Top = 50
            Width = 141
            Height = 13
            AutoSize = False
            Caption = 'Conteúdo da pesquisa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clSilver
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object gridConsulta: TRzDBGrid
            Left = 7
            Top = 216
            Width = 990
            Height = 398
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgMultiSelect]
            ParentFont = False
            TabOrder = 12
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            FrameVisible = True
          end
          object btnPesquisa: TRzButton
            Left = 15
            Top = 145
            Width = 164
            Caption = '&PESQUISAR'
            Color = 33023
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TextShadowColor = 5460819
            TextShadowDepth = 1
            TabOrder = 9
            TextStyle = tsShadow
          end
          object btnExporta: TRzButton
            Left = 359
            Top = 145
            Width = 164
            Caption = 'EXPORTAR PARA EXCEL'
            Color = 33023
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TextShadowColor = 5460819
            TextShadowDepth = 1
            TabOrder = 11
            TextStyle = tsShadow
          end
          object btnDesbloqueia: TRzButton
            Left = 187
            Top = 145
            Width = 164
            Hint = 
              'Desbloqueia o(s) registro(s) selecionado(s)'#13#10#13#10'Quando outro usuá' +
              'rio altera ou cadastra um registro em outro terminal,'#13#10'este regi' +
              'stro fica BLOQUEADO e não pode ser modificado. Se houver '#13#10'algum' +
              'a falha no desbloqueio, então pode ser feito desbloqueio '#13#10'manua' +
              'lmente.'
            Caption = '&DESBLOQUEAR'
            Color = 33023
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TextShadowColor = 5460819
            TextShadowDepth = 1
            TabOrder = 10
            TextStyle = tsShadow
          end
          object edPesq1: TRzEdit
            Left = 344
            Top = 65
            Width = 245
            Height = 21
            Hint = 'Conteúdo a ser pesquisado'
            AutoSize = False
            CharCase = ecUpperCase
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 2
          end
          object cbxCampos: TRzComboBox
            Left = 16
            Top = 65
            Width = 165
            Height = 21
            Hint = 'Campo para pesquisar'
            AllowEdit = False
            Ctl3D = False
            FrameHotTrack = True
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ItemHeight = 13
            ParentCtl3D = False
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 0
            Text = 'Código'
            Items.Strings = (
              'Código')
            ItemIndex = 0
          end
          object cbxAcao: TRzComboBox
            Left = 188
            Top = 65
            Width = 145
            Height = 21
            AllowEdit = False
            Ctl3D = False
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ItemHeight = 13
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 1
            Text = 'Igual a...'
            Items.Strings = (
              'Igual a...'
              'Diferente de...'
              'Maior que...'
              'Maior ou Igual que...'
              'Menor que...'
              'Menor ou Igual que...')
          end
          object cbxFields: TRzComboBox
            Left = 404
            Top = 41
            Width = 53
            Height = 21
            AllowEdit = False
            Ctl3D = False
            FrameVisible = True
            ItemHeight = 0
            ParentCtl3D = False
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 13
            Visible = False
          end
          object cbxTipos: TRzComboBox
            Left = 496
            Top = 41
            Width = 53
            Height = 21
            AllowEdit = False
            Ctl3D = False
            FrameVisible = True
            ItemHeight = 0
            ParentCtl3D = False
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 14
            Visible = False
          end
          object cbxOrdem: TRzComboBox
            Left = 600
            Top = 113
            Width = 163
            Height = 21
            AllowEdit = False
            Ctl3D = False
            FrameHotTrack = True
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ItemHeight = 13
            ParentCtl3D = False
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 8
            Text = 'Código'
            Items.Strings = (
              'Código')
            ItemIndex = 0
          end
          object cbxCondicao: TRzComboBox
            Left = 16
            Top = 89
            Width = 57
            Height = 21
            Hint = 'Condição para a segunda pesquisa'
            AllowEdit = False
            Ctl3D = False
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ItemHeight = 13
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 4
            Text = 'e ...'
            Items.Strings = (
              'e ...'
              'ou ...')
            ItemIndex = 0
          end
          object cbxCampos2: TRzComboBox
            Left = 16
            Top = 113
            Width = 165
            Height = 21
            Hint = 'Campo para pesquisar'
            AllowEdit = False
            Ctl3D = False
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ItemHeight = 13
            ParentCtl3D = False
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 5
            Text = 'Código'
            Items.Strings = (
              'Código')
            ItemIndex = 0
          end
          object cbxAcao2: TRzComboBox
            Left = 188
            Top = 113
            Width = 145
            Height = 21
            AllowEdit = False
            Ctl3D = False
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ItemHeight = 13
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 6
            Text = 'Igual a...'
            Items.Strings = (
              'Igual a...'
              'Diferente de...'
              'Maior que...'
              'Maior ou Igual que...'
              'Menor que...'
              'Menor ou Igual que...')
          end
          object edPesq2: TRzEdit
            Left = 344
            Top = 113
            Width = 245
            Height = 21
            Hint = 'Conteúdo a ser pesquisado'
            AutoSize = False
            CharCase = ecUpperCase
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 7
          end
          object cbxEscopo: TRzComboBox
            Left = 600
            Top = 65
            Width = 163
            Height = 21
            AllowEdit = False
            Ctl3D = False
            FrameHotTrack = True
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ItemHeight = 13
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 3
            Text = 'em qualquer posiçao'
            Items.Strings = (
              'terminando com...'
              'começando com...'
              'em qualquer posiçao')
          end
          object cbxTipos2: TRzComboBox
            Left = 456
            Top = 89
            Width = 53
            Height = 21
            AllowEdit = False
            Ctl3D = False
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ItemHeight = 0
            ParentCtl3D = False
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 15
            Visible = False
          end
          object cbxFields2: TRzComboBox
            Left = 400
            Top = 89
            Width = 53
            Height = 21
            AllowEdit = False
            Ctl3D = False
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ItemHeight = 0
            ParentCtl3D = False
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 16
            Visible = False
          end
          object cbxOrder: TRzComboBox
            Left = 560
            Top = 137
            Width = 53
            Height = 21
            AllowEdit = False
            Ctl3D = False
            FrameVisible = True
            ItemHeight = 0
            ParentCtl3D = False
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 17
            Visible = False
          end
          object chkDecrescente: TRzCheckGroup
            Left = 760
            Top = 110
            Width = 177
            Height = 25
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            GroupStyle = gsCustom
            ItemHotTrack = True
            ItemFont.Charset = DEFAULT_CHARSET
            ItemFont.Color = clBlack
            ItemFont.Height = -11
            ItemFont.Name = 'Tahoma'
            ItemFont.Style = []
            Items.Strings = (
              'Listar em Orderm Decrescente')
            ParentFont = False
            TextShadowColor = 14540253
            TextShadowDepth = 0
            TabOnEnter = True
            TabOrder = 18
            TextStyle = tsShadow
            CheckStates = (
              0)
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1024
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      Color = 4194309
      TabOrder = 1
      object Shape3: TShape
        Left = 0
        Top = 76
        Width = 1024
        Height = 5
        Align = alBottom
        Brush.Color = 43263
      end
      object labTitulo: TLabel
        Left = 0
        Top = 0
        Width = 541
        Height = 56
        AutoSize = False
        Caption = ' Mensagem do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -37
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        Visible = False
      end
      object TextFader1: TTextFader
        Left = 0
        Top = 52
        Width = 209
        Height = 20
        Active = True
        Alignment = taLeftJustify
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Lines.Strings = (
          '   VISUALIZANDO'
          '')
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object labSistema: TRzLabel
        Left = 694
        Top = 6
        Width = 50
        Height = 14
        Alignment = taRightJustify
        Caption = 'Sistema:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2020846
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        BlinkColor = clNavy
        BlinkIntervalOff = 700
        ShadowColor = clBlack
        ShadowDepth = 1
        TextStyle = tsShadow
      end
      object stSistema: TRzLabel
        Left = 748
        Top = 6
        Width = 198
        Height = 14
        AutoSize = False
        Caption = 'Código'
        Color = 15984858
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        BlinkIntervalOff = 700
        ShadowColor = clBlack
        ShadowDepth = 1
        TextStyle = tsShadow
      end
      object stUser: TRzLabel
        Left = 748
        Top = 23
        Width = 198
        Height = 14
        AutoSize = False
        Caption = 'Código'
        Color = 15984858
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        BlinkIntervalOff = 700
        ShadowColor = clBlack
        ShadowDepth = 1
        TextStyle = tsShadow
      end
      object RzLabel10: TRzLabel
        Left = 697
        Top = 23
        Width = 47
        Height = 14
        Alignment = taRightJustify
        Caption = 'Usuário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2020846
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        BlinkColor = clNavy
        BlinkIntervalOff = 700
        ShadowColor = clBlack
        ShadowDepth = 1
        TextStyle = tsShadow
      end
      object RzLabel11: TRzLabel
        Left = 691
        Top = 40
        Width = 53
        Height = 14
        Alignment = taRightJustify
        Caption = 'Empresa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2020846
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        BlinkColor = clNavy
        BlinkIntervalOff = 700
        ShadowColor = clBlack
        ShadowDepth = 1
        TextStyle = tsShadow
      end
      object stEmpresa: TRzLabel
        Left = 748
        Top = 40
        Width = 198
        Height = 14
        AutoSize = False
        Caption = 'Código'
        Color = 15984858
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        BlinkIntervalOff = 700
        ShadowColor = clBlack
        ShadowDepth = 1
        TextStyle = tsShadow
      end
      object stRegistros: TRzLabel
        Left = 748
        Top = 58
        Width = 198
        Height = 14
        AutoSize = False
        Caption = 'Código'
        Color = 15984858
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        BlinkIntervalOff = 700
        ShadowColor = clBlack
        ShadowDepth = 1
        TextStyle = tsShadow
      end
      object RzLabel12: TRzLabel
        Left = 709
        Top = 57
        Width = 35
        Height = 14
        Alignment = taRightJustify
        Caption = 'Regs.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2020846
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        BlinkColor = clNavy
        BlinkIntervalOff = 700
        ShadowColor = clBlack
        ShadowDepth = 1
        TextStyle = tsShadow
      end
      object Panel3: TPanel
        Left = 837
        Top = 0
        Width = 187
        Height = 76
        Align = alRight
        BevelOuter = bvNone
        Color = 4194309
        TabOrder = 0
        object btnHelp: TPNGButton
          Left = 119
          Top = 9
          Width = 66
          Height = 64
          ButtonLayout = pbsImageAbove
          ImageNormal.Data = {
            89504E470D0A1A0A0000000D4948445200000042000000420806000000E35400
            E80000001974455874536F6674776172650041646F626520496D616765526561
            647971C9653C0000032269545874584D4C3A636F6D2E61646F62652E786D7000
            000000003C3F787061636B657420626567696E3D22EFBBBF222069643D225735
            4D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D70
            6D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A
            786D70746B3D2241646F626520584D5020436F726520352E302D633036302036
            312E3133343737372C20323031302F30322F31322D31373A33323A3030202020
            2020202020223E203C7264663A52444620786D6C6E733A7264663D2268747470
            3A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E
            7461782D6E7323223E203C7264663A4465736372697074696F6E207264663A61
            626F75743D222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F
            62652E636F6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D226874
            74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F222078
            6D6C6E733A73745265663D22687474703A2F2F6E732E61646F62652E636F6D2F
            7861702F312E302F73547970652F5265736F75726365526566232220786D703A
            43726561746F72546F6F6C3D2241646F62652050686F746F73686F7020435335
            204D6163696E746F73682220786D704D4D3A496E7374616E636549443D22786D
            702E6969643A4443373241374432383032353131453038363436394143383237
            3930374245372220786D704D4D3A446F63756D656E7449443D22786D702E6469
            643A444337324137443338303235313145303836343639414338323739303742
            4537223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E
            7374616E636549443D22786D702E6969643A4443373241374430383032353131
            453038363436394143383237393037424537222073745265663A646F63756D65
            6E7449443D22786D702E6469643A444337324137443138303235313145303836
            3436394143383237393037424537222F3E203C2F7264663A4465736372697074
            696F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F78
            7061636B657420656E643D2272223F3E0EFDB277000020534944415478DACD5C
            07601465DA7E66B66F36BB9BDE43A80102080490AE1E8A05B18B729EA7DE9DA7
            E7799E9E9E8A0216406C2867A1082A220191227014A9A186222110420B098440
            20BDEE26DBF77FBF6F66369380A79EFAFFFF1EDFCD66767676DE679EF779CBF7
            8D02FE775E823C7085ED955E4179B47FFFAB5EE07FFD723A1D08048210E82C3E
            9F9FB602441AE156AB62381F79870E75B2DA6CFD351A4DFF602090EEF7FB53FC
            017FB4DF1F30D0DF080683749E003BD64DA34EA3112FD0794FFB0381BC969696
            8353A74E2D5CB76E9D5F01A5B8B82848E740B76EE9FF3F81B0DBEDEC7C223B6F
            7E7E7E17AB35FC0E01C21832B22F196B1144115AAD8686960F51D470F0080990
            D1740E1FBC1E375C6E1A2D2E783C1EF8FD3E170198AFD16837363636AEBEE6DA
            6B8FC88004F00B32E51701223C3C5C01403C5D5838C264323D4AC6DF1244D0AA
            D7EB61349A6818C1DE8BA2F8A3CECDEEB89B00696C68405D7D1D6D1BE1F57A5D
            4683619B3F18983778F090752A307EB6FBFC2C20E4EF73008E1F3FDEDF6AB5BE
            4054BF4DD4881AB3390C616161D0E9746DBEC0EE32DD59381D0E7AEFE64CE027
            2176180C0698E93B741E0E9AFAE572B9505D55854B972EC2E17042AFD365EBF4
            FA37AF1E3C385B06E46731E4BF0542F17F71EEDCB9B63163C64C207A3F49D437
            103B3800CA9D2766E0FCF9F32839538CF3A525A8AFA926109AE076B9B93B31BF
            22EA7397D191BBD01D8785CE1111158384945424D348484CE4C728E72B2F2FC7
            B9B367E1703A026161962F2A2A2B5FBDEBAEBB2EA22D437E75201416680A0A0A
            06474644CCA48BEBC78C27910C5D70437D3D0EE5E6E2D8D1C3A8AA284793D385
            FAE6001A7C7AB8F456729A18E86D91305AED30845BE80E6BA1F1BBA1F73861F4
            D423CC4DC3E744985E4064742C3A764D47B71E3D60B7D9F9F9999E9C2B294171
            5111B43A6D3101FAECA851D76FA08FFCFF0D3B7E2A10EC7866A9E6EC9933BF23
            FABE47865B6D763BD700F662B4DFB93D1B870F1E401DF977951338532BA04A88
            8026B133223A76863D210166329E0CA0130A0804035C6BFC347C6C4BFA009F1B
            467723A2DD1548745D44B4B716564B18D2D27BA0CF557DB9FB70C01BEA71F448
            3EEAEAEABC31B1B1AF0E193A74860A8CC0AF0184280FED850BE79FA7AFBE4AC6
            0B1429422CC8D9B31BDB366E40756D1DCA9A34C8BB1844435822E2AEEA8F941E
            DD60B38743476710C8581181D08FB35BC740F0B3E8E10FC0EB0FC24B7FBBC91C
            379912F07939103D7DA548F395C31666468FBE99E89991C17F9BB1A3E0E851CE
            8EF8F8F8B9CFBFF8E273393939AE9F02C68F0542014177A1ECC2242188096166
            336C1111D25DA96FC0F2655FE1787E1EAA5D7AE49CF5E112A2903A7428D2FA64
            C0643240A48BD5D019B4F47F5A51E0431405CE083FCF23181B24107C1C8CD6E1
            A17D2D7E011ED294A4401D86092548431D6293533170C8B0103B4E9C388E82FC
            7C1033BE7CE1C5097F3D70E0804BC58E9F0D44088473E7CE3DAB11C5294C1029
            41E21F96949CC5E22F3E47794525F2AB0CC839E743549F4C741D399C44CF02D1
            EFE546EB08009D9686286F593E41EF591AC180F0F902DC506EBCAF1D10CADFB4
            75905901729DC1BA725CA72B4584C58C7E570F43525212BF9E53A74E726D8A8F
            4F98FF9B51A3FE4EBBBC3F068C1F0242D104DDA953A7EEB78485CD379BCDA25D
            66C2F163C790F5C5A7A86972635BB1806287015D46DF88841EDD2106FCD0D2B7
            F50C008DC08D371AF53C2AB0FD42C0C7140F7E32DEC718C1922B8D96B62219EC
            A784CA03B7D7A762452B406E6248A35740274D031E082F4582D18F5E0386202D
            2D8D5FD7B1820202E3203A76EE3279C488114C333C3FE426C28F0041BB6BD7AE
            BE1DD3D2361A8C466B545414CF064F1C3F812FE6CF41354582B5C7FCA8D545A1
            DBD85B111E1B47EAEFE10CD093FFB2ADD1A4E780345556A0BCB008178ACEA2B1
            AA0641F2FD30BD0666037D6E24F7A1DC438C8884253109D6A46418C32C1495C9
            70B7A70D100A3B1A08CB48C18DC7A3CBD0D9E44646E660A4A6A6F28BDFBF6F1F
            4E9E38E14B4C4EBE6FF4E8D11B54CC08FE14209410A9BDE79E7BAC3367CEDC40
            3544666C5C1C17A7F3A5A598F3F1BF50D1E0C1AA021F1C260A6F636F8799854F
            BF4FA23E0382E86F0A33C171B10CA776EC4459FE313A6B10C3FA76C5A8ABBB63
            40461A52E2233810CC45DC1E2F451A278A2E54E344750B8E3500E55A2B4C143E
            35EC730284892803C52783D2E80DC22278F15C6239BA59FCE83D7008E2E83A99
            807EBB61035A5A9A4BC96D473DF5D453E7C91E1FBE27B47E1F10A2CC06C39933
            6726E8349A97A26362E8CE925194117E34F35D9C2BABC4AAE322AA442BD2C6DE
            45F94038B4E40E7A5907F43ACA14E92E5F38B01FC7366F069A5B30EEB6E178F6
            A11B302823ED474813505B5387CD87CE60C18132949813608D8A8497D26E1E55
            6477F1915E347A8288D478F17AA76A74B0EAD06F08E913E535B5B5B558B36A15
            E2E2E3B36E1933E62F908A3A058C1F04427109FDF2E5CB33060D1A944D270D8B
            888CE41F7EB9E0737C77601F36971871B24644D2AD77C01C134B20A89840AC31
            50A428DDB50367B66C852DCA86D9131FC4F89B07867E8465883FF46251855D4E
            3D85E3B796EFC3D27203ACC9C9F0519AEEF53166B48A6B1D81D12BCC83A95DEB
            101F1B83BE0306F2ECF6705E1E5DEF017F6252D21DB78E1D9B2D8371998B5C09
            08AE0B348CC5C5C5F30C06FDBDA4C0DC250E1DCA45D6E7F370A4C684ADC75D88
            BCEE7A58BAF4808E22030340CB2383001385D6AAC387707ADDBF111569C38A99
            4FE09ACC6EFCE4ACE46E730142BB4B60C2A93A8625571A166A8500662CD98599
            8520FD488287B909072218D28D7A5710F727BBF0D7342752BAF64407124F9FD7
            8B152B96B353E53CFDCC3F6EA3F49C523CAE176D5CA43D10820C827EE5CA9599
            99FD333759ED56034B6B9B9B9BF1C18C7770EA420DBE3A44229CD61DB661BFE1
            EEC0A282141D880D061DFC8D0D38F9D522F85B5AB0E2832771FB35577D2F007E
            BABB17ABEAE1747961D26B911863834ECE52196BD8E099267DDFA013F0CF4FB6
            E0CB5A3BC2ED56D2145F9B30EB22660468BCDFD785C1711AF422F164196FE1C9
            53D8B2651362E3E2C7DF3B6EDC5A152B02DF07040F95344C142E679A8CC6DF13
            A5381BB66ED98CB5AB5660538901C76B34B0DD7427F4ACBAA433E86410B40488
            D16C44F98E6D28DFB50B8F3D720BE6BCFCDB2B82E0A5A22B6BEB116C2AAA47A5
            5F4B8E4BE193408D143CB8A1B30D8FDC9C49D5A89E83A00CE629CD8D4D18F3E1
            6E9444758126E8E36E216985C40C17A5A257D9FDF87080178954B075EED2950B
            E7D2254B5864DA366EDC7DF7D225B4400AA9FE2B01A1688371D2A449A98F3CF2
            C80E6B787874547434296F0BFEF5EE5BC82FADC7D7B92E687B0F84A15726B1C1
            1B6282943069780255BC7C318C5E1772974E429794D8364030101A1B1DF8C7E7
            3B9147D9673455964C58D9312CB17293EF971E3F89AB1C2558F8FA833053E865
            552A03826D2D462DE6AF3D80670F7A6121F1F450AEE153426B400285D2504C27
            39BAA5A30EDD7AF7E3FD90BC4387B067F72E37A5F2373DFDCC33B974292E5938
            83ED81101536ECDBBBF7610A41EFB3F297F5080E504CFE7AC9226C3CA345418D
            16865163A1A508A297D9C098C0F4811DEBADB88892654B70DBE84CAC7EFF89CB
            D940BFFBFCFCADD8E48941526234B986971FC35B4E6C1BA423A81CCF9E330F93
            EFEA87D79EBC8B356442AC6061F4FC850A8CFE341F8ED83404BD9E10233CCC8D
            0810B8FCC88C0E62D6082D92523B208998C18AC1455F2E447474CCFBF7DD7FFF
            54FAB966B4E6166D1AA93C5CD2083B79F2C4C23073D88DC92929FCC3F9736661
            DF9193589C4BD95E5A06C43E43A00B7AA57459238484524FFEE83A5B888BDF2C
            C3FBAFFD014F3F304AA58141CE86830567F0C837C5884DEFCE8DE0BF1C64FF18
            0852BA2D68F5C8FF6625A21D1538B2E255D20E1DDD79090C965E073C2E8CF928
            07478CC9D006DBA6E3410242205710BD017C7ABD01433BDAD0B97B2F1E4156D1
            39ABABABF3A74C9D36A6B494E82DB182471035108C0DC6871F7A2869E2C489DB
            A9B48E8D26B7A8A9A9C6AC9933B0FB8C1B9B4EBA210C1B0D212A8E0E0E485142
            9418C1C160AE411756BE691DA6DED31FF7DD341011E12658A81E802855A8AF2C
            DC8E658D7644DB2DAD6C91810804B926D2558928589A05B3A30E79CB5E4152AC
            0D2DA4291C08BAEB2C54DF336B17B6FAE361201E2B451ADB8A748CC05CA9C587
            877B1BF0C2600B923AA5B37622778F1DDBB3DD4DCEE6D193274FCE97B5824710
            41E516AC37665EBA74E9280A175FB390C99A2DB907BFC3D2C58BB0FA3850D812
            0661E88D445D8D64BC283181BB860C086BCA6A48F402B55508137C88A4B3C69A
            34880DA3886016B0E98C032DA9147285B62EC33BD9B44B3418515F7C1A852BBE
            4646B7147CB7E8451E92BDA4050A10A2CF8D5B49307384447E1E06026BF97136
            3051657AE2F22123528305636D482166C7913D951515589CB5085A9DFED9BF3D
            F5D442FA59A7229A0A105AC52DA8AE7832213E6E526A8734DE6F5C453178CBF6
            DD58446ED114D319C8B89ADD3BFA869C37880A0812101A41E0CCD010204A880C
            FA5918F4735708371B7834502B74500642248D715EBA849275ABE0BE54890F5E
            7F187F1BFF1BDEC455478EEACA1A8C9C958B727B2A19EE959B3901CE04CE0816
            6EC935F4413F16DF1D85019D6291D4A1133FCFE79FCE27726A173CF6F8E313E8
            671D8A682ABD479E40D108A712F67DAA2EC7B14A8E19F2E9EC8FB0E33095DAB9
            CD10BA0F4430A50B5D3419A561D5A2D80A02034466064B804283682ECAEF453A
            4E947DA14DDC66F3213A039A4A8A707EF306F8AA6BF1D73F8CC1BF5E180736EF
            C19222A5DD6F35EBB070C321FC615B2374E4BAFC33BFCC84800C06134CFADBD3
            E2C5CC5B627077BF2824A675E53AB16471164BBD773DF9B7A71EA05F6E54DC43
            0182DD22130D6B5E5EDEA2A8C8C8112954C5B5B4B830EFE399D85A508D35475B
            A0EF3702818838CE8800DD753030E45E834694C0D0C8ACD0B07D820C00DF327B
            457E4705C578792B10F31A0A0EE3E2CE6D44541F5E7FEA2E4C7A6C0C07412D92
            3CFF687660D48C1DC833A6F008E293411014307CD27BC60C97D38BA74746E2D9
            6BE31093DC9147B5756BFF4D95F3F1C27FBEF0E28D32104E0588903ED0B01110
            6B62A2637A2525273185C5E7733FC6FA82266C2FF240DFFF5A04CDE108923501
            B28CB122C8EE326384203142A366842075A1D856E0808083C2FEC7FFF1C68C88
            FADC1CD4ECCF214D3263D6E407F1FB5B077310BCBE565D60AE433283BFCFDD8A
            0FCF99A0A5CCD24FBA010504CE8640C835041988F1FD6C78F3B664CA575261A6
            D47FE78EEDD8B57367C5C4C9AF0C277BEB6520DC0A105C1F68D80F1F3EBC3936
            36362D21210117CB2EE0CBCFE66175BE037B4B0330F4BD06414A4E2420241082
            A2D80A866C74AB6B30B7603F20B14290DF73ED606D3A8A248DFB77A021F70012
            93E2B0E8CD3FE1BA81E95C4F58F2A4A4D81C044A5ADE58B40B2F1F74418C8B97
            422F9B65630C6020F8032126280C692120C66658F1D17D1D10159F44405B7060
            FF7EAC5FB7AEF6B5295386C84038142094FCC1C280A0C26A2B8190CCA246E9B9
            7358FCC5675871D88983657E18FB8C24208C14DE2E07826D058DC406D6811245
            591B04299BD4F0FEA4F49EE3A0D3A3396F2F019183D40E0958FBD1DFD0BB6B12
            D701050036D8B11474F046168170807220BA2E12063294C4D52F69410888406B
            F864EF9B0988DB7AD9F0F1F84E88884BE040B0CED5EA6F56D5BD3E6DDA50BA9C
            BAF64018652022720F1EDC92909890949090C81B304B167E8EE5879BF0DD791F
            4CBD8623A837B61AAF6905810DE62ECC0518DD992668E44961DEA41524D7E05B
            D2045F59099AB6AD873D3C0C1BE73E8381191D7806A9068195F52C657F79C14E
            BC7D94DC80984035B86C7450624040E51A7EC93D04795FB3D383DBFA4460D683
            5D618F8EE7B36807291D58F3CD377553DE983E4C6644138B1C4AC4608C086740
            50EDBE3E3E3E3E8D6595972E5EC4922F3FC3AABC46EC2A76C1DC732831C2CC5D
            83EB03074490B7F2DF8220B3430641D10515104C1B3C3BD6C3537A0EB329443E
            7EEF355456BBE5145B9A103650FDD1DCD48427E6EEC0E20B747931D110C81D38
            0081562084F640A834C3E9F0E04E8A181F3F940E1B0161A2B2605F4E0ED6AE5D
            53376DFA5BC36546B40122C4889C3D7B96916B64A475ECC8264DB078C17CFCFB
            702D361634C2DCED6A52121B191B0C09A5C206E53DB356DA27F00C516288CA25
            34945F34D6C2B379157A774BC2BE85CFF35C8475B095D29B8150535D87DF7EBC
            03D98E0892F0704A99C91D58DAA9801008B4D106E97D5B509C0E371E1E9E80B7
            1EA0CC323296A286115B366F26C1DC513165DA3496FFD77E2F103BB66F9F478C
            18D62D3D9DF708B316CCC396C397B0647F0DCC1DAF82688BE340708D908D0677
            0B8D0C82BC4F6646501646BE654249758378A118FE9D1BF1E213B763FA5377C2
            E96C960A2F1A4C4B9A1D4EDCF1DE56EC692116508ACE6A0785059701A1D28736
            C010288E260F26DED519CF8CED0C4B442CCF7A572C5B868282A3A75F7D7DCA9D
            570222E41A9B376E9C121B1F7F77AF5E52A1B26C4916761E3A8D39DB2BA08BE9
            046D6C67298F08192EDF7DCE08091C090489112110D83E76CBF50688678EC27F
            28078B673C86FBA94A6D74BAA422838EB018B4984025FA3B79543845DAC8209F
            044050E512ACCDC7B78A5006DB02A2448D660FE6FFE52ADC3E2405E111319C95
            9FCC99430955CDEE092F4F7CACBD6BB411CB2F177EF1C71E3D7A3C9791D18B37
            6BB3B76EC1CEDD7BF1E1B62ACA3EAC30A5F40EE9402B0042C845D08E05123BA4
            C489EFA76881A27C040A0F63D3ECA730B26F27385D1E29C566933DA415D7BEBD
            1D05C158AA23027215166C0520D85E230232304AD49080F07BFD947750C5F9F2
            D5E8D93106E1B648DE65FBD7FBEFB1F993AC0913264C53450DD765E1F3A5975E
            1A79FBD8B19F74EEDA45888A8AC6A99327B071DD1A2CC8A9455E690B6C69FD11
            D4195B4160C685B4423696832186D8110281718252E940F1118825C7B06DDED3
            C84C4F46B3CBC3F58165A335B5F518FECE5E941B6279ADC00D9781508C0DEDF3
            B7D70BBFCC0E3F65C55E0CEA6CC7572F0E86D56EE7A1F33C89F39CD9B3D8B54D
            9A3EFDCDE5ED81689350914BA4CC9E356B3185D0F8CE9DBBA0A9C981155F2DC4
            96A3D5C8DA751196847468AD0954B7065A19208A2ABD9099A0002277A2D93F09
            342D02F595C089BDD83AF38F18D02305CD6E2F378E65A6972A6A71CDFB075163
            8CE5A5BE249032238281103B7E482B1A1BDD9830AE3B5EB8AF27F4663B11518F
            EDD9DBB069E3B72D274E15FE6ED5AAD505ED132AA533C58060139A511BBFFDF6
            CDC8C8C851FD3333B94E6C58BB06B9F927F1F6FAF3F40D0BC2E27ACA86B70A62
            286AA8DD82B342720B090CB91AA58B0A1218DDC30374A78C7C021872E386ADA8
            39D9A485DF102E69007D24045B3582831202C3DFAA0F2130487459278BDEAF9A
            720DAEEA12030BB90553A039B33E46755575C1EB53A73E4A895B950C44B30284
            D29431CB8219F5DE8C1977646666BED2BB4F1F444444A0E8F469645355B8785F
            35B61FAD822D31031A938DEE57B095151AC57095267090D0EA1E9CFF5A02A11C
            C1C62AB829E181D7AF5461921E180900CA02CD160BAF3704A9466F0D9DDFC308
            E56F56813A9ADCB87960223E7B7118F4A630B0654C95959578FFDD7761349BE7
            BDFADA6B73E9AC35341A9496DD65653813CCBE7DFB76983163C6E7F1F171B13D
            7B66F0B477CDCA653852548EB7561791F2DB6189EA2AB57594E8404004647750
            34A1AD50CAC66A29ABBC54087FD9093C71EF087488B34B3984DCA532EA44EC3C
            5185B5172C301A0D9789A5C20EB5E16A505873C6E3F222EB956B306A6032196E
            E3ACDEB86103B66ED9D2525854F4E8EA356B8ECAA1B351EE4778D58D19BD2298
            34A257AC58FEF7087BC4B8AB070FE6551B95AED8B79BB2BCBD15D872E812EC71
            E9C48A48A949C3F2084518DB470D41114C05082DBC9567E0AD28C2E60FFE8C41
            3D92431AC12207EB377CB032172FACAE4478B8B9AD38867A79570AA512484D8D
            2EDC3A34199FBE3C125ABD99B38175E1DF9EFE06CCE1E13B9F7FFE8597E942AA
            55E9B55B69CCB469D5B19E04738FBBEFBE3BE3CF7F7E74766A4AAAB97B8F1E7C
            FA7EFDBAD5283E578E292B4EA1D1A5813D2A9DBEA9E53A7059F224B4DFCA2E42
            AEE1A92E81B7AA182BA73F88FEE9096871F924B721432C261D3E59978FD7D657
            F395319057DDB5D788362155760F9F870A4362E637EF8CA6022E96D810CED940
            492256AE5816F0FA03FF9C3D7BCE6E1908C52DDAB4EA14F73029F90463C5574B
            963C1B19611F3B74D8708491CF9695956177F666EC3A59878FD79E4458782CED
            4FE5B46F6584705936D9AA130C721DDC75E7E0A9398BE5D31E40DFAE09703146
            C8EDBA700262FEFAA398B2B68A03C19605A80D0F01A04EB759346133E3C486D7
            1F1F84BF8FEF43099F89AFC56093D68C0D7A8371FFA4575E99206B439DAA3BC5
            2785D51D33C53D42D1E3BAEBAEEBFACFE79EFD302626D63E60A034817BF0C001
            14151EC7173BCAF0EDFE73B0457680C118C35D24A8D2073533B80ECACD39B618
            C4D540D1A7BE144B5FBB9F80886F030463C4A71B0A307D4DA5C488A05A30DB33
            42628348FBEA1B5CB8E3DA8E983BE93A6828576179037BAD5CB11C3BB2B33D8D
            CEE6E7162C58902B03110A9B68D7CE57DC4327B3225C6645D4471F7E382E2539
            F9F17E99FD919292CA857347F65694975760C69AD3C82BAC42644447E87536F8
            45B933ADB8891A0839740AE44A2D4D6570359662C5D4F1E84F40B4B8A50927F6
            ED70A30EF38811D39697C366317143D9070224103810688D1C2201C27286CCEE
            D1C87AEB26BA9630CA882DDC254E1716F24C32293965E54B1327CE9641A855B1
            E1B2091EE57D6892476645A4C16088CA5AB468AAD1A0EF37F2DAEBF8FC00A3DB
            EE1DD9A8AA6DC49B2B8EE1F8D95A44DAD3A0D75AA5CA549D52AB43A7EC2A6C39
            6173E3194CFC5D7F744B89A6DCC12FC3407741AFC1BAFD2558BABB19610643A8
            0609B945B0AD7B3071CCE81C892FA6DF88D4444A9C0C665E5CB199ADF7DE7D87
            B5FA4A162ECAFA676969E9451904351BAE38E5772556B0081275C30D3774F9CB
            E38FBD69B5DAA2468C1CC99707B312FDC0BE3DA8AD77E0BD55C771F0440522AC
            14AEB411DF0386CA3D58946113B81E97EAA783B27B30AF62AB6D8C92C1CA4E99
            0921D7A06D23B9C3C0DE7198FBFAF54849B4516436F32908D6E79CFFC95CB6E4
            D055DFE898B4286BD1211904A5C86A33DD772520D4AC30CBAC602E12F1CCD34F
            0F1D3278F084848404FD9061C3F80C797D7D3DF20EEE27F49DF86C4B11D6E414
            D31D8D829DD263D6A5E209973A62A0DD3628A8566BB4CE7AF1C38352AF320484
            CC06E60A1E7225564BDC33BA2BA63D3B0276BB99874ABDBCEEFBEBAF96203B3B
            3B68B3477CFCD6DB6FAF9301A8932385B33D1BAE04849A154A21160263F2E449
            37F7484FFF4B4A6AAA3878C8500E46B3D389FC23797034D423FB6805F97701AA
            EAFC883227C0A431931C0725DAB703A2CD15045517139A0694B692504A2194AD
            7D7038DC888930E11F7F1C80DFDFDD8BEA3D1DF446C91DD8EB9B152BB0F1DB0D
            48484E5EF2EAABAF2D915DA156068197DC32087EB5D1FF69E990E2224A92C5C0
            B0CD78F7DD317171B18F262626094389196CAE8051F1F4A953A8AEBC884BB5CD
            589C5D884DDF51886C3622C21849EE629096A770AB842BFF6A089DA0C40AF9BD
            20AFC16C69F1C06CD062CC6F3AE1C98732D1BD73347C010D4C6669013CBB8665
            4BBFA2C22A1BC9A91D564E9A3CF94BD97885098A402AEB227E70E990C20ABE8E
            0AAD35885D66878D6AF9D1E9DDBAFE292A324A376CC4085E8FB0577575154A4B
            CEC2DDE2C4E9B246ACD95B845D872FA1BE8EE5EF1698C8EFD91A0AEE15404820
            DB5F085F97CDD63B787C545705101369C6B54352F1DB3B7A22B34F028F3C5A9D
            494AC199A5A4574BB216E178C1B1A03D2AEAAB696FBCB15C36BC5E1EECBD923C
            FDE8C5646A3094EE557B30AC8F3EFAA7AB870F1DF6278D468C1A306810D2D3BB
            CB460470E9D225D45657C0EB76E1628D13DF9D2A47CEB14B282A69427D6D007E
            9748B15F033601A8B42994997156811A2972444799D083A2C1F041291871750A
            D252EC9494EA206A0CBC09ABCCAB1ECDCFC7B2AF9752F4687456D7D62D589495
            952D1BDEA062825A177ED2F242E533351861321856198CF011C38777183F7EFC
            235AADE6AAD4D40E1830700058334701A4B6A6160DF53594FAB2C792BCA871B8
            70A1DA81B24A072AAB5D7038D9FC2413400D254F06D86D46C4C7842125C9860E
            C956C4448771D763E4D4EADA02C0962B6CFCF65BECDDB38742BAB528BFA060C1
            BAF5EB4F40D201050085096A5DF8490B4ED59F2BABECD4CCB0CA5B36C25E7EE9
            A59B525353C7523219D1AD7B77F4EED51BCA7244F6623D06F6C48ECBD5023F9B
            A1621181B5E1E49F673EAEE14B0D345C8019F5451241AD4ECF43B52284EC554F
            6E909393C39601A1A5B9B98558B27EFE679FFD9B229822864D32004D2A26FCC7
            55B73F0688EF03234C05061353F3C0810393EEBEF3CE5B2C16CB7032C6D4B163
            47B0628D44153A7DDBC79902F2CC7640AE2CA59E8D28014240B47FEE8B1D7BFE
            7C29720F1EE4EB269DCDCD5E72A503B987F2D6EEDEBDFBAC6CB0530580436682
            02C20F3EAEF0531F5350EA11930C8645351840A6A14387A6DC72F3CDD7845B2C
            03A9608A618F10508A8B94D414C4C6C6321A5FF6BC56FB179BF16A6868406579
            398A8A8A7863A8BCA29C356AEA49240EEDDFBF3F7BD7EEDD6720458166190485
            014EB40AE38F02E1A700A16686124D8C2A40946196F719C855EC375C7F7DEF8E
            1DD3FA1BF4864E74E76318FDD90A3796A6B3E937BE529F681FE4C67B78DFA0A9
            910495C20C4BE389FAECB33A41D49CADAAAA3CBC7BCF9E23A74E1556CB77DAA5
            02410D800B6DA3C32FFAE08AFA7825B42A4997510580591E467930C074898989
            E103323313D95462427C7CA2489126E0F38793F099D89C59204819863F40E982
            DFAD11C4267F30505B7EA9FC625D7D7D696E6EEEF90B65650DB2611E19841615
            1B94E1425B3DF88F9AF0738150BEA3D60D35200A4B4CF27B830C865E3E56A302
            F24A8F462B4FE82977D2270FAF0A04970C827AAB00A076855FF5E136F54BD10D
            35207AD978652860289F29C72ADF553F33AE7E9055B9A36A10D440B8E5A1EC57
            42E3FFEAE38EEDBFAF7617051065286C50FED6A22D33AE0444400584729715B7
            500450315E0DC0FFC903B03F0488028A7A68D016040508F54BED166A56A8871F
            6D93A35FE419F15F0A882B01A28E3222DA02D09E0D6A20D4602880A8B7EABBFF
            FFE321F99F08CA95FE565F43FBFF5E841A94F677FE17FFEF49FC9A405CE977BE
            6FABBC823FB0FDD55EFF0312F1AA62AAC218020000000049454E44AE426082}
          ButtonStyle = pbsNoFrame
          OnClick = btnHelpClick
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 81
      Width = 1024
      Height = 51
      Align = alTop
      BevelOuter = bvNone
      Color = 4605510
      TabOrder = 2
      object btnSai: TRzBmpButton
        Left = 913
        Top = 9
        Width = 95
        Height = 32
        Cursor = crHandPoint
        Hint = 'Sair da tela'
        Bitmaps.Disabled.Data = {
          56250000424D5625000000000000360000002800000060000000210000000100
          18000000000020250000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464848485959596868686F6F6F7979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797959595948
          4848464646464646464646464646464646464646464646464646464646464646
          4646464646464646464747475F5F5F7676769D9D9DBABABAC6C6C6D8D8D8D8D8
          D8D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D7D7D7D7D7D7D7D7D7D7D7D7D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D8D8D8D8D8D8D9D9D9C5C5C59E9E9E76
          7676606060474747464646464646464646464646464646464646464646464646
          4646464646464C4C4C707070A1A1A1C9C9C9CDCDCDCBCBCBC8C8C8C7C7C7C6C6
          C6C4C4C4C4C4C4C4C4C4C4C4C4C5C5C5C5C5C5C5C5C5C4C4C4C3C3C3C3C3C3C3
          C3C3C3C3C3C4C4C4C5C5C5C6C6C6C6C6C6C6C6C6C6C6C6C5C5C5C4C4C4C3C3C3
          C3C3C3C4C4C4C5C5C5C6C6C6C6C6C6C7C7C7C7C7C7C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C9C9C9CACACACBCBCBCECECECA
          CACAA1A1A17070704C4C4C464646464646464646464646464646464646464646
          4646464B4B4B737373A4A4A4C5C5C5BFBFBFBCBCBCB8B8B8B4B4B4B2B2B2AFAF
          AFACACACABABABABABABACACACADADADADADADADADADACACACABABABABABABAB
          ABABABABABADADADAFAFAFB0B0B0B1B1B1B1B1B1B0B0B0AEAEAEACACACABABAB
          ABABABACACACAEAEAEB1B1B1B2B2B2B4B4B4B5B5B5B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B7B7B7B7B7B7B8B8B8BABABABCBCBCC0
          C0C0C4C4C4A4A4A47373734B4B4B464646464646464646464646464646464646
          4646466C6C6C9D9D9DB8B8B8B2B2B2ABABABA7A7A7A1A1A19D9D9D9898989494
          9492929291919191919192929293939394949494949493939392929291919191
          9191919191939393959595979797989898989898969696949494929292919191
          9191919393939696969999999D9D9D9F9F9FA1A1A1A1A1A1A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A3A3A3A4A4A4A5A5A5A8A8A8AC
          ACACB1B1B1B8B8B89D9D9D6C6C6C464646464646464646464646464646464646
          5656568C8C8CAEAEAEA5A5A59E9E9E9797979191918B8B8B8686868080807C7C
          7C7878787878787979797B7B7B7C7C7C7D7D7D7D7D7D7C7C7C7B7B7B79797978
          78787878787979797C7C7C7D7D7D7E7E7E7E7E7E7C7C7C7B7B7B797979787878
          7979797C7C7C7F7F7F8383838787878A8A8A8C8C8C8D8D8D8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8F8F8F90909091919193939398
          98989E9E9EA5A5A5AEAEAE8C8C8C565656464646464646464646464646464646
          6969699999999C9C9C9393938A8A8A8282827C7C7C7777776F6F6F6969696464
          64616161616161626262646464676767686868686868616E714C838C4B818B49
          80896161616262626363636565656666666666666565655E6B6E4A808A4A808A
          5F6C6F6868686B6B6B7070707474747878787A7A7A7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C9595959D9D9D9D9D9D8484847C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7D7D7D7E7E7E80808084
          84848A8A8A9393939C9C9C999999696969464646464646464646464646464646
          7373739595958C8C8C8282827979797272726B6B6B65656518BAD700D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF2C97AB43798311C0E000D8FF00D8FF00D8FF00
          D8FF00D8FF239CB24B595B515151525252436B7315B6D400D8FF00D8FF00D8FF
          00D8FF11C0E0467D866262626666666969696B6B6B6D6D6D6D6D6D6D6D6D6D6D
          6D6D6D6D6D6D6D9B9B9BF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFC8C8C8767676BF
          BFBFFFFFFFE4E4E46D6D6D6D6D6D6D6D6DBFBFBFFFFFFFE4E4E4B6B6B6FFFFFF
          FFFFFFFFFFFFFFFFFFDADADAB6B6B6FFFFFFDADADA6D6D6D6D6D6D767676F6F6
          F6FFFFFFE4E4E47676766D6D6D6D6D6D6D6D6D6D6D6D6E6E6E6E6E6E6F6F6F73
          73737979798282828C8C8C969696747474464646464646464646464646464646
          7878788C8C8C7E7E7E7272726A6A6A6161615C5C5C56565614B6D300D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF2691A52792A600D8FF05CFF41CA3BB248FA31A
          A1B900D8FF00D8FF11B2D0424242365F6604CFF300D8FF00D8FF09C6E813B5D2
          05CFF400D8FF2A96A95757575959595C5C5C5E5E5E5F5F5F5F5F5F5F5F5F5F5F
          5F5F5F5F5F5F5FAFAFAFF5F5F5B9B9B9878787878787CDCDCDFFFFFFCDCDCD7D
          7D7DFFFFFFFFFFFF7373735F5F5F5F5F5FEBEBEBFFFFFFA5A5A5878787AFAFAF
          FFFFFFFFFFFFC3C3C39B9B9BAFAFAFFFFFFFD7D7D75F5F5F5F5F5FE1E1E1FFFF
          FFF5F5F57373735F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F60606063
          63636A6A6A7272727E7E7E8B8B8B797979464646464646464646464646464646
          7979798080807171716666665D5D5D5656565050504A4A4A11B3D000D8FF00D8
          FF3939393A3A3A3C3C3C3F3F3F424242228DA1218DA04141413F3F3F3D3D3D3B
          3B3B1993A800D8FF00D8FF2D565D0EB0CD00D8FF00D8FF228192404040444444
          4747472591A42692A54D4D4D4F4F4F5151515252525353535353535353535353
          535353535353537E7E7E5E5E5E535353535353535353898989FFFFFFFFFFFF53
          5353E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF696969535353535353
          FFFFFFFFFFFF7E7E7E535353A9A9A9FFFFFFD4D4D4535353B3B3B3FFFFFFFFFF
          FF7E7E7E53535353535353535353535353535353535353535353535354545457
          57575D5D5D666666717171808080797979464646464646464646464646464646
          7979797878786969695C5C5C5454544D4D4D4646464242420FB1CE00D8FF00D8
          FF3131313232323535353737373A3A3A3B3B3B3A3A3A3838383636362E494E20
          718003CEF200D8FF00D8FF22667200D8FF00D8FF0AB9D93636363A3A3A3E3E3E
          4141414444444545454646464747474848484949494A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A838383BBBBBBDDDDDDFFFFFFFFFFFFE8E8E84A
          4A4AA4A4A4FFFFFFF4F4F4A4A4A4DDDDDDFFFFFFD2D2D24A4A4A4A4A4A4A4A4A
          FFFFFFFFFFFF7777774A4A4AA4A4A4FFFFFFF4F4F4D2D2D2FFFFFFFFFFFFA4A4
          A44A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4E
          4E4E5454545C5C5C696969777777797979464646464646464646464646464646
          7979799393938787877E7E7E76767670707069696963636317B9D600D8FF00D8
          FF2590A42691A52793A62995A84A656A5656564F5C5F1FA6BE0AC7E900D8FF00
          D8FF00D8FF00D8FF05CFF43A707A00D8FF00D8FF2792A65252525757575D5D5D
          6262626565656868686969696B6B6B6C6C6C6E6E6E6F6F6F6F6F6F6F6F6F6F6F
          6F6F6F6F6F6F6F787878E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFEDEDED8A8A8A6F
          6F6F818181FFFFFFFFFFFF818181EDEDEDFFFFFFA5A5A56F6F6F6F6F6F6F6F6F
          FFFFFFFFFFFF9393936F6F6FB7B7B7FFFFFFF6F6F6DBDBDBE4E4E4FFFFFFF6F6
          F69C9C9C6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F72
          72727676767E7E7E878787939393797979464646464646464646464646464646
          7979799898988D8D8D8383837D7D7D7676766F6F6F69696918BAD700D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF43798354626406D0F500D8FF00D8FF00D8FF00
          D8FF00D8FF15B7D4456E7540768000D8FF00D8FF2A96A95757575B5B5B606060
          6565656969696C6C6C6E6E6E7070707272727474747575757575757575757575
          75757575757575B2B2B2FFFFFFFFFFFFE5E5E5BABABA98989875757575757575
          7575757575E5E5E5FFFFFFCBCBCBFFFFFFFFFFFF7E7E7E757575757575757575
          FFFFFFFFFFFF989898757575BABABAFFFFFFDCDCDC757575757575B2B2B2FFFF
          FFEEEEEE75757575757575757575757575757575757575757575757575757578
          78787D7D7D8383838D8D8D989898797979464646464646464646464646464646
          7979799E9E9E9393938A8A8A8484847D7D7D7777777070701ABCD900D8FF00D8
          FF2B96AA2B97AA2D98AC2E9AAD526D723594A500D8FF00D8FF06D0F527A0B637
          88974F6A6F5D5D5D5E5E5E526D7200D8FF00D8FF1DB1CC5C5C5C606060636363
          6767676B6B6B6E6E6E7272727575757878787A7A7A7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7CBDBDBDFFFFFFDEDEDE7C7C7C7C7C7C7C7C7C7C7C7CA5A5A57C
          7C7C7C7C7CB6B6B6FFFFFFFFFFFFFFFFFFD6D6D67C7C7C7C7C7C7C7C7C7C7C7C
          FFFFFFFFFFFF9D9D9D7C7C7CBDBDBDFFFFFFDEDEDE7C7C7C7C7C7CA5A5A5FFFF
          FFFFFFFF7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7F
          7F7F8484848A8A8A9393939E9E9E797979464646464646464646464646464646
          787878A5A5A59B9B9B9292928B8B8B8585857F7F7F7878781CBEDB00D8FF00D8
          FF5D5D5D5D5D5D5F5F5F626262656565339FB200D8FF00D8FF42869260606060
          6060626262666666478B976868680DCAEC00D8FF00D8FF517A81656565666666
          6969695288924798A77676767A7A7A7E7E7E8080808282828383838383838383
          83838383838383939393F7F7F7FFFFFFD0D0D0C1C1C1D0D0D0F7F7F7E0E0E083
          83838383838B8B8BFFFFFFFFFFFFFFFFFFAAAAAA838383838383B2B2B2E0E0E0
          FFFFFFFFFFFFE8E8E8C9C9C9C1C1C1FFFFFFF7F7F7E0E0E0E0E0E0FFFFFFFFFF
          FFE0E0E083838383838383838383838383838383838383838383838384848486
          86868B8B8B9292929B9B9BA5A5A5797979464646464646464646464646464646
          737373A8A8A8A4A4A49B9B9B9595958E8E8E8989898282821FC1DE00D8FF00D8
          FF1ABCD91ABCD91BBCDA1BBDDA4597A5637E8300D8FF00D8FF14C4E3498D9950
          86903E9DAE0ECBED1DBFDC7474745094A000D8FF00D8FF00D8FF29B0C837A3B6
          1CBEDB00D8FF3CA8BB7D7D7D8282828686868989898A8A8A8B8B8B8B8B8B8B8B
          8B8B8B8B8B8B8B8B8B8B9A9A9AD3D3D3F8F8F8FFFFFFFFFFFFE2E2E2BEBEBE8B
          8B8B8B8B8B8B8B8BCCCCCCE2E2E2E2E2E28B8B8B8B8B8B8B8B8BB7B7B7E2E2E2
          E2E2E2E2E2E2E2E2E2CCCCCCB7B7B7E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2BEBE
          BE9292928B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8C8C8C8D8D8D90
          90909595959B9B9BA4A4A4A9A9A9747474464646464646464646464646464646
          696969A3A3A3AEAEAEA6A6A69F9F9F9999999292928D8D8D22C4E100D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF3FABBE7F7F7F4FA1AF08D2F700D8FF00D8FF00
          D8FF00D8FF00D8FF28BCD782828282828250A2B008D2F700D8FF00D8FF00D8FF
          00D8FF00D8FF51A2B18787878B8B8B8E8E8E9191919292929393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          939393939393939393939393939393939393939393939494949595959696969A
          9A9A9F9F9FA6A6A6AEAEAEA3A3A3696969464646464646464646464646464646
          5656568F8F8FB8B8B8B1B1B1AAAAAAA4A4A49F9F9F9B9B9B7BA3AB6DA4AD6AA1
          AA689EA8689EA8689EA86AA0AA7C979C8F8F8F90909086949661A5B146B2C546
          B2C557A9B7729BA28F8F8F91919192929291919186949661A5B146B2C546B1C5
          57A8B77B969B9090909494949797979A9A9A9C9C9C9C9C9C9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9E9E9E9F9F9FA1A1A1A5
          A5A5AAAAAAB1B1B1B8B8B88E8E8E555555464646464646464646464646464646
          4646466C6C6C9F9F9FBCBCBCB6B6B6B0B0B0ADADADA8A8A8A5A5A5A2A2A29F9F
          9F9D9D9D9C9C9C9D9D9D9D9D9D9E9E9E9E9E9E9F9F9F9E9E9E9E9E9E9D9D9D9C
          9C9C9C9C9C9D9D9D9E9E9EA0A0A0A0A0A0A0A0A0A0A0A09E9E9E9C9C9C9B9B9B
          9B9B9B9D9D9D9E9E9EA1A1A1A3A3A3A5A5A5A6A6A6A6A6A6A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A8A8A8A8A8A8A8A8A8A8A8A8A9A9A9ABABABADADADB1
          B1B1B6B6B6BCBCBC9F9F9F6C6C6C464646464646464646464646464646464646
          4646464B4B4B727272A2A2A2C2C2C2BDBDBDB8B8B8B6B6B6B3B3B3B1B1B1AFAF
          AFAEAEAEAEAEAEADADADADADADAEAEAEAFAFAFAFAFAFAFAFAFAEAEAEADADADAC
          ACACACACACADADADAEAEAEAFAFAFAFAFAFAFAFAFAFAFAFAEAEAEADADADACACAC
          ACACACADADADAEAEAEAFAFAFB1B1B1B1B1B1B1B1B1B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3B3B3B3B4B4B4B5B5B5B6B6B6B9B9B9BD
          BDBDC1C1C1A2A2A27373734B4B4B464646464646464646464646464646464646
          4646464646464C4C4C7070709E9E9EC1C1C1C4C4C4C1C1C1BFBFBFBEBEBEBDBD
          BDBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
          BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
          BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBEBEBEBEBEBEBFBFBFC1C1C1C4C4C4C1
          C1C19D9D9D7070704C4C4C464646464646464646464646464646464646464646
          4646464646464646464747475F5F5F767676989898AFAFAFBABABAC6C6C6C8C8
          C8C8C8C8C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C8C8C8C9C9C9CACACAB9B9B998989876
          76765F5F5F474747464646464646464646464646464646464646464646464646
          4646464646464646464646464646464848485959596767676F6F6F7777777979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797959595948
          4848464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          56250000424D562500000000000036000000280000005F000000210000000100
          18000000000020250000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474746464646
          4646464646464646464646464646464646464646464646000000464646464646
          4646464646464747474747474747474747474747474747474747474848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484847474747474747
          4747474747474747474747464646464646464646464646000000464646474747
          4747474747474747474747474848484848484848484949494949494949494949
          494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A49494949494949494948484848
          4848484848484848474747474747474747474747464646000000474747474747
          4747474848484848484949494949494A4A4A4A4A4A4B4B4B4A4A4A4B4B4B4B4B
          4B4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A4A4A4A49
          4949484848494949484848484848474747474747474747000000474747484848
          4848484949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4D4D4D4C4C
          4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B4B4A4A4A49
          49494949494A4A4A484848484848484848484848474747000000484848484848
          4949494A4A4A4B4B4B4B4B4B4D4D4D4D4D4D4E4E4E4D4D4D4E4E4E4E4E4E4E4E
          4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4D4D4D4D4D4D4C4C4C4B4B4B4B4B4B4A
          4A4A4949494949494848484848484848484747474848480000004949494A4A4A
          4B4B4B4C4C4C4D4D4D4E4E4E4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F5050505050
          505050504F4F4F50505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          505050505050505050505050504F4F4F4E4E4E4E4E4E4D4D4D4C4C4C4B4B4B4A
          4A4A4949494949494949494949494949494949494848480000004A4A4A4B4B4B
          4D4D4D4E4E4E4F4F4F5050505050505151515151515151515151515151515252
          5252525252525253535352525252525253535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          535353535252525252525252525151515151515050504E4E4E4D4D4D4C4C4C4B
          4B4B4A4A4A4949494949494949494848484848484949490000004B4B4B4D4D4D
          4E4E4E5050505151515252525353535353535454545454545555555555555656
          5657575757575757575758585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          585858585858585757575757575656565656565454545353535151514F4F4F4D
          4D4D4B4B4B4A4A4A4949494848484848484949494848480000004D4D4D4F4F4F
          5151515252525454545555555555555F5F5F959595C6C6C6DEDEDEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94949459
          59594E4E4E4C4C4C4A4A4A4949494848484848484848480000004F4F4F505050
          5353535555555757575C5C5CABABABF5F5F5C3D3F48CABEA6E96E54578DD4276
          DC4074DC3F74DC3E73DB3E73DB3E73DB3E73DB3E73DB3E73DA3E73DA3E73DA3E
          73DA3E73DA3E73DA3E73DA3E73DB3E73DB3E73DB3E73DB3E73DA3E73DA3E73DA
          3E73DA3E73DA3E73DA3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3F74DC4175DC4477DD487ADD749AE6C0D1F3F5
          F5F5AAAAAA5454544D4D4D4A4A4A494949484848494949000000515151535353
          5555555757576D6D6DE2E2E2B8CCF25F8CE24277DC3A72DA346CD82F69D72C66
          D62A65D52964D52964D52964D52964D62964D62964D62964D52964D42964D429
          64D42964D42964D52964D62A65D62A65D72A65D72A65D62964D62964D52964D4
          2964D42964D52964D62A65D62A65D72A66D82A66D82A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92C68D92E69D9326CDA3870DB4177DD5B
          8AE2B7CCF2E1E1E16565654D4D4D4A4A4A494949484848000000525252555555
          5858586B6B6BECECECA7C0F0477CDF3972DC2E69D92663D7205FD41D5BD01B59
          CF1957CB1857CA1856CA1856CB1856CC1856CC1856CC1856CB1856CA1856CA17
          55CA1856CA1856CC1857CF1858D01859D11859D11858CF1857CE1856CB1856CA
          1856CA1856CB1857CE1859D11959D3195AD4195BD6195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD71A5CD71B5CD81D5ED82060D92563D92D69DB38
          71DD467BDFA6BFF0EBEBEB6363634C4C4C494949494949000000545454575757
          5A5A5AD5D5D5A9C2F1467CE13671DE2867DB1E5FD71659D31254CF0F50CA0D4E
          C40D4DC20C4BC10C4BC10B4BC20B4CC40B4CC40B4CC40B4CC40B4BC20B4BC10B
          4BC10B4BC10B4CC40B4CC60B4DC90B4ECA0B4ECA0B4DC70B4CC40B4BC20B4AC0
          0B4BC10B4CC40B4DC70B4ECB0C50D00C51D30C52D50C53D60C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70D54D70D54D70E55D70F56D71258D8165BD91D5FDA27
          67DB3570DE467CE1A9C2F1D2D2D24F4F4F4B4B4B4A4A4A000000565656595959
          8F8F8FCFDDF84B82E33875E12769DE1A5FDA1158D70B52D1074ECA064AC20547
          BC0445B80344B70345B90346BB0347BD0447BF0447BF0347BE0346BC0345BA03
          45B80345B80345BA0347BD0447BF0448C10448C00347BE0346BB0345B90345B8
          0345BA0347BD0448C2044BC9044DCF044FD30450D60451D80451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90551D90652D90854D90B56DA1059DA1A
          60DC2769DE3774E04B82E3CFDDF88686864D4D4D4B4B4B0000005757575B5B5B
          CCCCCC8CB0EE3F7BE32C6EE01C63DE105AD90852D4054DCC0248C20144B80141
          AE003EAA003EAA003FAC0041B00042B40043B70043B7004BB90068C60066C300
          65C1003FAB003FAC0040AE0041B10042B40042B30041B2004AB40066C20066C2
          004AB60043B60045BD0048C5004BCC004DD2004FD70050D90050DA0050DA0050
          DA0050DA0050DA0050DA3071E1407CE3407CE3105BDC0050DA0050DA0050DA00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0050DA0151DA0251DA0453DB0855DB10
          5BDC1C63DE2C6EE03F7BE38CB0EEC9C9C94F4F4F4C4C4C0000005959595D5D5D
          ECECEC6294EA3677E4246AE21560E00A58DB0452D5024CCB00B4EF00D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF008CD70068C700BCF100D8FF00D8FF00D8FF00
          D8FF00D8FF0093D60046A9003DA5003EA7005BB800B1E900D8FF00D8FF00D8FF
          00D8FF00BCF2006BCF004AC6004DCE004FD40050D90052DC0052DD0052DD0052
          DD0052DD5088E8EFF4FDFFFFFFFFFFFFFFFFFFFFFFFF9FBEF2105DDF8FB3F0FF
          FFFFCFDEF90052DD0052DD0052DD8FB3F0FFFFFFCFDEF97FA8EEFFFFFFFFFFFF
          FFFFFFFFFFFFBFD4F67FA8EEFFFFFFBFD4F60052DD0052DD105DDFEFF4FDFFFF
          FFCFDEF9105DDF0052DD0052DD0052DD0052DD0052DD0153DD0253DD0455DE0A
          59DE1560E0246AE23677E45E91E9EFEFEF5151514E4E4E0000005A5A5A5E5E5E
          FDFDFD4985E83176E51F6AE31160E10759DC0252D5004DC900B4EE00D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF008DD8008EDA00D8FF00CFFA00A0E0008CD300
          9EDC00D8FF00D8FF00B1E6003B9C0059B000CEF900D8FF00D8FF00C5F400B3EB
          00CFFB00D8FF0091E2004ECC0050D20052D80054DC0055DE0055DF0055DF0055
          DF0055DF7FAAEFEFF4FD8FB4F14080E74080E7AFCAF5FFFFFFAFCAF53075E5FF
          FFFFFFFFFF206AE30055DF0055DFDFEAFBFFFFFF70A0ED4080E77FAAEFFFFFFF
          FFFFFF9FBFF36095EB7FAAEFFFFFFFBFD4F70055DF0055DFCFDFF9FFFFFFEFF4
          FD206AE30055DF0055DF0055DF0055DF0055DF0055DF0055DF0055DF0256DF07
          5AE01160E11F6AE33176E54684E8FFFFFF5353534E4E4E0000005B5B5B5F5F5F
          FFFFFF4383EA2D75E71C69E50F61E4065ADF0154D6004ECA00B4EE00D8FF00D8
          FF003B9A003D9E003FA40042AC0045B3008FDB008FDA0044B00042AB0040A600
          3DA00093D400D8FF00D8FF0059AB00B1E600D8FF00D8FF0083CE0044AF0047B8
          004AC10092E40094E70051D30053D80055DC0056DF0057E10057E20057E20057
          E20057E24081E91062E40057E20057E20057E2508CEBFFFFFFFFFFFF0057E2DF
          EAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF206CE60057E20057E2FFFFFF
          FFFFFF4081E90057E27FABF0FFFFFFBFD5F80057E28FB5F2FFFFFFFFFFFF4081
          E90057E20057E20057E20057E20057E20057E20057E20057E20057E20158E206
          5BE30F61E41C69E52D75E74383EAFFFFFF5454545050500000005C5C5C606060
          FFFFFF4184EC2C76E91A6BE80E63E6055CE20055D90050CC00B4EE00D8FF00D8
          FF003C99003D9C0040A30043AC0046B30047B50046B30044AD0042A80053AF00
          78C300CEF900D8FF00D8FF006DBA00D8FF00D8FF00BBED0042A80047B4004BBE
          004FC90052D10054D60055D80057DD0058E00059E2005AE4005AE5005AE5005A
          E5005AE5005AE5005AE5508EED9FC1F5CFE0FAFFFFFFFFFFFFDFEAFC005AE57F
          ACF2FFFFFFEFF5FD7FACF2CFE0FAFFFFFFBFD6F8005AE5005AE5005AE5FFFFFF
          FFFFFF4083EC005AE57FACF2FFFFFFEFF5FDBFD6F8FFFFFFFFFFFF7FACF2005A
          E5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE505
          5DE60E63E61A6BE82B76E94083ECFFFFFF5555555050500000005C5C5C616161
          FFFFFF4085ED2B77EB1A6DE90D64E8055EE30057DB0052CE00B5EF00D8FF00D8
          FF008ACB008BCD008CD0008ED40058BB0047B3004FB500A0DF00C5F400D8FF00
          D8FF00D8FF00D8FF00CEF90065B700D8FF00D8FF008CD00044AA0049B6004DC1
          0051CC0054D30056D80057DB0059DF005AE2005BE4005CE6005CE7005CE7005C
          E7005CE71066E9CFE0FAFFFFFFFFFFFFFFFFFFFFFFFFDFEBFC307BEC005CE720
          70EAFFFFFFFFFFFF2070EADFEBFCFFFFFF6099F0005CE7005CE7005CE7FFFFFF
          FFFFFF4085ED005CE77FADF3FFFFFFEFF5FDBFD6F9CFE0FAFFFFFFEFF5FD508F
          EF005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE705
          5FE70D64E81A6DE92B77EB4085EDFFFFFF5656565151510000005C5C5C606060
          FFFFFF4188EF2C7BEE1A6FEC0E68EB0560E6005ADE0055D100B6F000D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF006CC50052B900CFFA00D8FF00D8FF00D8FF00
          D8FF00D8FF00B3EA0061BB006ABF00D8FF00D8FF008ED30046AD004AB7004EC0
          0052CA0055D20058D80059DB005BE1005DE4005EE7005FE9005FEA005FEA005F
          EA005FEA70A5F3FFFFFFFFFFFFCFE1FB7FAFF44087EF005FEA005FEA005FEA00
          5FEACFE1FBFFFFFF9FC3F7FFFFFFFFFFFF1069EB005FEA005FEA005FEAFFFFFF
          FFFFFF4087EF005FEA7FAFF4FFFFFFBFD7FA005FEA005FEA70A5F3FFFFFFDFEB
          FC005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA05
          62EA0E68EB1A6FEC2C7BEE4087EFFFFFFF5656565151510000005B5B5B606060
          FFFFFF438BF22D7DF01C72EF0F6AEE0663E9015DE20057D600B6F100D8FF00D8
          FF008DD1008DD1008ED40090D7005CBD0089D600D8FF00D8FF00CFFA0097D800
          7CC90059B70049B2004AB4005CBD00D8FF00D8FF00ABE60048B1004BB7004DBD
          0051C50054CD0056D30059D9005CE0005EE6005FE90061EC0061ED0061ED0061
          ED0061ED7FB0F6FFFFFFBFD7FA0061ED0061ED0061ED0061ED5093F30061ED00
          61ED70A6F5FFFFFFFFFFFFFFFFFFAFCDF90061ED0061ED0061ED0061EDFFFFFF
          FFFFFF4089F20061ED7FB0F6FFFFFFBFD7FA0061ED0061ED5093F3FFFFFFFFFF
          FF0061ED0061ED0061ED0061ED0061ED0061ED0061ED0061ED0061ED0162ED06
          65ED0F6AEE1C72EF2D7DF0438BF2FFFFFF5555555151510000005A5A5A5F5F5F
          FDFDFD498FF33181F21F76F1116DF00867ED0260E6005ADA00B7F200D8FF00D8
          FF0046AA0046AA0048AD004AB3004CB80092DC00D8FF00D8FF0076C80048AE00
          49AF004AB3004DBA0079D2004FBE00C7F700D8FF00D8FF0066C4004CB8004DBB
          0050C00074D60087E10059D7005CDF005FE60061EA0063EE0063EF0063EF0063
          EF0063EF2077F1EFF5FEFFFFFF9FC4F97FB1F79FC4F9EFF5FEBFD8FB0063EF00
          63EF106DF0FFFFFFFFFFFFFFFFFF5094F40063EF0063EF609EF5BFD8FBFFFFFF
          FFFFFFCFE2FC8FBAF87FB1F7FFFFFFEFF5FEBFD8FBBFD8FBFFFFFFFFFFFFBFD8
          FB0063EF0063EF0063EF0063EF0063EF0063EF0063EF0063EF0063EF0264EF07
          67EF116DF01F76F13181F2468EF3FFFFFF5555555151510000005959595E5E5E
          EDEDED62A1F73686F5247CF41573F30A6BF00465EA0260E100B9F500D8FF00D8
          FF00B5ED00B5ED00B5ED00B6EF0084D90064CB00D8FF00D8FF00BEF3007AD000
          71CC008CDB00C7F700B7F10055CA007FDB00D8FF00D8FF00D8FF00A5E70094DF
          00B6F000D8FF0098E8005CD9005FE20062E90064EE0066F10066F20066F20066
          F20066F20066F22079F49FC5FAEFF5FEFFFFFFFFFFFFBFD9FC70A9F80066F200
          66F20066F28FBCF9BFD9FCBFD9FC0066F20066F20066F260A0F7BFD9FCBFD9FC
          BFD9FCBFD9FC8FBCF960A0F7BFD9FCBFD9FCBFD9FCBFD9FCBFD9FC70A9F81070
          F30066F20066F20066F20066F20066F20066F20066F20167F20267F20468F20A
          6CF31573F3247CF43686F55E9EF7EFEFEF5454545151510000005858585C5C5C
          CDCDCD8CBBFA3F8DF72C82F61C79F51070F3086AEE0566E801BAF700D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF0098E8005AD30089E400D0FC00D8FF00D8FF00
          D8FF00D8FF00D8FF00B1F2005CD7005CD8008AE500D0FC00D8FF00D8FF00D8FF
          00D8FF00D8FF008BE7005FE00062E70065EC0067F10068F30068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40169F40269F4046AF4086DF410
          71F51C79F52C82F63F8DF78CBBFACACACA5454545151510000005757575A5A5A
          909090CFE3FD4B96F9388BF92781F81A79F71172F40C6DEF077EEE0483EC0480
          E7037FE4037DE3037EE4037FE60371E40463E20463E30469E30386E9029CEE02
          9CED028DE90377E40463E20464E40464E60464E5046AE40386E9029CED029BEC
          028DE90370E20463E30466E80468EE046AF2046BF5046CF6046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7056DF7066EF7086FF70B70F71073F81A
          79F82781F8378AF94B96F9D1E4FE888888535353515151000000555555595959
          5D5D5DD6D6D6AACEFD4694FB368BFA2882F91E7CF81777F61274F20F70EE0D6E
          EB0D6CE80C6BE70C6BE80B6CE90B6DEB0B6DEC0B6EED0B6DEC0B6DEB0B6CE90B
          6BE80B6BE80B6CE90B6DEB0B6EEE0C6EEF0C6EEF0B6EEE0B6DEB0B6BE80B6BE7
          0B6BE70B6CE90B6DEC0C6FF00C70F30C72F60C73F80C73F80C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90D73F90D73F90E74F90F75F91276F91679FA1D7DFA27
          82FA358BFA4694FBA9CDFDD4D4D4565656535353515151000000535353565656
          5A5A5A6F6F6FEBEBEBA7CDFD4796FC398EFC2E87FB2683FA217FF91E7DF71B7B
          F5197AF4197AF41879F41879F41879F5197AF6197AF6197AF61879F51879F418
          78F31878F31879F41879F5197AF6197AF7197AF7197AF71879F51879F41878F3
          1878F31879F41879F5197AF7197BF9197CFA197CFA197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB1A7DFB1B7DFB1D7EFB2080FC2583FC2D88FC38
          8EFC4696FCA6CCFDECECEC6A6A6A555555535353505050000000515151545454
          5858585B5B5B727272E3E3E3B8D7FE5FA4FD4294FD3A8FFC348BFC3089FC2D87
          FC2B86FC2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FA2A
          86FA2A86FA2A86FA2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FA2A86FA
          2A86FA2A86FA2A86FB2A86FB2A86FB2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2C88FD2E89FD328BFD388FFD4194FD5D
          A4FDB7D7FEE2E2E26D6D6D5757575454545252525050500000004F4F4F515151
          5454545858585B5B5B626262AFAFAFF6F6F6C3DDFF8EC0FE6EAEFE4D9CFE4296
          FE4095FE3F94FE3F94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3F94FE4195FE4497FE4899FE76B3FEC2DDFFF6
          F6F6ADADAD5F5F5F5858585555555353535050504E4E4E0000004D4D4D4F4F4F
          5252525454545757575A5A5A5C5C5C6767679B9B9BC8C8C8E0E0E0FAFAFAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99999964
          64645A5A5A5858585555555353535151514E4E4E4D4D4D0000004B4B4B4D4D4D
          4F4F4F5151515454545656565858585A5A5A5C5C5C5E5E5E5F5F5F6060606060
          6061616161616161616162626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          626262626262626161616161616161616060605F5F5F5E5E5E5D5D5D5B5B5B59
          59595757575656565353535050504F4F4F4D4D4D4B4B4B000000}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 0
      end
      object btnLast: TRzBmpButton
        Left = 879
        Top = 9
        Width = 30
        Height = 32
        Cursor = crHandPoint
        Hint = 'Exibe o registro posterior'
        Bitmaps.Disabled.Data = {
          120C0000424D120C00000000000036000000280000001E000000210000000100
          180000000000DC0B0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646000046464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464600004646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646460000464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          464646464646464600FF46464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464600004646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          0000464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          46464646464646464646464646464646464646464646464646464646FFCC4646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646463300464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646996646464646464646464646
          46464C4C4C6060606E6E6E787878797979797979787878787878777777777777
          7777777777777878787878787979797979797878786E6E6E6060604C4C4C4646
          46464646464646464646464646464646CCCC4646464646464646465F5F5F7777
          77ADADADC6C6C6D8D8D8D7D7D7D6D6D6D4D4D4D1D1D1CFCFCFCCCCCCCCCCCCCE
          CECECFCFCFD2D2D2D5D5D5D7D7D7D8D8D8C6C6C6ADADAD7777775F5F5F464646
          46464646464646464646464633334646464646466565659F9F9FC9C9C9CFCFCF
          CCCCCCC9C9C9C7C7C7C4C4C4C1C1C1BCBCBCB8B8B8B4B4B4B4B4B4B6B6B6BABA
          BABEBEBEC3C3C3C7C7C7C9C9C9CCCCCCCFCFCFCACACA9F9F9F65656546464646
          4646464646464646CCCC4646465C5C5C9C9C9CC7C7C7C2C2C2BEBEBEB9B9B9B7
          B7B7B3B3B3B0B0B0A9A9A9A3A3A39C9C9C9898989797979999999F9F9FA6A6A6
          ADADADB2B2B2B6B6B6B9B9B9BEBEBEC2C2C2C7C7C79C9C9C5C5C5C4646464646
          4646464633334A4A4A767676B2B2B2B5B5B5AFAFAFA9A9A9A5A5A5A1A1A19D9D
          9D9797978F8F8F87878773A191A3C1A57A83767C7C7C8282828A8A8A9292929A
          9A9A9F9F9FA4A4A4A9A9A9AFAFAFB5B5B5B2B2B27676764A4A4A464646464646
          99995D5D5D959595ABABABA2A2A29A9A9A9494948F8F8F8A8A8A8585857D7D7D
          757575638F7EDAECE5FFFFFFA4B996636B5F6868687070707878788181818888
          888E8E8E9393939A9A9AA1A1A1ABABAB9595955D5D5D46464646464681776D6D
          6D9B9B9B9A9A9A8F8F8F8787878181817B7B7B7474746E6E6E676767598674DA
          EBE5FFFFFFFFFFFFFFFFFF9BB18D565D515959596262626A6A6A717171787878
          7F7F7F8686869090909A9A9A9B9B9B6C6C6C4646464646460000757575959595
          8B8B8B7F7F7F7777776F6F6F6868686262625B5B5B527F6DD7EAE3FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF94AB864D55485050505757575F5F5F6666666D6D6D76
          76767F7F7F8A8A8A949494747474464646464646BB707979798A8A8A7C7C7C71
          71716767675F5F5F5858585252524D7968D9EAE4FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFFFE95AD87474F434848484F4F4F5555555D5D5D6666667171
          717C7C7C8A8A8A78787846464646464600007979798080807171716565655A5A
          5A5252524C4C4C487462D7EAE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF96AC8941493D434343494949505050595959646464717171
          808080797979464646464646BF5F7979797777776969695B5B5B5151514A4A4A
          507B6BD0E5DCFFFFFFFFFFFFF8FAF6D5DFCCF9FBF8FFFFFFECF1E9DAE4D1FDFD
          FDFFFFFFFFFFFF99AF8D404E394040404848485050505B5B5B69696977777779
          797946464646464600007979799393938787877E7E7E7474746C6C6CA0C5B3FF
          FFFFFFFFFFFFFFFF7D966D779771FAFDFCFFFFFFD2DBCA667E5FCEE1D5FFFFFF
          FFFFFFEBF1E76E85606262626A6A6A7272727D7D7D8686869393937979794646
          4646464684827979799898988C8C8C8282827A7A7A7474746B8272B5D2BBFFFF
          FF8BA4765C605C82A08FFAFEFDFFFFFFE9E8E25059525C7A67DCEEE4F0F1E86F
          86606569636B6B6B7272727979798282828B8B8B989898797979464646464646
          00007979799E9E9E9393938989898181817C7C7C7878787389798BA98A6F766B
          6666668AAB96FDFEFCFFFFFFEEEDE76165615C5C5C70927B7D95776D706D7373
          737676767B7B7B8181818989899393939E9E9E797979464646464646BF5F7979
          79A5A5A59A9A9A9191918A8A8A8484848080807F7F7F7C7C7C7878787272728F
          AF97FDFFFDFFFFFFE4E9E270706D6767676E6E6E7575757A7A7A7E7E7E7F7F7F
          8484848A8A8A9191919A9A9AA4A4A47878784646464646467755757575A9A9A9
          A3A3A39A9A9A9393938E8E8E8B8B8B8989898787878383837D7D7D8EB095FEFE
          FEFFFFFFE7EBE37879767171717A7A7A8181818686868989898A8A8A8E8E8E93
          93939A9A9AA3A3A3A8A8A874747446464646464699666C6C6CA6A6A6ACACACA4
          A4A49D9D9D9999999595959393939191918E8E8E88888891B393FEFEFEFFFFFF
          E7ECE48284807D7D7D8585858C8C8C9090909393939595959898989D9D9DA4A4
          A4ACACACA6A6A66C6C6C464646464646FFCC5D5D5D999999B6B6B6AEAEAEA8A8
          A8A3A3A3A0A0A09E9E9E9C9C9C9999999494949FBA9BFBFDFBFFFFFFEDF1E990
          928F8B8B8B9292929797979B9B9B9D9D9DA0A0A0A3A3A3A8A8A8AEAEAEB6B6B6
          9999995D5D5D46464646464677554A4A4A767676B5B5B5B9B9B9B4B4B4AFAFAF
          ACACACA9A9A9A8A8A8A5A5A5A2A2A2A2B49AD4DDD1D8DFD3C7D1C19B9E9A9B9B
          9BA0A0A0A4A4A4A8A8A8A9A9A9ACACACAFAFAFB4B4B4B9B9B9B5B5B57676764A
          4A4A46464646464600004646465C5C5C9A9A9AC4C4C4BFBFBFBABABAB7B7B7B5
          B5B5B3B3B3B1B1B1AFAFAFACACACA9A9A9A7A7A7A6A6A6A8A8A8AAAAAAAEAEAE
          B0B0B0B3B3B3B5B5B5B7B7B7BABABABFBFBFC4C4C49A9A9A5C5C5C4646464646
          46464646CCCC4646464646466565659C9C9CC0C0C0C5C5C5C2C2C2C0C0C0BDBD
          BDBDBDBDBBBBBBBABABAB9B9B9B7B7B7B7B7B7B8B8B8B9B9B9BBBBBBBDBDBDBD
          BDBDC0C0C0C2C2C2C5C5C5C0C0C09C9C9C656565464646464646464646464646
          00004646464646464646465E5E5E777777A5A5A5BABABAC7C7C7C9C9C9C7C7C7
          C7C7C7C6C6C6C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C7C7C7C7C7C7C9C9C9C7C7
          C7BABABAA5A5A57777775E5E5E46464646464646464646464646464666664646
          464646464646464646464C4C4C6060606E6E6E77777779797979797979797979
          79797979797979797979797979797979797979797979797979797777776E6E6E
          6060604C4C4C464646464646464646464646464646464646FFFF464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          46464646464646464646464646464646464646460000}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          120C0000424D120C00000000000036000000280000001E000000210000000100
          180000000000DC0B0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474746464646
          4646464646464646464646464646464646464646000046464647474747474747
          4747474747474747474747484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484747474747474747474747
          4747474747474746464646464646464610004747474747474747474848484848
          484848484949494949494949494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A494949494949494949484848484848484848474747
          47474747474747474747474700004848484848484949494949494A4A4A4A4A4A
          4B4B4B4A4A4A4B4B4B4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A49494949494948484849494948484848
          484847474747474710004949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C
          4C4C4C4C4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C
          4C4C4C4B4B4B4B4B4B4B4B4B4A4A4A4949494949494949494848484848484848
          4847474700004A4A4A4B4B4B4B4B4B4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4D4D4D4D
          4D4D4C4C4C4B4B4B4B4B4B494949494949494949484848484848484848474747
          10004C4C4C4C4C4C4E4E4E4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          5050504F4F4F5050505050505050505050504F4F4F4F4F4F4E4E4E4E4E4E4D4D
          4D4C4C4C4A4A4A4A4A4A49494949494949494948484849494948484800004D4D
          4D4F4F4F50505050505051515151515151515151515151515152525252525252
          52525252525252525252525252525252525151515050504F4F4F4F4F4F4D4D4D
          4B4B4B4A4A4A49494949494948484849494948484849494910004F4F4F515151
          5252525252525353535353535454545555555555555656565656565757575757
          575858585858585757575757575656565555555454545252525050504E4E4E4C
          4C4C4A4A4A494949484848484848484848484848000052525253535355555555
          55556A6A6AAEAEAEDCDCDCFDFDFDFFFFFFFEFEFEFDFDFDFCFCFCFBFBFBFAFAFA
          FAFAFAFAFAFAFCFCFCFDFDFDFEFEFEFEFEFEFDFDFDDBDBDBACACAC6565654D4D
          4D4B4B4B4949494848484848484848481000555555565656575757A9A9A9F9F9
          F9AAC1EF759BE64B7DDD4477DC4074DA3F72D93D71D63C6ED23B6DD03B6DD03B
          6ED23D70D43E71D74074D94477DC4B7DDD759BE6AAC1EFF9F9F9A7A7A74D4D4D
          4B4B4B4949494848484848480000565656595959BDBDBDBED0F3638FE34479DD
          3A72DB336DD92E68D72B66D52962D12860CC275EC7265CC4265CC3265DC5275F
          CA2861CE2B65D32D68D6336DD93A72DB4479DD618EE3BED0F3BABABA4D4D4D4B
          4B4B4949494848481000595959A1A1A1BED0F44E81E03E75DE316CDB2765D921
          60D71C5CD41A58D01856C81651C0154EB9154CB4154BB2154DB51650BC1854C4
          1A57CC1C5BD22160D62765D9316CDB3E75DE4E81E0BED0F49B9B9B4D4D4D4A4A
          4A4949490000686868F6F6F66E99E83E77DF2E6BDD2162D9185BD71256D40F53
          D00D4FC80B4ABE0B46B32B7CAA81AFB11B5197093FA40A44AD0B48B80D4DC20F
          51CC1256D2185BD62162D92E6BDD3E77DF6E99E8F5F5F55C5C5C4C4C4C4A4A4A
          1000A8A8A8B4CBF4447DE23170DF2165DC155CD90D55D60851D0064CCA0447BF
          0343B31F72A3D2E9E9FFFFFF8BAEA311478C033B9E0340AB0445B8054AC4084F
          CD0D55D4155CD82165DC3170DE457EE3B4CBF4A2A2A24E4E4E4B4B4B0000DADA
          DA7AA4EC3A78E2276BDF185FDB0D58D90651D3024BCB0147C00042B41C70A2D4
          E9E9FFFFFFFFFFFFFFFFFF85A99E0D4488003A9D003FAC0145BA0249C5064FCF
          0D57D6185FDA286BDF3A78E27CA5ECD5D5D55050504D4D4D1000F4F4F4578DE9
          3475E42168E0135EDD0956D8034FD0014AC60044B91C71A5D1E9E9FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF81A69A0E4589003CA10042B10148BF034DCB0954D413
          5DDC2167DF3475E35B90E9EFEFEF5252524E4E4E0000FFFFFF4583E82F74E51D
          68E2105EDD0656D7014FCD0049C01B74AAD4EAEBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFFFE84AB9E0D48910040A90046B9014CC60653D2105DDB1E68
          E02F74E44784E8FDFDFD5454544F4F4F1000FFFFFF4282EA2C74E71B69E40E5E
          E00555D7014FCC1A76B3D2EAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF86ADA40B4C9B0046B6014DC50553D20E5DDC1B68E22C74E6
          4282EAFFFFFF5555555050500000FFFFFF4083EC2B76E91A6AE60D60E10558D9
          2885C1CAE7E8FFFFFFFFFFFFF8FAF7D1DFD5F8FBF9FFFFFFEAF1ECD7E4D7FDFD
          FEFFFFFFFFFFFF8BB2AD0F599F004EC70556D40C5EDD1A6AE52B76E84083ECFF
          FFFF5656565151510000FFFFFF4085ED2A77EB1A6DE80D62E3045BDC85C1D0FF
          FFFFFFFFFFFFFFFF5C9191599291FAFDFDFFFFFFC9DAD33E778AC7E0DCFFFFFF
          FFFFFFE9F1E9387C9A0052CD0559D80D61E11A6CE62B77EA4085EDFFFFFF5656
          565252520000FFFFFF4087EF2B7AEE1A6FEB0D65E7055FE21772C6A2CECEFFFF
          FF6A9E970850B15C99B6FAFEFDFFFFFFE1E7EA0B4D9726709DD7EDE8ECF0EC36
          7B990357C60057D7055DDE0D65E51A6EEA2B7AED4087EFFFFFFF565656515151
          0000FFFFFF428AF22C7CF01B72EE0E69EB0562E7015EE31C77C95A9FB61161C0
          0050C363A3BAFDFEFCFFFFFFE6EBEE1454A70048B13785B04389AC0258CF005A
          DB015DE00561E60E68EA1B71ED2C7CF0428AF2FFFFFF5656565151510000FFFF
          FF458DF32F80F21D75F1106DEF0666EC0162E90060E8005EE2005ADA0157CF65
          A5B9FDFFFDFFFFFFDBE7E91C5CB2004EBB0053CA0159D6005CDF005FE60161E8
          0665EB106CEE1E75F02F80F2478EF3FDFDFD5555555151510000F2F2F2599BF7
          3485F5217AF41371F2096BF10367F00166EF0063EB0060E5015CD95EA4B9FEFE
          FEFFFFFFDDE9EA1A61BB0053C5005AD5005FE10062E90165EE0367EF096AF013
          71F2217AF43485F55B9CF7EFEFEF5555555151510000D8D8D87CB1F93A8AF728
          80F61876F50D70F5066CF3036AF30168F10064EB0160E25BA3B6FEFEFEFFFFFF
          DCE9EB1A65C40059D0005EDC0063E80167EF036AF3066CF30D70F41876F52880
          F63A8AF77CB1F9D6D6D65454545151510000A9A9A9B4D3FD4592F93187F9217D
          F81576F80D72F7086FF7066DF5056AF10667E966A7BDFBFDFBFFFFFFE4EEEE1F
          6ED10460DB0565E60569EE066DF4086FF60D72F71576F8217DF83187F94592F9
          B4D3FDA4A4A45353535151510000696969F6F6F66EABFC3E90FA2E87FA217FFA
          187AFA1276F91075F80E72F50D6FF04B96C7B2D2E2B7D4E59AC1D91C73DE0C6A
          E60C6EED0E71F31074F71276F9187AFA217FFA2E87FA3E90FA6EABFCF5F5F562
          626253535351515100005B5B5BA3A3A3BEDAFE4E9AFC3E91FC318AFC2784FC21
          81FC1D7EFA1B7CF8197BF61878F21876EE1774EB1774EA1875EC1877F0197AF4
          1B7BF71D7EFA2181FC2784FC318AFC3E91FC4E9AFCBEDAFE9F9F9F5555555252
          5250505000005858585C5C5CBFBFBFBEDAFE65A9FD4495FD3A90FD338CFD2E88
          FC2C87FC2A85FA2985F82984F62983F42983F42983F52984F72A85FA2C87FB2E
          88FC338CFD3A90FD4495FD65A9FDBEDAFEBDBDBD575757555555525252505050
          00005656565959595C5C5CABABABF9F9F9ACD0FE75B3FE4F9EFE4497FE4194FD
          4094FD3F93FD3E93FC3E93FC3E93FC3E93FC3F93FC4094FD4194FD4497FE4F9E
          FE75B3FEACD0FEF9F9F9A8A8A85959595656565353535151514F4F4F00005353
          535656565858585B5B5B717171B0B0B0DEDEDEF9F9F9FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DDDDDD
          AFAFAF6F6F6F5959595656565454545151514F4F4F4D4D4D0000505050535353
          5555555858585959595B5B5B5E5E5E5F5F5F5F5F5F6060606161616161616161
          616262626262626161616161616161616060605F5F5F5D5D5D5C5C5C5A5A5A58
          58585656565454545252524F4F4F4E4E4E4C4C4C0000}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 1
      end
      object btnRight: TRzBmpButton
        Left = 847
        Top = 9
        Width = 30
        Height = 32
        Cursor = crHandPoint
        Hint = 'Exibe o registro posterior'
        Bitmaps.Disabled.Data = {
          120C0000424D120C00000000000036000000280000001E000000210000000100
          180000000000DC0B0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646000046464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464600004646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646460000464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646000046464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464600004646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          6400464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464641004646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464100464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464645454546464646464646464646464646464646464646464646
          46464646464646464646464646464646464646460A0046464646464646464646
          46464C4C4C6060606E6E6E787878797979797979797979797979787878777777
          7777777676767777777777777878787878787878786E6E6E6060604C4C4C4646
          4646464646464646464646464646464609004646464646464646465F5F5F7777
          77ADADADC6C6C6D8D8D8D8D8D8D8D8D8D6D6D6D4D4D4D2D2D2CFCFCFCDCDCDCB
          CBCBCCCCCCCFCFCFD2D2D2D5D5D5D6D6D6C5C5C5ADADAD7777775F5F5F464646
          4646464646464646464646463C004646464646466565659F9F9FC9C9C9CFCFCF
          CCCCCCCACACAC9C9C9C7C7C7C6C6C6C3C3C3BFBFBFBBBBBBB7B7B7B4B4B4B4B4
          B4B8B8B8BCBCBCC2C2C2C6C6C6CACACACECECECACACA9F9F9F65656546464646
          464646464646464641004646465C5C5C9C9C9CC7C7C7C2C2C2BEBEBEBABABAB8
          B8B8B7B7B7B6B6B6B4B4B4B0B0B0ABABABA3A3A39E9E9E9999999999999D9D9D
          A4A4A4AAAAAAB1B1B1B6B6B6BDBDBDC1C1C1C7C7C79C9C9C5C5C5C4646464646
          4646464646004A4A4A767676B2B2B2B5B5B5AFAFAFA9A9A9A5A5A5A3A3A3A2A2
          A2A0A0A09E9E9E999999939393829989A8CDBB75A0907E7E7E81818187878790
          90909898989F9F9FA7A7A7AEAEAEB4B4B4B2B2B27676764A4A4A464646464646
          61005D5D5D959595ABABABA2A2A29A9A9A9494949090908E8E8E8C8C8C898989
          86868682828279907FB7D4BDFFFFFFD3E9E05D88776868686D6D6D7676767F7F
          7F8888888F8F8F989898A1A1A1AAAAAA9595955D5D5D4646464646463E006D6D
          6D9B9B9B9A9A9A9090908787878181817D7D7D7979797676767373736F6F6F6B
          6B6B86A585FFFFFFFFFFFFFFFFFFD8EBE3517D6C5757575F5F5F676767707070
          7A7A7A8383838F8F8F9999999A9A9A6C6C6C4646464646460900757575959595
          8B8B8B8080807878787070706B6B6B6767676363635F5F5F5C5C5C5858585A61
          56859E70FFFFFFFFFFFFFFFFFFD9EAE44976644C4C4C5454545C5C5C66666671
          71717C7C7C89898993939374747446464646464636007979798A8A8A7C7C7C71
          71716868686161615B5B5B5757575252524E4F4E4B4C4B474847434343444844
          768F65F8FAF7FFFFFFFFFFFFD5E9E144705F4343434B4B4B5555556060606E6E
          6E7A7A7A89898978787846464646464669007979798080807171716565655B5B
          5B5353534F4F4F708269819B7D769879789A7E7C9D847A9B867593816D8E67D6
          DFCCFFFFFFFFFFFFFFFFFFD8E8E2416E5C3F3F3F4848485353536060606F6F6F
          7F7F7F7979794646464646462F007979797777776969695C5C5C5252524C4C4C
          454545C0C9BCFBFDFBFEFEFEFEFEFEFDFFFDFDFEFCFAFEFDFAFDFCF9FBF8FFFF
          FFFFFFFFFFFFFFFFFFFFD6E8E14776654141414B4B4B57575767676777777779
          797946464646464674007979799393938787877E7E7E7575756E6E6E686868CC
          D3C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF98B69A6060606B6B6B7979798484849292927979794646
          4646464636007979799898988C8C8C8383837B7B7B767676707070BAC3B3EBEF
          E7E6EAE2E6EBE2E4E9E2EEEDE8EAE9E3D3DCCBEDF2EAFFFFFFFFFFFFFFFFFFFF
          FFFFA1B793636C5F6969697373737E7E7E8A8A8A979797797979464646464646
          6B007979799E9E9E9393938A8A8A8282827E7E7E7A7A7A7D7F7C81837F7C7E7B
          7A7C797879766C706C5F68616F8769DCE6D4FFFFFFFFFFFFFFFFFF9EB491646C
          606B6B6B7474747C7C7C8787879292929D9D9D79797946464646464600007979
          79A5A5A59A9A9A9191918A8A8A8585858181818080807E7E7E7C7C7C7A7A7A75
          75756F6F6F6B8975D1E4D7FDFDFDFFFFFFFEFFFE9DB48F6870646F6F6F767676
          7F7F7F878787909090999999A4A4A47878784646464646461000757575A9A9A9
          A3A3A39A9A9A9494948E8E8E8B8B8B8A8A8A8989898888888686868282827FA0
          8ADDEFE5FFFFFFFFFFFFFFFFFFA1B9946F776A7676767D7D7D8484848B8B8B92
          9292999999A2A2A2A8A8A874747446464646464600006C6C6CA6A6A6ACACACA4
          A4A49D9D9D9999999696969494949292929292929191918D8D8D8EA688F1F2EA
          FFFFFFFFFFFFA7BD9A7980757F7F7F8585858C8C8C9292929797979C9C9CA4A4
          A4ACACACA6A6A66C6C6C46464646464610005D5D5D999999B6B6B6AEAEAEA8A8
          A8A3A3A3A0A0A09E9E9E9D9D9D9C9C9C9B9B9B9999999295928AA17AEDF3E8B0
          C5A3858D808B8B8B9090909494949A9A9A9E9E9EA2A2A2A8A8A8AEAEAEB6B6B6
          9999995D5D5D46464646464600004A4A4A767676B5B5B5B9B9B9B4B4B4AFAFAF
          ACACACA9A9A9A9A9A9A7A7A7A7A7A7A5A5A5A2A2A29A9E9892AA848D9B869B9B
          9B9D9D9DA1A1A1A4A4A4A7A7A7ABABABAFAFAFB4B4B4B9B9B9B5B5B57676764A
          4A4A46464646464610004646465C5C5C9A9A9AC4C4C4BFBFBFBABABAB7B7B7B5
          B5B5B4B4B4B3B3B3B2B2B2B1B1B1AFAFAFAEAEAEACACACABABABACACACAEAEAE
          AFAFAFB2B2B2B4B4B4B7B7B7BABABABFBFBFC4C4C49A9A9A5C5C5C4646464646
          4646464600004646464646466565659C9C9CC0C0C0C5C5C5C2C2C2C0C0C0BEBE
          BEBEBEBEBDBDBDBCBCBCBCBCBCBCBCBCBBBBBBBBBBBBBBBBBBBBBBBBBDBDBDBD
          BDBDBFBFBFC2C2C2C5C5C5C0C0C09C9C9C656565464646464646464646464646
          10004646464646464646465E5E5E777777A5A5A5BABABAC7C7C7C9C9C9C8C8C8
          C8C8C8C7C7C7C7C7C7C6C6C6C6C6C6C6C6C6C6C6C6C7C7C7C7C7C7C9C9C9C7C7
          C7BABABAA5A5A57777775E5E5E46464646464646464646464646464600004646
          464646464646464646464C4C4C6060606E6E6E77777779797979797979797979
          79797979797979797979797979797979797979797979797979797777776E6E6E
          6060604C4C4C4646464646464646464646464646464646461000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          46464646464646464646464646464646464646460000}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          120C0000424D120C00000000000036000000280000001E000000210000000100
          180000000000DC0B0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474746464646
          4646464646464646464646464646464646464646000046464647474747474747
          4747474747474747474747484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484747474747474747474747
          4747474747474746464646464646464600004747474747474747474848484848
          484848484949494949494949494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A494949494949494949484848484848484848474747
          47474747474747474747474700004848484848484949494949494A4A4A4A4A4A
          4B4B4B4A4A4A4B4B4B4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A49494949494948484849494948484848
          48484747474747473EB04949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C
          4C4C4C4C4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C
          4C4C4C4B4B4B4B4B4B4B4B4B4A4A4A4949494949494949494848484848484848
          4847474700004A4A4A4B4B4B4B4B4B4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4D4D4D4D
          4D4D4C4C4C4B4B4B4B4B4B494949494949494949484848484848484848474747
          00004C4C4C4C4C4C4E4E4E4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          5050504F4F4F5050505050505050505050504F4F4F4F4F4F4E4E4E4E4E4E4D4D
          4D4C4C4C4A4A4A4A4A4A49494949494949494948484849494948484847FF4D4D
          4D4F4F4F50505050505051515151515151515151515151515152525252525252
          52525252525252525252525252525252525151515050504F4F4F4F4F4F4D4D4D
          4B4B4B4A4A4A49494949494948484849494948484849494900004F4F4F515151
          5252525252525353535353535454545555555555555656565656565757575757
          575858585858585656565757575656565555555454545252525050504E4E4E4C
          4C4C4A4A4A494949484848484848484848484848000052525253535355555555
          55556A6A6AAEAEAEDCDCDCFDFDFDFFFFFFFFFFFFFEFEFEFEFEFEFCFCFCFBFBFB
          FAFAFAF9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFCFCFCDBDBDBACACAC6565654D4D
          4D4B4B4B4949494848484848484848481980555555565656575757A9A9A9F9F9
          F9AAC1EF759BE64B7DDD4477DD4175DC4074DB3E73D93D70D63C6FD33B6ED13B
          6DCF3C6ED13D6FD33F72D64375DA4A7CDB759AE5AAC1EFF9F9F9A7A7A74D4D4D
          4B4B4B4949494848484848480C1F565656595959BDBDBDBED0F3638FE34479DD
          3A72DB336DDA2E69D92C68D82A65D72964D42862D0275FCB265DC6265CC3265C
          C4275EC72962CC2C65D1326BD63A71D94479DC618EE3BED0F3BABABA4D4D4D4B
          4B4B4949494848480000595959A1A1A1BED0F44E81E03E75DE316CDB2765DA21
          61D91D5ED81B5CD71A5BD41858D01755CA1652C1164FBA154DB5154DB5164FB9
          1852C11B57C9205DD02663D6316BD93E75DD4E81E0BED0F49B9B9B4D4D4D4A4A
          4A4949490000686868F6F6F66E99E83E77DF2E6BDD2162D9185CD81258D71055
          D60E54D40D52D10C4FCB0B4CC41F65AD87BCC62D7BAA0A41A70A43AB0C47B40E
          4CBF1152C91758D02060D62E6ADB3E77DE6E99E8F5F5F55C5C5C4C4C4C4A4A4A
          0000A8A8A8B4CBF4447DE23170DF2165DC155DDA0D56D70853D60650D4054ED1
          044DCD044AC61E68B0A3CBC8FFFFFFCAE5E51C6B9A033B9E043EA70544B4074A
          BF0C51CB1459D22063D9316FDD457EE2B4CBF4A2A2A24E4E4E4B4B4B0000DADA
          DA7AA4EC3A78E2276BE01860DC0D58D90652D7024ED2014DCE004ACA0048C400
          45BD5A95A7FFFFFFFFFFFFFFFFFFD2E9E71B6A94003899013DA50243B4054AC1
          0C53CC175DD52769DC3A77E07CA4EBD5D5D55050504D4D4D0000F4F4F4578DE9
          3475E42168E1135FDF0957DB0351D5014ECF004AC80048C10045BA0042B3114F
          A16A978CFFFFFFFFFFFFFFFFFFD4E9E91C6A92003999013FA80246B8084FC612
          59D32065DB3374E15B8FE8EFEFEF5252524E4E4ED8F0FFFFFF4583E82F74E51D
          68E3105FDF0657DB0152D4004ECC014BC10147B70144AF0140A6003C9E084296
          5C8C87F8FAF7FFFFFFFFFFFFD1E8E71C6C94003C9D0143AF054CC00F58CE1D65
          DA2E72E14783E7FDFDFD5454544F4F4F0000FFFFFF4282EA2C74E71B69E50E5F
          E20557DC0152D44484B4659DAE5B99A75E9BAA659EAC639CAE5C94AB598F8AD1
          DFD4FFFFFFFFFFFFFFFFFFD4E9E81D709A0142AA044BBE0D57CE1A64D92B72E2
          4281E9FFFFFF5555555050500000FFFFFF4083EC2B76E91A6BE80D61E4055ADF
          0054D6B0CCDDFBFDFBFEFEFEFEFEFEFDFFFDFDFEFCFAFEFDFAFDFDF8FBF9FFFF
          FFFFFFFFFFFFFFFFFFFFD2E9E9267DAB044DBE0C58CF1966DC2A74E44082EBFF
          FFFF5656565151510000FFFFFF4085ED2A77EB1A6DE90D63E6045CE10057D9B4
          CFE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7EB1B50450C30C5BD31968DF2A75E64084ECFFFFFF5656
          565252520000FFFFFF4087EF2B7AEE1A6FEC0D66E90560E5005BE096BDD7E4ED
          EFDCE9ECDDE9EBDBE8EBE6ECF0E1E8ECC9DBD4EAF1EDFFFFFFFFFFFFFFFFFFFF
          FFFF8BB2AA135DAE0456CD0C60DA196BE42A79EB4086EEFFFFFF565656515151
          90F0FFFFFF428AF22C7CF01B72EF0E6AED0563EA015FE61268DF1D6DDB1A68D5
          1A67D01C65CA145DBE0B56AD3E7C95D7E5D8FFFFFFFFFFFFFFFFFF85AFA80E58
          AE0154CB055BD80D65E21A6FE92C7BEE4289F1FFFFFF5656565151510000FFFF
          FF458DF32F80F21D75F1106DEF0666ED0162EB0061E90060E7005EE3005CDE00
          59D60054CA2677ADC7E1DFFDFDFEFFFFFFFEFFFE81ADA50D5AAF0054CA015AD8
          0661E2106AE91E74EE2F7FF1478EF3FDFDFD55555551515189DCF2F2F2599BF7
          3485F5217AF41371F3096BF10368F10166F00065EF0064ED0062E9005FE2378D
          BFD7EEE9FFFFFFFFFFFFFFFFFF84B1A90E5EB30057CE015DDA0362E50968EB13
          70F0217AF33484F45B9CF7EFEFEF5555555151517D8FD8D8D87CB1F93A8AF728
          80F61876F50D70F5066CF4036AF40169F30068F30066F00164EA4390B9ECF1ED
          FFFFFFFFFFFF86B4B00D60BC005AD3015FDD0364E70669ED0D6FF21876F42880
          F63A8AF77CB1F9D6D6D65454545151510046A9A9A9B4D3FD4592F93187F9217D
          F81576F80D72F7086FF7066EF7056DF6056CF40469F00668E43886ABE9F1EA8B
          B9B80D66C60461DB0564E30668E9086CF00D71F41576F7217DF83187F94592F9
          B4D3FDA4A4A45353535151513830696969F6F6F66EABFC3E90FA2E87FA217FFA
          187AFA1276F91075F90E74F80D72F70D71F50C6FF10D6FE33E8DB01874C30C6A
          E60C6CE90D6FEE1072F21275F6187AF9217FFA2E87FA3E90FA6EABFCF5F5F562
          62625353535151518FD95B5B5BA3A3A3BEDAFE4E9AFC3E91FC318AFC2784FC21
          81FC1D7EFB1B7DFB1A7DFA197BF9197AF71879F51878F31877F11878F2197AF4
          1A7BF61D7DF82180FB2784FC318AFC3E91FC4E9AFCBEDAFE9F9F9F5555555252
          5250505017645858585C5C5CBFBFBFBEDAFE65A9FD4495FD3A90FD338CFD2E89
          FD2C88FD2B87FD2A86FB2A86FA2A86FA2A85F92A85F92A85F92A85FA2C87FB2E
          88FC338BFC3A90FD4495FD65A9FDBEDAFEBDBDBD575757555555525252505050
          B6C65656565959595C5C5CABABABF9F9F9ACD0FE75B3FE4F9EFE4497FE4195FE
          4095FE3F94FE3E94FE3E93FD3E93FD3E93FD3F93FD4094FD4194FD4497FE4F9E
          FE75B3FEACD0FEF9F9F9A8A8A85959595656565353535151514F4F4F03045353
          535656565858585B5B5B717171B0B0B0DEDEDEF9F9F9FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DDDDDD
          AFAFAF6F6F6F5959595656565454545151514F4F4F4D4D4D0311505050535353
          5555555858585959595B5B5B5E5E5E5F5F5F5F5F5F6060606161616161616161
          616262626262626161616161616161616060605F5F5F5D5D5D5C5C5C5A5A5A58
          58585656565454545252524F4F4F4E4E4E4C4C4C0C0C}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 2
      end
      object btnLeft: TRzBmpButton
        Left = 816
        Top = 9
        Width = 30
        Height = 32
        Cursor = crHandPoint
        Hint = 'Exibe o registro anterior'
        Bitmaps.Disabled.Data = {
          120C0000424D120C00000000000036000000280000001E000000210000000100
          180000000000DC0B0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646554646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          464646464646464646464646A6AB464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          464646464646464659A246464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          46464646854E4646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          5761464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          46464646464646464646464646464646464646464646464646464646B6AB4646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          464646464646464646464646464646464646464646464646C6B8464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          46464C4C4C6060606E6E6E787878797979797979797979787878787878787878
          7878787878787878787878787979797979797878786E6E6E6060604C4C4C4646
          4646464646464646464646464646464646464646464646464646465F5F5F7777
          77ADADADC6C6C6D8D8D8D8D8D8D7D7D7D4D4D4D3D3D3D1D1D1CFCFCFCFCFCFD0
          D0D0D2D2D2D4D4D4D6D6D6D7D7D7D8D8D8C6C6C6ADADAD7777775F5F5F464646
          46464646464646464646464646464646464646466565659F9F9FC9C9C9CFCFCF
          CCCCCCCACACAC8C8C8C6C6C6C3C3C3BFBFBFBBBBBBB9B9B9B8B8B8BBBBBBBEBE
          BEC2C2C2C5C5C5C7C7C7C9C9C9CCCCCCCFCFCFCACACA9F9F9F65656546464646
          464646464646464600004646465C5C5C9C9C9CC7C7C7C2C2C2BEBEBEBABABAB7
          B7B7B5B5B5B2B2B2ACACACA7A7A7A1A1A19E9E9E9E9E9EA1A1A1A7A7A7ACACAC
          B2B2B2B5B5B5B7B7B7BABABABEBEBEC2C2C2C7C7C79C9C9C5C5C5C4646464646
          4646464600004A4A4A767676B2B2B2B5B5B5AFAFAFAAAAAAA5A5A5A2A2A29F9F
          9F9999999393938C8C8C7D8B75839B7580847E8888888F8F8F9696969C9C9CA0
          A0A0A3A3A3A5A5A5AAAAAAAFAFAFB5B5B5B2B2B27676764A4A4A464646464646
          00005D5D5D959595ABABABA2A2A29A9A9A9494949090908C8C8C878787808080
          79797970786CA8BD9BECF2E7748A646E716E7777777E7E7E8585858A8A8A8D8D
          8D9090909494949A9A9AA1A1A1ABABAB9595955D5D5D46464646464615126D6D
          6D9B9B9B9A9A9A9090908787878181817C7C7C767676717171696969636B5F9F
          B692FFFFFFFFFFFFF0F1E8758E6F6262626969696F6F6F7474747777777B7B7B
          8080808686869090909999999B9B9B6C6C6C4646464646460000757575959595
          8B8B8B7F7F7F7777776F6F6F6969696464645D5D5D5961549AB28CFFFFFFFFFF
          FFFFFFFFDBEDE363846E5252525757575C5C5C6060606363636767676D6D6D75
          75757E7E7E8A8A8A9494947474744646464646460ADC7979798A8A8A7C7C7C71
          717168686860606059595953535350584C95AC87FEFFFEFFFFFFFDFDFDCDE0D3
          4D6A573E3E3E4343434747474B4B4B4D4D4D5151515555555C5C5C6464647070
          707B7B7B8A8A8A78787846464646464608397979798080807171716565655A5A
          5A5252524C4C4C4C534797AD89FFFFFFFFFFFFFFFFFFDAE4D159715237403942
          46424C4D4A4D4F4C4F514D5355524E504D4747474E4E4E575757626262707070
          808080797979464646464646BCFF7979797777776969695C5C5C5151514A4A4A
          4B55479BB08DFFFFFFFFFFFFFFFFFFFFFFFFECF1E9CED8C6E6E5DFEAE9E4E0E5
          DEE2E6DEE1E6DEE8EBE4A9B2A23E3E3E4545454D4D4D59595968686877777779
          7979464646464646D4FC7979799393938787877E7E7E7474746B6B6B9CBA9EFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC9D0C55D5D5D6565656F6F6F7A7A7A8686869393937979794646
          4646464637357979799898988C8C8C8282827A7A7A737373679585DAECE5FFFF
          FFFFFFFFFFFFFFFFFFFFF9FBF8FAFDFCFAFEFDFDFEFCFDFFFDFEFEFEFEFEFEFB
          FDFBC7D0C36565656E6E6E7676768080808B8B8B989898797979464646464646
          00007979799E9E9E9393938989898181817C7C7C767676659180DCECE6FFFFFF
          FFFFFFFFFFFFD8E1CF779771809E8C85A69288A99085A78C85A78790AA8C8596
          7D7171717777777E7E7E8888889292929E9E9E797979464646464646FFFF7979
          79A5A5A59A9A9A9090908A8A8A8484847E7E7E7A7A7A679482D9EDE5FFFFFFFF
          FFFFF9FBF780996F5A5E5A5D5D5D6565656C6C6C7272727676767979797C7C7C
          818181888888909090999999A4A4A4787878464646464646FCFC757575A9A9A9
          A3A3A39A9A9A9393938E8E8E8989898686868181816B9887DCEEE7FFFFFFFFFF
          FFFFFFFF8DA5786D74697171717979797F7F7F8383838686868989898D8D8D92
          9292999999A2A2A2A8A8A8747474464646464646FCFC6C6C6CA6A6A6ACACACA4
          A4A49D9D9D9898989595959191918D8D8D898989709C8BDCEEE6FFFFFFFFFFFF
          FFFFFF8EAC8D7E7E7E8686868B8B8B8F8F8F9292929595959898989C9C9CA3A3
          A3ACACACA6A6A66C6C6C46464646464681815D5D5D999999B6B6B6AEAEAEA8A8
          A8A3A3A39F9F9F9D9D9D9A9A9A97979792929276A291D6ECE3FFFFFFBAD7C082
          99888D8D8D9393939898989B9B9B9D9D9DA0A0A0A3A3A3A8A8A8AEAEAEB6B6B6
          9999995D5D5D464646464646F8F84A4A4A767676B5B5B5B9B9B9B4B4B4AFAFAF
          ACACACA8A8A8A8A8A8A5A5A5A2A2A29E9E9E86B1A0ADD2C08AA1929999999D9D
          9DA1A1A1A4A4A4A8A8A8A8A8A8ACACACAFAFAFB4B4B4B9B9B9B5B5B57676764A
          4A4A464646464646FAF94646465C5C5C9A9A9AC4C4C4BFBFBFBABABAB7B7B7B5
          B5B5B3B3B3B2B2B2B0B0B0ADADADABABABA9A9A9A8A8A8AAAAAAACACACAFAFAF
          B1B1B1B3B3B3B5B5B5B7B7B7BABABABFBFBFC4C4C49A9A9A5C5C5C4646464646
          46464646F9FC4646464646466565659C9C9CC0C0C0C5C5C5C2C2C2C0C0C0BEBE
          BEBDBDBDBCBCBCBBBBBBBABABAB9B9B9B9B9B9B9B9B9BABABABBBBBBBDBDBDBD
          BDBDC0C0C0C2C2C2C5C5C5C0C0C09C9C9C656565464646464646464646464646
          00004646464646464646465E5E5E777777A5A5A5BABABAC7C7C7C9C9C9C8C8C8
          C7C7C7C6C6C6C6C6C6C6C6C6C5C5C5C6C6C6C6C6C6C7C7C7C8C8C8C9C9C9C7C7
          C7BABABAA5A5A57777775E5E5E46464646464646464646464646464681F74646
          464646464646464646464C4C4C6060606E6E6E77777779797979797979797979
          79797979797979797979797979797979797979797979797979797777776E6E6E
          6060604C4C4C464646464646464646464646464646464646F7F8464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646F9F9}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          120C0000424D120C00000000000036000000280000001E000000210000000100
          180000000000DC0B0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474746464646
          4646464646464646464646464646464646464646000046464647474747474747
          4747474747474747474747484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484747474747474747474747
          4747474747474746464646464646464600004747474747474747474848484848
          484848484949494949494949494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A494949494949494949484848484848484848474747
          47474747474747474747474700004848484848484949494949494A4A4A4A4A4A
          4B4B4B4A4A4A4B4B4B4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A49494949494948484849494948484848
          484847474747474700004949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C
          4C4C4C4C4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C
          4C4C4C4B4B4B4B4B4B4B4B4B4A4A4A4949494949494949494848484848484848
          4847474700004A4A4A4B4B4B4B4B4B4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4D4D4D4D
          4D4D4C4C4C4B4B4B4B4B4B494949494949494949484848484848484848474747
          00004C4C4C4C4C4C4E4E4E4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          5050504F4F4F5050505050505050505050504F4F4F4F4F4F4E4E4E4E4E4E4D4D
          4D4C4C4C4A4A4A4A4A4A49494949494949494948484849494948484800004D4D
          4D4F4F4F50505050505051515151515151515151515151515152525252525252
          52525252525252525252525252525252525151515050504F4F4F4F4F4F4D4D4D
          4B4B4B4A4A4A49494949494948484849494948484849494900004F4F4F515151
          5252525252525353535353535454545555555555555656565656565757575757
          575858585858585757575757575656565555555454545252525050504E4E4E4C
          4C4C4A4A4A494949484848484848484848484848000052525253535355555555
          55556A6A6AAEAEAEDCDCDCFDFDFDFFFFFFFEFEFEFEFEFEFDFDFDFCFCFCFCFCFC
          FCFCFCFCFCFCFDFDFDFDFDFDFEFEFEFFFFFFFDFDFDDBDBDBACACAC6565654D4D
          4D4B4B4B4949494848484848484848480000555555565656575757A9A9A9F9F9
          F9AAC1EF759BE64B7DDD4477DD4175DB3F73D93E72D83C70D53C6FD33C6ED23C
          6FD43E71D73F72D94074DA4477DC4B7DDD759BE6AAC1EFF9F9F9A7A7A74D4D4D
          4B4B4B4949494848484848480000565656595959BDBDBDBED0F3638FE34479DD
          3A72DB336DDA2E69D82B67D62963D32862D02760CB275EC9275EC8275FCB2861
          CE2963D22B66D62E68D7336DD93A72DB4479DD618EE3BED0F3BABABA4D4D4D4B
          4B4B4949494848480000595959A1A1A1BED0F44E81E03E75DE316CDB2765DA21
          61D81D5DD51A59D21957CB1754C51651BF164FBB164FBB1651BF1754C51957CB
          1A59D21D5DD52161D82765DA316CDB3E75DE4E81E0BED0F49B9B9B4D4D4D4A4A
          4A4949490000686868F6F6F66E99E83E77DF2E6BDD2162DA185CD81257D51054
          D20D50CB0C4CC30B48B91756993E768E0C47A70A46B40B4ABE0C4EC70D52CF10
          55D51258D7185CD82162DA2E6BDD3E77DF6E99E8F5F5F55C5C5C4C4C4C4A4A4A
          0000A8A8A8B4CBF4447DE23170DF2165DC155DDA0D56D70852D3064DCD0549C4
          0345B90D4CA18BB0ABE9F1E83770850543A70344B60448C1054CCB064FD10852
          D50D56D7155CD92165DC3170DE457EE3B4CBF4A2A2A24E4E4E4B4B4B0000DADA
          DA7AA4EC3A78E2276BE01860DC0D58D90652D5024DCE0149C50044B90D4CA186
          ADA5FFFFFFFFFFFFECF0EB437C960140AD0044B90048C3014BCB024DCF0651D3
          0D57D7185EDA286ADE3A78E17CA5ECD5D5D55050504D4D4D0000F4F4F4578DE9
          3475E42168E0135EDE0956D90350D2014CC90046BD0E4FA184ACA3FFFFFFFFFF
          FFFFFFFFD7ECE637799B003DA60042B10045BA0048C2014BC7034ECD0954D412
          5CDA2167DE3475E35B90E9EFEFEF5252524E4E4E0000FFFFFF4583E82F74E51D
          68E2105FDE0656D80150CF004AC30D51A781AAA2FEFFFEFFFFFFFDFDFEC7DFDA
          26668A003892003C9D003FA60043AF0045B60048BE014CC60652CF0F5CD71D67
          DF2F73E34784E8FDFDFD5454544F4F4F0000FFFFFF4282EA2C74E71B69E40E5E
          E00556D90150CE0E56B185AEA9FFFFFFFFFFFFFFFFFFD7E4D73E72800B428514
          49931C4F9D1A51A31A53A91D58B11254B6014BBF0551CD0D5AD71A66DF2C73E5
          4282EAFFFFFF5555555050500000FFFFFF4083EC2B76E91A6BE70D60E10558DA
          1361BE8BB4AFFFFFFFFFFFFFFFFFFFFFFFFFEAF1ECC9D9D1E1E6E8E6EAECDBE6
          E7DDE7E8DCE7E8E4ECEC96B7CA004BBE0453CD0C5BD71968E12B75E74083ECFF
          FFFF5656565151510000FFFFFF4085ED2A77EB1A6DE80D62E3045ADB7EB5BEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFB4CCDB004DC10455CE0C5ED9196AE22B76E94085EDFFFFFF5656
          565252520000FFFFFF4087EF2B7AEE1A6FEB0D65E7055EE12689C6D2EBEDFFFF
          FFFFFFFFFFFFFFFFFFFFF8FBF9FAFDFDFAFEFDFDFEFCFDFFFDFEFEFEFEFEFEFB
          FDFBB0CCDA0052CB055AD60C62DF196CE62B79EC4087EFFFFFFF565656515151
          0000FFFFFF428AF22C7CF01B72EE0E69EB0561E6015CDF1D82C1D4EBEDFFFFFF
          FFFFFFFFFFFFD1E0D559918C5C96AD639FB165A1B05E9FB05B9DAD65A1B34489
          B80159D7055EDE0E66E61B70EB2C7CEF428AF2FFFFFF5656565151510000FFFF
          FF458DF32F80F21D75F0106CEE0665EB0160E7005CDE1C81C0D1EBECFFFFFFFF
          FFFFF8FBF75C908D084A9E0047AB014DB80153C50156CF0159D7005CDD015FE2
          0663E7106BEB1E74EE2F7FF1478EF3FDFDFD5555555151510000F2F2F2599BF7
          3485F5217AF41371F2096AF00366ED0163E9005FE11C83C2D4EBEDFFFFFFFFFF
          FFFFFFFF6A9D92115CAD0053C50059D3005DDD0060E50163E90366EC0969EE13
          70F0217AF33484F45B9CF7EFEFEF5555555151510000D8D8D87CB1F93A8AF728
          80F61876F50D70F4066BF20368EF0165EA0061E31B83C3D2EBECFFFFFFFFFFFF
          FFFFFF5A9DAF0059D2005FDE0062E70166ED0369F1066BF20D70F41876F4287F
          F53A8AF77CB1F9D6D6D65454545151510000A9A9A9B4D3FD4592F93187F9217D
          F81576F80D72F6086EF5066CF20569ED0565E61C86C6CAE8EAFFFFFFA3CFCE1E
          79C30461DE0566E8056AEF066DF4086FF60D72F71576F8217DF83187F94592F9
          B4D3FDA4A4A45353535151510000696969F6F6F66EABFC3E90FA2E87FA217FFA
          187AFA1276F81074F70E72F40D6FF00C6CEA2F94CE88C6D4207DCA0B69E40C6B
          E80C6EEE0E71F31074F71276F8187AFA217FFA2E87FA3E90FA6EABFCF5F5F562
          626253535351515100005B5B5BA3A3A3BEDAFE4E9AFC3E91FC318AFC2784FC21
          81FC1D7EFA1B7CF91A7BF71879F41877F11876EE1875ED1876EF1878F2197AF5
          1B7CF81D7EFA2181FC2784FC318AFC3E91FC4E9AFCBEDAFE9F9F9F5555555252
          5250505000005858585C5C5CBFBFBFBEDAFE65A9FD4495FD3A90FD338CFD2E89
          FD2C87FC2B86FB2A85F92985F82984F72984F62984F72985F82A85FA2C87FC2E
          88FC338CFD3A90FD4495FD65A9FDBEDAFEBDBDBD575757555555525252505050
          00005656565959595C5C5CABABABF9F9F9ACD0FE75B3FE4F9EFE4497FE4195FE
          4094FD3F93FD3E93FD3E93FD3E93FC3E93FD3F93FD4094FD4195FE4497FE4F9E
          FE75B3FEACD0FEF9F9F9A8A8A85959595656565353535151514F4F4F00005353
          535656565858585B5B5B717171B0B0B0DEDEDEF9F9F9FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DDDDDD
          AFAFAF6F6F6F5959595656565454545151514F4F4F4D4D4D0000505050535353
          5555555858585959595B5B5B5E5E5E5F5F5F5F5F5F6060606161616161616161
          616262626262626161616161616161616060605F5F5F5D5D5D5C5C5C5A5A5A58
          58585656565454545252524F4F4F4E4E4E4C4C4C0000}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 3
      end
      object btnFirst: TRzBmpButton
        Left = 785
        Top = 9
        Width = 30
        Height = 32
        Cursor = crHandPoint
        Hint = 'Exibe o registro anterior'
        Bitmaps.Disabled.Data = {
          120C0000424D120C00000000000036000000280000001E000000210000000100
          180000000000DC0B0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646000046464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464600004646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646460000464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646000046464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464600004646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          0000464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464600004646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646460000464646464646
          4646464646464646464646464646464646464646464646464646464646464545
          4545454545454545454545454546464646464646464646464646464646464646
          4646464646464646464646464646464646464646000046464646464646464646
          46464C4C4C6060606E6E6E787878797979797979787878787878777777767676
          7575757575757676767777777878787979797878786E6E6E6060604C4C4C4646
          4646464646464646464646464646464600004646464646464646465F5F5F7777
          77ADADADC6C6C6D8D8D8D8D8D8D7D7D7D4D4D4D1D1D1CECECECACACAC9C9C9CA
          CACACCCCCCCFCFCFD4D4D4D5D5D5D7D7D7C6C6C6ADADAD7777775F5F5F464646
          46464646464646464646464600004646464646466565659F9F9FC9C9C9CFCFCF
          CCCCCCCACACAC9C9C9C6C6C6C3C3C3BFBFBFB9B9B9B4B4B4B2B2B2B2B2B2B7B7
          B7BBBBBBC1C1C1C6C6C6C9C9C9CCCCCCCFCFCFCACACA9F9F9F65656546464646
          464646464646464600004646465C5C5C9C9C9CC7C7C7C2C2C2BEBEBEBABABAB8
          B8B8B6B6B6B5B5B5B0B0B0A9A9A9A1A1A19A9A9A9797979898989E9E9EA5A5A5
          ADADADB3B3B3B7B7B7BABABABEBEBEC2C2C2C7C7C79C9C9C5C5C5C4646464646
          4646464600004A4A4A767676B2B2B2B5B5B5AFAFAFAAAAAAA5A5A5A3A3A3A2A2
          A29F9F9F9A9A9A979996C4CDBDD3DACFCED7CA90A2888585858E8E8E9696969D
          9D9DA2A2A2A5A5A5A9A9A9AFAFAFB5B5B5B2B2B27676764A4A4A464646464646
          00005D5D5D959595ABABABA2A2A29B9B9B9494949191918E8E8E8D8D8D898989
          848484898B88ECF0E8FFFFFFFBFDFB90AA8C6F6F6F7878788080808787878C8C
          8C9090909494949A9A9AA1A1A1ABABAB9595955D5D5D46464646464600006D6D
          6D9B9B9B9A9A9A9090908787878282827D7D7D7A7A7A7878787474746F6F6F76
          7875E6EAE2FFFFFFFEFEFE80A2825C5C5C6464646B6B6B7272727676767B7B7B
          8080808686869090909A9A9A9B9B9B6C6C6C4646464646460000757575959595
          8B8B8B8080807777777070706C6C6C6868686565656161615C5C5C676965E5E9
          E1FFFFFFFEFEFE7D9F834D4E4D5454545A5A5A5F5F5F6464646868686D6D6D75
          75757E7E7E8A8A8A94949474747446464646464600007979798A8A8A7C7C7C71
          71716868686161615B5B5B5757575454545050504B4B4B5A5B58E2E7E0FFFFFF
          FDFFFD7D9E854041404545454949494D4D4D5252525656565C5C5C6565657070
          707C7C7C8A8A8A78787846464646464608397979798080807171716565655B5B
          5B5353534E4E4E4A4D4A6A82645D7E683D3D3D484C48EBEAE5FFFFFFFDFEFC78
          998435353541493D7492734B62514343434949494F4F4F585858636363717171
          808080797979464646464646BCFF7979797777776969695C5C5C5252524B4B4B
          4448425B724CEFF0E7DAECE2486652363F38E6E5DFFFFFFFFAFEFD708E7C3135
          317A9365FFFFFFACC9B2445B4B3E3E3E4646464E4E4E5A5A5A68686877777779
          7979464646464646D4FC7979799393938787877E7E7E7575756D6D6D738B65EC
          F2E7FFFFFFFFFFFFCFE2D5667E5FD1DBC9FFFFFFFAFDFC71926B779067FFFFFF
          FFFFFFFFFFFF9CC1AF5E5E5E6767677070707C7C7C8686869393937979794646
          4646464637357979799898988C8C8C8282827B7B7B757575697762A7BC9AFFFF
          FFFFFFFFFDFDFDDCE6D3EDF2EAFFFFFFF9FBF8D7E0CEF9FBF7FFFFFFFFFFFFD2
          E7DE618C7C6565656E6E6E7777778181818B8B8B989898797979464646464646
          00007979799E9E9E9393938989898282827D7D7D78787870786CA4BA97FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9EBE35984736868
          687070707878787F7F7F8888889292929E9E9E79797946464646464646467979
          79A5A5A59A9A9A9191918A8A8A8484847F7F7F7C7C7C767E72A3BB95FEFFFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAECE55C88776C6C6C7474747A7A7A
          818181898989919191999999A4A4A47878784646464646464646757575A9A9A9
          A3A3A39A9A9A9393938E8E8E8A8A8A8787878383837B8376A3BA95FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD8ECE4608D7C7272727B7B7B8181818787878C8C8C93
          9393999999A3A3A3A8A8A874747446464646464646466C6C6CA6A6A6ACACACA4
          A4A49D9D9D9999999595959292928F8F8F8B8B8B838A7EA9BF9BFFFFFFFFFFFF
          FFFFFFDCEDE66793817A7A7A8282828989898E8E8E9393939898989C9C9CA4A4
          A4ACACACA6A6A66C6C6C46464646464672F95D5D5D999999B6B6B6AEAEAEA8A8
          A8A3A3A3A0A0A09D9D9D9B9B9B9999999494948C9387AFC4A1FFFFFFDCEFE772
          9E8D8787878C8C8C9292929797979B9B9B9F9F9FA2A2A2A8A8A8AEAEAEB6B6B6
          9999995D5D5D4646464646464B784A4A4A767676B5B5B5B9B9B9B4B4B4AFAFAF
          ACACACA9A9A9A8A8A8A6A6A6A3A3A39F9F9F97A092ACCAAE81AF9F9797979A9A
          9A9E9E9EA2A2A2A6A6A6A8A8A8ABABABAFAFAFB4B4B4B9B9B9B5B5B57676764A
          4A4A4646464646468B884646465C5C5C9A9A9AC4C4C4BFBFBFBABABAB7B7B7B5
          B5B5B4B4B4B2B2B2B1B1B1AEAEAEACACACAAAAAAA9A9A9A9A9A9ABABABAEAEAE
          B0B0B0B3B3B3B4B4B4B7B7B7BABABABFBFBFC4C4C49A9A9A5C5C5C4646464646
          464646463D694646464646466565659C9C9CC0C0C0C5C5C5C2C2C2C0C0C0BEBE
          BEBDBDBDBCBCBCBCBCBCBBBBBBB9B9B9B9B9B9B9B9B9BABABABBBBBBBDBDBDBD
          BDBDC0C0C0C2C2C2C5C5C5C0C0C09C9C9C656565464646464646464646464646
          E0DE4646464646464646465E5E5E777777A5A5A5BABABAC7C7C7C9C9C9C8C8C8
          C8C8C8C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C7C7C7C7C7C7C9C9C9C7C7
          C7BABABAA5A5A57777775E5E5E4646464646464646464646464646467F844646
          464646464646464646464C4C4C6060606E6E6E77777779797979797979797979
          79797979797979797979797979797979797979797979797979797777776E6E6E
          6060604C4C4C464646464646464646464646464646464646C1C0464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          46464646464646464646464646464646464646464646}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          120C0000424D120C00000000000036000000280000001E000000210000000100
          180000000000DC0B0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474746464646
          4646464646464646464646464646464646464646000046464647474747474747
          4747474747474747474747484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484747474747474747474747
          4747474747474746464646464646464600004747474747474747474848484848
          484848484949494949494949494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A494949494949494949484848484848484848474747
          474747474747474747474747FFFF4848484848484949494949494A4A4A4A4A4A
          4B4B4B4A4A4A4B4B4B4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A49494949494948484849494948484848
          484847474747474700004949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C
          4C4C4C4C4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C
          4C4C4C4B4B4B4B4B4B4B4B4B4A4A4A4949494949494949494848484848484848
          48474747FFFF4A4A4A4B4B4B4B4B4B4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4D4D4D4D
          4D4D4C4C4C4B4B4B4B4B4B494949494949494949484848484848484848474747
          00004C4C4C4C4C4C4E4E4E4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          5050504F4F4F5050505050505050505050504F4F4F4F4F4F4E4E4E4E4E4E4D4D
          4D4C4C4C4A4A4A4A4A4A49494949494949494948484849494948484832004D4D
          4D4F4F4F50505050505051515151515151515151515151515152525252525252
          52525252525252525252525252525252525151515050504F4F4F4F4F4F4D4D4D
          4B4B4B4A4A4A49494949494948484849494948484849494900004F4F4F515151
          5252525252525353535353535454545555555555555656565656565757575656
          565757575757575656565656565656565555555454545252525050504E4E4E4C
          4C4C4A4A4A494949484848484848484848484848000052525253535355555555
          55556A6A6AAEAEAEDCDCDCFDFDFDFFFFFFFEFEFEFDFDFDFCFCFCFAFAFAF8F8F8
          F7F7F7F7F7F7F9F9F9FBFBFBFCFCFCFEFEFEFCFCFCDBDBDBACACAC6565654D4D
          4D4B4B4B4949494848484848484848480000555555565656575757A9A9A9F9F9
          F9AAC1EF759BE64B7DDD4477DD4175DB3F72D93D71D63B6ED23A6CCE3A6BCC3A
          6CCD3C6ED13E70D44073D84376DA4B7DDC759BE6AAC1EFF9F9F9A7A7A74D4D4D
          4B4B4B4949494848484848480000565656595959BDBDBDBED0F3638FE34479DD
          3A72DB336DDA2E69D92C67D72964D42861CF275EC9265CC4255BC1255BC1265D
          C62760CB2A64D12D67D6336DD93A72DB4479DD618EE3BED0F3BABABA4D4D4D4B
          4B4B4949494848480000595959A1A1A1BED0F44E81E03E75DE316CDB2765DA21
          61D91D5ED71B5BD51959CF1755C81651BF154DB6154CB3154CB4164FBA1853C3
          1A57CC1C5CD32160D72765DA316CDB3E75DE4E81E0BED0F49B9B9B4D4D4D4A4A
          4A4949490100686868F6F6F66E99E83E77DF2E6BDD2162DA185CD81258D71056
          D70E53D30C50CC1C59C19AB7CCB7CBD9B2C8D44A7DA10B45B00B49BC0D4FC70F
          53D01257D5185CD82162D92E6BDD3E77DF6E99E8F5F5F55C5C5C4C4C4C4A4A4A
          F03FA8A8A8B4CBF4447DE23170DF2165DD155DDA0D56D80853D60651D6054ED1
          044BCA205CC1E4ECECFFFFFFFBFDFB6698A30441AA0344B70449C3064DCD0852
          D30D56D7155CD92165DC3170DE457EE3B4CBF4A2A2A24E4E4E4B4B4B0000DADA
          DA7AA4EC3A78E2276BE01860DC0D58DA0653D8024FD4014ED1004BCB0048C31A
          57BBDCE7E9FFFFFFFEFEFE5B949E013DA20041B00045BD014AC7024DCE0651D4
          0D57D7185FDA286BDF3A78E27CA5ECD5D5D55050504D4D4D0000F4F4F4578DE9
          3475E42168E1135EDE0957DB0351D6014ED1004CCD0049C50045BB1A56B5DDE7
          E9FFFFFFFEFEFE5E97A2013B9D003FAA0044B60047C0014CC9034FCF0954D413
          5DDB2167DE3475E35B90E9EFEFEF5252524E4E4E0000FFFFFF4583E82F74E51D
          68E2105FDF0657DB0152D4004ECD014BC50047BB0043B11C55ADDBE6E8FFFFFF
          FDFFFD659BA6013B97003DA10041AB0045B60049C0014DC80653D10F5DD91E67
          DF2F74E44784E8FDFDFD5454544F4F4F7311FFFFFF4282EA2C74E71B69E40E5F
          E10557DC0152D30250C44384A63780A90040A7144DA0E6EAEDFFFFFFFDFEFC63
          9AA8003890114B915A939F1C64A30047B7014CC40552CF0D5BD91A67E12C74E6
          4282EAFFFFFF5555555050500000FFFFFF4083EC2B76E91A6BE70D61E30559DD
          0356CB367A9BECF0ECD7EDE8266D9A0B4892E1E6E9FFFFFFFAFEFD5C92A6083E
          896A9787FFFFFFA2CBC61764A8004CC10454CF0C5DD91968E32B75E74083ECFF
          FFFF5656565151510000FFFFFF4085ED2A77EB1A6DE80D63E5045CDF3881A5E9
          F1E9FFFFFFFFFFFFC7E0DD3E778AC9DAD2FFFFFFFAFDFD598E865C8B83FFFFFF
          FFFFFFFFFFFF85BDC8004EC30556D00C5FDC196BE42B77EA4085EDFFFFFF5656
          565252520000FFFFFF4087EF2B7AEE1A6FEB0D66E8055FE40F66BB8BB6B6FFFF
          FFFFFFFFFDFDFED7E5D8EAF1ECFFFFFFF8FBF9D1DFD4F8FAF7FFFFFFFFFFFFCA
          E6E62882B50052CA055AD70C63E21A6DE82B7AED4087EFFFFFFF565656515151
          0000FFFFFF428AF22C7CF01B72EE0E69EC0562E8015EE30B62C886B4B2FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2EAE91A77AD0051
          C60158D4055EDF0E67E71B71EC2C7CEF428AF2FFFFFF5656565151514747FFFF
          FF458DF32F80F21D75F1106DEF0666EC0161E8005EE20D64C984B3AFFEFFFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4EAEB1B78AC0052C60057D3015DDE
          0663E7106BEC1E74EF2F7FF1478EF3FDFDFD5555555151514848F2F2F2599BF7
          3485F5217AF41371F2096BF10367EF0164EB0060E50E67C881B1AEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD1EAEA1C7BAE0054C7005AD60160E10364E90969ED13
          70F1217AF33485F55B9CF7EFEFEF5555555151514947D8D8D87CB1F93A8AF728
          80F61876F50D70F5066CF30369F10166ED0062E70D68CB85B4B3FFFFFFFFFFFF
          FFFFFFD4EAEC1C7EB30056CB005CD70162E30366EA066AEF0D6FF31876F42880
          F63A8AF77CB1F9D6D6D65454545151510000A9A9A9B4D3FD4592F93187F9217D
          F81576F80D72F7086FF6066DF4056AF00567E9126CCF8BB9B6FFFFFFD2ECED1F
          84BD035DD40461DD0565E6066AED086DF20D71F51576F7217DF83187F94592F9
          B4D3FDA4A4A45353535151516ECD696969F6F6F66EABFC3E90FA2E87FA217FFA
          187AFA1276F91075F80E73F60D70F20C6DEC1D77D382BCC42D93CB0B68E10C6A
          E40C6CEA0E70F01073F41275F7187AF9217FFA2E87FA3E90FA6EABFCF5F5F562
          626253535351515157515B5B5BA3A3A3BEDAFE4E9AFC3E91FC318AFC2784FC21
          81FC1D7EFB1B7DFA1A7CF81879F51878F21877F01876EE1876EE1877F1197AF4
          1B7BF71D7DF92180FB2784FC318AFC3E91FC4E9AFCBEDAFE9F9F9F5555555252
          525050503B6B5858585C5C5CBFBFBFBEDAFE65A9FD4495FD3A90FD338CFD2E89
          FD2C87FC2B86FC2A86FA2A85F92984F72984F72984F72985F82A85FA2C87FB2E
          88FC338CFD3A90FD4495FD65A9FDBEDAFEBDBDBD575757555555525252505050
          E7E45656565959595C5C5CABABABF9F9F9ACD0FE75B3FE4F9EFE4497FE4195FE
          4095FE3F93FD3E93FD3E93FD3E93FD3E93FD3F93FD4094FD4194FD4497FE4F9E
          FE75B3FEACD0FEF9F9F9A8A8A85959595656565353535151514F4F4F5A625353
          535656565858585B5B5B717171B0B0B0DEDEDEF9F9F9FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DDDDDD
          AFAFAF6F6F6F5959595656565454545151514F4F4F4D4D4D88AD505050535353
          5555555858585959595B5B5B5E5E5E5F5F5F5F5F5F6060606161616161616161
          616262626262626161616161616161616060605F5F5F5D5D5D5C5C5C5A5A5A58
          58585656565454545252524F4F4F4E4E4E4C4C4C4F4D}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 4
      end
      object RzBmpButton1: TRzBmpButton
        Left = 684
        Top = 9
        Width = 96
        Height = 32
        Cursor = crHandPoint
        Hint = 'Outras Opções '
        Bitmaps.Disabled.Data = {
          56250000424D5625000000000000360000002800000060000000210000000100
          18000000000020250000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464848485959596868686F6F6F7979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797959595948
          4848464646464646464646464646464646464646464646464646464646464646
          4646464646464646464747475F5F5F7676769D9D9DBABABAC6C6C6D8D8D8D8D8
          D8D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D8D8D8D8D8D8D9D9D9C5C5C59E9E9E76
          7676606060474747464646464646464646464646464646464646464646464646
          4646464646464C4C4C707070A1A1A1C9C9C9CDCDCDCBCBCBC8C8C8C7C7C7C7C7
          C7C6C6C6C6C6C6C7C7C7C7C7C7C7C7C7C7C7C7C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C7C7C7C7C7C7C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C9C9C9CACACACBCBCBCECECECA
          CACAA1A1A17070704C4C4C464646464646464646464646464646464646464646
          4646464B4B4B737373A4A4A4C5C5C5BFBFBFBCBCBCB8B8B8B4B4B4B3B3B3B1B1
          B1B1B1B1B2B2B2B3B3B3B5B5B5B5B5B5B4B4B4B2B2B2B1B1B1B0B0B0B0B0B0B2
          B2B2B2B2B2B4B4B4B5B5B5B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B7B7B7B7B7B7B8B8B8BABABABCBCBCC0
          C0C0C4C4C4A4A4A47373734B4B4B464646464646464646464646464646464646
          4646466C6C6C9D9D9DB8B8B8B2B2B2ABABABA7A7A7A1A1A19E9E9E9A9A9A9898
          989898989B9B9B9E9E9E9F9F9F9F9F9F9F9F9F9C9C9C9A9A9A9898989898989A
          9A9A9C9C9C9E9E9EA0A0A0A1A1A1A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2AEAEAED0D0D0CB
          CBCBA8A8A8A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A3A3A3A4A4A4A5A5A5A8A8A8AC
          ACACB1B1B1B8B8B89D9D9D6C6C6C464646464646464646464646464646464646
          5656568C8C8CAEAEAEA5A5A59E9E9E9797979191918B8B8B8686868282828080
          808181818484848787878A8A8A8B8B8B8A8A8A86868683838380808080808082
          82828585858888888B8B8B8D8D8D8D8D8D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EA3A3A3CDCDCDEA
          EAEAE3E3E38E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8F8F8F90909091919193939398
          98989E9E9EA5A5A5AEAEAE8C8C8C565656464646464646464646464646464646
          6969699999999C9C9C9393938A8A8A8282827C7C7C7777777070706C6C6C6A6A
          6A6A6A6A6E6E6E7272727676767777777676767272726E6E6E6B6B6B6A6A6A6B
          6B6B6F6F6F7373737777777A7A7A7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C8484849D9D9D9D9D9D8484847C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C8C8C8CB6
          B6B6FFFFFF7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C8484849D9D9D9D9D9D848484
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C9595959D9D9D9D9D9D8484847C7C7C7D7D7D7D7D7D7E7E7E80808084
          84848A8A8A9393939C9C9C999999696969464646464646464646464646464646
          7373739595958C8C8C8282827979797272726B6B6B65656518BAD700D8FF00D8
          FF5757575B5B5B5F5F5F64646466666666666619BBD800D8FF00D8FF4871785A
          5A5A5D5D5D6262626666666A6A6A6C6C6C6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D
          767676BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFDADADA7F7F7F6D6D6DB6B6B6FFFF
          FFDADADA6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D888888DADADAFFFFFFFF
          FFFFFFFFFFFFFFFFDADADA6D6D6D767676BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF
          DADADA7F7F7F6D6D6DB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B
          9BF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFC8C8C87676766E6E6E6E6E6E6F6F6F73
          73737979798282828C8C8C969696747474464646464646464646464646464646
          7878788C8C8C7E7E7E7272726A6A6A6161615C5C5C56565614B6D300D8FF00D8
          FF4848484B4B4B4F4F4F5353535757575858584A656A00D8FF00D8FF13B5D24B
          4B4B4E4E4E5252525757575B5B5B5D5D5D5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
          CDCDCDFFFFFFF5F5F5B9B9B9AFAFAFEBEBEBFFFFFFEBEBEB696969AFAFAFFFFF
          FFD7D7D75F5F5F5F5F5F5F5F5F5F5F5F5F5F5F696969F5F5F5FFFFFFF5F5F5B9
          B9B9AFAFAFE1E1E1FFFFFF5F5F5FCDCDCDFFFFFFF5F5F5B9B9B9AFAFAFEBEBEB
          FFFFFFEBEBEB696969AFAFAFFFFFFFF5F5F5D7D7D7D7D7D7D7D7D7D7D7D7AFAF
          AFF5F5F5B9B9B9878787878787CDCDCDFFFFFFCDCDCD5F5F5F5F5F5F60606063
          63636A6A6A7272727E7E7E8B8B8B797979464646464646464646464646464646
          7979798080807171716666665D5D5D5656565050504A4A4A11B3D000D8FF00D8
          FF3C3C3C3E3E3E4242424646464A4A4A4C4C4C4A4A4A2490A300D8FF00D8FF30
          66704242424545454949494D4D4D505050525252535353535353535353737373
          FFFFFFFFFFFF7E7E7E5353535353535E5E5EF4F4F4FFFFFF9F9F9FA9A9A9FFFF
          FFDFDFDF7E7E7E7E7E7E5E5E5E5353535353539F9F9FFFFFFFF4F4F45E5E5E53
          5353535353535353898989737373FFFFFFFFFFFF7E7E7E5353535353535E5E5E
          F4F4F4FFFFFF9F9F9FA9A9A9FFFFFFD4D4D45353535353535353535353537E7E
          7E5E5E5E535353535353535353898989FFFFFFFFFFFF53535353535354545457
          57575D5D5D666666717171808080797979464646464646464646464646464646
          7979797878786969695C5C5C5454544D4D4D4646464242420FB1CE00D8FF00D8
          FF3333333535353838383B3B3B3F3F3F4242424242423C4A4C04CEF300D8FF07
          C4E63939393B3B3B3F3F3F4343434646464949494949494A4A4A4A4A4A999999
          FFFFFFDDDDDD4A4A4A4A4A4A4A4A4A4A4A4AB0B0B0FFFFFFC6C6C6A4A4A4FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B04A4A4AD2D2D2FFFFFFB0B0B04A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A999999FFFFFFDDDDDD4A4A4A4A4A4A4A4A4A4A4A4A
          B0B0B0FFFFFFC6C6C6A4A4A4FFFFFFDDDDDD7777777777777777776C6C6C4A4A
          4A4A4A4A838383BBBBBBDDDDDDFFFFFFFFFFFFE8E8E84A4A4A4A4A4A4A4A4A4E
          4E4E5454545C5C5C696969777777797979464646464646464646464646464646
          7979799393938787877E7E7E76767670707069696963636317B9D600D8FF00D8
          FF13B4D213B5D214B6D316B7D54A737A606060616161606060398B9900D8FF00
          D8FF2E8D9E5555555B5B5B6161616767676C6C6C6E6E6E6F6F6F6F6F6FB7B7B7
          FFFFFFDBDBDB6F6F6F6F6F6F6F6F6F6F6F6FB7B7B7FFFFFFDBDBDBB7B7B7FFFF
          FFEDEDEDB7B7B7C9C9C9FFFFFFFFFFFFA5A5A5DBDBDBFFFFFFB7B7B76F6F6F6F
          6F6F6F6F6F6F6F6F6F6F6FB7B7B7FFFFFFDBDBDB6F6F6F6F6F6F6F6F6F6F6F6F
          B7B7B7FFFFFFDBDBDBB7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDB7878
          78E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFEDEDED8A8A8A6F6F6F6F6F6F6F6F6F72
          72727676767E7E7E878787939393797979464646464646464646464646464646
          7979799898988D8D8D8383837D7D7D7676766F6F6F69696918BAD700D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF477D8763636365656564646460606011C1E000
          D8FF05D0F4525F625C5C5C6464646A6A6A707070737373757575757575A9A9A9
          FFFFFFEEEEEE757575757575757575757575CBCBCBFFFFFFCBCBCBBABABAFFFF
          FFDCDCDC757575757575C2C2C2FFFFFFDCDCDCCBCBCBFFFFFFCBCBCB75757575
          7575757575757575757575A9A9A9FFFFFFEEEEEE757575757575757575757575
          CBCBCBFFFFFFCBCBCBBABABAFFFFFFEEEEEEBABABABABABABABABAA9A9A9B2B2
          B2FFFFFFFFFFFFE5E5E5BABABA98989875757575757575757575757575757578
          78787D7D7D8383838D8D8D989898797979464646464646464646464646464646
          7979799E9E9E9393938A8A8A8484847D7D7D7777777070701ABCD900D8FF00D8
          FF407780417781437983467D865D6A6D686868696969686868656565497F8900
          D8FF00D8FF28A1B76060606868686F6F6F7575757A7A7A7C7C7C7C7C7C8C8C8C
          FFFFFFFFFFFFB6B6B67C7C7C7C7C7C959595FFFFFFFFFFFFADADADBDBDBDFFFF
          FFDEDEDE7C7C7C848484DEDEDEFFFFFFD6D6D6ADADADFFFFFFFFFFFF9D9D9D7C
          7C7C7C7C7C848484C5C5C58C8C8CFFFFFFFFFFFFB6B6B67C7C7C7C7C7C959595
          FFFFFFFFFFFFADADADBDBDBDFFFFFFDEDEDE7C7C7C7C7C7C7C7C7C7C7C7CBDBD
          BDFFFFFFDEDEDE7C7C7C7C7C7C7C7C7C7C7C7CA5A5A57C7C7C7C7C7C7D7D7D7F
          7F7F8484848A8A8A9393939E9E9E797979464646464646464646464646464646
          787878A5A5A59B9B9B9292928B8B8B8585857F7F7F7878781CBEDB00D8FF00D8
          FF5D5D5D5E5E5E6060606464646868686C6C6C6D6D6D6C6C6C69696966666625
          ACC400D8FF00D8FF5A757A6E6E6E7676767C7C7C808080828282838383838383
          C1C1C1FFFFFFFFFFFFE8E8E8E0E0E0FFFFFFFFFFFFE0E0E0838383C1C1C1FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA838383D8D8D8FFFFFFFFFFFFE8
          E8E8E0E0E0FFFFFFFFFFFF838383C1C1C1FFFFFFFFFFFFE8E8E8E0E0E0FFFFFF
          FFFFFFE0E0E0838383C1C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393
          93F7F7F7FFFFFFD0D0D0C1C1C1D0D0D0F7F7F7E0E0E083838383838384848486
          86868B8B8B9292929B9B9BA5A5A5797979464646464646464646464646464646
          737373A8A8A8A4A4A49B9B9B9595958E8E8E8989898282821FC1DE00D8FF00D8
          FF1BBCDA1BBCDA1BBDDA1CBDDB4698A6489AA81DBFDC1DBFDC1CBEDB1CBDDB14
          C3E300D8FF00D8FF38A4B77777777E7E7E8484848888888A8A8A8B8B8B8B8B8B
          8B8B8BAFAFAFE9E9E9FFFFFFFFFFFFE9E9E9C5C5C58B8B8B8B8B8BB7B7B7E2E2
          E2E2E2E2E2E2E2E2E2E2D3D3D3A8A8A88B8B8B8B8B8B8B8B8BC5C5C5E9E9E9FF
          FFFFFFFFFFE9E9E9C5C5C58B8B8B8B8B8BAFAFAFE9E9E9FFFFFFFFFFFFE9E9E9
          C5C5C58B8B8B8B8B8BB7B7B7E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E28B8B
          8B9A9A9AD3D3D3F8F8F8FFFFFFFFFFFFE2E2E2BEBEBE8B8B8B8C8C8C8D8D8D90
          90909595959B9B9BA4A4A4A9A9A9747474464646464646464646464646464646
          696969A3A3A3AEAEAEA6A6A69F9F9F9999999292928D8D8D22C4E100D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF3FABBE40ACBF00D8FF00D8FF00D8FF00D8FF00
          D8FF00D8FF00D8FF3FABBE8383838989898D8D8D919191929292939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393A1A1A1A7A7A7939393A1A1A1A7A7A7
          9393939393939393939393939393939393939393939393939393939393939393
          939393939393939393939393939393939393939393939494949595959696969A
          9A9A9F9F9FA6A6A6AEAEAEA3A3A3696969464646464646464646464646464646
          5656568F8F8FB8B8B8B1B1B1AAAAAAA4A4A49F9F9F9B9B9B7BA3AB6DA4AD6AA1
          AA689EA8689EA8689EA8699FA97B969B7C979C6AA1AA6AA0AA699FA9689EA868
          9EA8689EA8699FA97D989D9292929696969999999B9B9B9C9C9C9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9DC2C2C2F9F9F9D4D4D4FFFFFFFFFFFF
          C2C2C29D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9E9E9E9F9F9FA1A1A1A5
          A5A5AAAAAAB1B1B1B8B8B88E8E8E555555464646464646464646464646464646
          4646466C6C6C9F9F9FBCBCBCB6B6B6B0B0B0ADADADA8A8A8A5A5A5A2A2A29F9F
          9F9D9D9D9C9C9C9C9C9C9C9C9C9D9D9D9D9D9D9D9D9D9D9D9D9C9C9C9B9B9B9B
          9B9B9B9B9B9D9D9D9E9E9EA0A0A0A3A3A3A4A4A4A6A6A6A6A6A6A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7D8D8D8E3E3E3B8B8B8CECECE
          D8D8D8A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A8A8A8A8A8A8A8A8A8A8A8A8A9A9A9ABABABADADADB1
          B1B1B6B6B6BCBCBC9F9F9F6C6C6C464646464646464646464646464646464646
          4646464B4B4B727272A2A2A2C2C2C2BDBDBDB8B8B8B6B6B6B3B3B3B1B1B1AFAF
          AFAEAEAEAEAEAEADADADADADADADADADADADADADADADADADADADADADADADADAC
          ACACADADADADADADAFAFAFAFAFAFB0B0B0B1B1B1B1B1B1B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3B3B3B3B4B4B4B5B5B5B6B6B6B9B9B9BD
          BDBDC1C1C1A2A2A27373734B4B4B464646464646464646464646464646464646
          4646464646464C4C4C7070709E9E9EC1C1C1C4C4C4C1C1C1BFBFBFBEBEBEBDBD
          BDBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
          BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBEBEBEBEBEBEBFBFBFC1C1C1C4C4C4C1
          C1C19D9D9D7070704C4C4C464646464646464646464646464646464646464646
          4646464646464646464747475F5F5F767676989898AFAFAFBABABAC6C6C6C8C8
          C8C8C8C8C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C8C8C8C9C9C9CACACAB9B9B998989876
          76765F5F5F474747464646464646464646464646464646464646464646464646
          4646464646464646464646464646464848485959596767676F6F6F7777777979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797959595948
          4848464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          56250000424D5625000000000000360000002800000060000000210000000100
          18000000000020250000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474746464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464747474747474747474747474747474747474747474848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484847474747474747
          4747474747474747474747464646464646464646464646464646464646474747
          4747474747474747474747474848484848484848484949494949494949494949
          494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A49494949494949494948484848
          4848484848484848474747474747474747474747464646464646474747474747
          4747474848484848484949494949494A4A4A4A4A4A4B4B4B4A4A4A4B4B4B4B4B
          4B4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A4A4A4A49
          4949484848494949484848484848474747474747474747474747474747484848
          4848484949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4D4D4D4C4C
          4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B4B4A4A4A49
          49494949494A4A4A484848484848484848484848474747474747484848484848
          4949494A4A4A4B4B4B4B4B4B4D4D4D4D4D4D4E4E4E4D4D4D4E4E4E4E4E4E4E4E
          4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4D4D4D4D4D4D4C4C4C4B4B4B4B4B4B4A
          4A4A4949494949494848484848484848484747474848484747474949494A4A4A
          4B4B4B4C4C4C4D4D4D4E4E4E4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F5050505050
          505050504F4F4F50505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          505050505050505050505050504F4F4F4E4E4E4E4E4E4D4D4D4C4C4C4B4B4B4A
          4A4A4949494949494949494949494949494949494848484848484A4A4A4B4B4B
          4D4D4D4E4E4E4F4F4F5050505050505151515151515151515151515151515252
          5252525252525253535352525252525253535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          535353535252525252525252525151515151515050504E4E4E4D4D4D4C4C4C4B
          4B4B4A4A4A4949494949494949494848484848484949494848484B4B4B4D4D4D
          4E4E4E5050505151515252525353535353535454545454545555555555555656
          5657575757575757575758585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          585858585858585757575757575656565656565454545353535151514F4F4F4D
          4D4D4B4B4B4A4A4A4949494848484848484949494848484949494D4D4D4F4F4F
          5151515252525454545555555555555F5F5F959595C6C6C6DEDEDEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94949459
          59594E4E4E4C4C4C4A4A4A4949494848484848484848484848484F4F4F505050
          5353535555555757575C5C5CABABABF5F5F5C3D3F48CABEA6E96E54578DD4276
          DC4074DC3F74DC3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3F74DC4175DC4477DD487ADD749AE6C0D1F3F5
          F5F5AAAAAA5454544D4D4D4A4A4A494949484848494949494949515151535353
          5555555757576D6D6DE2E2E2B8CCF25F8CE24277DC3A72DA346CD83069D82C67
          D62A66D62A65D72A66D82A66D82A66D82A66D82A65D72A65D62A65D62A65D62A
          65D72A65D72A66D82A66D82A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92C68D92E69D9326CDA3870DB4177DD5B
          8AE2B7CCF2E1E1E16565654D4D4D4A4A4A494949484848494949525252555555
          5858586B6B6BECECECA7C0F0477CDF3972DC2E69D92663D7205FD51D5BD21B5A
          D11959D1195AD3195AD4195AD5195AD5195AD41959D31859D11858D01858D018
          59D21959D3195AD4195BD6195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD71A5CD71B5CD81D5ED82060D92563D92D69DB38
          71DD467BDFA6BFF0EBEBEB6363634C4C4C494949494949494949545454575757
          5A5A5AD5D5D5A9C2F1467CE13671DE2867DB1E5FD71659D31255D00F51CC0D50
          CA0D50CA0C50CE0D52D10C52D40C52D40C51D30C50CF0B4FCC0B4ECA0B4ECA0B
          4FCC0C50CF0C51D20C52D40C53D60C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D72A69DC85A9EB77
          9FE91B5EDA0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70D54D70D54D70E55D70F56D71258D8165BD91D5FDA27
          67DB3570DE467CE1A9C2F1D2D2D24F4F4F4B4B4B4A4A4A4A4A4A565656595959
          8F8F8FCFDDF84B82E33875E12769DE1A5FDA1158D70B52D1074ECB064CC5054A
          C30549C5044BCA044DCF044FD3044FD5044ED2044DCD044BC80449C40449C304
          4AC6044CCB044ED0044FD40450D70451D80451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D93372E091B3EED0
          DEF8C0D3F50451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90551D90652D90854D90B56DA1059DA1A
          60DC2769DE3774E04B82E3CFDDF88686864D4D4D4B4B4B4A4A4A5757575B5B5B
          CCCCCC8CB0EE3F7BE32C6EE01C63DE105AD90852D4054DCC0249C40146BC0145
          B90044BA0047C10049C8004CCF004DD1004CD0004AC90047C20045BC0044BA00
          45BD0048C3004ACB004DD1004FD70050D90050DA0050DA0050DA0050DA0050DA
          0050DA0050DA105BDC407CE3407CE3105BDC0050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA2066DF70
          9DEAFFFFFF0050DA0050DA0050DA0050DA0050DA105BDC407CE3407CE3105BDC
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA3071E1407CE3407CE3105BDC0050DA0151DA0251DA0453DB0855DB10
          5BDC1C63DE2C6EE03F7BE38CB0EEC9C9C94F4F4F4C4C4C4B4B4B5959595D5D5D
          ECECEC6294EA3677E4246AE21560E00A58DB0452D5024CCB00B4EF00D8FF00D8
          FF0042B10044B90048C1004BCA004DCF004DCE00B4F100D8FF00D8FF005FC200
          44B60046BD004AC6004DCF0050D70051DB0052DC0052DD0052DD0052DD0052DD
          105DDF8FB3F0FFFFFFFFFFFFFFFFFFFFFFFFBFD4F62068E10052DD7FA8EEFFFF
          FFBFD4F60052DD0052DD0052DD0052DD0052DD0052DD3073E3BFD4F6FFFFFFFF
          FFFFFFFFFFFFFFFFBFD4F60052DD105DDF8FB3F0FFFFFFFFFFFFFFFFFFFFFFFF
          BFD4F62068E10052DD7FA8EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5088
          E8EFF4FDFFFFFFFFFFFFFFFFFFFFFFFF9FBEF2105DDF0153DD0253DD0455DE0A
          59DE1560E0246AE23677E45E91E9EFEFEF5151514E4E4E4C4C4C5A5A5A5E5E5E
          FDFDFD4985E83176E51F6AE31160E10759DC0252D5004DC900B4EE00D8FF00D8
          FF0040A90043B10047B9004BC4004ECC004ECE005ECF00D8FF00D8FF00B3EC00
          43B10046B7004AC1004ECC0051D50053DB0055DE0055DF0055DF0055DF0055DF
          AFCAF5FFFFFFEFF4FD8FB4F17FAAEFDFEAFBFFFFFFDFEAFB1060E17FAAEFFFFF
          FFBFD4F70055DF0055DF0055DF0055DF0055DF1060E1EFF4FDFFFFFFEFF4FD8F
          B4F17FAAEFCFDFF9FFFFFF0055DFAFCAF5FFFFFFEFF4FD8FB4F17FAAEFDFEAFB
          FFFFFFDFEAFB1060E17FAAEFFFFFFFEFF4FDBFD4F7BFD4F7BFD4F7BFD4F77FAA
          EFEFF4FD8FB4F14080E74080E7AFCAF5FFFFFFAFCAF50055DF0055DF0256DF07
          5AE01160E11F6AE33176E54684E8FFFFFF5353534E4E4E4D4D4D5B5B5B5F5F5F
          FFFFFF4383EA2D75E71C69E50F61E4065ADF0154D6004ECA00B4EE00D8FF00D8
          FF003FA30042AA0045B4004ABF004DC9004FCE004ECA0091E100D8FF00D8FF00
          69C30045B30048BC004DC70051D30054DB0056DF0057E10057E20057E23077E7
          FFFFFFFFFFFF4081E90057E20057E21062E4EFF4FDFFFFFF70A1EF7FABF0FFFF
          FFCFDFFA4081E94081E91062E40057E20057E270A1EFFFFFFFEFF4FD1062E400
          57E20057E20057E2508CEB3077E7FFFFFFFFFFFF4081E90057E20057E21062E4
          EFF4FDFFFFFF70A1EF7FABF0FFFFFFBFD5F80057E20057E20057E20057E24081
          E91062E40057E20057E20057E2508CEBFFFFFFFFFFFF0057E20057E20158E206
          5BE30F61E41C69E52D75E74383EAFFFFFF5454545050504E4E4E5C5C5C606060
          FFFFFF4184EC2C76E91A6BE80E63E6055CE20055D90050CC00B4EE00D8FF00D8
          FF003E9E0040A30044AC0048B8004DC40050CB0050CB0057CA00CFFB00D8FF00
          C6F50045B00048B7004DC30051CF0055D90058E10059E3005AE5005AE570A2F0
          FFFFFFCFE0FA005AE5005AE5005AE5005AE58FB7F4FFFFFFAFCBF77FACF2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF8FB7F4005AE5BFD6F8FFFFFF8FB7F4005AE500
          5AE5005AE5005AE5005AE570A2F0FFFFFFCFE0FA005AE5005AE5005AE5005AE5
          8FB7F4FFFFFFAFCBF77FACF2FFFFFFCFE0FA4083EC4083EC4083EC3079EA005A
          E5005AE5508EED9FC1F5CFE0FAFFFFFFFFFFFFDFEAFC005AE5005AE5005AE505
          5DE60E63E61A6BE82B76E94083ECFFFFFF5555555050504E4E4E5C5C5C616161
          FFFFFF4085ED2B77EB1A6DE90D64E8055EE30057DB0052CE00B5EF00D8FF00D8
          FF00B1E600B2E700B2E900B4EC0066CA004FC70050CA004FC70081D700D8FF00
          D8FF0085D00046B1004BBC0050CA0056D70059E0005BE4005CE6005CE77FADF3
          FFFFFFBFD6F9005CE7005CE7005CE7005CE77FADF3FFFFFFBFD6F97FADF3FFFF
          FFDFEBFC7FADF39FC2F6FFFFFFFFFFFF6099F0BFD6F9FFFFFF7FADF3005CE700
          5CE7005CE7005CE7005CE77FADF3FFFFFFBFD6F9005CE7005CE7005CE7005CE7
          7FADF3FFFFFFBFD6F97FADF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFD6F91066
          E9CFE0FAFFFFFFFFFFFFFFFFFFFFFFFFDFEBFC307BEC005CE7005CE7005CE705
          5FE70D64E81A6DE92B77EB4085EDFFFFFF5656565151514E4E4E5C5C5C606060
          FFFFFF4188EF2C7BEE1A6FEC0E68EB0560E6005ADE0055D100B6F000D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF0070CE0050C60052CA0051C7004EC100BDF200
          D8FF00CFFA0050B3004BB80051C70056D5005BE0005EE6005FE9005FEA609BF2
          FFFFFFDFEBFC005FEA005FEA005FEA005FEA9FC3F7FFFFFF9FC3F77FAFF4FFFF
          FFBFD7FA005FEA005FEA8FB9F6FFFFFFBFD7FA9FC3F7FFFFFF9FC3F7005FEA00
          5FEA005FEA005FEA005FEA609BF2FFFFFFDFEBFC005FEA005FEA005FEA005FEA
          9FC3F7FFFFFF9FC3F77FAFF4FFFFFFDFEBFC7FAFF47FAFF47FAFF4609BF270A5
          F3FFFFFFFFFFFFCFE1FB7FAFF44087EF005FEA005FEA005FEA005FEA005FEA05
          62EA0E68EB1A6FEC2C7BEE4087EFFFFFFF5656565151514F4F4F5B5B5B606060
          FFFFFF438BF22D7DF01C72EF0F6AEE0663E9015DE20057D600B6F100D8FF00D8
          FF0068BB0069BC006BC0006EC70057C20051C60052C90051C7004FC1006FCB00
          D8FF00D8FF0099DC004BB80051C70057D5005CE0005FE80061EC0061ED2075EF
          FFFFFFFFFFFF70A6F50061ED0061ED307FF0FFFFFFFFFFFF609CF47FB0F6FFFF
          FFBFD7FA0061ED106BEEBFD7FAFFFFFFAFCDF9609CF4FFFFFFFFFFFF4089F200
          61ED0061ED106BEE8FBAF72075EFFFFFFFFFFFFF70A6F50061ED0061ED307FF0
          FFFFFFFFFFFF609CF47FB0F6FFFFFFBFD7FA0061ED0061ED0061ED0061ED7FB0
          F6FFFFFFBFD7FA0061ED0061ED0061ED0061ED5093F30061ED0061ED0162ED06
          65ED0F6AEE1C72EF2D7DF0438BF2FFFFFF5555555151514F4F4F5A5A5A5F5F5F
          FDFDFD498FF33181F21F76F1116DF00867ED0260E6005ADA00B7F200D8FF00D8
          FF0047AB0047AC0049AF004BB6004EBD0052C50052C70052C50050C0004DBA00
          A3E200D8FF00D8FF005FC40053C90059D7005EE20061E90063EE0063EF0063EF
          7FB1F7FFFFFFFFFFFFCFE2FCBFD8FBFFFFFFFFFFFFBFD8FB0063EF7FB1F7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5094F40063EFAFCEFAFFFFFFFFFFFFCF
          E2FCBFD8FBFFFFFFFFFFFF0063EF7FB1F7FFFFFFFFFFFFCFE2FCBFD8FBFFFFFF
          FFFFFFBFD8FB0063EF7FB1F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2077
          F1EFF5FEFFFFFF9FC4F97FB1F79FC4F9EFF5FEBFD8FB0063EF0063EF0264EF07
          67EF116DF01F76F13181F2468EF3FFFFFF5555555151514F4F4F5959595E5E5E
          EDEDED62A1F73686F5247CF41573F30A6BF00465EA0260E100B9F500D8FF00D8
          FF00B5ED00B5ED00B6EE00B6EF0085DB0086DD00B7F200B7F100B7F000B6EF00
          BEF200D8FF00D8FF0095E10058D0005DDC0061E60064ED0066F10066F20066F2
          0066F25096F6CFE2FDFFFFFFFFFFFFCFE2FD7FB2F80066F20066F260A0F7BFD9
          FCBFD9FCBFD9FCBFD9FC9FC5FA408CF50066F20066F20066F27FB2F8CFE2FDFF
          FFFFFFFFFFCFE2FD7FB2F80066F20066F25096F6CFE2FDFFFFFFFFFFFFCFE2FD
          7FB2F80066F20066F260A0F7BFD9FCBFD9FCBFD9FCBFD9FCBFD9FCBFD9FC0066
          F22079F49FC5FAEFF5FEFFFFFFFFFFFFBFD9FC70A9F80167F20267F20468F20A
          6CF31573F3247CF43686F55E9EF7EFEFEF5454545151514F4F4F5858585C5C5C
          CDCDCD8CBBFA3F8DF72C82F61C79F51070F3086AEE0566E801BAF700D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF0098E80099E900D8FF00D8FF00D8FF00D8FF00
          D8FF00D8FF00D8FF0098E8005DDA0061E30064EA0066F00068F30068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F4207BF53084F60068F4207BF53084F6
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40169F40269F4046AF4086DF410
          71F51C79F52C82F63F8DF78CBBFACACACA5454545151514F4F4F5757575A5A5A
          909090CFE3FD4B96F9388BF92781F81A79F71172F40C6DEF077EEE0483EC0480
          E7037FE4037DE3037EE4037FE60370E20371E40380E8037FE6037FE6037EE403
          7DE3037DE3037EE50371E50464E60467EC0469F1046BF4046CF6046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF762A3FAEFF6FE91BEFBFFFFFFFFFFFF
          62A3FA046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7056DF7066EF7086FF70B70F71073F81A
          79F82781F8378AF94B96F9D1E4FE8888885353535151514F4F4F555555595959
          5D5D5DD6D6D6AACEFD4694FB368BFA2882F91E7CF81777F61274F20F70EE0D6E
          EB0D6CE80C6BE70C6BE70B6BE80B6CE90B6CEA0B6CEA0B6CE90B6BE80B6BE70B
          6BE70B6BE70B6CE90B6DEC0C6EEF0C70F30C71F50C72F70C73F80C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F994C2FCB3D3FD3A8DFA77B0FC
          94C2FC0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90D73F90D73F90E74F90F75F91276F91679FA1D7DFA27
          82FA358BFA4694FBA9CDFDD4D4D45656565353535151514F4F4F535353565656
          5A5A5A6F6F6FEBEBEBA7CDFD4796FC398EFC2E87FB2683FA217FF91E7DF71B7B
          F5197AF4197AF41879F41879F41879F41879F41879F41879F41879F41879F418
          78F31879F41879F4197AF6197AF7197BF8197BF9197CFA197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB1A7DFB1B7DFB1D7EFB2080FC2583FC2D88FC38
          8EFC4696FCA6CCFDECECEC6A6A6A5555555353535050504F4F4F515151545454
          5858585B5B5B727272E3E3E3B8D7FE5FA4FD4294FD3A8FFC348BFC3089FC2D87
          FC2B86FC2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A
          86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2C88FD2E89FD328BFD388FFD4194FD5D
          A4FDB7D7FEE2E2E26D6D6D5757575454545252525050504D4D4D4F4F4F515151
          5454545858585B5B5B626262AFAFAFF6F6F6C3DDFF8EC0FE6EAEFE4D9CFE4296
          FE4095FE3F94FE3F94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3F94FE4195FE4497FE4899FE76B3FEC2DDFFF6
          F6F6ADADAD5F5F5F5858585555555353535050504E4E4E4C4C4C4D4D4D4F4F4F
          5252525454545757575A5A5A5C5C5C6767679B9B9BC8C8C8E0E0E0FAFAFAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99999964
          64645A5A5A5858585555555353535151514E4E4E4D4D4D4B4B4B4B4B4B4D4D4D
          4F4F4F5151515454545656565858585A5A5A5C5C5C5E5E5E5F5F5F6060606060
          6061616161616161616162626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          626262626262626161616161616161616060605F5F5F5E5E5E5D5D5D5B5B5B59
          59595757575656565353535050504F4F4F4D4D4D4B4B4B4A4A4A}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 5
      end
      object btnCancela: TRzBmpButton
        Left = 494
        Top = 9
        Width = 116
        Height = 32
        Cursor = crHandPoint
        Hint = 
          'Cancela os dados ALTERADOS ou o registro que estava sendo CADAST' +
          'RADO'
        Bitmaps.Disabled.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646484848595959686868
          6F6F6F7979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979796F6F6F6868685959594848484646464646464646464646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          76769D9D9DBABABAC6C6C6D8D8D8D8D8D8D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D8D8D8D8D8D8C6C6C6BABABA9E9E9E767676606060474747
          4646464646464646464646464646464646464646464646464646464646464C4C
          4C707070A1A1A1C9C9C9CDCDCDCBCBCBC8C8C8C7C7C7C7C7C7C6C6C6C6C6C6C7
          C7C7C7C7C7C7C7C7C7C7C7C6C6C6C6C6C6C5C5C5C4C4C4C4C4C4C4C4C4C5C5C5
          C6C6C6C6C6C6C7C7C7C7C7C7C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C9C9C9C9C9C9CACACACCCCCCCECECECA
          CACAA1A1A17070704C4C4C464646464646464646464646464646464646464646
          4646464B4B4B737373A4A4A4C5C5C5BFBFBFBCBCBCB8B8B8B4B4B4B3B3B3B1B1
          B1B1B1B1B2B2B2B3B3B3B5B5B5B5B5B5B5B5B5B2B2B2B1B1B1AFAFAFADADADAC
          ACACACACACAEAEAEB0B0B0B2B2B2B4B4B4B5B5B5B5B5B5B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B7B7B7B8B8B8B8B8
          B8BABABABDBDBDC0C0C0C5C5C5A4A4A47373734B4B4B46464646464646464646
          46464646464646464646466C6C6C9D9D9DB8B8B8B2B2B2ABABABA7A7A7A1A1A1
          9E9E9E9A9A9A9898989898989B9B9B9E9E9E9F9F9F9F9F9F9F9F9F9C9C9C9898
          989595959393939191919292929494949797979A9A9A9E9E9E9F9F9FA1A1A1A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A3A3A3A4A4A4A6A6A6A9A9A9ACACACB2B2B2B8B8B89D9D9D6C6C6C4646
          464646464646464646464646464646465656568C8C8CAEAEAEA5A5A59E9E9E97
          97979191918B8B8B8686868282828080808181818484848787878A8A8A8A8A8A
          8888888585858080807C7C7C7979797878787878787B7B7B7E7E7E8383838787
          878A8A8A8C8C8C8D8D8D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8F8F8F8F8F8F9090909191919494949898989E9E9EA5A5A5
          AEAEAE8C8C8C5656564646464646464646464646464646466969699999999C9C
          9C9393938A8A8A8282827C7C7C7777777070706C6C6C6A6A6A6A6A6A6E6E6E72
          72727575757575757373736F6F6F6A6A6A597479498089497F89616161646464
          6868686D6D6D7272727777777A7A7A7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C8484849D9D9D9D9D9D8C8C8C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C9D9D9D9D9D9D9595
          957C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7D7D7D7D7D7D7E7E7E80808084
          84848A8A8A9393939C9C9C999999696969464646464646464646464646464646
          7373739595958C8C8C8282827979797272726B6B6B65656518BAD700D8FF00D8
          FF5757575B5B5B5F5F5F62626263636361616156646616B8D500D8FF00D8FF00
          D8FF05CFF4387C885656565C5C5C6161616666666A6A6A6C6C6C6D6D6D6D6D6D
          6D6D6D6D6D6D6D6D6D767676BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4D1D1
          D1FFFFFFE4E4E46D6D6D6D6D6D6D6D6DBFBFBFFFFFFFE4E4E4929292FFFFFFDA
          DADA6D6D6D6D6D6D6D6D6DB6B6B6FFFFFFFFFFFF6D6D6D6D6D6DADADADF6F6F6
          FFFFFFFFFFFFFFFFFFEDEDED9B9B9BB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6D6D6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4
          E4E46D6D6D6D6D6D6D6D6DBFBFBFFFFFFFE4E4E4929292FFFFFFFFFFFF6D6D6D
          6D6D6D6D6D6DDADADAFFFFFFF6F6F68888886D6D6D6D6D6D6D6D6D6D6D6D6E6E
          6E6E6E6E6F6F6F7373737979798282828C8C8C96969674747446464646464646
          46464646464646467878788C8C8C7E7E7E7272726A6A6A6161615C5C5C565656
          14B6D300D8FF00D8FF4848484B4B4B4F4F4F51515152525250505013B5D200D8
          FF04CFF31D97AC0CBCDB00D8FF00D8FF366C764E4E4E5353535858585C5C5C5E
          5E5E5F5F5F5F5F5F5F5F5F5F5F5F5F5F5FCDCDCDFFFFFFFFFFFFC3C3C3AFAFAF
          CDCDCDFFFFFFA5A5A5FFFFFFFFFFFF7373735F5F5F5F5F5FEBEBEBFFFFFFA5A5
          A5878787FFFFFFD7D7D75F5F5F5F5F5F7D7D7DFFFFFFFFFFFFFFFFFF5F5F5FA5
          A5A5FFFFFFFFFFFFD7D7D7AFAFAFC3C3C3F5F5F5AFAFAFAFAFAFFFFFFFF5F5F5
          D7D7D7D7D7D7D7D7D7D7D7D75F5F5FFFFFFFFFFFFFE1E1E1D7D7D7D7D7D7D7D7
          D7B9B9B9FFFFFFFFFFFF7373735F5F5F5F5F5FEBEBEBFFFFFFA5A5A5878787FF
          FFFFFFFFFF5F5F5F5F5F5FB9B9B9FFFFFFFFFFFF9191915F5F5F5F5F5F5F5F5F
          5F5F5F5F5F5F5F5F5F5F5F5F6060606363636A6A6A7272727E7E7E8B8B8B7979
          794646464646464646464646464646467979798080807171716666665D5D5D56
          56565050504A4A4A11B3D000D8FF00D8FF3C3C3C3E3E3E414141444444454545
          365F6600D8FF00D8FF1D899C393939324D5200D8FF00D8FF189EB74343434848
          484C4C4C505050525252535353535353535353535353737373FFFFFFFFFFFF7E
          7E7E535353535353535353737373696969E9E9E9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF6969697E7E7EFFFFFFD4D4D4535353535353DFDFDFFFFFFFFFFF
          FFFFFFFF535353F4F4F4FFFFFFA9A9A95353535353535353535E5E5E7E7E7EA9
          A9A9FFFFFFD4D4D4535353535353535353535353535353FFFFFFFFFFFF7E7E7E
          535353535353535353535353E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6969697E7E7EFFFFFFFFFFFF535353898989FFFFFFFFFFFFA9A9A953535353
          53535353535353535353535353535353535353535454545757575D5D5D666666
          7171718080807979794646464646464646464646464646467979797878786969
          695C5C5C5454544D4D4D4646464242420FB1CE00D8FF00D8FF33333335353537
          37373939393A3A3A207F9000D8FF00D8FF255C6532323232323200D8FF00D8FF
          0EB0CD3C3C3C4141414444444848484949494A4A4A4A4A4A4A4A4A4A4A4AA4A4
          A4FFFFFFDDDDDD4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AA4A4A4FFFFFFF4
          F4F4A4A4A4DDDDDDFFFFFFD2D2D24A4A4A777777FFFFFFD2D2D24A4A4AA4A4A4
          FFFFFFFFFFFFFFFFFFFFFFFF777777FFFFFFFFFFFF5555554A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4AA4A4A4FFFFFFDDDDDD7777777777777777776C6C6C4A4A4AFF
          FFFFFFFFFF7777774A4A4A4A4A4A4A4A4A4A4A4AA4A4A4FFFFFFF4F4F4A4A4A4
          DDDDDDFFFFFFD2D2D24A4A4A777777FFFFFFFFFFFFD2D2D2F4F4F4FFFFFFD2D2
          D24A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4E
          4E4E5454545C5C5C696969777777797979464646464646464646464646464646
          7979799393938787877E7E7E76767670707069696963636317B9D600D8FF00D8
          FF13B4D213B5D214B6D315B7D4446D742A96A900D8FF00D8FF3377834A4A4A2E
          7F8E00D8FF00D8FF20A7BF5C5C5C6262626868686C6C6C6E6E6E6F6F6F6F6F6F
          6F6F6F6F6F6FB7B7B7FFFFFFDBDBDB6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F
          6F818181FFFFFFFFFFFF818181EDEDEDFFFFFFA5A5A56F6F6F939393FFFFFFDB
          DBDB939393FFFFFFFFFFFFAEAEAEFFFFFFFFFFFF939393FFFFFFFFFFFF6F6F6F
          6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FB7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFDBDBDB6F6F6FFFFFFFFFFFFF9393936F6F6F6F6F6F6F6F6F6F6F6F818181FF
          FFFFFFFFFF818181EDEDEDFFFFFFA5A5A56F6F6F939393FFFFFFFFFFFFDBDBDB
          DBDBDBFFFFFFFFFFFFB7B7B76F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F
          6F6F6F6F6F6F6F7272727676767E7E7E87878793939379797946464646464646
          46464646464646467979799898988D8D8D8383837D7D7D7676766F6F6F696969
          18BAD700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF4379832D98AC00D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF00D8FF4B747B6464646A6A6A6F6F6F73737375
          7575757575757575757575757575A9A9A9FFFFFFEEEEEE757575757575757575
          757575757575757575757575E5E5E5FFFFFFCBCBCBFFFFFFFFFFFF7E7E7E7575
          75989898FFFFFFE5E5E5EEEEEEFFFFFFDCDCDC757575FFFFFFFFFFFF868686FF
          FFFFFFFFFF868686757575757575757575757575757575BABABAFFFFFFEEEEEE
          BABABABABABABABABAA9A9A9757575FFFFFFFFFFFF9898987575757575757575
          75757575757575E5E5E5FFFFFFCBCBCBFFFFFFFFFFFF7E7E7E757575989898FF
          FFFFFFFFFF7575757575758F8F8FFFFFFFFFFFFF868686757575757575757575
          7575757575757575757575757575757878787D7D7D8383838D8D8D9898987979
          794646464646464646464646464646467979799E9E9E9393938A8A8A8484847D
          7D7D7777777070701ABCD900D8FF00D8FF407780417781437983467C86596769
          42869200D8FF00D8FF2C98AB269FB516B8D522A9C14D767D6666666C6C6C7272
          727777777A7A7A7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C8C8C8CFFFFFFFFFFFFBD
          BDBD7C7C7C7C7C7C7C7C7CB6B6B69595957C7C7CB6B6B6FFFFFFFFFFFFFFFFFF
          D6D6D67C7C7C7C7C7C9D9D9DFFFFFFFFFFFFFFFFFFF7F7F78C8C8C7C7C7CFFFF
          FFFFFFFF7C7C7CEFEFEFFFFFFFD6D6D68484847C7C7C7C7C7C9D9D9DADADADBD
          BDBDFFFFFFDEDEDE7C7C7C7C7C7C7C7C7C7C7C7C7C7C7CFFFFFFFFFFFF9D9D9D
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7CB6B6B6FFFFFFFFFFFFFFFFFFD6D6D67C7C
          7C7C7C7C9D9D9DFFFFFFFFFFFF7C7C7C7C7C7C848484FFFFFFFFFFFF9D9D9D7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7F7F7F8484848A8A8A
          9393939E9E9E797979464646464646464646464646464646787878A5A5A59B9B
          9B9292928B8B8B8585857F7F7F7878781CBEDB00D8FF00D8FF5D5D5D5E5E5E60
          6060646464676767616F7107D1F600D8FF12C2E15A686A606060626262676767
          6D6D6D7575757A7A7A7E7E7E8181818383838383838383838383838383838383
          83B9B9B9FFFFFFFFFFFFEFEFEFE0E0E0F7F7F7FFFFFFA2A2A28383838B8B8BFF
          FFFFFFFFFFFFFFFFAAAAAA838383838383A2A2A2FFFFFFFFFFFFFFFFFFAAAAAA
          838383838383FFFFFFFFFFFF8383839A9A9AFFFFFFFFFFFFF7F7F7E0E0E0EFEF
          EFFFFFFFC1C1C1C1C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF838383FF
          FFFFFFFFFFA2A2A28383838383838383838383838383838B8B8BFFFFFFFFFFFF
          FFFFFFAAAAAA838383838383A2A2A2FFFFFFFFFFFFE0E0E0E0E0E0F7F7F7FFFF
          FFF7F7F78B8B8B83838383838383838383838383838383838383838384848486
          86868B8B8B9292929B9B9BA5A5A5797979464646464646464646464646464646
          737373A8A8A8A4A4A49B9B9B9595958E8E8E8989898282821FC1DE00D8FF00D8
          FF1BBCDA1BBCDA1BBDDA1CBEDB4798A774747441A0B100D8FF00D8FF0ECAED2F
          A9BE37A2B623B8D27777777E7E7E8383838787878989898B8B8B8B8B8B8B8B8B
          8B8B8B8B8B8B8B8B8B8B8B8BAFAFAFE2E2E2FFFFFFFFFFFFF0F0F0D3D3D39292
          928B8B8B8B8B8BCCCCCCE2E2E2E2E2E28B8B8B8B8B8B8B8B8BA1A1A1E2E2E2E2
          E2E2CCCCCC8B8B8B8B8B8B8B8B8BE2E2E2E2E2E28B8B8B8B8B8BA1A1A1DBDBDB
          F8F8F8FFFFFFF8F8F8DBDBDBA1A1A1B7B7B7E2E2E2E2E2E2E2E2E2E2E2E2E2E2
          E2E2E2E28B8B8BE2E2E2E2E2E2A1A1A18B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B
          8B8BCCCCCCE2E2E2E2E2E28B8B8B8B8B8B8B8B8BA1A1A1E2E2E2E2E2E2E2E2E2
          E2E2E2E2E2E2CCCCCC9A9A9A8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B
          8B8C8C8C8D8D8D9090909595959B9B9BA4A4A4A9A9A974747446464646464646
          4646464646464646696969A3A3A3AEAEAEA6A6A69F9F9F9999999292928D8D8D
          22C4E100D8FF00D8FF00D8FF00D8FF00D8FF00D8FF41ACC082828283838341AC
          C008D2F700D8FF00D8FF00D8FF00D8FF8383838989898D8D8D90909092929293
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939494949595959696969A9A9A9F9F9FA6A6A6AEAEAEA3A3A36969
          694646464646464646464646464646465656568F8F8FB8B8B8B1B1B1AAAAAAA4
          A4A49F9F9F9B9B9B7BA3AB6DA4AD6AA1AA689EA8689EA8689EA86AA0AA7D989D
          91919192929291919187959761A5B146B2C546B2C550AFC09191919595959898
          989B9B9B9C9C9C9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9E9E9E9F9F9FA0A0A0A2A2A2A5A5A5AAAAAAB1B1B1
          B8B8B88E8E8E5555554646464646464646464646464646464646466C6C6C9F9F
          9FBCBCBCB6B6B6B0B0B0ADADADA8A8A8A5A5A5A2A2A29F9F9F9D9D9D9C9C9C9D
          9D9D9D9D9D9E9E9EA0A0A0A0A0A0A0A0A0A0A0A09E9E9E9D9D9D9D9D9D9D9D9D
          9E9E9EA2A2A2A4A4A4A5A5A5A6A6A6A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A8A8A8A8A8A8A8A8A8A8A8A8A9A9A9AAAAAAABABABAEAEAEB1
          B1B1B6B6B6BCBCBC9F9F9F6C6C6C464646464646464646464646464646464646
          4646464B4B4B727272A2A2A2C2C2C2BDBDBDB8B8B8B6B6B6B3B3B3B1B1B1AFAF
          AFAEAEAEAEAEAEADADADADADADAEAEAEAFAFAFAFAFAFAFAFAFAFAFAFAEAEAEAD
          ADADADADADADADADAEAEAEAFAFAFB0B0B0B1B1B1B1B1B1B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3B3B3B3B3B3B3B4B4B4B5B5
          B5B7B7B7B9B9B9BDBDBDC2C2C2A2A2A27373734B4B4B46464646464646464646
          46464646464646464646464646464C4C4C7070709E9E9EC1C1C1C4C4C4C1C1C1
          BFBFBFBEBEBEBDBDBDBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
          BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BEBEBEBFBFBFC0C0C0C2C2C2C4C4C4C1C1C19D9D9D7070704C4C4C4646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          7676989898AFAFAFBABABAC6C6C6C8C8C8C8C8C8C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C8C8C8C8C8C8C6C6C6BABABAB0B0B09898987676765F5F5F474747
          4646464646464646464646464646464646464646464646464646464646464646
          464646464646464848485959596767676F6F6F77777779797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          797979797979797979797979797979797979797777776F6F6F68686859595948
          4848464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474746464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646474747474747474747474747474747474747
          4747474848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484747474747474747474747474747474747474747474646464646
          4646464646464646464646464647474747474747474747474747474748484848
          48484848484949494949494949494949494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A494949494949494949494949484848484848484848474747
          4747474747474747474747474646464646464747474747474747474848484848
          484949494949494A4A4A4A4A4A4B4B4B4A4A4A4B4B4B4B4B4B4B4B4B4B4B4B4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A49494949
          4949484848494949484848484848474747474747474747474747474747484848
          4848484949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4D4D4D4C4C
          4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B
          4B4B4B4B4A4A4A4A4A4A49494949494948484848484848484848484847474747
          47474848484848484949494A4A4A4B4B4B4B4B4B4D4D4D4D4D4D4E4E4E4D4D4D
          4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E
          4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4A4A4A4A4A4A4949494949494848484848
          484747474848484747474949494A4A4A4B4B4B4C4C4C4D4D4D4E4E4E4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F5050505050505050504F4F4F505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          50504F4F4F4F4F4F4E4E4E4E4E4E4C4C4C4C4C4C4B4B4B4B4B4B4A4A4A494949
          4949494848484949494949494848484848484A4A4A4B4B4B4D4D4D4E4E4E4F4F
          4F50505050505051515151515151515151515151515152525252525252525253
          5353525252525252535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          535252525252525252525252525151515050505050504F4F4F4D4D4D4C4C4C4B
          4B4B4A4A4A4949494949494848484848484848484949494848484B4B4B4D4D4D
          4E4E4E5050505151515252525353535353535454545454545555555555555656
          5657575757575757575758585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585757575757575656565555555454545252
          525151514F4F4F4D4D4D4B4B4B4A4A4A49494948484848484848484848484849
          49494D4D4D4F4F4F5151515252525454545555555555555F5F5F959595C6C6C6
          DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFDEDEDEC5C5C59494945959594E4E4E4C4C4C4A4A4A4949494848
          484848484848484848484F4F4F5050505353535555555757575C5C5CABABABF5
          F5F5C3D3F48CABEA6E96E54578DD4276DC4074DC3F74DC3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DA3E73DA3E73DA3E73DA3E73DA3E73DA3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3F74DC4074DC4276DC4578DD6E96E58CABEAC1D2F3F5F5F5AAAAAA545454
          4C4C4C4A4A4A4949494848484949494949495151515353535555555757576D6D
          6DE2E2E2B8CCF25F8CE24277DC3A72DA346CD83069D82C67D62A66D62A65D72A
          66D82A66D82A66D82A66D82A65D72A65D62964D62964D52964D52964D52964D6
          2A65D62A65D72A66D82A66D82A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92B67D92D68D9306ADA346DDA3A72DB4277DD5D
          8AE2B8CCF2E1E1E16565654D4D4D4A4A4A494949484848494949525252555555
          5858586B6B6BECECECA7C0F0477CDF3972DC2E69D92663D7205FD51D5BD21B5A
          D11959D1195AD3195AD4195AD5195AD5195AD51959D31859D11857CF1856CC18
          56CB1856CB1857CE1858CF1859D2195AD4195AD5195BD6195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD71A5CD71A5CD71C5DD81E5ED82161
          D92664DA2E6ADB3972DD477CDFA7C0F0EBEBEB6262624C4C4C49494949494949
          49495454545757575A5A5AD5D5D5A9C2F1467CE13671DE2867DB1E5FD71659D3
          1255D00F51CC0D50CA0D50CA0C50CE0D52D10C51D30C52D40C51D30C50CF0B4E
          CA0B4CC60B4BC30B4BC10B4BC20B4CC40B4DC90B4FCD0C51D10C52D40C52D50C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70D54D70D54D70E55D7
          0E55D71056D81358D8175BD91E60DA2867DC3671DE467CE1A9C2F1D2D2D24F4F
          4F4B4B4B4A4A4A4A4A4A5656565959598F8F8FCFDDF84B82E33875E12769DE1A
          5FDA1158D70B52D1074ECB064CC5054AC30549C5044BCA044DCE044ED2044FD3
          044ED0044CCB0449C40347BE0345B90344B70345B80346BB0448C1044BC8044D
          CE044FD30450D60451D80451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90551D90652D90753D90854D90C56DA115ADB1A60DC2769DE3774E0
          4B82E3CFDDF88686864D4D4D4B4B4B4A4A4A5757575B5B5BCCCCCC8CB0EE3F7B
          E32C6EE01C63DE105AD90852D4054DCC0249C40146BC0145B90044BA0047C100
          49C8004BCD004CCE004ACB0048C30044BA0055BD0065C20065BF003FAB0040AF
          0043B70046BF004AC9004DD1004ED60050D90050DA0050DA0050DA0050DA0050
          DA0050DA0050DA105BDC407CE3407CE32066DF0050DA0050DA0050DA0050DA00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA407CE3407CE33071
          E10050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0151DA0151DA0251DA0453DB0855DB10
          5BDC1C63DE2C6EE03F7BE38CB0EEC9C9C94F4F4F4C4C4C4B4B4B5959595D5D5D
          ECECEC6294EA3677E4246AE21560E00A58DB0452D5024CCB00B4EF00D8FF00D8
          FF0042B10044B90047C0004AC6004AC80049C4004EBF00B2EC00D8FF00D8FF00
          D8FF00CEF9006EC20041AF0045BA0049C6004DCF0050D70051DB0052DD0052DD
          0052DD0052DD0052DD105DDF8FB3F0FFFFFFFFFFFFFFFFFFFFFFFFCFDEF9AFC9
          F4FFFFFFCFDEF90052DD0052DD0052DD8FB3F0FFFFFFCFDEF9407DE6FFFFFFBF
          D4F60052DD0052DD0052DD7FA8EEFFFFFFFFFFFF0052DD0052DD709EECEFF4FD
          FFFFFFFFFFFFFFFFFFDFE9FB5088E87FA8EEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0052DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF
          DEF90052DD0052DD0052DD8FB3F0FFFFFFCFDEF9407DE6FFFFFFFFFFFF0052DD
          0052DD0052DDBFD4F6FFFFFFEFF4FD3073E30052DD0052DD0052DD0052DD0153
          DD0253DD0455DE0A59DE1560E0246AE23677E45E91E9EFEFEF5151514E4E4E4C
          4C4C5A5A5A5E5E5EFDFDFD4985E83176E51F6AE31160E10759DC0252D5004DC9
          00B4EE00D8FF00D8FF0040A90043B10046B90049BF0049C00048BD00B3EC00D8
          FF00CEF90093D400BAEC00D8FF00D8FF0067BF0046B7004AC3004FCE0052D800
          54DD0055DF0055DF0055DF0055DF0055DFAFCAF5FFFFFFFFFFFF9FBFF37FAAEF
          AFCAF5FFFFFF70A0EDFFFFFFFFFFFF206AE30055DF0055DFDFEAFBFFFFFF70A0
          ED4080E7FFFFFFBFD4F70055DF0055DF3075E5FFFFFFFFFFFFFFFFFF0055DF70
          A0EDFFFFFFFFFFFFBFD4F77FAAEF9FBFF3EFF4FD7FAAEF7FAAEFFFFFFFEFF4FD
          BFD4F7BFD4F7BFD4F7BFD4F70055DFFFFFFFFFFFFFCFDFF9BFD4F7BFD4F7BFD4
          F78FB4F1FFFFFFFFFFFF206AE30055DF0055DFDFEAFBFFFFFF70A0ED4080E7FF
          FFFFFFFFFF0055DF0055DF8FB4F1FFFFFFFFFFFF508AE90055DF0055DF0055DF
          0055DF0055DF0055DF0055DF0256DF075AE01160E11F6AE33176E54684E8FFFF
          FF5353534E4E4E4D4D4D5B5B5B5F5F5FFFFFFF4383EA2D75E71C69E50F61E406
          5ADF0154D6004ECA00B4EE00D8FF00D8FF003FA30042AA0045B20047B90048BB
          0061C500D8FF00D8FF008ACE003C9B004FA700D8FF00D8FF00A0DF0046B7004C
          C50050D00054DB0056E00057E20057E20057E20057E23077E7FFFFFFFFFFFF40
          81E90057E20057E20057E23077E7206CE6DFEAFBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF206CE64081E9FFFFFFBFD5F80057E20057E2CFDFFAFFFFFFFFFF
          FFFFFFFF0057E2EFF4FDFFFFFF7FABF00057E20057E20057E21062E44081E97F
          ABF0FFFFFFBFD5F80057E20057E20057E20057E20057E2FFFFFFFFFFFF4081E9
          0057E20057E20057E20057E2DFEAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF206CE64081E9FFFFFFFFFFFF0057E2508CEBFFFFFFFFFFFF7FABF00057E200
          57E20057E20057E20057E20057E20057E20057E20158E2065BE30F61E41C69E5
          2D75E74383EAFFFFFF5454545050504E4E4E5C5C5C606060FFFFFF4184EC2C76
          E91A6BE80E63E6055CE20055D90050CC00B4EE00D8FF00D8FF003E9E0040A300
          43AB0046B20047B40086D400D8FF00D8FF0064B4003C9A003D9A00D8FF00D8FF
          00B3EB0049BB004FC80053D40057DE0059E3005AE5005AE5005AE5005AE57FAC
          F2FFFFFFCFE0FA005AE5005AE5005AE5005AE5005AE5005AE57FACF2FFFFFFEF
          F5FD7FACF2CFE0FAFFFFFFBFD6F8005AE54083ECFFFFFFBFD6F8005AE57FACF2
          FFFFFFFFFFFFFFFFFFFFFFFF4083ECFFFFFFFFFFFF1064E7005AE5005AE5005A
          E5005AE5005AE57FACF2FFFFFFCFE0FA4083EC4083EC4083EC3079EA005AE5FF
          FFFFFFFFFF4083EC005AE5005AE5005AE5005AE57FACF2FFFFFFEFF5FD7FACF2
          CFE0FAFFFFFFBFD6F8005AE54083ECFFFFFFFFFFFFBFD6F8EFF5FDFFFFFFBFD6
          F8005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE505
          5DE60E63E61A6BE82B76E94083ECFFFFFF5555555050504E4E4E5C5C5C616161
          FFFFFF4085ED2B77EB1A6DE90D64E8055EE30057DB0052CE00B5EF00D8FF00D8
          FF00B1E600B2E700B2E800B3EA0061BE008ED600D8FF00D8FF006EBA003D9900
          78C100D8FF00D8FF00A1E2004CC00052CD0056D80059E1005BE5005CE7005CE7
          005CE7005CE77FADF3FFFFFFBFD6F9005CE7005CE7005CE7005CE7005CE7005C
          E72070EAFFFFFFFFFFFF2070EADFEBFCFFFFFF6099F0005CE74085EDFFFFFFBF
          D6F94085EDFFFFFFFFFFFF70A4F2FFFFFFFFFFFF4085EDFFFFFFFFFFFF005CE7
          005CE7005CE7005CE7005CE7005CE77FADF3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFBFD6F9005CE7FFFFFFFFFFFF4085ED005CE7005CE7005CE7005CE72070EAFF
          FFFFFFFFFF2070EADFEBFCFFFFFF6099F0005CE74085EDFFFFFFFFFFFFBFD6F9
          BFD6F9FFFFFFFFFFFF7FADF3005CE7005CE7005CE7005CE7005CE7005CE7005C
          E7005CE7005CE7055FE70D64E81A6DE92B77EB4085EDFFFFFF5656565151514E
          4E4E5C5C5C606060FFFFFF4188EF2C7BEE1A6FEC0E68EB0560E6005ADE0055D1
          00B6F000D8FF00D8FF00D8FF00D8FF00D8FF00D8FF006CC50090D800D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF00D8FF0066C70051C80056D4005ADE005DE500
          5FE9005FEA005FEA005FEA005FEA609BF2FFFFFFDFEBFC005FEA005FEA005FEA
          005FEA005FEA005FEA005FEACFE1FBFFFFFF9FC3F7FFFFFFFFFFFF1069EB005F
          EA4087EFFFFFFFCFE1FBDFEBFCFFFFFFBFD7FA005FEAFFFFFFFFFFFF2073EDFF
          FFFFFFFFFF2073ED005FEA005FEA005FEA005FEA005FEA7FAFF4FFFFFFDFEBFC
          7FAFF47FAFF47FAFF4609BF2005FEAFFFFFFFFFFFF4087EF005FEA005FEA005F
          EA005FEA005FEACFE1FBFFFFFF9FC3F7FFFFFFFFFFFF1069EB005FEA4087EFFF
          FFFFFFFFFF005FEA005FEA307DEEFFFFFFFFFFFF2073ED005FEA005FEA005FEA
          005FEA005FEA005FEA005FEA005FEA0562EA0E68EB1A6FEC2C7BEE4087EFFFFF
          FF5656565151514F4F4F5B5B5B606060FFFFFF438BF22D7DF01C72EF0F6AEE06
          63E9015DE20057D600B6F100D8FF00D8FF0068BB0069BC006BC0006DC50054BB
          0077CE00D8FF00D8FF008ED30097D700B3E900A1E00066C40050C20055CF0059
          DA005DE4005FE90061EC0061ED0061ED0061ED0061ED2075EFFFFFFFFFFFFF7F
          B0F60061ED0061ED0061ED70A6F5307FF00061ED70A6F5FFFFFFFFFFFFFFFFFF
          AFCDF90061ED0061ED4089F2FFFFFFFFFFFFFFFFFFEFF5FE2075EF0061EDFFFF
          FFFFFFFF0061EDDFEBFDFFFFFFAFCDF9106BEE0061ED0061ED4089F2609CF47F
          B0F6FFFFFFBFD7FA0061ED0061ED0061ED0061ED0061EDFFFFFFFFFFFF4089F2
          0061ED0061ED0061ED0061ED0061ED70A6F5FFFFFFFFFFFFFFFFFFAFCDF90061
          ED0061ED4089F2FFFFFFFFFFFF0061ED0061ED106BEEFFFFFFFFFFFF4089F200
          61ED0061ED0061ED0061ED0061ED0061ED0061ED0162ED0665ED0F6AEE1C72EF
          2D7DF0438BF2FFFFFF5555555151514F4F4F5A5A5A5F5F5FFDFDFD498FF33181
          F21F76F1116DF00867ED0260E6005ADA00B7F200D8FF00D8FF0047AB0047AC00
          49AF004BB6004EBB0058C200CFFB00D8FF00BDF10051B30048AE004AB3004EBB
          0053C80058D5005CDF0060E70062EC0063EF0063EF0063EF0063EF0063EF0063
          EF70A8F6FFFFFFFFFFFFDFEBFDBFD8FBEFF5FEFFFFFF408AF30063EF106DF0FF
          FFFFFFFFFFFFFFFF5094F40063EF0063EF408AF3FFFFFFFFFFFFFFFFFF5094F4
          0063EF0063EFFFFFFFFFFFFF0063EF3080F2FFFFFFFFFFFFEFF5FEBFD8FBDFEB
          FDFFFFFF7FB1F77FB1F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0063EFFF
          FFFFFFFFFF408AF30063EF0063EF0063EF0063EF0063EF106DF0FFFFFFFFFFFF
          FFFFFF5094F40063EF0063EF408AF3FFFFFFFFFFFFBFD8FBBFD8FBEFF5FEFFFF
          FFEFF5FE106DF00063EF0063EF0063EF0063EF0063EF0063EF0063EF0264EF07
          67EF116DF01F76F13181F2468EF3FFFFFF5555555151514F4F4F5959595E5E5E
          EDEDED62A1F73686F5247CF41573F30A6BF00465EA0260E100B9F500D8FF00D8
          FF00B5ED00B5ED00B6EE00B6F00086DC0055CA008FE100D8FF00D8FF00C7F700
          9CE20094DE00AEED0057CF005CDB0060E40063EB0065EF0066F20066F20066F2
          0066F20066F20066F20066F25096F6BFD9FCFFFFFFFFFFFFDFECFD9FC5FA1070
          F30066F20066F28FBCF9BFD9FCBFD9FC0066F20066F20066F23083F4BFD9FCBF
          D9FC8FBCF90066F20066F20066F2BFD9FCBFD9FC0066F20066F23083F4AFCFFB
          EFF5FEFFFFFFEFF5FEAFCFFB3083F460A0F7BFD9FCBFD9FCBFD9FCBFD9FCBFD9
          FCBFD9FC0066F2BFD9FCBFD9FC3083F40066F20066F20066F20066F20066F200
          66F28FBCF9BFD9FCBFD9FC0066F20066F20066F23083F4BFD9FCBFD9FCBFD9FC
          BFD9FCBFD9FC8FBCF92079F40066F20066F20066F20066F20066F20066F20167
          F20267F20468F20A6CF31573F3247CF43686F55E9EF7EFEFEF5454545151514F
          4F4F5858585C5C5CCDCDCD8CBBFA3F8DF72C82F61C79F51070F3086AEE0566E8
          01BAF700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF0099EA005CD8005DD90099
          EA00D0FC00D8FF00D8FF00D8FF00D8FF005DD90061E30064E90066EF0067F200
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0169F40169F40269F4056BF4086DF41071F51C79F52C82F63F8DF78CBBFACACA
          CA5454545151514F4F4F5757575A5A5A909090CFE3FD4B96F9388BF92781F81A
          79F71172F40C6DEF077EEE0483EC0480E7037FE4037DE3037EE4037FE60372E6
          0464E50464E60464E5046AE50386E9029CEE029CEE0296EE0464E50466EA0469
          EF046AF3046BF5046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7056DF7066EF7076EF7096FF70C71F71174F81A79F82781F8388BF9
          4B96F9D1E4FE8888885353535151514F4F4F5555555959595D5D5DD6D6D6AACE
          FD4694FB368BFA2882F91E7CF81777F61274F20F70EE0D6EEB0D6CE80C6BE70C
          6BE80B6CE90B6DEB0B6EEE0C6EEF0C6EEF0B6EEE0B6DEB0B6CE90B6CE90B6CEA
          0B6DEC0C6FF10C71F40C72F60C73F80C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90D73F90D73F90E74F90E74F91075F91377F91779FA1E7DFA28
          83FA368BFA4694FBA9CDFDD4D4D45656565353535151514F4F4F535353565656
          5A5A5A6F6F6FEBEBEBA7CDFD4796FC398EFC2E87FB2683FA217FF91E7DF71B7B
          F5197AF4197AF41879F41879F41879F5197AF7197AF7197AF7197AF71879F518
          79F41879F41879F41879F5197AF7197BF8197CFA197CFA197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB1A7DFB1A7DFB1C7EFB1E7FFB2181
          FC2684FC2E88FC398EFC4796FCA7CDFDECECEC6A6A6A5555555353535050504F
          4F4F5151515454545858585B5B5B727272E3E3E3B8D7FE5FA4FD4294FD3A8FFC
          348BFC3089FC2D87FC2B86FC2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86
          FB2A86FB2A86FB2A86FA2A86FA2A86FA2A86FA2A86FB2A86FB2A86FB2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2B87FD
          2D88FD308AFD348CFD3A90FD4294FD5FA4FDB8D7FEE2E2E26D6D6D5757575454
          545252525050504D4D4D4F4F4F5151515454545858585B5B5B626262AFAFAFF6
          F6F6C3DDFF8EC0FE6EAEFE4D9CFE4296FE4095FE3F94FE3F94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3F
          94FE3F94FE4095FE4296FE4D9CFE6EAEFE8CBFFEC3DDFFF6F6F6ADADAD5E5E5E
          5858585555555353535050504E4E4E4C4C4C4D4D4D4F4F4F5252525454545757
          575A5A5A5C5C5C6767679B9B9BC8C8C8E0E0E0FAFAFAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE0E0E0C9C9C999999965
          65655B5B5B5757575656565353535151514E4E4E4D4D4D4B4B4B4B4B4B4D4D4D
          4F4F4F5151515454545656565858585A5A5A5C5C5C5E5E5E5F5F5F6060606060
          6061616161616161616162626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626161616161616161616060605F5F5F5E5E
          5E5D5D5D5B5B5B5959595757575555555353535050504F4F4F4D4D4D4B4B4B4A
          4A4A}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 6
      end
      object btnConfirma: TRzBmpButton
        Left = 372
        Top = 9
        Width = 116
        Height = 32
        Cursor = crHandPoint
        Hint = 'Confirma os dados CADASTRADOS ou ALTERADOS'
        Bitmaps.Disabled.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646484848595959686868
          6F6F6F7979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979796F6F6F6868685959594848484646464646464646464646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          76769D9D9DBABABAC6C6C6D8D8D8D8D8D8D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D8D8D8D8D8D8C6C6C6BABABA9E9E9E767676606060474747
          4646464646464646464646464646464646464646464646464646464646464C4C
          4C707070A1A1A1C9C9C9CDCDCDCBCBCBC8C8C8C7C7C7C7C7C7C6C6C6C6C6C6C7
          C7C7C7C7C7C7C7C7C6C6C6C6C6C6C5C5C5C4C4C4C3C3C3C3C3C3C4C4C4C5C5C5
          C6C6C6C6C6C6C7C7C7C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C9C9C9C9C9C9CACACACCCCCCCECECECA
          CACAA1A1A17070704C4C4C464646464646464646464646464646464646464646
          4646464B4B4B737373A4A4A4C5C5C5BFBFBFBCBCBCB8B8B8B4B4B4B3B3B3B1B1
          B1B1B1B1B2B2B2B3B3B3B4B4B4B3B3B3B2B2B2B0B0B0AEAEAEACACACABABABAB
          ABABACACACAEAEAEB0B0B0B2B2B2B4B4B4B5B5B5B5B5B5B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B7B7B7B8B8B8B8B8
          B8BABABABDBDBDC0C0C0C5C5C5A4A4A47373734B4B4B46464646464646464646
          46464646464646464646466C6C6C9D9D9DB8B8B8B2B2B2ABABABA7A7A7A1A1A1
          9E9E9E9A9A9A9898989898989B9B9B9D9D9D9E9E9E9E9E9E9C9C9C9999999696
          969393939191919191919292929595959898989C9C9C9E9E9EA0A0A0A1A1A1A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A3A3A3A4A4A4A6A6A6A9A9A9ACACACB2B2B2B8B8B89D9D9D6C6C6C4646
          464646464646464646464646464646465656568C8C8CAEAEAEA5A5A59E9E9E97
          97979191918B8B8B868686828282808080818181848484878787898989898989
          8787878383837F7F7F7C7C7C7979797878787979797C7C7C8080808484848888
          888B8B8B8D8D8D8D8D8D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8F8F8F8F8F8F9090909191919494949898989E9E9EA5A5A5
          AEAEAE8C8C8C5656564646464646464646464646464646466969699999999C9C
          9C9393938A8A8A8282827C7C7C7777777070706C6C6C6A6A6A6A6A6A6E6E6E71
          71717474747575757373736F6F6F5780874D838D4B818B5C696C626262656565
          6969696E6E6E7474747878787B7B7B7C7C7C7C7C7C7C7C7C7C7C7C8484849D9D
          9D9D9D9D8C8C8C7C7C7C7C7C7C7C7C7C7C7C7C8484849D9D9D9D9D9D8484847C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7D7D7D7D7D7D7E7E7E80808084
          84848A8A8A9393939C9C9C999999696969464646464646464646464646464646
          7373739595958C8C8C8282827979797272726B6B6B65656518BAD700D8FF00D8
          FF5757575B5B5B5F5F5F6262626464643E8F9E06D0F500D8FF00D8FF00D8FF00
          D8FF14B6D34964695757575D5D5D6363636767676B6B6B6D6D6D6D6D6D767676
          BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E47F7F7F767676BFBFBFFFFFFFFFFF
          FFFFFFFFFFFFFFDADADA7F7F7F6D6D6D929292FFFFFFDADADA6D6D6D6D6D6D6D
          6D6DB6B6B6FFFFFFFFFFFF6D6D6DDADADAFFFFFFB6B6B66D6D6D6D6D6D6D6D6D
          6D6D6DDADADAFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6B6B6B6FFFFFFDADADA6D6D
          6D6D6D6D767676F6F6F6FFFFFFE4E4E4E4E4E4FFFFFFB6B6B66D6D6D6D6D6D6D
          6D6D6D6D6DB6B6B6FFFFFFDADADABFBFBFFFFFFFE4E4E46D6D6D6D6D6D6D6D6D
          BFBFBFFFFFFFE4E4E4929292FFFFFFFFFFFF6D6D6D6D6D6D6D6D6DDADADAFFFF
          FFF6F6F68A8A8A7373737979798282828C8C8C96969674747446464646464646
          46464646464646467878788C8C8C7E7E7E7272726A6A6A6161615C5C5C565656
          14B6D300D8FF00D8FF4848484B4B4B4F4F4F5252525454542A96A900D8FF0AC7
          E913B5D209C6E800D8FF00D8FF09C6E84452544F4F4F5555555959595D5D5D5F
          5F5F5F5F5FCDCDCDFFFFFFFFFFFFC3C3C3AFAFAFCDCDCDFFFFFF878787CDCDCD
          FFFFFFF5F5F5B9B9B9AFAFAFEBEBEBFFFFFFEBEBEB696969878787FFFFFFD7D7
          D75F5F5F5F5F5F7D7D7DFFFFFFFFFFFFFFFFFF5F5F5FD7D7D7FFFFFFAFAFAF5F
          5F5F5F5F5F5F5F5F5F5F5F9B9B9BC3C3C3FFFFFFFFFFFFAFAFAF878787AFAFAF
          FFFFFFD7D7D75F5F5F5F5F5FE1E1E1FFFFFFF5F5F5737373D7D7D7FFFFFFAFAF
          AF5F5F5F5F5F5F5F5F5F5F5F5FAFAFAFFFFFFFD7D7D77D7D7DFFFFFFFFFFFF73
          73735F5F5F5F5F5FEBEBEBFFFFFFA5A5A5878787FFFFFFFFFFFF5F5F5F5F5F5F
          B9B9B9FFFFFFFFFFFF9191916060606363636A6A6A7272727E7E7E8B8B8B7979
          794646464646464646464646464646467979798080807171716666665D5D5D56
          56565050504A4A4A11B3D000D8FF00D8FF3C3C3C3E3E3E424242454545474747
          366C763961694444444141413E3E3E1E8A9D00D8FF00D8FF2779874444444A4A
          4A4E4E4E515151535353737373FFFFFFFFFFFF7E7E7E53535353535353535373
          7373898989FFFFFFFFFFFF7E7E7E5353535353535E5E5EF4F4F4FFFFFF9F9F9F
          7E7E7EFFFFFFD4D4D4535353535353DFDFDFFFFFFFFFFFFFFFFFFF535353D4D4
          D4FFFFFFA9A9A95353535353535353535353535353537E7E7EFFFFFFFFFFFF53
          5353535353A9A9A9FFFFFFD4D4D4535353B3B3B3FFFFFFFFFFFF7E7E7E535353
          D4D4D4FFFFFFA9A9A95E5E5EF4F4F4F4F4F45E5E5EA9A9A9FFFFFFD4D4D45353
          53E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6969697E7E7EFFFFFFFF
          FFFF535353898989FFFFFFFFFFFFA9A9A95353535454545757575D5D5D666666
          7171718080807979794646464646464646464646464646467979797878786969
          695C5C5C5454544D4D4D4646464242420FB1CE00D8FF00D8FF33333335353537
          37373B3B3B3D3D3D3E3E3E3D3D3D3A3A3A383838363636275D6700D8FF00D8FF
          1D889C3D3D3D4242424545454848484A4A4AA4A4A4FFFFFFDDDDDD4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A999999FFFFFFDDDDDD4A4A4A4A4A4A4A4A4A4A4A4AB0
          B0B0FFFFFFC6C6C6777777FFFFFFD2D2D24A4A4AA4A4A4FFFFFFFFFFFFFFFFFF
          FFFFFF4A4A4AD2D2D2FFFFFFBBBBBB7777777777777777775555554A4A4A7777
          77FFFFFFFFFFFF4A4A4A4A4A4AA4A4A4FFFFFFF4F4F4D2D2D2FFFFFFFFFFFFA4
          A4A44A4A4A4A4A4AD2D2D2FFFFFFA4A4A4A4A4A4FFFFFFFFFFFFA4A4A4A4A4A4
          FFFFFFD2D2D24A4A4AA4A4A4FFFFFFF4F4F4A4A4A4DDDDDDFFFFFFD2D2D24A4A
          4A777777FFFFFFFFFFFFD2D2D2F4F4F4FFFFFFD2D2D24A4A4A4A4A4A4A4A4A4E
          4E4E5454545C5C5C696969777777797979464646464646464646464646464646
          7979799393938787877E7E7E76767670707069696963636317B9D600D8FF00D8
          FF13B4D213B5D214B6D315B7D4476F775959592C97AB3F757F3D737D3182910E
          BEDD00D8FF00D8FF3687965D5D5D6363636969696C6C6C6F6F6FB7B7B7FFFFFF
          DBDBDB6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FB7B7B7FFFFFFDBDBDB6F6F6F6F6F
          6F6F6F6F6F6F6FB7B7B7FFFFFFDBDBDB939393FFFFFFDBDBDB939393FFFFFFFF
          FFFFAEAEAEFFFFFFFFFFFF6F6F6FDBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9393936F6F6F939393FFFFFFFFFFFF6F6F6F6F6F6FB7B7B7FFFFFFF6F6F6DBDB
          DBE4E4E4FFFFFFF6F6F69C9C9C6F6F6FDBDBDBFFFFFFB7B7B7EDEDEDF6F6F6ED
          EDEDEDEDEDB7B7B7FFFFFFDBDBDB6F6F6F818181FFFFFFFFFFFF818181EDEDED
          FFFFFFA5A5A56F6F6F939393FFFFFFFFFFFFDBDBDBDBDBDBFFFFFFFFFFFFB7B7
          B76F6F6F6F6F6F7272727676767E7E7E87878793939379797946464646464646
          46464646464646467979799898988D8D8D8383837D7D7D7676766F6F6F696969
          18BAD700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF447A845C5C5C00D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF10C0DF5765676464646A6A6A6F6F6F73737375
          7575A9A9A9FFFFFFEEEEEE757575757575757575757575757575A9A9A9FFFFFF
          EEEEEE757575757575757575757575CBCBCBFFFFFFCBCBCB989898FFFFFFE5E5
          E5EEEEEEFFFFFFDCDCDC757575FFFFFFFFFFFF757575DCDCDCFFFFFFDCDCDCBA
          BABABABABABABABA868686757575989898FFFFFFFFFFFF757575757575BABABA
          FFFFFFDCDCDC757575757575B2B2B2FFFFFFEEEEEE757575DCDCDCFFFFFFEEEE
          EEFFFFFFBABABAA9A9A9FFFFFFEEEEEEFFFFFFDCDCDC757575757575E5E5E5FF
          FFFFCBCBCBFFFFFFFFFFFF7E7E7E757575989898FFFFFFFFFFFF757575757575
          8F8F8FFFFFFFFFFFFF8686867575757878787D7D7D8383838D8D8D9898987979
          794646464646464646464646464646467979799E9E9E9393938A8A8A8484847D
          7D7D7777777070701ABCD900D8FF00D8FF407780417781437A83467C865A686A
          61616100D8FF00D8FF0BC8EA16B7D516B8D53291A25967696666666C6C6C7373
          737777777A7A7A7C7C7C8C8C8CFFFFFFFFFFFFBDBDBD7C7C7C7C7C7C7C7C7CB6
          B6B6A5A5A5FFFFFFFFFFFFB6B6B67C7C7C7C7C7C959595FFFFFFFFFFFFADADAD
          9D9D9DFFFFFFFFFFFFFFFFFFF7F7F78C8C8C7C7C7CFFFFFFFFFFFF7C7C7CDEDE
          DEFFFFFFBDBDBD7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C9D9D9DFFFFFFFFFFFF7C
          7C7C7C7C7CBDBDBDFFFFFFDEDEDE7C7C7C7C7C7CA5A5A5FFFFFFFFFFFF7C7C7C
          DEDEDEFFFFFFFFFFFFFFFFFF8484847C7C7CEFEFEFFFFFFFFFFFFFDEDEDE7C7C
          7C7C7C7CB6B6B6FFFFFFFFFFFFFFFFFFD6D6D67C7C7C7C7C7C9D9D9DFFFFFFFF
          FFFF7C7C7C7C7C7C848484FFFFFFFFFFFF9D9D9D7D7D7D7F7F7F8484848A8A8A
          9393939E9E9E797979464646464646464646464646464646787878A5A5A59B9B
          9B9292928B8B8B8585857F7F7F7878781CBEDB00D8FF00D8FF5D5D5D5E5E5E61
          616164646466666667676700D8FF00D8FF2F9BAE5D5D5D5D5D5D616161666666
          6D6D6D7474747A7A7A7E7E7E818181828282838383B9B9B9FFFFFFFFFFFFEFEF
          EFE0E0E0F7F7F7FFFFFFA2A2A2C1C1C1FFFFFFFFFFFFE8E8E8E0E0E0FFFFFFFF
          FFFFE0E0E0838383A2A2A2FFFFFFFFFFFFFFFFFFAAAAAA838383838383FFFFFF
          FFFFFF838383E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1C1C9C9C9E8E8
          E8FFFFFFFFFFFFE0E0E0B2B2B2C1C1C1FFFFFFF7F7F7E0E0E0E0E0E0FFFFFFFF
          FFFFE0E0E0838383E0E0E0FFFFFFFFFFFFD0D0D0838383838383C1C1C1FFFFFF
          FFFFFFE0E0E08383838383838B8B8BFFFFFFFFFFFFFFFFFFAAAAAA8383838383
          83A2A2A2FFFFFFFFFFFFE0E0E0E0E0E0F7F7F7FFFFFFF7F7F78B8B8B84848486
          86868B8B8B9292929B9B9BA5A5A5797979464646464646464646464646464646
          737373A8A8A8A4A4A49B9B9B9595958E8E8E8989898282821FC1DE00D8FF00D8
          FF1BBCDA1BBCDA1BBDDA1CBDDB4697A671717100D8FF00D8FF0DCAEC1ABCD91A
          BCD91BBDDA1CBEDB6189917D7D7D8282828787878989898A8A8A8B8B8B8B8B8B
          AFAFAFE2E2E2FFFFFFFFFFFFF0F0F0D3D3D39292928B8B8BAFAFAFE9E9E9FFFF
          FFFFFFFFE9E9E9C5C5C58B8B8B8B8B8BA1A1A1E2E2E2E2E2E2CCCCCC8B8B8B8B
          8B8B8B8B8BE2E2E2E2E2E28B8B8BCCCCCCE2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
          B7B7B7CCCCCCE2E2E2E2E2E2E2E2E2E2E2E2B7B7B7B7B7B7E2E2E2E2E2E2E2E2
          E2E2E2E2E2E2E2BEBEBE9292928B8B8BCCCCCCE2E2E2E2E2E29A9A9A8B8B8B8B
          8B8B929292E2E2E2E2E2E2CCCCCC8B8B8B8B8B8B8B8B8BCCCCCCE2E2E2E2E2E2
          8B8B8B8B8B8B8B8B8BA1A1A1E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2CCCCCC9A9A
          9A8C8C8C8D8D8D9090909595959B9B9BA4A4A4A9A9A974747446464646464646
          4646464646464646696969A3A3A3AEAEAEA6A6A69F9F9F9999999292928D8D8D
          22C4E100D8FF00D8FF00D8FF00D8FF00D8FF00D8FF3FABBE7F7F7F00D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF00D8FF6298A28888888D8D8D90909091919192
          9292939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939494949595959696969A9A9A9F9F9FA6A6A6AEAEAEA3A3A36969
          694646464646464646464646464646465656568F8F8FB8B8B8B1B1B1AAAAAAA4
          A4A49F9F9F9B9B9B7BA3AB6DA4AD6AA1AA689EA8689EA8689EA8699FA97C979C
          8F8F8F6BA1AB6AA0AA699FA9689EA8689EA8699FA96AA1AA8895989595959898
          989B9B9B9C9C9C9C9C9C9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9E9E9E9F9F9FA0A0A0A2A2A2A5A5A5AAAAAAB1B1B1
          B8B8B88E8E8E5555554646464646464646464646464646464646466C6C6C9F9F
          9FBCBCBCB6B6B6B0B0B0ADADADA8A8A8A5A5A5A2A2A29F9F9F9D9D9D9C9C9C9D
          9D9D9D9D9D9D9D9D9E9E9E9E9E9E9D9D9D9D9D9D9C9C9C9B9B9B9C9C9C9D9D9D
          9F9F9FA2A2A2A4A4A4A5A5A5A6A6A6A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A8A8A8A8A8A8A8A8A8A8A8A8A9A9A9AAAAAAABABABAEAEAEB1
          B1B1B6B6B6BCBCBC9F9F9F6C6C6C464646464646464646464646464646464646
          4646464B4B4B727272A2A2A2C2C2C2BDBDBDB8B8B8B6B6B6B3B3B3B1B1B1AFAF
          AFAEAEAEAEAEAEADADADADADADAEAEAEAEAEAEAEAEAEAEAEAEADADADADADADAD
          ADADADADADAEAEAEAFAFAFAFAFAFB1B1B1B1B1B1B1B1B1B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3B3B3B3B3B3B3B4B4B4B5B5
          B5B7B7B7B9B9B9BDBDBDC2C2C2A2A2A27373734B4B4B46464646464646464646
          46464646464646464646464646464C4C4C7070709E9E9EC1C1C1C4C4C4C1C1C1
          BFBFBFBEBEBEBDBDBDBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
          BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BEBEBEBFBFBFC0C0C0C2C2C2C4C4C4C1C1C19D9D9D7070704C4C4C4646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          7676989898AFAFAFBABABAC6C6C6C8C8C8C8C8C8C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C8C8C8C8C8C8C6C6C6BABABAB0B0B09898987676765F5F5F474747
          4646464646464646464646464646464646464646464646464646464646464646
          464646464646464848485959596767676F6F6F77777779797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          797979797979797979797979797979797979797777776F6F6F68686859595948
          4848464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474746464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646474747474747474747474747474747474747
          4747474848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484747474747474747474747474747474747474747474646464646
          4646464646464646464646464647474747474747474747474747474748484848
          48484848484949494949494949494949494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A494949494949494949494949484848484848484848474747
          4747474747474747474747474646464646464747474747474747474848484848
          484949494949494A4A4A4A4A4A4B4B4B4A4A4A4B4B4B4B4B4B4B4B4B4B4B4B4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A49494949
          4949484848494949484848484848474747474747474747474747474747484848
          4848484949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4D4D4D4C4C
          4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B
          4B4B4B4B4A4A4A4A4A4A49494949494948484848484848484848484847474747
          47474848484848484949494A4A4A4B4B4B4B4B4B4D4D4D4D4D4D4E4E4E4D4D4D
          4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E
          4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4A4A4A4A4A4A4949494949494848484848
          484747474848484747474949494A4A4A4B4B4B4C4C4C4D4D4D4E4E4E4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F5050505050505050504F4F4F505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          50504F4F4F4F4F4F4E4E4E4E4E4E4C4C4C4C4C4C4B4B4B4B4B4B4A4A4A494949
          4949494848484949494949494848484848484A4A4A4B4B4B4D4D4D4E4E4E4F4F
          4F50505050505051515151515151515151515151515152525252525252525253
          5353525252525252535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          535252525252525252525252525151515050505050504F4F4F4D4D4D4C4C4C4B
          4B4B4A4A4A4949494949494848484848484848484949494848484B4B4B4D4D4D
          4E4E4E5050505151515252525353535353535454545454545555555555555656
          5657575757575757575758585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585757575757575656565555555454545252
          525151514F4F4F4D4D4D4B4B4B4A4A4A49494948484848484848484848484849
          49494D4D4D4F4F4F5151515252525454545555555555555F5F5F959595C6C6C6
          DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFDEDEDEC5C5C59494945959594E4E4E4C4C4C4A4A4A4949494848
          484848484848484848484F4F4F5050505353535555555757575C5C5CABABABF5
          F5F5C3D3F48CABEA6E96E54578DD4276DC4074DC3F74DC3E73DB3E73DB3E73DB
          3E73DB3E73DA3E73DA3E73DA3E73DA3E73DA3E73DA3E73DA3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3F74DC4074DC4276DC4578DD6E96E58CABEAC1D2F3F5F5F5AAAAAA545454
          4C4C4C4A4A4A4949494848484949494949495151515353535555555757576D6D
          6DE2E2E2B8CCF25F8CE24277DC3A72DA346CD83069D82C67D62A66D62A65D72A
          66D82A66D82A66D82A65D72A65D62964D62964D52964D42964D42964D52964D6
          2A65D62A65D72A66D82A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92B67D92D68D9306ADA346DDA3A72DB4277DD5D
          8AE2B8CCF2E1E1E16565654D4D4D4A4A4A494949484848494949525252555555
          5858586B6B6BECECECA7C0F0477CDF3972DC2E69D92663D7205FD51D5BD21B5A
          D11959D1195AD3195AD4195AD4195AD41959D31858D01857CE1856CB1755CA18
          56CA1856CB1857CE1858D01959D3195AD4195BD6195BD6195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD71A5CD71A5CD71C5DD81E5ED82161
          D92664DA2E6ADB3972DD477CDFA7C0F0EBEBEB6262624C4C4C49494949494949
          49495454545757575A5A5AD5D5D5A9C2F1467CE13671DE2867DB1E5FD71659D3
          1255D00F51CC0D50CA0D50CA0C50CE0D51D00C51D20C51D20C50CF0B4ECB0B4D
          C70B4CC40B4BC10B4AC00B4BC20B4CC50B4ECA0C50CF0C51D20C52D40C53D60C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70D54D70D54D70E55D7
          0E55D71056D81358D8175BD91E60DA2867DC3671DE467CE1A9C2F1D2D2D24F4F
          4F4B4B4B4A4A4A4A4A4A5656565959598F8F8FCFDDF84B82E33875E12769DE1A
          5FDA1158D70B52D1074ECB064CC5054AC30549C5044BCA044DCE044ED1044ED1
          044DCE044BC90448C20347BD0345B90345B80345B90347BD0449C3044BCA044E
          D0044FD50450D70451D80451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90551D90652D90753D90854D90C56DA115ADB1A60DC2769DE3774E0
          4B82E3CFDDF88686864D4D4D4B4B4B4A4A4A5757575B5B5BCCCCCC8CB0EE3F7B
          E32C6EE01C63DE105AD90852D4054DCC0249C40146BC0145B90044BA0047C100
          49C7004BCC004BCD004ACB0048C30061C90068C70066C30049B1003FAD0041B2
          0044B90047C2004BCB004DD2004FD70050D90050DA0050DA0050DA105BDC407C
          E3407CE32066DF0050DA0050DA0050DA0050DA105BDC407CE3407CE3105BDC00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0151DA0151DA0251DA0453DB0855DB10
          5BDC1C63DE2C6EE03F7BE38CB0EEC9C9C94F4F4F4C4C4C4B4B4B5959595D5D5D
          ECECEC6294EA3677E4246AE21560E00A58DB0452D5024CCB00B4EF00D8FF00D8
          FF0042B10044B90047C0004AC6004BCA007FDD00CFFB00D8FF00D8FF00D8FF00
          D8FF00B1E80052B40042B10046BD004BC9004ED20050D90052DC0052DD105DDF
          8FB3F0FFFFFFFFFFFFFFFFFFFFFFFFCFDEF92068E1105DDF8FB3F0FFFFFFFFFF
          FFFFFFFFFFFFFFBFD4F62068E10052DD407DE6FFFFFFBFD4F60052DD0052DD00
          52DD7FA8EEFFFFFFFFFFFF0052DDBFD4F6FFFFFF7FA8EE0052DD0052DD0052DD
          0052DDBFD4F6FFFFFFFFFFFFFFFFFFFFFFFF7FA8EE7FA8EEFFFFFFBFD4F60052
          DD0052DD105DDFEFF4FDFFFFFFCFDEF9CFDEF9FFFFFF7FA8EE0052DD0052DD00
          52DD0052DD7FA8EEFFFFFFBFD4F68FB3F0FFFFFFCFDEF90052DD0052DD0052DD
          8FB3F0FFFFFFCFDEF9407DE6FFFFFFFFFFFF0052DD0052DD0052DDBFD4F6FFFF
          FFEFF4FD3375E40A59DE1560E0246AE23677E45E91E9EFEFEF5151514E4E4E4C
          4C4C5A5A5A5E5E5EFDFDFD4985E83176E51F6AE31160E10759DC0252D5004DC9
          00B4EE00D8FF00D8FF0040A90043B10046B9004AC1004BC60091E200D8FF00C6
          F600B3EB00C5F400D8FF00D8FF00C5F4004BB10047B9004CC70050D20053DA00
          55DE0055DFAFCAF5FFFFFFFFFFFF9FBFF37FAAEFAFCAF5FFFFFF4080E7AFCAF5
          FFFFFFEFF4FD8FB4F17FAAEFDFEAFBFFFFFFDFEAFB1060E14080E7FFFFFFBFD4
          F70055DF0055DF3075E5FFFFFFFFFFFFFFFFFF0055DFBFD4F7FFFFFF7FAAEF00
          55DF0055DF0055DF0055DF6095EB9FBFF3FFFFFFFFFFFF7FAAEF4080E77FAAEF
          FFFFFFBFD4F70055DF0055DFCFDFF9FFFFFFEFF4FD206AE3BFD4F7FFFFFF7FAA
          EF0055DF0055DF0055DF0055DF7FAAEFFFFFFFBFD4F73075E5FFFFFFFFFFFF20
          6AE30055DF0055DFDFEAFBFFFFFF70A0ED4080E7FFFFFFFFFFFF0055DF0055DF
          8FB4F1FFFFFFFFFFFF508AE90256DF075AE01160E11F6AE33176E54684E8FFFF
          FF5353534E4E4E4D4D4D5B5B5B5F5F5FFFFFFF4383EA2D75E71C69E50F61E406
          5ADF0154D6004ECA00B4EE00D8FF00D8FF003FA30042AA0045B30048BC004BC2
          006ED30065CB0047B80044B00041A8008BD100D8FF00D8FF007BCC0048BA004D
          C80052D40055DD0057E13077E7FFFFFFFFFFFF4081E90057E20057E20057E230
          77E7508CEBFFFFFFFFFFFF4081E90057E20057E21062E4EFF4FDFFFFFF70A1EF
          4081E9FFFFFFBFD5F80057E20057E2CFDFFAFFFFFFFFFFFFFFFFFF0057E2BFD5
          F8FFFFFF7FABF00057E20057E20057E20057E20057E24081E9FFFFFFFFFFFF00
          57E20057E27FABF0FFFFFFBFD5F80057E28FB5F2FFFFFFFFFFFF4081E90057E2
          BFD5F8FFFFFF7FABF01062E4EFF4FDEFF4FD1062E47FABF0FFFFFFBFD5F80057
          E2DFEAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF206CE64081E9FFFFFFFF
          FFFF0057E2508CEBFFFFFFFFFFFF7FABF00057E20158E2065BE30F61E41C69E5
          2D75E74383EAFFFFFF5454545050504E4E4E5C5C5C606060FFFFFF4184EC2C76
          E91A6BE80E63E6055CE20055D90050CC00B4EE00D8FF00D8FF003E9E0040A300
          43AC0047B5004ABC004BBE004ABC0047B40044AD0041A60066B900D8FF00D8FF
          008ED7004ABD0050CB0054D70058E0005AE47FACF2FFFFFFCFE0FA005AE5005A
          E5005AE5005AE5005AE570A2F0FFFFFFCFE0FA005AE5005AE5005AE5005AE58F
          B7F4FFFFFFAFCBF74083ECFFFFFFBFD6F8005AE57FACF2FFFFFFFFFFFFFFFFFF
          FFFFFF005AE5BFD6F8FFFFFF9FC1F54083EC4083EC4083EC1064E7005AE54083
          ECFFFFFFFFFFFF005AE5005AE57FACF2FFFFFFEFF5FDBFD6F8FFFFFFFFFFFF7F
          ACF2005AE5005AE5BFD6F8FFFFFF7FACF27FACF2FFFFFFFFFFFF7FACF27FACF2
          FFFFFFBFD6F8005AE57FACF2FFFFFFEFF5FD7FACF2CFE0FAFFFFFFBFD6F8005A
          E54083ECFFFFFFFFFFFFBFD6F8EFF5FDFFFFFFBFD6F8005AE5005AE5005AE505
          5DE60E63E61A6BE82B76E94083ECFFFFFF5555555050504E4E4E5C5C5C616161
          FFFFFF4085ED2B77EB1A6DE90D64E8055EE30057DB0052CE00B5EF00D8FF00D8
          FF00B1E600B2E700B2E900B3EB0063C3004AB90090DA006AC20068BE007AC500
          BBED00D8FF00D8FF007ED0004DC20052CF0057DA005AE2005CE67FADF3FFFFFF
          BFD6F9005CE7005CE7005CE7005CE7005CE77FADF3FFFFFFBFD6F9005CE7005C
          E7005CE7005CE77FADF3FFFFFFBFD6F94085EDFFFFFFBFD6F94085EDFFFFFFFF
          FFFF70A4F2FFFFFFFFFFFF005CE7BFD6F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          4085ED005CE74085EDFFFFFFFFFFFF005CE7005CE77FADF3FFFFFFEFF5FDBFD6
          F9CFE0FAFFFFFFEFF5FD508FEF005CE7BFD6F9FFFFFF7FADF3DFEBFCEFF5FDDF
          EBFCDFEBFC7FADF3FFFFFFBFD6F9005CE72070EAFFFFFFFFFFFF2070EADFEBFC
          FFFFFF6099F0005CE74085EDFFFFFFFFFFFFBFD6F9BFD6F9FFFFFFFFFFFF7FAD
          F3005CE7005CE7055FE70D64E81A6DE92B77EB4085EDFFFFFF5656565151514E
          4E4E5C5C5C606060FFFFFF4188EF2C7BEE1A6FEC0E68EB0560E6005ADE0055D1
          00B6F000D8FF00D8FF00D8FF00D8FF00D8FF00D8FF006EC8004BB800D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF00BDF00055BE0051C80056D5005BDF005DE500
          5FE9609BF2FFFFFFDFEBFC005FEA005FEA005FEA005FEA005FEA609BF2FFFFFF
          DFEBFC005FEA005FEA005FEA005FEA9FC3F7FFFFFF9FC3F74087EFFFFFFFCFE1
          FBDFEBFCFFFFFFBFD7FA005FEAFFFFFFFFFFFF005FEABFD7FAFFFFFFBFD7FA7F
          AFF47FAFF47FAFF42073ED005FEA4087EFFFFFFFFFFFFF005FEA005FEA7FAFF4
          FFFFFFBFD7FA005FEA005FEA70A5F3FFFFFFDFEBFC005FEABFD7FAFFFFFFDFEB
          FCFFFFFF7FAFF4609BF2FFFFFFDFEBFCFFFFFFBFD7FA005FEA005FEACFE1FBFF
          FFFF9FC3F7FFFFFFFFFFFF1069EB005FEA4087EFFFFFFFFFFFFF005FEA005FEA
          307DEEFFFFFFFFFFFF2073ED005FEA0562EA0E68EB1A6FEC2C7BEE4087EFFFFF
          FF5656565151514F4F4F5B5B5B606060FFFFFF438BF22D7DF01C72EF0F6AEE06
          63E9015DE20057D600B6F100D8FF00D8FF0068BB0069BC006BC1006DC50054BC
          004CB900D8FF00D8FF00C5F400B3E800B3E80086D00054BB0050C20055CF005A
          DB005DE4005FE90061EC2075EFFFFFFFFFFFFF7FB0F60061ED0061ED0061ED70
          A6F55093F3FFFFFFFFFFFF70A6F50061ED0061ED307FF0FFFFFFFFFFFF609CF4
          4089F2FFFFFFFFFFFFFFFFFFEFF5FE2075EF0061EDFFFFFFFFFFFF0061EDBFD7
          FAFFFFFF7FB0F60061ED0061ED0061ED0061ED0061ED4089F2FFFFFFFFFFFF00
          61ED0061ED7FB0F6FFFFFFBFD7FA0061ED0061ED5093F3FFFFFFFFFFFF0061ED
          BFD7FAFFFFFFFFFFFFFFFFFF106BEE0061EDDFEBFDFFFFFFFFFFFFBFD7FA0061
          ED0061ED70A6F5FFFFFFFFFFFFFFFFFFAFCDF90061ED0061ED4089F2FFFFFFFF
          FFFF0061ED0061ED106BEEFFFFFFFFFFFF4089F20162ED0665ED0F6AEE1C72EF
          2D7DF0438BF2FFFFFF5555555151514F4F4F5A5A5A5F5F5FFDFDFD498FF33181
          F21F76F1116DF00867ED0260E6005ADA00B7F200D8FF00D8FF0047AB0047AC00
          49B0004BB6004DBB004EBB00D8FF00D8FF008FD50046AA0047AB0049B0004DBB
          0052C70058D4005CDE0060E70061EB0063EE0063EF70A8F6FFFFFFFFFFFFDFEB
          FDBFD8FBEFF5FEFFFFFF408AF37FB1F7FFFFFFFFFFFFCFE2FCBFD8FBFFFFFFFF
          FFFFBFD8FB0063EF408AF3FFFFFFFFFFFFFFFFFF5094F40063EF0063EFFFFFFF
          FFFFFF0063EFBFD8FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FB1F78FBAF8CFE2
          FCFFFFFFFFFFFFBFD8FB609EF57FB1F7FFFFFFEFF5FEBFD8FBBFD8FBFFFFFFFF
          FFFFBFD8FB0063EFBFD8FBFFFFFFFFFFFF9FC4F90063EF0063EF7FB1F7FFFFFF
          FFFFFFBFD8FB0063EF0063EF106DF0FFFFFFFFFFFFFFFFFF5094F40063EF0063
          EF408AF3FFFFFFFFFFFFBFD8FBBFD8FBEFF5FEFFFFFFEFF5FE106DF00264EF07
          67EF116DF01F76F13181F2468EF3FFFFFF5555555151514F4F4F5959595E5E5E
          EDEDED62A1F73686F5247CF41573F30A6BF00465EA0260E100B9F500D8FF00D8
          FF00B5ED00B5ED00B6EE00B6EF0084DA0053C500D8FF00D8FF00C7F600B5EC00
          B5ED00B6EE00B7F0006FD8005CDA0060E30063EA0065EF0066F10066F20066F2
          5096F6BFD9FCFFFFFFFFFFFFDFECFD9FC5FA1070F30066F25096F6CFE2FDFFFF
          FFFFFFFFCFE2FD7FB2F80066F20066F23083F4BFD9FCBFD9FC8FBCF90066F200
          66F20066F2BFD9FCBFD9FC0066F28FBCF9BFD9FCBFD9FCBFD9FCBFD9FCBFD9FC
          60A0F78FBCF9BFD9FCBFD9FCBFD9FCBFD9FC60A0F760A0F7BFD9FCBFD9FCBFD9
          FCBFD9FCBFD9FC70A9F81070F30066F28FBCF9BFD9FCBFD9FC2079F40066F200
          66F21070F3BFD9FCBFD9FC8FBCF90066F20066F20066F28FBCF9BFD9FCBFD9FC
          0066F20066F20066F23083F4BFD9FCBFD9FCBFD9FCBFD9FCBFD9FC8FBCF9217A
          F40267F20468F20A6CF31573F3247CF43686F55E9EF7EFEFEF5454545151514F
          4F4F5858585C5C5CCDCDCD8CBBFA3F8DF72C82F61C79F51070F3086AEE0566E8
          01BAF700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF0098E8005AD300D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF00D8FF007CE30060E20064E90066EE0067F100
          68F30068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0169F40169F40269F4056BF4086DF41071F51C79F52C82F63F8DF78CBBFACACA
          CA5454545151514F4F4F5757575A5A5A909090CFE3FD4B96F9388BF92781F81A
          79F71172F40C6DEF077EEE0483EC0480E7037FE4037DE3037EE4037FE60370E3
          0462E10380E9037FE6037EE5037EE4037EE4037EE50380E8046BE70466EA0469
          EF046AF3046BF5046CF6046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7056DF7066EF7076EF7096FF70C71F71174F81A79F82781F8388BF9
          4B96F9D1E4FE8888885353535151514F4F4F5555555959595D5D5DD6D6D6AACE
          FD4694FB368BFA2882F91E7CF81777F61274F20F70EE0D6EEB0D6CE80C6BE70C
          6BE80B6CE90B6CEA0B6DEB0B6DEB0B6CEA0B6CE90B6BE80B6BE70B6BE80B6CEA
          0B6EED0C6FF10C71F40C72F60C73F80C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90D73F90D73F90E74F90E74F91075F91377F91779FA1E7DFA28
          83FA368BFA4694FBA9CDFDD4D4D45656565353535151514F4F4F535353565656
          5A5A5A6F6F6FEBEBEBA7CDFD4796FC398EFC2E87FB2683FA217FF91E7DF71B7B
          F5197AF4197AF41879F41879F41879F51879F51879F51879F51879F41879F418
          79F41879F41879F5197AF6197AF7197BF9197CFA197CFA197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB1A7DFB1A7DFB1C7EFB1E7FFB2181
          FC2684FC2E88FC398EFC4796FCA7CDFDECECEC6A6A6A5555555353535050504F
          4F4F5151515454545858585B5B5B727272E3E3E3B8D7FE5FA4FD4294FD3A8FFC
          348BFC3089FC2D87FC2B86FC2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86
          FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2B87FD
          2D88FD308AFD348CFD3A90FD4294FD5FA4FDB8D7FEE2E2E26D6D6D5757575454
          545252525050504D4D4D4F4F4F5151515454545858585B5B5B626262AFAFAFF6
          F6F6C3DDFF8EC0FE6EAEFE4D9CFE4296FE4095FE3F94FE3F94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3F
          94FE3F94FE4095FE4296FE4D9CFE6EAEFE8CBFFEC3DDFFF6F6F6ADADAD5E5E5E
          5858585555555353535050504E4E4E4C4C4C4D4D4D4F4F4F5252525454545757
          575A5A5A5C5C5C6767679B9B9BC8C8C8E0E0E0FAFAFAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE0E0E0C9C9C999999965
          65655B5B5B5757575656565353535151514E4E4E4D4D4D4B4B4B4B4B4B4D4D4D
          4F4F4F5151515454545656565858585A5A5A5C5C5C5E5E5E5F5F5F6060606060
          6061616161616161616162626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626161616161616161616060605F5F5F5E5E
          5E5D5D5D5B5B5B5959595757575555555353535050504F4F4F4D4D4D4B4B4B4A
          4A4A}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 7
      end
      object btnExclui: TRzBmpButton
        Left = 250
        Top = 9
        Width = 116
        Height = 32
        Cursor = crHandPoint
        Hint = 'Exclui o registro ATUAL'
        Bitmaps.Disabled.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646484848595959686868
          6F6F6F7979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979796F6F6F6868685959594848484646464646464646464646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          76769D9D9DBABABAC6C6C6D8D8D8D8D8D8D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D8D8D8D8D8D8C6C6C6BABABA9E9E9E767676606060474747
          4646464646464646464646464646464646464646464646464646464646464C4C
          4C707070A1A1A1C9C9C9CDCDCDCBCBCBC8C8C8C7C7C7C7C7C7C6C6C6C6C6C6C7
          C7C7C7C7C7C8C8C8C8C8C8C8C8C8C8C8C8C7C7C7C7C7C7C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C7C7C7C7C7C7C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C9C9C9C9C9C9CACACACCCCCCCECECECA
          CACAA1A1A17070704C4C4C464646464646464646464646464646464646464646
          4646464B4B4B737373A4A4A4C5C5C5BFBFBFBCBCBCB8B8B8B4B4B4B3B3B3B1B1
          B1B1B1B1B2B2B2B3B3B3B5B5B5B5B5B5B6B6B6B6B6B6B5B5B5B5B5B5B3B3B3B2
          B2B2B1B1B1B1B1B1B2B2B2B2B2B2B4B4B4B5B5B5B5B5B5B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B7B7B7B8B8B8B8B8
          B8BABABABDBDBDC0C0C0C5C5C5A4A4A47373734B4B4B46464646464646464646
          46464646464646464646466C6C6C9D9D9DB8B8B8B2B2B2ABABABA7A7A7A1A1A1
          9E9E9E9A9A9A9898989898989B9B9B9E9E9E9F9F9FA1A1A1A1A1A1A1A1A1A0A0
          A09E9E9E9C9C9C9A9A9A9898989898989A9A9A9C9C9C9E9E9EA0A0A0A1A1A1A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A3A3A3A4A4A4A6A6A6A9A9A9ACACACB2B2B2B8B8B89D9D9D6C6C6C4646
          464646464646464646464646464646465656568C8C8CAEAEAEA5A5A59E9E9E97
          97979191918B8B8B8686868282828080808181818484848787878A8A8A8B8B8B
          8C8C8C8B8B8B8888888686868383838181817E7E7E7E7E7E8181818484848787
          878B8B8B8D8D8D8D8D8D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8F8F8F8F8F8F9090909191919494949898989E9E9EA5A5A5
          AEAEAE8C8C8C5656564646464646464646464646464646466969699999999C9C
          9C9393938A8A8A8282827C7C7C7777777070706C6C6C6A6A6A6A6A6A6E6E6E71
          71717575757777777777777575757272726F6F6F6B6B6B696969666666676767
          6969696E6E6E7373737777777A7A7A7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C9D9D9D9D9D9D9595957C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C8484849D9D9D9D9D9D8C
          8C8C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7D7D7D7D7D7D7E7E7E80808084
          84848A8A8A9393939C9C9C999999696969464646464646464646464646464646
          7373739595958C8C8C8282827979797272726B6B6B65656518BAD700D8FF00D8
          FF5757575B5B5B5F5F5F6262626464646464646262625F5F5F5B5B5B58585800
          D8FF00D8FF2A96A95757575C5C5C6262626767676B6B6B6D6D6D6D6D6D6D6D6D
          6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6DFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFEDEDEDFFFFFFB6B6B66D6D6D6D6D6DBF
          BFBFFFFFFFFFFFFF8888886D6D6DADADADF6F6F6FFFFFFFFFFFFFFFFFFEDEDED
          9B9B9BDADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA6D6D6DBFBFBFFFFF
          FFFFFFFFFFFFFFFFFFFFDADADA7676766D6D6DDADADAFFFFFFFFFFFFFFFFFFFF
          FFFFB6B6B6B6B6B6FFFFFFDADADA6D6D6D6D6D6D767676F6F6F6FFFFFFE4E4E4
          7676766D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6E6E
          6E6E6E6E6F6F6F7373737979798282828C8C8C96969674747446464646464646
          46464646464646467878788C8C8C7E7E7E7272726A6A6A6161615C5C5C565656
          14B6D300D8FF00D8FF4848484B4B4B4E4E4E5151515353535353535050504D4D
          4D4B4B4B47474700D8FF00D8FF238EA24848484E4E4E5454545959595C5C5C5E
          5E5E5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
          5F5F5FFFFFFFFFFFFFE1E1E1D7D7D7D7D7D7D7D7D79B9B9B7D7D7DFFFFFFFFFF
          FF7D7D7D7D7D7DFFFFFFFFFFFFAFAFAF5F5F5FA5A5A5FFFFFFFFFFFFD7D7D7AF
          AFAFC3C3C3F5F5F5AFAFAFD7D7D7FFFFFFEBEBEBD7D7D7D7D7D7D7D7D7B9B9B9
          9B9B9BFFFFFFFFFFFFB9B9B9AFAFAFF5F5F5FFFFFFC3C3C35F5F5F9B9B9BC3C3
          C3FFFFFFFFFFFFAFAFAF878787AFAFAFFFFFFFD7D7D75F5F5F5F5F5FE1E1E1FF
          FFFFF5F5F57373735F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
          5F5F5F5F5F5F5F5F5F5F5F5F6060606363636A6A6A7272727E7E7E8B8B8B7979
          794646464646464646464646464646467979798080807171716666665D5D5D56
          56565050504A4A4A11B3D000D8FF00D8FF3C3C3C3E3E3E414141444444454545
          238EA2228DA1208C9F1F8A9E1D899C00D8FF00D8FF0EB0CD1F8A9E4242424848
          484D4D4D51515152525253535353535353535353535353535353535353535353
          5353535353535353535353FFFFFFFFFFFF7E7E7E535353535353535353535353
          535353A9A9A9FFFFFFDFDFDFDFDFDFFFFFFFDFDFDF535353535353F4F4F4FFFF
          FFA9A9A95353535353535353535E5E5E7E7E7ED4D4D4FFFFFFA9A9A953535353
          5353535353535353D4D4D4FFFFFFBEBEBE535353535353949494FFFFFFFFFFFF
          5353535353537E7E7EFFFFFFFFFFFF535353535353A9A9A9FFFFFFD4D4D45353
          53B3B3B3FFFFFFFFFFFF7E7E7E53535353535353535353535353535353535353
          53535353535353535353535353535353535353535454545757575D5D5D666666
          7171718080807979794646464646464646464646464646467979797878786969
          695C5C5C5454544D4D4D4646464242420FB1CE00D8FF00D8FF33333335353537
          37373939393B3B3B00D8FF00D8FF00D8FF00D8FF00D8FF00D8FF00D8FF00D8FF
          00D8FF3B3B3B4040404545454848484949494A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AFFFFFFFFFFFF99999977777777
          77777777775555554A4A4A4A4A4ADDDDDDFFFFFFFFFFFFFFFFFF6C6C6C4A4A4A
          777777FFFFFFFFFFFF5555554A4A4A4A4A4A4A4A4A4A4A4A4A4A4AD2D2D2FFFF
          FFA4A4A44A4A4A4A4A4A4A4A4A4A4A4AD2D2D2FFFFFFA4A4A44A4A4A4A4A4A77
          7777FFFFFFFFFFFF4A4A4A4A4A4A777777FFFFFFFFFFFF4A4A4A4A4A4AA4A4A4
          FFFFFFF4F4F4D2D2D2FFFFFFFFFFFFA4A4A44A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4E
          4E4E5454545C5C5C696969777777797979464646464646464646464646464646
          7979799393938787877E7E7E76767670707069696963636317B9D600D8FF00D8
          FF13B4D213B5D214B6D315B7D4466E7605D0F400D8FF259EB42894A72792A600
          D8FF00D8FF13B5D22995A85A5A5A6262626868686C6C6C6F6F6F6F6F6F6F6F6F
          6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF9393936F6F6F6F6F6FB7B7B7FFFFFFFFFFFFC9
          C9C96F6F6F6F6F6F939393FFFFFFFFFFFF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F
          6F6F6FDBDBDBFFFFFFB7B7B76F6F6F6F6F6F6F6F6F6F6F6FDBDBDBFFFFFFB7B7
          B76F6F6F6F6F6F939393FFFFFFFFFFFF6F6F6F6F6F6F939393FFFFFFFFFFFF6F
          6F6F6F6F6FB7B7B7FFFFFFF6F6F6DBDBDBE4E4E4FFFFFFF6F6F69C9C9C6F6F6F
          6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F
          6F6F6F6F6F6F6F7272727676767E7E7E87878793939379797946464646464646
          46464646464646467979799898988D8D8D8383837D7D7D7676766F6F6F696969
          18BAD700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF447A844C757C00D8FF17B9
          D657575753535300D8FF00D8FF2995A85959596161616868686F6F6F73737375
          7575757575757575757575757575757575757575757575757575757575757575
          757575FFFFFFFFFFFFCBCBCBBABABABABABABABABA868686757575868686F6F6
          F6FFFFFFFFFFFFFFFFFF8F8F8F757575868686FFFFFFFFFFFF86868675757575
          7575757575757575757575DCDCDCFFFFFFBABABA757575757575757575757575
          DCDCDCFFFFFFBABABA757575757575989898FFFFFFFFFFFF7575757575759898
          98FFFFFFFFFFFF757575757575BABABAFFFFFFDCDCDC757575757575B2B2B2FF
          FFFFEEEEEE757575757575757575757575757575757575757575757575757575
          7575757575757575757575757575757878787D7D7D8383838D8D8D9898987979
          794646464646464646464646464646467979799E9E9E9393938A8A8A8484847D
          7D7D7777777070701ABCD900D8FF00D8FF407780417781437983467D865D6A6D
          6666664092A000D8FF25ABC45C5C5C00D8FF00D8FF2D99AC6161616969697070
          707777777A7A7A7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7CFFFFFFFFFFFF9D9D9D7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7CDEDEDEFFFFFFEFEFEFC5C5C5FFFFFFEFEFEF8484847C7C7CEFEFEFFFFF
          FFD6D6D68484847C7C7C7C7C7C9D9D9DADADADDEDEDEFFFFFFBDBDBD7C7C7C7C
          7C7C7C7C7C7C7C7CDEDEDEFFFFFFBDBDBD7C7C7C7C7C7C9D9D9DFFFFFFFFFFFF
          7C7C7C7C7C7C9D9D9DFFFFFFFFFFFF7C7C7C7C7C7CBDBDBDFFFFFFDEDEDE7C7C
          7C7C7C7CA5A5A5FFFFFFFFFFFF7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7F7F7F8484848A8A8A
          9393939E9E9E797979464646464646464646464646464646787878A5A5A59B9B
          9B9292928B8B8B8585857F7F7F7878781CBEDB00D8FF00D8FF5D5D5D5E5E5E61
          61616565656A6A6A6E6E6E71717138A4B700D8FF3A99AA00D8FF00D8FF339EB2
          6B6B6B7373737979797E7E7E8181818383838383838383838383838383838383
          83838383838383838383838383838383838383FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFC1C1C1B9B9B9FFFFFFFFFFFFAAAAAA838383E8E8E8FFFFFFD0D0D0
          8383839A9A9AFFFFFFFFFFFFF7F7F7E0E0E0EFEFEFFFFFFFC1C1C1E0E0E0FFFF
          FFC1C1C1838383838383838383838383E0E0E0FFFFFFC1C1C1838383838383A2
          A2A2FFFFFFFFFFFF838383C9C9C9E8E8E8FFFFFFFFFFFFE0E0E0B2B2B2C1C1C1
          FFFFFFF7F7F7E0E0E0E0E0E0FFFFFFFFFFFFE0E0E08383838383838383838383
          8383838383838383838383838383838383838383838383838383838384848486
          86868B8B8B9292929B9B9BA5A5A5797979464646464646464646464646464646
          737373A8A8A8A4A4A49B9B9B9595958E8E8E8989898282821FC1DE00D8FF00D8
          FF1BBCDA1BBCDA1BBDDA1CBEDB499AA97A7A7A7C7C7C7C7C7C2EB5CD00D8FF00
          D8FF00D8FF39A4B87676767D7D7D8383838787878A8A8A8B8B8B8B8B8B8B8B8B
          8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8BE2E2E2E2E2
          E2E2E2E2E2E2E2E2E2E2E2E2E2BEBEBEDBDBDBE2E2E2CCCCCC8B8B8B8B8B8BA1
          A1A1E2E2E2E2E2E2A1A1A18B8B8BA1A1A1DBDBDBF8F8F8FFFFFFF8F8F8DBDBDB
          A1A1A1CCCCCCE2E2E2B7B7B78B8B8B8B8B8B8B8B8B8B8B8BCCCCCCE2E2E2B7B7
          B78B8B8B8B8B8BA1A1A1E2E2E2E2E2E28B8B8BCCCCCCE2E2E2E2E2E2E2E2E2E2
          E2E2B7B7B7B7B7B7E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2BEBEBE9292928B8B8B
          8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B
          8B8C8C8C8D8D8D9090909595959B9B9BA4A4A4A9A9A974747446464646464646
          4646464646464646696969A3A3A3AEAEAEA6A6A69F9F9F9999999292928D8D8D
          22C4E100D8FF00D8FF00D8FF00D8FF00D8FF00D8FF41ADC08686868989898989
          8987878719C8E800D8FF00D8FF40ACBF8383838989898D8D8D90909092929293
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939494949595959696969A9A9A9F9F9FA6A6A6AEAEAEA3A3A36969
          694646464646464646464646464646465656568F8F8FB8B8B8B1B1B1AAAAAAA4
          A4A49F9F9F9B9B9B7BA3AB6DA4AD6AA1AA689EA8689EA8689EA86AA1AA7F9A9F
          9494949696969696969595958A979A6DA3AD6BA1AB7E999E9393939696969999
          999B9B9B9C9C9C9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9E9E9E9F9F9FA0A0A0A2A2A2A5A5A5AAAAAAB1B1B1
          B8B8B88E8E8E5555554646464646464646464646464646464646466C6C6C9F9F
          9FBCBCBCB6B6B6B0B0B0ADADADA8A8A8A5A5A5A2A2A29F9F9F9D9D9D9C9C9C9D
          9D9D9D9D9D9E9E9EA1A1A1A2A2A2A3A3A3A3A3A3A2A2A2A0A0A0A0A0A0A0A0A0
          A1A1A1A3A3A3A4A4A4A6A6A6A6A6A6A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A8A8A8A8A8A8A8A8A8A8A8A8A9A9A9AAAAAAABABABAEAEAEB1
          B1B1B6B6B6BCBCBC9F9F9F6C6C6C464646464646464646464646464646464646
          4646464B4B4B727272A2A2A2C2C2C2BDBDBDB8B8B8B6B6B6B3B3B3B1B1B1AFAF
          AFAEAEAEAEAEAEADADADADADADAFAFAFAFAFAFB0B0B0B1B1B1B1B1B1B0B0B0AF
          AFAFAFAFAFAFAFAFAFAFAFB0B0B0B1B1B1B1B1B1B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3B3B3B3B3B3B3B4B4B4B5B5
          B5B7B7B7B9B9B9BDBDBDC2C2C2A2A2A27373734B4B4B46464646464646464646
          46464646464646464646464646464C4C4C7070709E9E9EC1C1C1C4C4C4C1C1C1
          BFBFBFBEBEBEBDBDBDBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
          BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BEBEBEBFBFBFC0C0C0C2C2C2C4C4C4C1C1C19D9D9D7070704C4C4C4646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          7676989898AFAFAFBABABAC6C6C6C8C8C8C8C8C8C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C8C8C8C8C8C8C6C6C6BABABAB0B0B09898987676765F5F5F474747
          4646464646464646464646464646464646464646464646464646464646464646
          464646464646464848485959596767676F6F6F77777779797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          797979797979797979797979797979797979797777776F6F6F68686859595948
          4848464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474746464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646474747474747474747474747474747474747
          4747474848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484747474747474747474747474747474747474747474646464646
          4646464646464646464646464647474747474747474747474747474748484848
          48484848484949494949494949494949494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A494949494949494949494949484848484848484848474747
          4747474747474747474747474646464646464747474747474747474848484848
          484949494949494A4A4A4A4A4A4B4B4B4A4A4A4B4B4B4B4B4B4B4B4B4B4B4B4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A49494949
          4949484848494949484848484848474747474747474747474747474747484848
          4848484949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4D4D4D4C4C
          4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B
          4B4B4B4B4A4A4A4A4A4A49494949494948484848484848484848484847474747
          47474848484848484949494A4A4A4B4B4B4B4B4B4D4D4D4D4D4D4E4E4E4D4D4D
          4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E
          4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4A4A4A4A4A4A4949494949494848484848
          484747474848484747474949494A4A4A4B4B4B4C4C4C4D4D4D4E4E4E4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F5050505050505050504F4F4F505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          50504F4F4F4F4F4F4E4E4E4E4E4E4C4C4C4C4C4C4B4B4B4B4B4B4A4A4A494949
          4949494848484949494949494848484848484A4A4A4B4B4B4D4D4D4E4E4E4F4F
          4F50505050505051515151515151515151515151515152525252525252525253
          5353525252525252535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          535252525252525252525252525151515050505050504F4F4F4D4D4D4C4C4C4B
          4B4B4A4A4A4949494949494848484848484848484949494848484B4B4B4D4D4D
          4E4E4E5050505151515252525353535353535454545454545555555555555656
          5657575757575757575758585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585757575757575656565555555454545252
          525151514F4F4F4D4D4D4B4B4B4A4A4A49494948484848484848484848484849
          49494D4D4D4F4F4F5151515252525454545555555555555F5F5F959595C6C6C6
          DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFDEDEDEC5C5C59494945959594E4E4E4C4C4C4A4A4A4949494848
          484848484848484848484F4F4F5050505353535555555757575C5C5CABABABF5
          F5F5C3D3F48CABEA6E96E54578DD4276DC4074DC3F74DC3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3F74DC4074DC4276DC4578DD6E96E58CABEAC1D2F3F5F5F5AAAAAA545454
          4C4C4C4A4A4A4949494848484949494949495151515353535555555757576D6D
          6DE2E2E2B8CCF25F8CE24277DC3A72DA346CD83069D82C67D62A66D62A65D72A
          66D82A66D82A66D92A66D92A66D92A66D92A66D82A66D82A65D72A65D72A65D7
          2A65D72A65D72A66D82A66D82A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92B67D92D68D9306ADA346DDA3A72DB4277DD5D
          8AE2B8CCF2E1E1E16565654D4D4D4A4A4A494949484848494949525252555555
          5858586B6B6BECECECA7C0F0477CDF3972DC2E69D92663D7205FD51D5BD21B5A
          D11959D1195AD3195AD4195AD5195BD6195BD7195BD7195BD6195AD5195AD419
          59D31859D11859D11859D21959D3195AD4195BD6195BD6195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD71A5CD71A5CD71C5DD81E5ED82161
          D92664DA2E6ADB3972DD477CDFA7C0F0EBEBEB6262624C4C4C49494949494949
          49495454545757575A5A5AD5D5D5A9C2F1467CE13671DE2867DB1E5FD71659D3
          1255D00F51CC0D50CA0D50CA0C50CE0D52D10C52D40C52D50C53D60C52D50C52
          D40C51D20C50CF0B4FCD0B4ECA0B4ECA0B4FCC0C50CF0C51D20C52D40C53D60C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70D54D70D54D70E55D7
          0E55D71056D81358D8175BD91E60DA2867DC3671DE467CE1A9C2F1D2D2D24F4F
          4F4B4B4B4A4A4A4A4A4A5656565959598F8F8FCFDDF84B82E33875E12769DE1A
          5FDA1158D70B52D1074ECB064CC5054AC30549C5044BCA044DCE044ED2044FD5
          0450D6044FD4044ED0044CCC044BC80449C50448C10448C10449C5044BCA044D
          CF044FD40450D70451D80451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90551D90652D90753D90854D90C56DA115ADB1A60DC2769DE3774E0
          4B82E3CFDDF88686864D4D4D4B4B4B4A4A4A5757575B5B5BCCCCCC8CB0EE3F7B
          E32C6EE01C63DE105AD90852D4054DCC0249C40146BC0145B90044BA0047C100
          49C7004BCD004DD1004DD1004BCD004AC90048C30045BD0043B80042B40042B4
          0044B90047C1004ACA004DD1004FD70050D90050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA407CE3407CE33071E10050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA105BDC407CE340
          7CE32066DF0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0151DA0151DA0251DA0453DB0855DB10
          5BDC1C63DE2C6EE03F7BE38CB0EEC9C9C94F4F4F4C4C4C4B4B4B5959595D5D5D
          ECECEC6294EA3677E4246AE21560E00A58DB0452D5024CCB00B4EF00D8FF00D8
          FF0042B10044B90047C0004AC6004BCB004BCB004AC60047C00045B90042B300
          D8FF00D8FF008BD50042B10045BB004AC7004ED20050D90052DC0052DD0052DD
          0052DD0052DD0052DD0052DD0052DD0052DD0052DD0052DD0052DD0052DDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FB3F0DFE9FBFFFFFF7FA8EE0052DD00
          52DD8FB3F0FFFFFFFFFFFF3073E30052DD709EECEFF4FDFFFFFFFFFFFFFFFFFF
          DFE9FB5088E8BFD4F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFD4F60052DD8FB3
          F0FFFFFFFFFFFFFFFFFFFFFFFFBFD4F6105DDF0052DDBFD4F6FFFFFFFFFFFFFF
          FFFFFFFFFF7FA8EE7FA8EEFFFFFFBFD4F60052DD0052DD105DDFEFF4FDFFFFFF
          CFDEF9105DDF0052DD0052DD0052DD0052DD0052DD0052DD0052DD0052DD0153
          DD0253DD0455DE0A59DE1560E0246AE23677E45E91E9EFEFEF5151514E4E4E4C
          4C4C5A5A5A5E5E5EFDFDFD4985E83176E51F6AE31160E10759DC0252D5004DC9
          00B4EE00D8FF00D8FF0040A90043B10046B80049BF004AC3004AC20048BD0045
          B60043AF0040A700D8FF00D8FF008AD00041AA0046B7004BC50050D10053D900
          54DD0055DF0055DF0055DF0055DF0055DF0055DF0055DF0055DF0055DF0055DF
          0055DF0055DFFFFFFFFFFFFFCFDFF9BFD4F7BFD4F7BFD4F76095EB3075E5FFFF
          FFFFFFFF3075E53075E5FFFFFFFFFFFF7FAAEF0055DF70A0EDFFFFFFFFFFFFBF
          D4F77FAAEF9FBFF3EFF4FD7FAAEFBFD4F7FFFFFFDFEAFBBFD4F7BFD4F7BFD4F7
          8FB4F16095EBFFFFFFFFFFFF8FB4F17FAAEFEFF4FDFFFFFF9FBFF30055DF6095
          EB9FBFF3FFFFFFFFFFFF7FAAEF4080E77FAAEFFFFFFFBFD4F70055DF0055DFCF
          DFF9FFFFFFEFF4FD206AE30055DF0055DF0055DF0055DF0055DF0055DF0055DF
          0055DF0055DF0055DF0055DF0256DF075AE01160E11F6AE33176E54684E8FFFF
          FF5353534E4E4E4D4D4D5B5B5B5F5F5FFFFFFF4383EA2D75E71C69E50F61E406
          5ADF0154D6004ECA00B4EE00D8FF00D8FF003FA30042AA0044B10047B90049BD
          0090DD008FDA008DD6008CD2008ACF00D8FF00D8FF00B1E6008CD30046B5004C
          C50051D20055DC0056E00057E20057E20057E20057E20057E20057E20057E200
          57E20057E20057E20057E20057E2FFFFFFFFFFFF4081E90057E20057E20057E2
          0057E20057E27FABF0FFFFFFCFDFFACFDFFAFFFFFFCFDFFA0057E20057E2EFF4
          FDFFFFFF7FABF00057E20057E20057E21062E44081E9BFD5F8FFFFFF7FABF000
          57E20057E20057E20057E2BFD5F8FFFFFF9FC0F40057E20057E26096EDFFFFFF
          FFFFFF0057E20057E24081E9FFFFFFFFFFFF0057E20057E27FABF0FFFFFFBFD5
          F80057E28FB5F2FFFFFFFFFFFF4081E90057E20057E20057E20057E20057E200
          57E20057E20057E20057E20057E20057E20057E20158E2065BE30F61E41C69E5
          2D75E74383EAFFFFFF5454545050504E4E4E5C5C5C606060FFFFFF4184EC2C76
          E91A6BE80E63E6055CE20055D90050CC00B4EE00D8FF00D8FF003E9E0040A300
          43AA0046B20048B600D8FF00D8FF00D8FF00D8FF00D8FF00D8FF00D8FF00D8FF
          00D8FF0048B7004EC70054D60058DF0059E3005AE5005AE5005AE5005AE5005A
          E5005AE5005AE5005AE5005AE5005AE5005AE5005AE5FFFFFFFFFFFF70A2F040
          83EC4083EC4083EC1064E7005AE5005AE5CFE0FAFFFFFFFFFFFFFFFFFF3079EA
          005AE54083ECFFFFFFFFFFFF1064E7005AE5005AE5005AE5005AE5005AE5BFD6
          F8FFFFFF7FACF2005AE5005AE5005AE5005AE5BFD6F8FFFFFF7FACF2005AE500
          5AE54083ECFFFFFFFFFFFF005AE5005AE54083ECFFFFFFFFFFFF005AE5005AE5
          7FACF2FFFFFFEFF5FDBFD6F8FFFFFFFFFFFF7FACF2005AE5005AE5005AE5005A
          E5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE505
          5DE60E63E61A6BE82B76E94083ECFFFFFF5555555050504E4E4E5C5C5C616161
          FFFFFF4085ED2B77EB1A6DE90D64E8055EE30057DB0052CE00B5EF00D8FF00D8
          FF00B1E600B2E700B2E800B3EA0062C100CFFA00D8FF0097DB008DD3008BCF00
          D8FF00D8FF00B2E7008ED5004ABB0051CB0056D9005AE2005CE6005CE7005CE7
          005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4085ED005CE7005CE77FADF3FFFFFFFF
          FFFF9FC2F6005CE7005CE74085EDFFFFFFFFFFFF005CE7005CE7005CE7005CE7
          005CE7005CE7BFD6F9FFFFFF7FADF3005CE7005CE7005CE7005CE7BFD6F9FFFF
          FF7FADF3005CE7005CE74085EDFFFFFFFFFFFF005CE7005CE74085EDFFFFFFFF
          FFFF005CE7005CE77FADF3FFFFFFEFF5FDBFD6F9CFE0FAFFFFFFEFF5FD508FEF
          005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005C
          E7005CE7005CE7055FE70D64E81A6DE92B77EB4085EDFFFFFF5656565151514E
          4E4E5C5C5C606060FFFFFF4188EF2C7BEE1A6FEC0E68EB0560E6005ADE0055D1
          00B6F000D8FF00D8FF00D8FF00D8FF00D8FF00D8FF006EC90066C800D8FF00B4
          ED0046AD0043A600D8FF00D8FF008DD10048B1004FC20055D0005ADD005DE500
          5FE9005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA
          005FEA005FEAFFFFFFFFFFFF9FC3F77FAFF47FAFF47FAFF42073ED005FEA2073
          EDEFF5FEFFFFFFFFFFFFFFFFFF307DEE005FEA2073EDFFFFFFFFFFFF2073ED00
          5FEA005FEA005FEA005FEA005FEABFD7FAFFFFFF7FAFF4005FEA005FEA005FEA
          005FEABFD7FAFFFFFF7FAFF4005FEA005FEA4087EFFFFFFFFFFFFF005FEA005F
          EA4087EFFFFFFFFFFFFF005FEA005FEA7FAFF4FFFFFFBFD7FA005FEA005FEA70
          A5F3FFFFFFDFEBFC005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA
          005FEA005FEA005FEA005FEA005FEA0562EA0E68EB1A6FEC2C7BEE4087EFFFFF
          FF5656565151514F4F4F5B5B5B606060FFFFFF438BF22D7DF01C72EF0F6AEE06
          63E9015DE20057D600B6F100D8FF00D8FF0068BB0069BC006BC0006EC70056C1
          0050C30083DA00D8FF00A3E50048B100D8FF00D8FF008FD6004CBA0052C90058
          D7005DE3005FE90061EC0061ED0061ED0061ED0061ED0061ED0061ED0061ED00
          61ED0061ED0061ED0061ED0061EDFFFFFFFFFFFF4089F20061ED0061ED0061ED
          0061ED0061EDBFD7FAFFFFFFDFEBFD8FBAF7FFFFFFDFEBFD106BEE0061EDDFEB
          FDFFFFFFAFCDF9106BEE0061ED0061ED4089F2609CF4BFD7FAFFFFFF7FB0F600
          61ED0061ED0061ED0061EDBFD7FAFFFFFF7FB0F60061ED0061ED4089F2FFFFFF
          FFFFFF0061ED0061ED4089F2FFFFFFFFFFFF0061ED0061ED7FB0F6FFFFFFBFD7
          FA0061ED0061ED5093F3FFFFFFFFFFFF0061ED0061ED0061ED0061ED0061ED00
          61ED0061ED0061ED0061ED0061ED0061ED0061ED0162ED0665ED0F6AEE1C72EF
          2D7DF0438BF2FFFFFF5555555151514F4F4F5A5A5A5F5F5FFDFDFD498FF33181
          F21F76F1116DF00867ED0260E6005ADA00B7F200D8FF00D8FF0047AB0047AC00
          49B0004CB90050C10053CA0055CE0096E500D8FF008BDA00D8FF00D8FF0092DB
          0051C30057D1005CDD0060E70062EC0063EF0063EF0063EF0063EF0063EF0063
          EF0063EF0063EF0063EF0063EF0063EF0063EF0063EFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF7FB1F770A8F6FFFFFFFFFFFF5094F40063EFCFE2FCFFFFFF
          9FC4F90063EF3080F2FFFFFFFFFFFFEFF5FEBFD8FBDFEBFDFFFFFF7FB1F7BFD8
          FBFFFFFF7FB1F70063EF0063EF0063EF0063EFBFD8FBFFFFFF7FB1F70063EF00
          63EF408AF3FFFFFFFFFFFF0063EF8FBAF8CFE2FCFFFFFFFFFFFFBFD8FB609EF5
          7FB1F7FFFFFFEFF5FEBFD8FBBFD8FBFFFFFFFFFFFFBFD8FB0063EF0063EF0063
          EF0063EF0063EF0063EF0063EF0063EF0063EF0063EF0063EF0063EF0264EF07
          67EF116DF01F76F13181F2468EF3FFFFFF5555555151514F4F4F5959595E5E5E
          EDEDED62A1F73686F5247CF41573F30A6BF00465EA0260E100B9F500D8FF00D8
          FF00B5ED00B5ED00B6EE00B6F00087DF0059D4005BD8005BD800A8EF00D8FF00
          D8FF00D8FF0095E20057CE005CD90060E40063EB0065F00066F20066F20066F2
          0066F20066F20066F20066F20066F20066F20066F20066F20066F20066F2BFD9
          FCBFD9FCBFD9FCBFD9FCBFD9FCBFD9FC70A9F8AFCFFBBFD9FC8FBCF90066F200
          66F23083F4BFD9FCBFD9FC3083F40066F23083F4AFCFFBEFF5FEFFFFFFEFF5FE
          AFCFFB3083F48FBCF9BFD9FC60A0F70066F20066F20066F20066F28FBCF9BFD9
          FC60A0F70066F20066F23083F4BFD9FCBFD9FC0066F28FBCF9BFD9FCBFD9FCBF
          D9FCBFD9FC60A0F760A0F7BFD9FCBFD9FCBFD9FCBFD9FCBFD9FC70A9F81070F3
          0066F20066F20066F20066F20066F20066F20066F20066F20066F20066F20167
          F20267F20468F20A6CF31573F3247CF43686F55E9EF7EFEFEF5454545151514F
          4F4F5858585C5C5CCDCDCD8CBBFA3F8DF72C82F61C79F51070F3086AEE0566E8
          01BAF700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF009AEB005FDF0061E30061
          E3005FE000C1F800D8FF00D8FF0099E9005DDA0061E30064E90066EF0068F300
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0169F40169F40269F4056BF4086DF41071F51C79F52C82F63F8DF78CBBFACACA
          CA5454545151514F4F4F5757575A5A5A909090CFE3FD4B96F9388BF92781F81A
          79F71172F40C6DEF077EEE0483EC0480E7037FE4037DE3037EE4037FE70373E7
          0466E80467EC0467EC0466EA046CE90381EB0380E90372E70465E70467EC0469
          F0046BF4046CF6046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7056DF7066EF7076EF7096FF70C71F71174F81A79F82781F8388BF9
          4B96F9D1E4FE8888885353535151514F4F4F5555555959595D5D5DD6D6D6AACE
          FD4694FB368BFA2882F91E7CF81777F61274F20F70EE0D6EEB0D6CE80C6BE70C
          6BE80B6CE90B6DEC0C6FF00C70F20C70F30C70F30C6FF10C6EEF0B6EEE0B6EEE
          0C6FF00C70F30C71F50C72F70C73F80C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90D73F90D73F90E74F90E74F91075F91377F91779FA1E7DFA28
          83FA368BFA4694FBA9CDFDD4D4D45656565353535151514F4F4F535353565656
          5A5A5A6F6F6FEBEBEBA7CDFD4796FC398EFC2E87FB2683FA217FF91E7DF71B7B
          F5197AF4197AF41879F41879F4197AF6197AF7197BF8197BF9197BF9197BF819
          7AF7197AF7197AF7197AF7197BF8197BF9197CFA197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB1A7DFB1A7DFB1C7EFB1E7FFB2181
          FC2684FC2E88FC398EFC4796FCA7CDFDECECEC6A6A6A5555555353535050504F
          4F4F5151515454545858585B5B5B727272E3E3E3B8D7FE5FA4FD4294FD3A8FFC
          348BFC3089FC2D87FC2B86FC2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86
          FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2B87FD
          2D88FD308AFD348CFD3A90FD4294FD5FA4FDB8D7FEE2E2E26D6D6D5757575454
          545252525050504D4D4D4F4F4F5151515454545858585B5B5B626262AFAFAFF6
          F6F6C3DDFF8EC0FE6EAEFE4D9CFE4296FE4095FE3F94FE3F94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3F
          94FE3F94FE4095FE4296FE4D9CFE6EAEFE8CBFFEC3DDFFF6F6F6ADADAD5E5E5E
          5858585555555353535050504E4E4E4C4C4C4D4D4D4F4F4F5252525454545757
          575A5A5A5C5C5C6767679B9B9BC8C8C8E0E0E0FAFAFAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE0E0E0C9C9C999999965
          65655B5B5B5757575656565353535151514E4E4E4D4D4D4B4B4B4B4B4B4D4D4D
          4F4F4F5151515454545656565858585A5A5A5C5C5C5E5E5E5F5F5F6060606060
          6061616161616161616162626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626161616161616161616060605F5F5F5E5E
          5E5D5D5D5B5B5B5959595757575555555353535050504F4F4F4D4D4D4B4B4B4A
          4A4A}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 8
      end
      object btnAltera: TRzBmpButton
        Left = 128
        Top = 9
        Width = 116
        Height = 32
        Cursor = crHandPoint
        Hint = 'Altera o registro ATUAL'
        Bitmaps.Disabled.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646484848595959686868
          6F6F6F7979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979796F6F6F6868685959594848484646464646464646464646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          76769D9D9DBABABAC6C6C6D8D8D8D8D8D8D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D8D8D8D8D8D8C6C6C6BABABA9E9E9E767676606060474747
          4646464646464646464646464646464646464646464646464646464646464C4C
          4C707070A1A1A1C9C9C9CDCDCDCBCBCBC8C8C8C7C7C7C7C7C7C6C6C6C6C6C6C7
          C7C7C7C7C7C7C7C7C6C6C6C6C6C6C5C5C5C4C4C4C3C3C3C3C3C3C4C4C4C5C5C5
          C6C6C6C6C6C6C7C7C7C7C7C7C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C9C9C9C9C9C9CACACACCCCCCCECECECA
          CACAA1A1A17070704C4C4C464646464646464646464646464646464646464646
          4646464B4B4B737373A4A4A4C5C5C5BFBFBFBCBCBCB8B8B8B4B4B4B3B3B3B1B1
          B1B1B1B1B2B2B2B3B3B3B4B4B4B4B4B4B2B2B2B0B0B0AEAEAEACACACABABABAB
          ABABACACACAEAEAEB0B0B0B2B2B2B4B4B4B5B5B5B5B5B5B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B7B7B7B8B8B8B8B8
          B8BABABABDBDBDC0C0C0C5C5C5A4A4A47373734B4B4B46464646464646464646
          46464646464646464646466C6C6C9D9D9DB8B8B8B2B2B2ABABABA7A7A7A1A1A1
          9E9E9E9A9A9A9898989898989B9B9B9D9D9D9E9E9E9E9E9E9C9C9C9999999696
          969393939191919191919292929595959898989B9B9B9E9E9EA0A0A0A1A1A1A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A3A3A3A4A4A4A6A6A6A9A9A9ACACACB2B2B2B8B8B89D9D9D6C6C6C4646
          464646464646464646464646464646465656568C8C8CAEAEAEA5A5A59E9E9E97
          97979191918B8B8B868686828282808080818181848484878787898989898989
          8787878383837E7E7E7B7B7B7979797878787878787B7B7B7F7F7F8383838888
          888B8B8B8D8D8D8D8D8D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8F8F8F8F8F8F9090909191919494949898989E9E9EA5A5A5
          AEAEAE8C8C8C5656564646464646464646464646464646466969699999999C9C
          9C9393938A8A8A8282827C7C7C7777777070706C6C6C6A6A6A6A6A6A6E6E6E71
          71717474747575757373736F6F6F5D787D4D838D4A808A567176626262646464
          6969696E6E6E7373737878787A7A7A7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7D7D7D7D7D7D7E7E7E80808084
          84848A8A8A9393939C9C9C999999696969464646464646464646464646464646
          7373739595958C8C8C8282827979797272726B6B6B65656518BAD700D8FF00D8
          FF5757575B5B5B5F5F5F6262626464643E8F9E06D0F500D8FF00D8FF00D8FF00
          D8FF0AC7E9436C735757575D5D5D6363636767676B6B6B6D6D6D6D6D6D6D6D6D
          6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6DBFBFBFFFFFFFE4E4E46D6D
          6D6D6D6D6D6D6DBFBFBFFFFFFFE4E4E4929292FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF9292926D6D6D929292FFFFFFFFFFFF6D6D6D6D6D6D6D6D6DDADADA
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA6D6D6DFFFFFFFFFFFF9292926D6D
          6D6D6D6DB6B6B6FFFFFFFFFFFFF6F6F6FFFFFFBFBFBF6D6D6D6D6D6D6D6D6DE4
          E4E4FFFFFFBFBFBFB6B6B6FFFFFFDADADA6D6D6D6D6D6D767676F6F6F6FFFFFF
          E4E4E47676766D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6E6E
          6E6E6E6E6F6F6F7373737979798282828C8C8C96969674747446464646464646
          46464646464646467878788C8C8C7E7E7E7272726A6A6A6161615C5C5C565656
          14B6D300D8FF00D8FF4848484B4B4B4F4F4F5252525555552B96AA00D8FF05D0
          F413B5D20EBDDD00D8FF00D8FF04CFF3415C614F4F4F5555555959595D5D5D5F
          5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F7D7D7D
          FFFFFFFFFFFF7373735F5F5F5F5F5FEBEBEBFFFFFFA5A5A5878787FFFFFFFFFF
          FFD7D7D7D7D7D7D7D7D7D7D7D77D7D7D5F5F5F878787FFFFFFFFFFFF5F5F5F5F
          5F5F5F5F5FD7D7D7FFFFFFEBEBEBD7D7D7D7D7D7D7D7D7B9B9B95F5F5FFFFFFF
          FFFFFF8787875F5F5F919191FFFFFFFFFFFFB9B9B9A5A5A5FFFFFFEBEBEB5F5F
          5F5F5F5F737373FFFFFFFFFFFF7D7D7DAFAFAFFFFFFFD7D7D75F5F5F5F5F5FE1
          E1E1FFFFFFF5F5F57373735F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
          5F5F5F5F5F5F5F5F5F5F5F5F6060606363636A6A6A7272727E7E7E8B8B8B7979
          794646464646464646464646464646467979798080807171716666665D5D5D56
          56565050504A4A4A11B3D000D8FF00D8FF3C3C3C3E3E3E424242454545494949
          2E7F8E2E7F8E48484845454541414123829300D8FF00D8FF2382934444444949
          494E4E4E51515153535353535353535353535353535353535353535353535353
          5353535353535353E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF696969
          7E7E7EFFFFFFFFFFFF5353535353535353535353535353535353537E7E7EFFFF
          FFFFFFFF535353535353535353D4D4D4FFFFFFA9A9A953535353535353535353
          5353535353FFFFFFFFFFFF7E7E7E696969F4F4F4FFFFFFD4D4D4535353696969
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9535353A9A9A9FFFFFFD4D4
          D4535353B3B3B3FFFFFFFFFFFF7E7E7E53535353535353535353535353535353
          53535353535353535353535353535353535353535454545757575D5D5D666666
          7171718080807979794646464646464646464646464646467979797878786969
          695C5C5C5454544D4D4D4646464242420FB1CE00D8FF00D8FF33333335353537
          37373B3B3B3E3E3E4141414141414040403E3E3E3A3A3A295F6900D8FF00D8FF
          1C889B3C3C3C4141414545454848484A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AA4A4A4FFFFFFF4F4F4A4A4A4DDDDDDFF
          FFFFD2D2D24A4A4A777777FFFFFFFFFFFF4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A777777FFFFFFFFFFFF4A4A4A4A4A4A4A4A4AD2D2D2FFFFFFBBBBBB7777
          777777777777776161614A4A4AFFFFFFFFFFFFDDDDDDE8E8E8FFFFFFF4F4F455
          55554A4A4A4A4A4AD2D2D2FFFFFFDDDDDDA4A4A4F4F4F4FFFFFFA4A4A44A4A4A
          A4A4A4FFFFFFF4F4F4D2D2D2FFFFFFFFFFFFA4A4A44A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4E
          4E4E5454545C5C5C696969777777797979464646464646464646464646464646
          7979799393938787877E7E7E76767670707069696963636317B9D600D8FF00D8
          FF13B4D213B5D214B6D315B7D44A737A5E5E5E606060536E732E9AAD2C97AB0A
          C7E900D8FF05CFF44965695B5B5B6262626868686C6C6C6F6F6F6F6F6F6F6F6F
          6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F818181FFFFFFFFFF
          FF818181EDEDEDFFFFFFA5A5A56F6F6F939393FFFFFFFFFFFF6F6F6F6F6F6F6F
          6F6F6F6F6F6F6F6F6F6F6F939393FFFFFFFFFFFF6F6F6F6F6F6F6F6F6FDBDBDB
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B76F6F6FFFFFFFFFFFFFE4E4E4DBDB
          DBF6F6F6FFFFFFDBDBDB6F6F6F6F6F6FA5A5A5FFFFFFEDEDED818181FFFFFFFF
          FFFF8181816F6F6FB7B7B7FFFFFFF6F6F6DBDBDBE4E4E4FFFFFFF6F6F69C9C9C
          6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F
          6F6F6F6F6F6F6F7272727676767E7E7E87878793939379797946464646464646
          46464646464646467979799898988D8D8D8383837D7D7D7676766F6F6F696969
          18BAD700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF467D866363636464644A80
          8A00D8FF00D8FF00D8FF10BFDF4A656A5959596161616868686E6E6E73737375
          7575757575757575757575757575757575757575757575757575757575757575
          757575E5E5E5FFFFFFCBCBCBFFFFFFFFFFFF7E7E7E757575989898FFFFFFFFFF
          FF757575757575757575757575757575757575989898FFFFFFFFFFFF75757575
          7575757575DCDCDCFFFFFFDCDCDCBABABABABABABABABA989898757575FFFFFF
          FFFFFF9898987575757E7E7EEEEEEEFFFFFFA9A9A97575757E7E7EFFFFFFFFFF
          FFCBCBCBFFFFFFE5E5E5757575757575BABABAFFFFFFDCDCDC757575757575B2
          B2B2FFFFFFEEEEEE757575757575757575757575757575757575757575757575
          7575757575757575757575757575757878787D7D7D8383838D8D8D9898987979
          794646464646464646464646464646467979799E9E9E9393938A8A8A8484847D
          7D7D7777777070701ABCD900D8FF00D8FF407780417781437983467D865D6A6D
          676767696969616F714B818B4286921DB1CC00D8FF11C0E06060606868686F6F
          6F7575757A7A7A7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7CB6B6B6FFFFFFFFFFFFFFFFFFD6D6D67C7C7C7C7C7C
          9D9D9DFFFFFFFFFFFF7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C9D9D9DFFFF
          FFFFFFFF7C7C7C7C7C7C7C7C7CDEDEDEFFFFFFBDBDBD7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7CFFFFFFFFFFFF9D9D9D7C7C7C7C7C7CE6E6E6FFFFFFBDBDBD7C7C7C
          7C7C7CD6D6D6FFFFFFFFFFFFFFFFFFB6B6B67C7C7C7C7C7CBDBDBDFFFFFFDEDE
          DE7C7C7C7C7C7CA5A5A5FFFFFFFFFFFF7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7F7F7F8484848A8A8A
          9393939E9E9E797979464646464646464646464646464646787878A5A5A59B9B
          9B9292928B8B8B8585857F7F7F7878781CBEDB00D8FF00D8FF5D5D5D5E5E5E60
          60606464646868686573756573756B6B6B68686865656549808900D8FF00D8FF
          557E857171717878787D7D7D8181818282828383838383838383838383838383
          838383838383838383838383838383838383838B8B8BFFFFFFFFFFFFFFFFFFAA
          AAAA838383838383A2A2A2FFFFFFFFFFFF838383838383838383838383FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0E0E0E0FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE0E0E0838383FFFFFFFFFFFFE8E8E8E0E0E0EFEFEFFFFFFFFF
          FFFFA2A2A2838383838383AAAAAAFFFFFFFFFFFFFFFFFF8B8B8B838383838383
          C1C1C1FFFFFFF7F7F7E0E0E0E0E0E0FFFFFFFFFFFFE0E0E08383838383838383
          8383838383838383838383838383838383838383838383838383838384848486
          86868B8B8B9292929B9B9BA5A5A5797979464646464646464646464646464646
          737373A8A8A8A4A4A49B9B9B9595958E8E8E8989898282821FC1DE00D8FF00D8
          FF1BBCDA1BBCDA1BBDDA1CBEDB4798A7578D9700D8FF24B8D338A4B737A3B60E
          CAED00D8FF00D8FF5E878E7B7B7B8181818686868989898A8A8A8B8B8B8B8B8B
          8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8BCCCC
          CCE2E2E2E2E2E28B8B8B8B8B8B8B8B8BA1A1A1E2E2E2E2E2E28B8B8B8B8B8B8B
          8B8B8B8B8BE2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2CCCCCCCCCCCC
          E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2CCCCCC8B8B8BE2E2E2E2E2E2E2E2E2E2E2
          E2E2E2E2D3D3D3A8A8A88B8B8B8B8B8B8B8B8B8B8B8BE2E2E2E2E2E2CCCCCC8B
          8B8B8B8B8B8B8B8BB7B7B7E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2BEBEBE929292
          8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B
          8B8C8C8C8D8D8D9090909595959B9B9BA4A4A4A9A9A974747446464646464646
          4646464646464646696969A3A3A3AEAEAEA6A6A69F9F9F9999999292928D8D8D
          22C4E100D8FF00D8FF00D8FF00D8FF00D8FF00D8FF40ABBF6197A100D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF2FB6CE8282828787878C8C8C90909092929293
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939494949595959696969A9A9A9F9F9FA6A6A6AEAEAEA3A3A36969
          694646464646464646464646464646465656568F8F8FB8B8B8B1B1B1AAAAAAA4
          A4A49F9F9F9B9B9B7BA3AB6DA4AD6AA1AA689EA8689EA8689EA8699FA97C979C
          8F8F8F7D989D61A5B146B2C546B1C54EADBE7A959A8E8E8E9191919595959898
          989B9B9B9C9C9C9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9E9E9E9F9F9FA0A0A0A2A2A2A5A5A5AAAAAAB1B1B1
          B8B8B88E8E8E5555554646464646464646464646464646464646466C6C6C9F9F
          9FBCBCBCB6B6B6B0B0B0ADADADA8A8A8A5A5A5A2A2A29F9F9F9D9D9D9C9C9C9D
          9D9D9C9C9C9D9D9D9D9D9D9D9D9D9D9D9D9C9C9C9B9B9B9B9B9B9C9C9C9E9E9E
          A0A0A0A2A2A2A4A4A4A6A6A6A6A6A6A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A8A8A8A8A8A8A8A8A8A8A8A8A9A9A9AAAAAAABABABAEAEAEB1
          B1B1B6B6B6BCBCBC9F9F9F6C6C6C464646464646464646464646464646464646
          4646464B4B4B727272A2A2A2C2C2C2BDBDBDB8B8B8B6B6B6B3B3B3B1B1B1AFAF
          AFAEAEAEAEAEAEADADADADADADAEAEAEAEAEAEAEAEAEADADADACACACACACACAC
          ACACADADADAEAEAEAFAFAFB0B0B0B1B1B1B1B1B1B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3B3B3B3B3B3B3B4B4B4B5B5
          B5B7B7B7B9B9B9BDBDBDC2C2C2A2A2A27373734B4B4B46464646464646464646
          46464646464646464646464646464C4C4C7070709E9E9EC1C1C1C4C4C4C1C1C1
          BFBFBFBEBEBEBDBDBDBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
          BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BEBEBEBFBFBFC0C0C0C2C2C2C4C4C4C1C1C19D9D9D7070704C4C4C4646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          7676989898AFAFAFBABABAC6C6C6C8C8C8C8C8C8C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C8C8C8C8C8C8C6C6C6BABABAB0B0B09898987676765F5F5F474747
          4646464646464646464646464646464646464646464646464646464646464646
          464646464646464848485959596767676F6F6F77777779797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          797979797979797979797979797979797979797777776F6F6F68686859595948
          4848464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474746464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646474747474747474747474747474747474747
          4747474848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484747474747474747474747474747474747474747474646464646
          4646464646464646464646464647474747474747474747474747474748484848
          48484848484949494949494949494949494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A494949494949494949494949484848484848484848474747
          4747474747474747474747474646464646464747474747474747474848484848
          484949494949494A4A4A4A4A4A4B4B4B4A4A4A4B4B4B4B4B4B4B4B4B4B4B4B4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A49494949
          4949484848494949484848484848474747474747474747474747474747484848
          4848484949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4D4D4D4C4C
          4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B
          4B4B4B4B4A4A4A4A4A4A49494949494948484848484848484848484847474747
          47474848484848484949494A4A4A4B4B4B4B4B4B4D4D4D4D4D4D4E4E4E4D4D4D
          4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E
          4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4A4A4A4A4A4A4949494949494848484848
          484747474848484747474949494A4A4A4B4B4B4C4C4C4D4D4D4E4E4E4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F5050505050505050504F4F4F505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          50504F4F4F4F4F4F4E4E4E4E4E4E4C4C4C4C4C4C4B4B4B4B4B4B4A4A4A494949
          4949494848484949494949494848484848484A4A4A4B4B4B4D4D4D4E4E4E4F4F
          4F50505050505051515151515151515151515151515152525252525252525253
          5353525252525252535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          535252525252525252525252525151515050505050504F4F4F4D4D4D4C4C4C4B
          4B4B4A4A4A4949494949494848484848484848484949494848484B4B4B4D4D4D
          4E4E4E5050505151515252525353535353535454545454545555555555555656
          5657575757575757575758585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585757575757575656565555555454545252
          525151514F4F4F4D4D4D4B4B4B4A4A4A49494948484848484848484848484849
          49494D4D4D4F4F4F5151515252525454545555555555555F5F5F959595C6C6C6
          DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFDEDEDEC5C5C59494945959594E4E4E4C4C4C4A4A4A4949494848
          484848484848484848484F4F4F5050505353535555555757575C5C5CABABABF5
          F5F5C3D3F48CABEA6E96E54578DD4276DC4074DC3F74DC3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DA3E73DA3E73DA3E73DA3E73DA3E73DA3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3F74DC4074DC4276DC4578DD6E96E58CABEAC1D2F3F5F5F5AAAAAA545454
          4C4C4C4A4A4A4949494848484949494949495151515353535555555757576D6D
          6DE2E2E2B8CCF25F8CE24277DC3A72DA346CD83069D82C67D62A66D62A65D72A
          66D82A66D82A66D82A65D72A65D62964D62964D52964D42964D42964D52964D6
          2A65D62A65D72A66D82A66D82A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92B67D92D68D9306ADA346DDA3A72DB4277DD5D
          8AE2B8CCF2E1E1E16565654D4D4D4A4A4A494949484848494949525252555555
          5858586B6B6BECECECA7C0F0477CDF3972DC2E69D92663D7205FD51D5BD21B5A
          D11959D1195AD3195AD4195AD4195AD41959D31858D01857CE1856CB1755CA17
          55CA1856CB1857CE1858D01959D3195AD4195BD6195BD6195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD71A5CD71A5CD71C5DD81E5ED82161
          D92664DA2E6ADB3972DD477CDFA7C0F0EBEBEB6262624C4C4C49494949494949
          49495454545757575A5A5AD5D5D5A9C2F1467CE13671DE2867DB1E5FD71659D3
          1255D00F51CC0D50CA0D50CA0C50CE0D51D00C51D20C51D20C50CF0B4ECB0B4D
          C70B4BC30B4AC00B4AC00B4BC20B4CC50B4ECA0B4FCE0C51D20C52D40C53D60C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70D54D70D54D70E55D7
          0E55D71056D81358D8175BD91E60DA2867DC3671DE467CE1A9C2F1D2D2D24F4F
          4F4B4B4B4A4A4A4A4A4A5656565959598F8F8FCFDDF84B82E33875E12769DE1A
          5FDA1158D70B52D1074ECB064CC5054AC30549C5044BCA044DCE044ED1044ED1
          044DCE044BC80448C10346BC0345B90344B70345B80346BC0448C2044BC9044E
          D0044FD40450D70451D80451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90551D90652D90753D90854D90C56DA115ADB1A60DC2769DE3774E0
          4B82E3CFDDF88686864D4D4D4B4B4B4A4A4A5757575B5B5BCCCCCC8CB0EE3F7B
          E32C6EE01C63DE105AD90852D4054DCC0249C40146BC0145B90044BA0047C100
          49C7004BCB004BCD004ACB0048C30057C40068C70066C20052B6003FAC0041B0
          0043B80047C1004ACB004DD2004FD70050D90050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0151DA0151DA0251DA0453DB0855DB10
          5BDC1C63DE2C6EE03F7BE38CB0EEC9C9C94F4F4F4C4C4C4B4B4B5959595D5D5D
          ECECEC6294EA3677E4246AE21560E00A58DB0452D5024CCB00B4EF00D8FF00D8
          FF0042B10044B90047C0004AC6004BCA0080DD00CFFB00D8FF00D8FF00D8FF00
          D8FF00C5F4005BB80042B10046BD004BC9004ED20050D90052DC0052DD0052DD
          0052DD0052DD0052DD0052DD0052DD0052DD0052DD0052DD8FB3F0FFFFFFCFDE
          F90052DD0052DD0052DD8FB3F0FFFFFFCFDEF9407DE6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF407DE60052DD407DE6FFFFFFFFFFFF0052DD0052DD0052DD
          BFD4F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFD4F60052DDFFFFFFFFFFFF407D
          E60052DD0052DD7FA8EEFFFFFFFFFFFFEFF4FDFFFFFF8FB3F00052DD0052DD00
          52DDCFDEF9FFFFFF8FB3F07FA8EEFFFFFFBFD4F60052DD0052DD105DDFEFF4FD
          FFFFFFCFDEF9105DDF0052DD0052DD0052DD0052DD0052DD0052DD0052DD0153
          DD0253DD0455DE0A59DE1560E0246AE23677E45E91E9EFEFEF5151514E4E4E4C
          4C4C5A5A5A5E5E5EFDFDFD4985E83176E51F6AE31160E10759DC0252D5004DC9
          00B4EE00D8FF00D8FF0040A90043B10046B9004AC1004CC70092E300D8FF00CF
          FB00B3ED00BCF000D8FF00D8FF00CEF90055B70047B9004CC70050D20053DA00
          55DE0055DF0055DF0055DF0055DF0055DF0055DF0055DF0055DF0055DF0055DF
          3075E5FFFFFFFFFFFF206AE30055DF0055DFDFEAFBFFFFFF70A0ED4080E7FFFF
          FFFFFFFFBFD4F7BFD4F7BFD4F7BFD4F73075E50055DF4080E7FFFFFFFFFFFF00
          55DF0055DF0055DFBFD4F7FFFFFFDFEAFBBFD4F7BFD4F7BFD4F78FB4F10055DF
          FFFFFFFFFFFF4080E70055DF508AE9FFFFFFFFFFFF8FB4F170A0EDFFFFFFDFEA
          FB0055DF0055DF206AE3FFFFFFFFFFFF3075E57FAAEFFFFFFFBFD4F70055DF00
          55DFCFDFF9FFFFFFEFF4FD206AE30055DF0055DF0055DF0055DF0055DF0055DF
          0055DF0055DF0055DF0055DF0256DF075AE01160E11F6AE33176E54684E8FFFF
          FF5353534E4E4E4D4D4D5B5B5B5F5F5FFFFFFF4383EA2D75E71C69E50F61E406
          5ADF0154D6004ECA00B4EE00D8FF00D8FF003FA30042AA0045B30049BD004CC6
          0081DD0081DC004BC30048BB0044B10083CE00D8FF00D8FF0084D00047B9004D
          C70052D40055DD0057E10057E20057E20057E20057E20057E20057E20057E200
          57E20057E20057E20057E2DFEAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          206CE64081E9FFFFFFFFFFFF0057E20057E20057E20057E20057E20057E24081
          E9FFFFFFFFFFFF0057E20057E20057E2BFD5F8FFFFFF7FABF00057E20057E200
          57E20057E20057E2FFFFFFFFFFFF4081E9206CE6EFF4FDFFFFFFBFD5F80057E2
          206CE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEAFB0057E27FABF0FFFF
          FFBFD5F80057E28FB5F2FFFFFFFFFFFF4081E90057E20057E20057E20057E200
          57E20057E20057E20057E20057E20057E20057E20158E2065BE30F61E41C69E5
          2D75E74383EAFFFFFF5454545050504E4E4E5C5C5C606060FFFFFF4184EC2C76
          E91A6BE80E63E6055CE20055D90050CC00B4EE00D8FF00D8FF003E9E0040A300
          43AC0048B6004CC1004FC8004FC9004EC6004BBE0047B40068BF00D8FF00D8FF
          008ED50049BB004FC90054D60058E0005AE4005AE5005AE5005AE5005AE5005A
          E5005AE5005AE5005AE5005AE5005AE5005AE57FACF2FFFFFFEFF5FD7FACF2CF
          E0FAFFFFFFBFD6F8005AE54083ECFFFFFFFFFFFF005AE5005AE5005AE5005AE5
          005AE5005AE54083ECFFFFFFFFFFFF005AE5005AE5005AE5BFD6F8FFFFFF9FC1
          F54083EC4083EC4083EC206FE8005AE5FFFFFFFFFFFFCFE0FADFEAFCFFFFFFEF
          F5FD1064E7005AE5005AE5BFD6F8FFFFFFCFE0FA7FACF2EFF5FDFFFFFF7FACF2
          005AE57FACF2FFFFFFEFF5FDBFD6F8FFFFFFFFFFFF7FACF2005AE5005AE5005A
          E5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE5005AE505
          5DE60E63E61A6BE82B76E94083ECFFFFFF5555555050504E4E4E5C5C5C616161
          FFFFFF4085ED2B77EB1A6DE90D64E8055EE30057DB0052CE00B5EF00D8FF00D8
          FF00B1E600B2E700B2E900B4EC0066C9004EC50050C80060CC0092DF0090D900
          C5F400D8FF00CFF90057B8004CBE0051CC0056D9005AE2005CE6005CE7005CE7
          005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE72070EAFFFF
          FFFFFFFF2070EADFEBFCFFFFFF6099F0005CE74085EDFFFFFFFFFFFF005CE700
          5CE7005CE7005CE7005CE7005CE74085EDFFFFFFFFFFFF005CE7005CE7005CE7
          BFD6F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FADF3005CE7FFFFFFFFFFFFCFE0
          FABFD6F9EFF5FDFFFFFFBFD6F9005CE7005CE76099F0FFFFFFDFEBFC2070EAFF
          FFFFFFFFFF2070EA005CE77FADF3FFFFFFEFF5FDBFD6F9CFE0FAFFFFFFEFF5FD
          508FEF005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005CE7005C
          E7005CE7005CE7055FE70D64E81A6DE92B77EB4085EDFFFFFF5656565151514E
          4E4E5C5C5C606060FFFFFF4188EF2C7BEE1A6FEC0E68EB0560E6005ADE0055D1
          00B6F000D8FF00D8FF00D8FF00D8FF00D8FF00D8FF006FCD0050C50051C80072
          D400D8FF00D8FF00D8FF00BCEF0057B50048B2004FC20055D00059DC005DE500
          5FE9005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA005FEA
          005FEA005FEACFE1FBFFFFFF9FC3F7FFFFFFFFFFFF1069EB005FEA4087EFFFFF
          FFFFFFFF005FEA005FEA005FEA005FEA005FEA005FEA4087EFFFFFFFFFFFFF00
          5FEA005FEA005FEABFD7FAFFFFFFBFD7FA7FAFF47FAFF47FAFF44087EF005FEA
          FFFFFFFFFFFF4087EF005FEA1069EBDFEBFCFFFFFF609BF2005FEA1069EBFFFF
          FFFFFFFF9FC3F7FFFFFFCFE1FB005FEA005FEA7FAFF4FFFFFFBFD7FA005FEA00
          5FEA70A5F3FFFFFFDFEBFC005FEA005FEA005FEA005FEA005FEA005FEA005FEA
          005FEA005FEA005FEA005FEA005FEA0562EA0E68EB1A6FEC2C7BEE4087EFFFFF
          FF5656565151514F4F4F5B5B5B606060FFFFFF438BF22D7DF01C72EF0F6AEE06
          63E9015DE20057D600B6F100D8FF00D8FF0068BB0069BC006BC0006EC70057C2
          0051C50052C80059CA0071CF0077CE00ABE600D8FF00BDF0004BB80051C70057
          D5005CE0005FE80061EC0061ED0061ED0061ED0061ED0061ED0061ED0061ED00
          61ED0061ED0061ED0061ED0061ED70A6F5FFFFFFFFFFFFFFFFFFAFCDF90061ED
          0061ED4089F2FFFFFFFFFFFF0061ED0061ED0061ED0061ED0061ED0061ED4089
          F2FFFFFFFFFFFF0061ED0061ED0061EDBFD7FAFFFFFF7FB0F60061ED0061ED00
          61ED0061ED0061EDFFFFFFFFFFFF4089F20061ED0061EDCFE1FCFFFFFF7FB0F6
          0061ED0061EDAFCDF9FFFFFFFFFFFFFFFFFF70A6F50061ED0061ED7FB0F6FFFF
          FFBFD7FA0061ED0061ED5093F3FFFFFFFFFFFF0061ED0061ED0061ED0061ED00
          61ED0061ED0061ED0061ED0061ED0061ED0061ED0162ED0665ED0F6AEE1C72EF
          2D7DF0438BF2FFFFFF5555555151514F4F4F5A5A5A5F5F5FFDFDFD498FF33181
          F21F76F1116DF00867ED0260E6005ADA00B7F200D8FF00D8FF0047AB0047AC00
          49AF004CB7004FBE005AC9005ACA0051C4004FBE004CB8006EC500D8FF00D8FF
          0069CB0055CD005ADA005FE50061EB0063EE0063EF0063EF0063EF0063EF0063
          EF0063EF0063EF0063EF0063EF0063EF0063EF0063EF106DF0FFFFFFFFFFFFFF
          FFFF5094F40063EF0063EF408AF3FFFFFFFFFFFF0063EF0063EF0063EF0063EF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFD8FBBFD8FBFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFBFD8FB0063EFFFFFFFFFFFFFCFE2FCBFD8FBDFEBFDFF
          FFFFFFFFFF408AF30063EF0063EF5094F4FFFFFFFFFFFFFFFFFF106DF00063EF
          0063EF7FB1F7FFFFFFEFF5FEBFD8FBBFD8FBFFFFFFFFFFFFBFD8FB0063EF0063
          EF0063EF0063EF0063EF0063EF0063EF0063EF0063EF0063EF0063EF0264EF07
          67EF116DF01F76F13181F2468EF3FFFFFF5555555151514F4F4F5959595E5E5E
          EDEDED62A1F73686F5247CF41573F30A6BF00465EA0260E100B9F500D8FF00D8
          FF00B5ED00B5ED00B6EE00B6EF0086DB0076D700D8FF00AFEE0095E10094DF00
          C7F700D8FF00D8FF006ED4005AD6005FE10062E90065EF0066F10066F20066F2
          0066F20066F20066F20066F20066F20066F20066F20066F20066F20066F20066
          F28FBCF9BFD9FCBFD9FC0066F20066F20066F23083F4BFD9FCBFD9FC0066F200
          66F20066F20066F2BFD9FCBFD9FCBFD9FCBFD9FCBFD9FCBFD9FCBFD9FC8FBCF9
          8FBCF9BFD9FCBFD9FCBFD9FCBFD9FCBFD9FC8FBCF90066F2BFD9FCBFD9FCBFD9
          FCBFD9FCBFD9FC9FC5FA408CF50066F20066F20066F20066F2BFD9FCBFD9FC8F
          BCF90066F20066F20066F260A0F7BFD9FCBFD9FCBFD9FCBFD9FCBFD9FC70A9F8
          1070F30066F20066F20066F20066F20066F20066F20066F20066F20066F20167
          F20267F20468F20A6CF31573F3247CF43686F55E9EF7EFEFEF5454545151514F
          4F4F5858585C5C5CCDCDCD8CBBFA3F8DF72C82F61C79F51070F3086AEE0566E8
          01BAF700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF0099E9007AE000D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF00A8ED005CD7005FE00063E80066EE0067F200
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0169F40169F40269F4056BF4086DF41071F51C79F52C82F63F8DF78CBBFACACA
          CA5454545151514F4F4F5757575A5A5A909090CFE3FD4B96F9388BF92781F81A
          79F71172F40C6DEF077EEE0483EC0480E7037FE4037DE3037EE4037FE60370E3
          0462E10371E50386E9029CEE029CED0294EA036FE00461DF0464E50466EA0469
          EF046AF3046CF6046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7056DF7066EF7076EF7096FF70C71F71174F81A79F82781F8388BF9
          4B96F9D1E4FE8888885353535151514F4F4F5555555959595D5D5DD6D6D6AACE
          FD4694FB368BFA2882F91E7CF81777F61274F20F70EE0D6EEB0D6CE80C6BE70C
          6BE80B6BE80B6CE90B6CEA0B6CEA0B6CE90B6BE80B6BE70B6BE70B6BE80B6DEB
          0C6EEF0C70F20C71F50C72F70C73F80C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90D73F90D73F90E74F90E74F91075F91377F91779FA1E7DFA28
          83FA368BFA4694FBA9CDFDD4D4D45656565353535151514F4F4F535353565656
          5A5A5A6F6F6FEBEBEBA7CDFD4796FC398EFC2E87FB2683FA217FF91E7DF71B7B
          F5197AF4197AF41879F41879F41879F51879F51879F51879F41878F31878F318
          78F31879F41879F5197AF7197BF8197BF9197CFA197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB1A7DFB1A7DFB1C7EFB1E7FFB2181
          FC2684FC2E88FC398EFC4796FCA7CDFDECECEC6A6A6A5555555353535050504F
          4F4F5151515454545858585B5B5B727272E3E3E3B8D7FE5FA4FD4294FD3A8FFC
          348BFC3089FC2D87FC2B86FC2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86
          FB2A86FA2A86FA2A86FA2A86FA2A86FB2A86FB2A86FB2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2B87FD
          2D88FD308AFD348CFD3A90FD4294FD5FA4FDB8D7FEE2E2E26D6D6D5757575454
          545252525050504D4D4D4F4F4F5151515454545858585B5B5B626262AFAFAFF6
          F6F6C3DDFF8EC0FE6EAEFE4D9CFE4296FE4095FE3F94FE3F94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3F
          94FE3F94FE4095FE4296FE4D9CFE6EAEFE8CBFFEC3DDFFF6F6F6ADADAD5E5E5E
          5858585555555353535050504E4E4E4C4C4C4D4D4D4F4F4F5252525454545757
          575A5A5A5C5C5C6767679B9B9BC8C8C8E0E0E0FAFAFAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE0E0E0C9C9C999999965
          65655B5B5B5757575656565353535151514E4E4E4D4D4D4B4B4B4B4B4B4D4D4D
          4F4F4F5151515454545656565858585A5A5A5C5C5C5E5E5E5F5F5F6060606060
          6061616161616161616162626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626161616161616161616060605F5F5F5E5E
          5E5D5D5D5B5B5B5959595757575555555353535050504F4F4F4D4D4D4B4B4B4A
          4A4A}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 9
      end
      object btnCadastra: TRzBmpButton
        Left = 6
        Top = 9
        Width = 116
        Height = 32
        Cursor = crHandPoint
        Hint = 'Cadastra um NOVO registro'
        Bitmaps.Disabled.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646484848595959686868
          6F6F6F7979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979796F6F6F6868685959594848484646464646464646464646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          76769D9D9DBABABAC6C6C6D8D8D8D8D8D8D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
          D7D7D7D7D7D7D7D7D8D8D8D8D8D8C6C6C6BABABA9E9E9E767676606060474747
          4646464646464646464646464646464646464646464646464646464646464C4C
          4C707070A1A1A1C9C9C9CDCDCDCBCBCBC8C8C8C7C7C7C7C7C7C6C6C6C6C6C6C7
          C7C7C7C7C7C7C7C7C6C6C6C6C6C6C5C5C5C5C5C5C4C4C4C4C4C4C4C4C4C4C4C4
          C5C5C5C6C6C6C6C6C6C7C7C7C7C7C7C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C9C9C9C9C9C9CACACACCCCCCCECECECA
          CACAA1A1A17070704C4C4C464646464646464646464646464646464646464646
          4646464B4B4B737373A4A4A4C5C5C5BFBFBFBCBCBCB8B8B8B4B4B4B3B3B3B1B1
          B1B1B1B1B2B2B2B3B3B3B4B4B4B4B4B4B3B3B3B1B1B1AFAFAFADADADACACACAB
          ABABABABABACACACAEAEAEB0B0B0B2B2B2B4B4B4B5B5B5B5B5B5B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B7B7B7B8B8B8B8B8
          B8BABABABDBDBDC0C0C0C5C5C5A4A4A47373734B4B4B46464646464646464646
          46464646464646464646466C6C6C9D9D9DB8B8B8B2B2B2ABABABA7A7A7A1A1A1
          9E9E9E9A9A9A9898989898989B9B9B9D9D9D9F9F9F9E9E9E9D9D9D9A9A9A9696
          969393939191919090909191919393939595959898989C9C9C9E9E9EA0A0A0A1
          A1A1A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
          A2A2A2A3A3A3A4A4A4A6A6A6A9A9A9ACACACB2B2B2B8B8B89D9D9D6C6C6C4646
          464646464646464646464646464646465656568C8C8CAEAEAEA5A5A59E9E9E97
          97979191918B8B8B8686868282828080808181818484848787878989898A8A8A
          8787878383837E7E7E7979797777777676767777777A7A7A7E7E7E8282828686
          868A8A8A8C8C8C8D8D8D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
          8E8E8E8E8E8E8E8E8F8F8F8F8F8F9090909191919494949898989E9E9EA5A5A5
          AEAEAE8C8C8C5656564646464646464646464646464646466969699999999C9C
          9C9393938A8A8A8282827C7C7C7777777070706C6C6C6A6A6A6A6A6A6E6E6E72
          72727575757575757373736E6E6E6868686363636060605E5E5E606060636363
          6868686D6D6D7373737777777A7A7A7B7B7B7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C8484849D9D9D9D9D9D8C8C8C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C9595959D9D9D9D9D9D8484847C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7D7D7D7D7D7D7E7E7E80808084
          84848A8A8A9393939C9C9C999999696969464646464646464646464646464646
          7373739595958C8C8C8282827979797272726B6B6B65656518BAD700D8FF00D8
          FF5757575B5B5B5F5F5F6363636464644A808A00D8FF00D8FF00D8FF00D8FF00
          D8FF00D8FF00D8FF16B8D55F5F5F6464646868686B6B6B6C6C6C6D6D6D6D6D6D
          6D6D6D767676BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4D1D1D1FFFFFFE4E4
          E46D6D6D6D6D6D6D6D6DBFBFBFFFFFFFE4E4E4929292FFFFFFFFFFFFFFFFFFFF
          FFFFEDEDEDC8C8C87F7F7F6D6D6D9B9B9BFFFFFFFFFFFF7676766D6D6D6D6D6D
          9B9B9BFFFFFFFFFFFFA4A4A4F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFC8C8C87676
          766D6D6D6D6D6D929292FFFFFFFFFFFF6D6D6D6D6D6D6D6D6DB6B6B6FFFFFFDA
          DADA6D6D6D6D6D6D767676F6F6F6FFFFFFF6F6F6FFFFFFFFFFFF7676766D6D6D
          6D6D6D9B9B9BFFFFFFFFFFFF767676FFFFFFFFFFFF9292926D6D6D6D6D6DB6B6
          B6FFFFFFFFFFFFA8A8A87979798282828C8C8C96969674747446464646464646
          46464646464646467878788C8C8C7E7E7E7272726A6A6A6161615C5C5C565656
          14B6D300D8FF00D8FF4848484B4B4B4F4F4F535353555555456E7500D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF00D8FF13B5D25353535858585B5B5B5E5E5E5F
          5F5F5F5F5F5F5F5F5F5F5FCDCDCDFFFFFFFFFFFFC3C3C3AFAFAFCDCDCDFFFFFF
          A5A5A5FFFFFFFFFFFF7373735F5F5F5F5F5FEBEBEBFFFFFFA5A5A5878787FFFF
          FFFFFFFFD7D7D7D7D7D7FFFFFFFFFFFFF5F5F57D7D7D5F5F5FF5F5F5FFFFFF9B
          9B9B5F5F5F5F5F5FC3C3C3FFFFFFCDCDCDAFAFAFF5F5F5B9B9B9878787878787
          CDCDCDFFFFFFCDCDCD5F5F5F5F5F5F878787FFFFFFFFFFFF5F5F5F5F5F5F5F5F
          5FAFAFAFFFFFFFD7D7D75F5F5F5F5F5FE1E1E1FFFFFFF5F5F5737373F5F5F5FF
          FFFF9B9B9B5F5F5F5F5F5FC3C3C3FFFFFFCDCDCD5F5F5FFFFFFFFFFFFF878787
          5F5F5F919191FFFFFFFFFFFFB9B9B96363636A6A6A7272727E7E7E8B8B8B7979
          794646464646464646464646464646467979798080807171716666665D5D5D56
          56565050504A4A4A11B3D000D8FF00D8FF3C3C3C3E3E3E424242464646494949
          4A4A4A32768204CFF300D8FF10B1CF3947493C3C3C3E3E3E4343434848484C4C
          4C505050525252535353535353535353737373FFFFFFFFFFFF7E7E7E53535353
          5353535353737373696969E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          6969697E7E7EFFFFFFFFFFFF5353535353535E5E5EC9C9C9FFFFFFE9E9E95353
          53BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9494947E7E7E5E5E5E53
          5353535353535353898989FFFFFFFFFFFF5353535353537E7E7EFFFFFFFFFFFF
          535353535353535353A9A9A9FFFFFFD4D4D4535353B3B3B3FFFFFFFFFFFF7E7E
          7E535353BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949494535353FF
          FFFFFFFFFF7E7E7E696969F4F4F4FFFFFFD4D4D45454545757575D5D5D666666
          7171718080807979794646464646464646464646464646467979797878786969
          695C5C5C5454544D4D4D4646464242420FB1CE00D8FF00D8FF33333335353538
          38383B3B3B3F3F3F414141414141335C6308C5E700D8FF07C4E62C545C373737
          3B3B3B3F3F3F4343434747474949494A4A4A4A4A4A4A4A4AA4A4A4FFFFFFDDDD
          DD4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AA4A4A4FFFFFFF4F4F4A4A4A4DD
          DDDDFFFFFFD2D2D24A4A4A777777FFFFFFFFFFFF4A4A4A4A4A4A4A4A4A616161
          FFFFFFFFFFFF6C6C6C777777FFFFFFFFFFFFB0B0B0C6C6C6FFFFFFF4F4F45555
          554A4A4A4A4A4A838383BBBBBBDDDDDDFFFFFFFFFFFFE8E8E84A4A4A4A4A4A77
          7777FFFFFFFFFFFF4A4A4A4A4A4A4A4A4AA4A4A4FFFFFFF4F4F4D2D2D2FFFFFF
          FFFFFFA4A4A44A4A4A4A4A4A777777FFFFFFFFFFFFB0B0B0C6C6C6FFFFFFF4F4
          F45555554A4A4AFFFFFFFFFFFFDDDDDDE8E8E8FFFFFFF4F4F45555554A4A4A4E
          4E4E5454545C5C5C696969777777797979464646464646464646464646464646
          7979799393938787877E7E7E76767670707069696963636317B9D600D8FF00D8
          FF13B4D213B5D214B6D316B7D54A737A5F5F5F61616160606057656711C0E000
          D8FF05D0F44964695757575E5E5E6565656A6A6A6D6D6D6F6F6F6F6F6F6F6F6F
          B7B7B7FFFFFFDBDBDB6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F818181FFFF
          FFFFFFFF818181EDEDEDFFFFFFA5A5A56F6F6F939393FFFFFFFFFFFF6F6F6F6F
          6F6F6F6F6F6F6F6FFFFFFFFFFFFF9393936F6F6FEDEDEDFFFFFFA5A5A5C9C9C9
          FFFFFFC9C9C96F6F6F787878E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFEDEDED8A8A
          8A6F6F6F6F6F6F939393FFFFFFFFFFFF6F6F6F6F6F6F6F6F6FB7B7B7FFFFFFF6
          F6F6DBDBDBE4E4E4FFFFFFF6F6F69C9C9C6F6F6F6F6F6FEDEDEDFFFFFFA5A5A5
          C9C9C9FFFFFFC9C9C96F6F6F6F6F6FFFFFFFFFFFFFE4E4E4DBDBDBF6F6F6FFFF
          FFDBDBDB6F6F6F7272727676767E7E7E87878793939379797946464646464646
          46464646464646467979799898988D8D8D8383837D7D7D7676766F6F6F696969
          18BAD700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF477D876464646666666565
          65626262526D7206D0F500D8FF16B8D55C5C5C6363636A6A6A6F6F6F73737375
          7575757575757575A9A9A9FFFFFFEEEEEE757575757575757575757575757575
          757575757575E5E5E5FFFFFFCBCBCBFFFFFFFFFFFF7E7E7E757575989898FFFF
          FFFFFFFF757575757575757575989898FFFFFFFFFFFF868686757575C2C2C2FF
          FFFFD4D4D4F6F6F6FFFFFFA0A0A0757575B2B2B2FFFFFFFFFFFFE5E5E5BABABA
          989898757575757575757575757575989898FFFFFFFFFFFF7575757575757575
          75BABABAFFFFFFDCDCDC757575757575B2B2B2FFFFFFEEEEEE757575757575C2
          C2C2FFFFFFD4D4D4F6F6F6FFFFFFA0A0A0757575757575FFFFFFFFFFFF989898
          7575757E7E7EEEEEEEFFFFFFA9A9A97878787D7D7D8383838D8D8D9898987979
          794646464646464646464646464646467979799E9E9E9393938A8A8A8484847D
          7D7D7777777070701ABCD900D8FF00D8FF407780417781437A83477D875E6B6E
          6868686A6A6A6A6A6A67676762626229A2B800D8FF00D8FF5570756969696F6F
          6F7676767A7A7A7C7C7C7C7C7C7C7C7C8C8C8CFFFFFFFFFFFFBDBDBD7C7C7C7C
          7C7C7C7C7CB6B6B69595957C7C7CB6B6B6FFFFFFFFFFFFFFFFFFD6D6D67C7C7C
          7C7C7C9D9D9DFFFFFFFFFFFF7C7C7C7C7C7CA5A5A5E6E6E6FFFFFFDEDEDE7C7C
          7C7C7C7C959595FFFFFFFFFFFFFFFFFFF7F7F77C7C7C7C7C7CBDBDBDFFFFFFDE
          DEDE7C7C7C7C7C7C7C7C7C7C7C7CA5A5A57C7C7C7C7C7C9D9D9DFFFFFFFFFFFF
          7C7C7C7C7C7C7C7C7CBDBDBDFFFFFFDEDEDE7C7C7C7C7C7CA5A5A5FFFFFFFFFF
          FF7C7C7C7C7C7C959595FFFFFFFFFFFFFFFFFFF7F7F77C7C7C7C7C7C7C7C7CFF
          FFFFFFFFFF9D9D9D7C7C7C7C7C7CE6E6E6FFFFFFBEBEBE7F7F7F8484848A8A8A
          9393939E9E9E797979464646464646464646464646464646787878A5A5A59B9B
          9B9292928B8B8B8585857F7F7F7878781CBEDB00D8FF00D8FF5D5D5D5E5E5E61
          61616565656969696D6D6D4B8F9B6D6D6D6B6B6B6767672CA5BB00D8FF00D8FF
          4F858F7070707777777D7D7D818181828282838383838383838383B9B9B9FFFF
          FFFFFFFFEFEFEFE0E0E0F7F7F7FFFFFFA2A2A28383838B8B8BFFFFFFFFFFFFFF
          FFFFAAAAAA838383838383A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E8E8E88B8B8B838383838383838383E8E8E8FFFFFFFFFFFFC9C9C98383838383
          83939393F7F7F7FFFFFFD0D0D0C1C1C1D0D0D0F7F7F7E0E0E0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0C1C1C1FFFFFFF7F7F7E0E0E0E0E0E0
          FFFFFFFFFFFFE0E0E0838383838383838383E8E8E8FFFFFFFFFFFFC9C9C98383
          83838383838383FFFFFFFFFFFFE8E8E8E0E0E0EFEFEFFFFFFFFFFFFFA3A3A386
          86868B8B8B9292929B9B9BA5A5A5797979464646464646464646464646464646
          737373A8A8A8A4A4A49B9B9B9595958E8E8E8989898282821FC1DE00D8FF00D8
          FF1BBCDA1BBCDA1BBDDA1CBEDB4798A775757500D8FF16C5E539A5B82AB0C900
          D8FF00D8FF00D8FF6D7A7D7B7B7B8181818686868989898A8A8A8B8B8B8B8B8B
          8B8B8B8B8B8BAFAFAFE2E2E2FFFFFFFFFFFFF0F0F0D3D3D39292928B8B8B8B8B
          8BCCCCCCE2E2E2E2E2E28B8B8B8B8B8B8B8B8BA1A1A1E2E2E2E2E2E2E2E2E2E2
          E2E2D3D3D3B7B7B79292928B8B8B8B8B8B8B8B8B8B8B8BB7B7B7E2E2E2E2E2E2
          A1A1A18B8B8B8B8B8B8B8B8B9A9A9AD3D3D3F8F8F8FFFFFFFFFFFFE2E2E2BEBE
          BEE2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2CCCCCCB7B7B7E2E2E2E2
          E2E2E2E2E2E2E2E2E2E2E2BEBEBE9292928B8B8B8B8B8B8B8B8BB7B7B7E2E2E2
          E2E2E2A1A1A18B8B8B8B8B8B8B8B8BE2E2E2E2E2E2E2E2E2E2E2E2E2E2E2D3D3
          D3A9A9A98D8D8D9090909595959B9B9BA4A4A4A9A9A974747446464646464646
          4646464646464646696969A3A3A3AEAEAEA6A6A69F9F9F9999999292928D8D8D
          22C4E100D8FF00D8FF00D8FF00D8FF00D8FF00D8FF40ABBF81818100D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF4E9FAE8282828787878C8C8C90909092929293
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939393939393939393939393939393939393939393939393939393
          9393939393939494949595959696969A9A9A9F9F9FA6A6A6AEAEAEA3A3A36969
          694646464646464646464646464646465656568F8F8FB8B8B8B1B1B1AAAAAAA4
          A4A49F9F9F9B9B9B7BA3AB6DA4AD6AA1AA689EA8689EA8689EA86AA0AA7C979C
          8F8F8F8795976AA1AA46B2C546B1C54EADBE7A959A8E8E8E9191919595959999
          999B9B9B9C9C9C9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
          9D9D9D9D9D9D9D9D9D9D9D9E9E9E9F9F9FA0A0A0A2A2A2A5A5A5AAAAAAB1B1B1
          B8B8B88E8E8E5555554646464646464646464646464646464646466C6C6C9F9F
          9FBCBCBCB6B6B6B0B0B0ADADADA8A8A8A5A5A5A2A2A29F9F9F9D9D9D9C9C9C9D
          9D9D9D9D9D9D9D9D9E9E9E9E9E9E9D9D9D9C9C9C9B9B9B9B9B9B9C9C9C9E9E9E
          A0A0A0A3A3A3A4A4A4A6A6A6A6A6A6A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A8A8A8A8A8A8A8A8A8A8A8A8A9A9A9AAAAAAABABABAEAEAEB1
          B1B1B6B6B6BCBCBC9F9F9F6C6C6C464646464646464646464646464646464646
          4646464B4B4B727272A2A2A2C2C2C2BDBDBDB8B8B8B6B6B6B3B3B3B1B1B1AFAF
          AFAEAEAEAEAEAEADADADADADADAEAEAEAEAEAEAEAEAEAEAEAEADADADACACACAC
          ACACADADADAEAEAEAFAFAFB1B1B1B1B1B1B1B1B1B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3B3B3B3B3B3B3B4B4B4B5B5
          B5B7B7B7B9B9B9BDBDBDC2C2C2A2A2A27373734B4B4B46464646464646464646
          46464646464646464646464646464C4C4C7070709E9E9EC1C1C1C4C4C4C1C1C1
          BFBFBFBEBEBEBDBDBDBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
          BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BEBEBEBFBFBFC0C0C0C2C2C2C4C4C4C1C1C19D9D9D7070704C4C4C4646464646
          464646464646464646464646464646464646464646464646464747475F5F5F76
          7676989898AFAFAFBABABAC6C6C6C8C8C8C8C8C8C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
          C7C7C7C7C7C8C8C8C8C8C8C6C6C6BABABAB0B0B09898987676765F5F5F474747
          4646464646464646464646464646464646464646464646464646464646464646
          464646464646464848485959596767676F6F6F77777779797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          7979797979797979797979797979797979797979797979797979797979797979
          797979797979797979797979797979797979797777776F6F6F68686859595948
          4848464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646}
        Bitmaps.TransparentColor = clOlive
        Bitmaps.Up.Data = {
          9E2E0000424D9E2E000000000000360000002800000078000000210000000100
          180000000000682E0000120B0000120B00000000000000000000464646464646
          4646464646464646464646464646464646464646464747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474746464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646474747474747474747474747474747474747
          4747474848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484848484848484848484848484848484848484848484848484848
          4848484848484747474747474747474747474747474747474747474646464646
          4646464646464646464646464647474747474747474747474747474748484848
          48484848484949494949494949494949494A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A494949494949494949494949484848484848484848474747
          4747474747474747474747474646464646464747474747474747474848484848
          484949494949494A4A4A4A4A4A4B4B4B4A4A4A4B4B4B4B4B4B4B4B4B4B4B4B4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B4B4B4B4B4A4A4A4A4A4A49494949
          4949484848494949484848484848474747474747474747474747474747484848
          4848484949494949494A4A4A4B4B4B4B4B4B4C4C4C4C4C4C4C4C4C4D4D4D4C4C
          4C4D4D4D4D4D4D4C4C4C4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4B4B4B4B4B
          4B4B4B4B4A4A4A4A4A4A49494949494948484848484848484848484847474747
          47474848484848484949494A4A4A4B4B4B4B4B4B4D4D4D4D4D4D4E4E4E4D4D4D
          4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E
          4D4D4D4C4C4C4C4C4C4C4C4C4B4B4B4A4A4A4A4A4A4949494949494848484848
          484747474848484747474949494A4A4A4B4B4B4C4C4C4D4D4D4E4E4E4F4F4F4F
          4F4F4F4F4F4F4F4F4F4F4F5050505050505050504F4F4F505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          5050505050505050505050505050505050505050505050505050505050505050
          50504F4F4F4F4F4F4E4E4E4E4E4E4C4C4C4C4C4C4B4B4B4B4B4B4A4A4A494949
          4949494848484949494949494848484848484A4A4A4B4B4B4D4D4D4E4E4E4F4F
          4F50505050505051515151515151515151515151515152525252525252525253
          5353525252525252535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          5353535353535353535353535353535353535353535353535353535353535353
          535252525252525252525252525151515050505050504F4F4F4D4D4D4C4C4C4B
          4B4B4A4A4A4949494949494848484848484848484949494848484B4B4B4D4D4D
          4E4E4E5050505151515252525353535353535454545454545555555555555656
          5657575757575757575758585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585858585858585858585858585858585858
          5858585858585858585858585858585757575757575656565555555454545252
          525151514F4F4F4D4D4D4B4B4B4A4A4A49494948484848484848484848484849
          49494D4D4D4F4F4F5151515252525454545555555555555F5F5F959595C6C6C6
          DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFDEDEDEC5C5C59494945959594E4E4E4C4C4C4A4A4A4949494848
          484848484848484848484F4F4F5050505353535555555757575C5C5CABABABF5
          F5F5C3D3F48CABEA6E96E54578DD4276DC4074DC3F74DC3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB
          3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73
          DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E73DB3E
          73DB3F74DC4074DC4276DC4578DD6E96E58CABEAC1D2F3F5F5F5AAAAAA545454
          4C4C4C4A4A4A4949494848484949494949495151515353535555555757576D6D
          6DE2E2E2B8CCF25F8CE24277DC3A72DA346CD83069D82C67D62A66D62A65D72A
          66D82A66D82A66D82A65D72A65D62964D62964D62964D52964D52964D52964D5
          2964D62A65D62A65D72A66D82A66D82A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A
          66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D9
          2A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66D92A66
          D92A66D92A66D92A66D92A66D92B67D92D68D9306ADA346DDA3A72DB4277DD5D
          8AE2B8CCF2E1E1E16565654D4D4D4A4A4A494949484848494949525252555555
          5858586B6B6BECECECA7C0F0477CDF3972DC2E69D92663D7205FD51D5BD21B5A
          D11959D1195AD3195AD4195AD4195AD4195AD41859D11857CF1856CC1856CB18
          56CA1856CA1856CB1857CE1858CF1859D2195AD4195AD5195BD6195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195B
          D7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD719
          5BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7195BD7
          195BD7195BD7195BD7195BD7195BD7195BD71A5CD71A5CD71C5DD81E5ED82161
          D92664DA2E6ADB3972DD477CDFA7C0F0EBEBEB6262624C4C4C49494949494949
          49495454545757575A5A5AD5D5D5A9C2F1467CE13671DE2867DB1E5FD71659D3
          1255D00F51CC0D50CA0D50CA0C50CE0D51D00C51D30C51D20C50D00B4FCC0B4D
          C70B4CC40B4AC00B4ABF0B4AC00B4BC30B4CC60B4ECA0C50CF0C51D20C52D40C
          53D60C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D7
          0C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53
          D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70C
          53D70C53D70C53D70C53D70C53D70C53D70C53D70C53D70D54D70D54D70E55D7
          0E55D71056D81358D8175BD91E60DA2867DC3671DE467CE1A9C2F1D2D2D24F4F
          4F4B4B4B4A4A4A4A4A4A5656565959598F8F8FCFDDF84B82E33875E12769DE1A
          5FDA1158D70B52D1074ECB064CC5054AC30549C5044BCA044DCE044ED1044ED2
          044DCF044BC80448C00345BA0344B50343B40344B60346BA0448C0044AC7044D
          CD044ED20450D60451D80451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D9
          0451D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451
          D90451D90451D90451D90451D90451D90451D90451D90451D90451D90451D904
          51D90451D90551D90652D90753D90854D90C56DA115ADB1A60DC2769DE3774E0
          4B82E3CFDDF88686864D4D4D4B4B4B4A4A4A5757575B5B5BCCCCCC8CB0EE3F7B
          E32C6EE01C63DE105AD90852D4054DCC0249C40146BC0145B90044BA0047C100
          49C8004BCD004CCE004ACB0047C20043B70040AE003EA8003DA6003EA80040AE
          0043B70047C0004ACB004DD1004ED6004FD80050DA0050DA0050DA0050DA105B
          DC407CE3407CE32066DF0050DA0050DA0050DA0050DA0050DA0050DA0050DA00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA3071E1407CE3407CE3105BDC0050DA0050DA0050DA0050DA0050DA00
          50DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA
          0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050DA0050
          DA0050DA0050DA0050DA0050DA0050DA0151DA0151DA0251DA0453DB0855DB10
          5BDC1C63DE2C6EE03F7BE38CB0EEC9C9C94F4F4F4C4C4C4B4B4B5959595D5D5D
          ECECEC6294EA3677E4246AE21560E00A58DB0452D5024CCB00B4EF00D8FF00D8
          FF0042B10044B90048C1004AC8004CCC006ED700D8FF00D8FF00D8FF00D8FF00
          D8FF00D8FF00D8FF00B3EC0047C0004CCC004ED30050D90051DB0052DD0052DD
          105DDF8FB3F0FFFFFFFFFFFFFFFFFFFFFFFFCFDEF9AFC9F4FFFFFFCFDEF90052
          DD0052DD0052DD8FB3F0FFFFFFCFDEF9407DE6FFFFFFFFFFFFFFFFFFFFFFFFDF
          E9FB9FBEF22068E10052DD5088E8FFFFFFFFFFFF105DDF0052DD0052DD5088E8
          FFFFFFFFFFFF6093EAEFF4FDFFFFFFFFFFFFFFFFFFFFFFFF9FBEF2105DDF0052
          DD0052DD407DE6FFFFFFFFFFFF0052DD0052DD0052DD7FA8EEFFFFFFBFD4F600
          52DD0052DD105DDFEFF4FDFFFFFFEFF4FDFFFFFFFFFFFF105DDF0052DD0052DD
          5088E8FFFFFFFFFFFF105DDFFFFFFFFFFFFF407DE60052DD0052DD7FA8EEFFFF
          FFFFFFFF6295EA0A59DE1560E0246AE23677E45E91E9EFEFEF5151514E4E4E4C
          4C4C5A5A5A5E5E5EFDFDFD4985E83176E51F6AE31160E10759DC0252D5004DC9
          00B4EE00D8FF00D8FF0040A90043B10047B9004AC3004CC80066D200D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF00D8FF00B3EC004AC2004ECE0052D60054DC00
          55DE0055DF0055DFAFCAF5FFFFFFFFFFFF9FBFF37FAAEFAFCAF5FFFFFF70A0ED
          FFFFFFFFFFFF206AE30055DF0055DFDFEAFBFFFFFF70A0ED4080E7FFFFFFFFFF
          FFBFD4F7BFD4F7FFFFFFFFFFFFEFF4FD3075E50055DFEFF4FDFFFFFF6095EB00
          55DF0055DF9FBFF3FFFFFFAFCAF57FAAEFEFF4FD8FB4F14080E74080E7AFCAF5
          FFFFFFAFCAF50055DF0055DF4080E7FFFFFFFFFFFF0055DF0055DF0055DF7FAA
          EFFFFFFFBFD4F70055DF0055DFCFDFF9FFFFFFEFF4FD206AE3EFF4FDFFFFFF60
          95EB0055DF0055DF9FBFF3FFFFFFAFCAF50055DFFFFFFFFFFFFF4080E70055DF
          508AE9FFFFFFFFFFFF8FB4F10256DF075AE01160E11F6AE33176E54684E8FFFF
          FF5353534E4E4E4D4D4D5B5B5B5F5F5FFFFFFF4383EA2D75E71C69E50F61E406
          5ADF0154D6004ECA00B4EE00D8FF00D8FF003FA30042AA0045B40049BF004CC7
          004DC90078D800CFFB00D8FF00B2EA0049AB003FA40042AA0046B6004BC30050
          CF0054D90056DE0057E10057E23077E7FFFFFFFFFFFF4081E90057E20057E200
          57E23077E7206CE6DFEAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF206CE6
          4081E9FFFFFFFFFFFF0057E20057E21062E4AFCAF6FFFFFFDFEAFB0057E29FC0
          F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6096ED4081E91062E40057E200
          57E20057E2508CEBFFFFFFFFFFFF0057E20057E24081E9FFFFFFFFFFFF0057E2
          0057E20057E27FABF0FFFFFFBFD5F80057E28FB5F2FFFFFFFFFFFF4081E90057
          E29FC0F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6096ED0057E2FFFFFFFF
          FFFF4081E9206CE6EFF4FDFFFFFFBFD5F80057E20158E2065BE30F61E41C69E5
          2D75E74383EAFFFFFF5454545050504E4E4E5C5C5C606060FFFFFF4184EC2C76
          E91A6BE80E63E6055CE20055D90050CC00B4EE00D8FF00D8FF003E9E0040A300
          44AC0048B7004CC2004FC8004FC90067CF00C6F700D8FF00C5F4005EB80043AC
          0047B5004DC40052D00056DB0059E1005AE4005AE57FACF2FFFFFFCFE0FA005A
          E5005AE5005AE5005AE5005AE5005AE57FACF2FFFFFFEFF5FD7FACF2CFE0FAFF
          FFFFBFD6F8005AE54083ECFFFFFFFFFFFF005AE5005AE5005AE5206FE8FFFFFF
          FFFFFF3079EA4083ECFFFFFFFFFFFF8FB7F4AFCBF7FFFFFFEFF5FD1064E7005A
          E5005AE5508EED9FC1F5CFE0FAFFFFFFFFFFFFDFEAFC005AE5005AE54083ECFF
          FFFFFFFFFF005AE5005AE5005AE57FACF2FFFFFFEFF5FDBFD6F8FFFFFFFFFFFF
          7FACF2005AE5005AE54083ECFFFFFFFFFFFF8FB7F4AFCBF7FFFFFFEFF5FD1064
          E7005AE5FFFFFFFFFFFFCFE0FADFEAFCFFFFFFEFF5FD1064E7005AE5005AE505
          5DE60E63E61A6BE82B76E94083ECFFFFFF5555555050504E4E4E5C5C5C616161
          FFFFFF4085ED2B77EB1A6DE90D64E8055EE30057DB0052CE00B5EF00D8FF00D8
          FF00B1E600B2E700B2E900B4EC0066C9004FC60050CA004FC70056C500BDF200
          D8FF00CFFA0057B70049B6004EC40053D10058DC005BE3005CE6005CE77FADF3
          FFFFFFBFD6F9005CE7005CE7005CE7005CE7005CE7005CE72070EAFFFFFFFFFF
          FF2070EADFEBFCFFFFFF6099F0005CE74085EDFFFFFFFFFFFF005CE7005CE700
          5CE7005CE7FFFFFFFFFFFF4085ED005CE7DFEBFCFFFFFF6099F09FC2F6FFFFFF
          9FC2F6005CE71066E9CFE0FAFFFFFFFFFFFFFFFFFFFFFFFFDFEBFC307BEC005C
          E7005CE74085EDFFFFFFFFFFFF005CE7005CE7005CE77FADF3FFFFFFEFF5FDBF
          D6F9CFE0FAFFFFFFEFF5FD508FEF005CE7005CE7DFEBFCFFFFFF6099F09FC2F6
          FFFFFF9FC2F6005CE7005CE7FFFFFFFFFFFFCFE0FABFD6F9EFF5FDFFFFFFBFD6
          F9005CE7005CE7055FE70D64E81A6DE92B77EB4085EDFFFFFF5656565151514E
          4E4E5C5C5C606060FFFFFF4188EF2C7BEE1A6FEC0E68EB0560E6005ADE0055D1
          00B6F000D8FF00D8FF00D8FF00D8FF00D8FF00D8FF0070CE0051C70053CC0052
          CA0050C4005EC400CFFA00D8FF00B4EB004BB80050C50056D3005ADE005EE600
          5FE9005FEA609BF2FFFFFFDFEBFC005FEA005FEA005FEA005FEA005FEA005FEA
          005FEACFE1FBFFFFFF9FC3F7FFFFFFFFFFFF1069EB005FEA4087EFFFFFFFFFFF
          FF005FEA005FEA005FEA4087EFFFFFFFFFFFFF2073ED005FEA8FB9F6FFFFFFAF
          CDF8EFF5FEFFFFFF5091F1005FEA70A5F3FFFFFFFFFFFFCFE1FB7FAFF44087EF
          005FEA005FEA005FEA005FEA4087EFFFFFFFFFFFFF005FEA005FEA005FEA7FAF
          F4FFFFFFBFD7FA005FEA005FEA70A5F3FFFFFFDFEBFC005FEA005FEA8FB9F6FF
          FFFFAFCDF8EFF5FEFFFFFF5091F1005FEA005FEAFFFFFFFFFFFF4087EF005FEA
          1069EBDFEBFCFFFFFF609BF2005FEA0562EA0E68EB1A6FEC2C7BEE4087EFFFFF
          FF5656565151514F4F4F5B5B5B606060FFFFFF438BF22D7DF01C72EF0F6AEE06
          63E9015DE20057D600B6F100D8FF00D8FF0068BB0069BC006BC1006EC80057C3
          0051C70053CC0053CA0050C4004DBC009ADE00D8FF00D8FF005EC30052C80057
          D5005CE1005FE90061EC0061ED2075EFFFFFFFFFFFFF7FB0F60061ED0061ED00
          61ED70A6F5307FF00061ED70A6F5FFFFFFFFFFFFFFFFFFAFCDF90061ED0061ED
          4089F2FFFFFFFFFFFF0061ED0061ED5093F3CFE1FCFFFFFFBFD7FA0061ED0061
          ED307FF0FFFFFFFFFFFFFFFFFFEFF5FE0061ED0061ED7FB0F6FFFFFFBFD7FA00
          61ED0061ED0061ED0061ED5093F30061ED0061ED4089F2FFFFFFFFFFFF0061ED
          0061ED0061ED7FB0F6FFFFFFBFD7FA0061ED0061ED5093F3FFFFFFFFFFFF0061
          ED0061ED307FF0FFFFFFFFFFFFFFFFFFEFF5FE0061ED0061ED0061EDFFFFFFFF
          FFFF4089F20061ED0061EDCFE1FCFFFFFF7FB0F60162ED0665ED0F6AEE1C72EF
          2D7DF0438BF2FFFFFF5555555151514F4F4F5A5A5A5F5F5FFDFDFD498FF33181
          F21F76F1116DF00867ED0260E6005ADA00B7F200D8FF00D8FF0047AB0047AC00
          49B0004CB8004FBF0052C7007DDB0053C80051C3004EBC009ADF00D8FF00D8FF
          0071CF0055CC005AD9005FE50061EB0063EE0063EF0063EF70A8F6FFFFFFFFFF
          FFDFEBFDBFD8FBEFF5FEFFFFFF408AF30063EF106DF0FFFFFFFFFFFFFFFFFF50
          94F40063EF0063EF408AF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFE2FC
          106DF00063EF0063EF0063EFCFE2FCFFFFFFFFFFFF8FBAF80063EF0063EF2077
          F1EFF5FEFFFFFF9FC4F97FB1F79FC4F9EFF5FEBFD8FBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFBFD8FB7FB1F7FFFFFFEFF5FEBFD8FBBFD8FBFFFFFF
          FFFFFFBFD8FB0063EF0063EF0063EFCFE2FCFFFFFFFFFFFF8FBAF80063EF0063
          EF0063EFFFFFFFFFFFFFCFE2FCBFD8FBDFEBFDFFFFFFFFFFFF408AF30264EF07
          67EF116DF01F76F13181F2468EF3FFFFFF5555555151514F4F4F5959595E5E5E
          EDEDED62A1F73686F5247CF41573F30A6BF00465EA0260E100B9F500D8FF00D8
          FF00B5ED00B5ED00B6EE00B6F00086DC0056CC00D8FF00C0F50096E200A5E800
          D8FF00D8FF00D8FF005DCD005AD6005FE10062E90065EF0066F10066F20066F2
          0066F25096F6BFD9FCFFFFFFFFFFFFDFECFD9FC5FA1070F30066F20066F28FBC
          F9BFD9FCBFD9FC0066F20066F20066F23083F4BFD9FCBFD9FCBFD9FCBFD9FC9F
          C5FA60A0F71070F30066F20066F20066F20066F260A0F7BFD9FCBFD9FC3083F4
          0066F20066F20066F22079F49FC5FAEFF5FEFFFFFFFFFFFFBFD9FC70A9F8BFD9
          FCBFD9FCBFD9FCBFD9FCBFD9FCBFD9FCBFD9FC8FBCF960A0F7BFD9FCBFD9FCBF
          D9FCBFD9FCBFD9FC70A9F81070F30066F20066F20066F260A0F7BFD9FCBFD9FC
          3083F40066F20066F20066F2BFD9FCBFD9FCBFD9FCBFD9FCBFD9FC9FC5FA418D
          F50267F20468F20A6CF31573F3247CF43686F55E9EF7EFEFEF5454545151514F
          4F4F5858585C5C5CCDCDCD8CBBFA3F8DF72C82F61C79F51070F3086AEE0566E8
          01BAF700D8FF00D8FF00D8FF00D8FF00D8FF00D8FF0099E9005BD600D8FF00D8
          FF00D8FF00D8FF00D8FF00D8FF0089E2005CD70060E10063E80066EE0067F200
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0068F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068
          F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F400
          68F40068F40068F40068F40068F40068F40068F40068F40068F40068F40068F4
          0169F40169F40269F4056BF4086DF41071F51C79F52C82F63F8DF78CBBFACACA
          CA5454545151514F4F4F5757575A5A5A909090CFE3FD4B96F9388BF92781F81A
          79F71172F40C6DEF077EEE0483EC0480E7037FE4037DE3037EE4037FE60371E4
          0463E2046AE50380E8029CEE029CED0294EA036FE00461DF0464E50466EA0469
          F0046BF4046CF6046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7
          046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046C
          F7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF7046CF704
          6CF7046CF7056DF7066EF7076EF7096FF70C71F71174F81A79F82781F8388BF9
          4B96F9D1E4FE8888885353535151514F4F4F5555555959595D5D5DD6D6D6AACE
          FD4694FB368BFA2882F91E7CF81777F61274F20F70EE0D6EEB0D6CE80C6BE70C
          6BE80B6CE90B6CEA0B6DEB0B6DEB0B6CEA0B6BE80B6BE70B6BE70B6BE80B6DEB
          0C6EEF0C70F30C71F50C72F70C73F80C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C
          73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F9
          0C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73F90C73
          F90C73F90C73F90D73F90D73F90E74F90E74F91075F91377F91779FA1E7DFA28
          83FA368BFA4694FBA9CDFDD4D4D45656565353535151514F4F4F535353565656
          5A5A5A6F6F6FEBEBEBA7CDFD4796FC398EFC2E87FB2683FA217FF91E7DF71B7B
          F5197AF4197AF41879F41879F41879F51879F51879F51879F51879F41878F318
          78F31879F41879F5197AF7197BF9197CFA197CFA197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197C
          FB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB19
          7CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB197CFB
          197CFB197CFB197CFB197CFB197CFB197CFB1A7DFB1A7DFB1C7EFB1E7FFB2181
          FC2684FC2E88FC398EFC4796FCA7CDFDECECEC6A6A6A5555555353535050504F
          4F4F5151515454545858585B5B5B727272E3E3E3B8D7FE5FA4FD4294FD3A8FFC
          348BFC3089FC2D87FC2B86FC2A86FB2A86FB2A86FB2A86FB2A86FB2A86FB2A86
          FB2A86FA2A86FA2A86FA2A86FA2A86FB2A86FB2A86FB2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC
          2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87
          FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A
          87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2A87FC2B87FD
          2D88FD308AFD348CFD3A90FD4294FD5FA4FDB8D7FEE2E2E26D6D6D5757575454
          545252525050504D4D4D4F4F4F5151515454545858585B5B5B626262AFAFAFF6
          F6F6C3DDFF8EC0FE6EAEFE4D9CFE4296FE4095FE3F94FE3F94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E
          94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE
          3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94
          FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3E94FE3F
          94FE3F94FE4095FE4296FE4D9CFE6EAEFE8CBFFEC3DDFFF6F6F6ADADAD5E5E5E
          5858585555555353535050504E4E4E4C4C4C4D4D4D4F4F4F5252525454545757
          575A5A5A5C5C5C6767679B9B9BC8C8C8E0E0E0FAFAFAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE0E0E0C9C9C999999965
          65655B5B5B5757575656565353535151514E4E4E4D4D4D4B4B4B4B4B4B4D4D4D
          4F4F4F5151515454545656565858585A5A5A5C5C5C5E5E5E5F5F5F6060606060
          6061616161616161616162626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626262626262626262626262626262626262
          6262626262626262626262626262626161616161616161616060605F5F5F5E5E
          5E5D5D5D5B5B5B5959595757575555555353535050504F4F4F4D4D4D4B4B4B4A
          4A4A}
        Color = clBtnFace
        ButtonSize = bszNeither
        DragCursor = crHandPoint
        TabOrder = 10
      end
    end
  end
  object RzBalloonHints1: TRzBalloonHints
    Bitmaps.TransparentColor = clOlive
    CaptionWidth = 150
    FrameColor = cl3DDkShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    HintShortPause = 400
    Left = 572
    Top = 564
  end
  object zQryCadGeral: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    Params = <>
    Left = 84
    Top = 252
  end
  object dsCadGeral: TDataSource
    DataSet = zQryCadGeral
    Left = 87
    Top = 299
  end
  object zQryGeral: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    Params = <>
    Left = 148
    Top = 252
  end
  object dsGeral: TDataSource
    DataSet = zQryGeral
    Left = 151
    Top = 299
  end
  object zQryLkpTipoPagto: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Descricao from TiposPagamento'
      'order by Descricao'
      ' ')
    Params = <>
    Left = 220
    Top = 252
  end
  object dsLkpTipoPagto: TDataSource
    DataSet = zQryLkpTipoPagto
    Left = 223
    Top = 299
  end
  object zQryDelete: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    Params = <>
    Left = 148
    Top = 356
  end
  object dsDelete: TDataSource
    DataSet = zQryDelete
    Left = 151
    Top = 403
  end
  object popOpcoes: TPopupMenu
    Left = 439
    Top = 174
    object Excluir1: TMenuItem
      Caption = 'Excluir'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
    end
  end
end
