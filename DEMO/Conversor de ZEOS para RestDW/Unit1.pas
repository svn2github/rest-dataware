unit Unit1;

interface

implementation

{

object frmCadAcertoEstoque: TfrmCadAcertoEstoque
  Left = 526
  Top = 269
  AlphaBlend = True
  BorderStyle = bsNone
  Caption = 'Mikromundo NAUTILUS - Copyright 1998-2009 by Flávio Motta'
  ClientHeight = 705
  ClientWidth = 1131
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
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
    Width = 792
    Height = 600
    Align = alCustom
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 0
    object pgGeral: TRzPageControl
      Left = 3
      Top = 67
      Width = 789
      Height = 479
      ActivePage = tabGeral
      ActivePageDefault = tabGeral
      Color = 15790320
      UseColoredTabs = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HotTrackColor = clBlack
      ParentColor = False
      ParentFont = False
      TabColors.HighlightBar = 33023 //  17
      TabIndex = 0
      TabOrder = 0
      TextColors.Selected = clMaroon
      TextColors.Unselected = clGray
      OnChange = pgGeralChange
      FixedDimension = 19
      object tabGeral: TRzTabSheet
        Color = clWhite
        Caption = '&1. Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        object paDados: TRzPanel
          Left = 3
          Top = 6
          Width = 779
          Height = 447
          BorderOuter = fsFlatRounded
          Color = 15790320
          TabOrder = 0
          object Shape4: TShape
            Left = 192
            Top = 384
            Width = 173
            Height = 57
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
            Visible = False
          end
          object Shape5: TShape
            Left = 372
            Top = 394
            Width = 144
            Height = 43
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
            Visible = False
          end
          object lab: TRzLabel
            Left = 12
            Top = 7
            Width = 89
            Height = 13
            AutoSize = False
            Caption = 'Codigo'
            Color = 15984858
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object Shape9: TShape
            Left = 12
            Top = 384
            Width = 161
            Height = 57
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel22: TRzLabel
            Left = 17
            Top = 378
            Width = 41
            Height = 15
            AutoSize = False
            Caption = '  Ítens   '
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object RzLabel62: TRzLabel
            Left = 481
            Top = 400
            Width = 47
            Height = 13
            AutoSize = False
            Caption = 'A Receb.'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel16: TRzLabel
            Left = 581
            Top = 400
            Width = 44
            Height = 13
            AutoSize = False
            Caption = '&Recebido'
            Color = 15984858
            FocusControl = edCliPagara
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel17: TRzLabel
            Left = 673
            Top = 400
            Width = 44
            Height = 13
            AutoSize = False
            Caption = 'Troco'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel23: TRzLabel
            Left = 21
            Top = 400
            Width = 47
            Height = 13
            AutoSize = False
            Caption = 'Entrada'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel3: TRzLabel
            Left = 599
            Top = 4
            Width = 90
            Height = 13
            AutoSize = False
            Caption = 'Senha'
            Color = 15984858
            FocusControl = edCodiCli
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel44: TRzLabel
            Left = 627
            Top = 8
            Width = 61
            Height = 13
            AutoSize = False
            Caption = 'N° Vendas'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel5: TRzLabel
            Left = 354
            Top = 4
            Width = 241
            Height = 13
            AutoSize = False
            Caption = 'Usuário'
            Color = 15984858
            FocusControl = edCodiFunc
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object labApoio: TRzLabel
            Left = 248
            Top = 98
            Width = 48
            Height = 13
            AutoSize = False
            Caption = 'Apoio'
            Color = 15984858
            FocusControl = edApoio
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel78: TRzLabel
            Left = 190
            Top = 98
            Width = 50
            Height = 13
            AutoSize = False
            Caption = 'Atual'
            Color = 15984858
            FocusControl = edAtual
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel34: TRzLabel
            Left = 12
            Top = 99
            Width = 180
            Height = 13
            AutoSize = False
            Caption = '&Produto ( Cód/Descr/Ref/@aplic )'
            Color = 15984858
            FocusControl = edPeca
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel35: TRzLabel
            Left = 314
            Top = 98
            Width = 68
            Height = 13
            AutoSize = False
            Caption = 'Qtde Entrada'
            Color = 15984858
            FocusControl = edQtde
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel4: TRzLabel
            Left = 381
            Top = 386
            Width = 56
            Height = 15
            AutoSize = False
            Caption = ' Situação '
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Visible = False
            BlinkIntervalOff = 700
            ShadowColor = clSilver
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object labSituacao: TRzLabel
            Left = 373
            Top = 406
            Width = 142
            Height = 24
            Alignment = taCenter
            AutoSize = False
            Caption = 'Situação'
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Visible = False
            Blinking = True
            BlinkColor = 15790320
            BlinkIntervalOff = 700
            ShadowColor = clSilver
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object RzLabel110: TRzLabel
            Left = 201
            Top = 402
            Width = 47
            Height = 13
            AutoSize = False
            Caption = 'Desconto'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel111: TRzLabel
            Left = 335
            Top = 404
            Width = 19
            Height = 12
            AutoSize = False
            Caption = '%'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel6: TRzLabel
            Left = 201
            Top = 378
            Width = 60
            Height = 15
            AutoSize = False
            Caption = 'Desconto'
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Visible = False
            BlinkIntervalOff = 700
            ShadowColor = clSilver
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object RzLabel13: TRzLabel
            Left = 335
            Top = 420
            Width = 19
            Height = 12
            AutoSize = False
            Caption = 'R$'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel15: TRzLabel
            Left = 196
            Top = 7
            Width = 88
            Height = 13
            AutoSize = False
            Caption = 'Data Fechamento'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel26: TRzLabel
            Left = 12
            Top = 47
            Width = 104
            Height = 13
            AutoSize = False
            Caption = 'Data Cadastro'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel18: TRzLabel
            Left = 688
            Top = -2
            Width = 33
            Height = 15
            AutoSize = False
            Caption = ' Tipo'
            Color = 15790320
            FocusControl = rgTipo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Visible = False
            BlinkIntervalOff = 700
            ShadowColor = clSilver
            ShadowDepth = 1
            TextStyle = tsShadow
          end
          object labApoioSai: TRzLabel
            Left = 430
            Top = 98
            Width = 55
            Height = 13
            AutoSize = False
            Caption = 'Qtde Saída'
            Color = 15984858
            FocusControl = edQtdeSai
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel1: TRzLabel
            Left = 112
            Top = 48
            Width = 241
            Height = 13
            AutoSize = False
            Caption = 'Motivo'
            Color = 15984858
            FocusControl = edEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel12: TRzLabel
            Left = 544
            Top = 99
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Corred./ Est.'
            Color = 15984858
            FocusControl = edCorredor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel19: TRzLabel
            Left = 616
            Top = 99
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Prateleira'
            Color = 15984858
            FocusControl = edPrateleira
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel20: TRzLabel
            Left = 93
            Top = 400
            Width = 47
            Height = 13
            AutoSize = False
            Caption = 'Saída'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object Shape6: TShape
            Left = 530
            Top = 12
            Width = 241
            Height = 82
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel24: TRzLabel
            Left = 534
            Top = 2
            Width = 33
            Height = 15
            AutoSize = False
            Caption = ' Tipo'
            Color = 15790320
            FocusControl = RzDBRadioGroup1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object edLkpCliente: TRzDBLookupComboBox
            Left = 327
            Top = 11
            Width = 154
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            Ctl3D = False
            DataField = 'CODICLI'
            DataSource = dm.dsOSes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            KeyField = 'CODIGO'
            ListField = 'NOME'
            ListSource = dsLkpCliente
            NullValueKey = 46
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 15
            Visible = False
            FlatButtons = True
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotStyle = fsFlat
            FrameHotTrack = True
            FrameSides = []
            FrameVisible = True
            TabOnEnter = True
          end
          object edDataSai: TRzDBDateTimeEdit
            Left = 336
            Top = 19
            Width = 93
            Height = 21
            Hint = 
              'Só mude esta data se for informar venda'#13'retroativa, se não , o p' +
              'róprio sistema a'#13'utilizará no fechamento da venda.'
            DataSource = dm.dsOSes
            DataField = 'DTFECHAMENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 11
            Visible = False
            CaptionTodayBtn = 'Hoje'
            CaptionClearBtn = 'Limpa'
            HowToUseMsg = 'Digite ou Selecione uma data'#13'clicando na seta ao lado'
            EditType = etDate
            Format = 'dd/mm/yyyy'
            FlatButtons = True
          end
          object edCodigo: TRzDBEdit
            Left = 12
            Top = 23
            Width = 75
            Height = 19
            DataSource = dm.dsAcertos_Estoque
            DataField = 'CODIGO'
            ReadOnly = True
            Alignment = taRightJustify
            AutoSize = False
            Color = clSkyBlue
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnlyColor = clSkyBlue
            TabOnEnter = True
            TabOrder = 0
            OnKeyPress = edCodigoKeyPress
          end
          object RzDBNumericEdit9: TRzDBNumericEdit
            Left = 482
            Top = 415
            Width = 90
            Height = 19
            DataSource = dsTotaliza_OS
            DataField = 'TOTAL_GERAL'
            ReadOnly = True
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 18
            Visible = False
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object edCliPagara: TRzDBNumericEdit
            Left = 578
            Top = 415
            Width = 90
            Height = 19
            Hint = 
              'No Caso de Uma ENTREGA, é o valor'#13'que o cliente pagará, igual ou' +
              ' a mais'#13'que o total da venda.'
            DataSource = dm.dsOSes
            DataField = 'CLI_PAGARA'
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 16
            Visible = False
            IntegersOnly = False
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object edTroco: TRzDBNumericEdit
            Left = 674
            Top = 415
            Width = 90
            Height = 19
            DataSource = dm.dsOSes
            DataField = 'TROCO'
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 17
            Visible = False
            IntegersOnly = False
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object edDescrPeca: TRzEdit
            Left = 120
            Top = 138
            Width = 653
            Height = 34
            AutoSize = False
            CharCase = ecUpperCase
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = [sdTop]
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            ReadOnlyColor = clSkyBlue
            TabOnEnter = True
            TabOrder = 19
          end
          object gridPecas: TRzDBGrid
            Left = 12
            Top = 176
            Width = 761
            Height = 197
            BorderStyle = bsNone
            Color = clInfoBk
            DataSource = dm.dsAcertos_Estoque_Pecas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentFont = False
            TabOrder = 20
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            DisabledColor = clWhite
            FrameHotColor = clRed
            FrameHotStyle = fsFlat
            FrameVisible = True
          end
          object RzDBNumericEdit1: TRzDBNumericEdit
            Left = 22
            Top = 415
            Width = 67
            Height = 19
            DataSource = dm.dsAcertos_Estoque
            DataField = 'QTDE_ENTRADA'
            ReadOnly = True
            AutoSize = False
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            ReadOnlyColor = clSkyBlue
            TabOnEnter = True
            TabOrder = 21
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object edCodiCli: TRzDBEdit
            Left = 552
            Top = 23
            Width = 89
            Height = 21
            DataSource = dm.dsOSes
            DataField = 'CODICLI'
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 14
            Visible = False
          end
          object btnAdiCli: TRzButton
            Left = 605
            Top = 22
            Width = 19
            Height = 21
            Hint = 'Adiciona novo Cliente'
            Caption = '+'
            Color = 8421631
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TextShadowColor = 5460819
            TextShadowDepth = 1
            TabOrder = 22
            TextStyle = tsShadow
            Visible = False
          end
          object edVisitas: TRzMaskEdit
            Left = 599
            Top = 3
            Width = 53
            Height = 19
            AutoSize = False
            CharCase = ecUpperCase
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOnEnter = True
            TabOrder = 23
            Visible = False
          end
          object edCodiFunc: TRzDBEdit
            Left = 355
            Top = 19
            Width = 40
            Height = 21
            DataSource = dm.dsOSes
            DataField = 'CODIFUNC'
            Alignment = taRightJustify
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 12
            Visible = False
            OnKeyPress = edCodigoKeyPress
          end
          object edLkpFuncionario: TRzDBLookupComboBox
            Left = 354
            Top = 23
            Width = 127
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            Ctl3D = False
            DataField = 'CODIFUNC'
            DataSource = dm.dsOSes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            KeyField = 'CODIGO'
            ListField = 'NOME'
            ListSource = dsLkpFuncionario
            NullValueKey = 46
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 13
            Visible = False
            FlatButtons = True
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotStyle = fsFlat
            FrameHotTrack = True
            FrameSides = []
            FrameVisible = True
            TabOnEnter = True
          end
          object RzButton1: TRzButton
            Left = 568
            Top = 18
            Width = 19
            Height = 21
            Hint = 'Adiciona novo Funcionário'
            Caption = '+'
            Color = 8421631
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TextShadowColor = 5460819
            TextShadowDepth = 1
            TabOrder = 24
            TextStyle = tsShadow
            Visible = False
          end
          object RzButton6: TRzButton
            Left = 728
            Top = 113
            Width = 45
            Height = 21
            Hint = 'Exclui a(s) Peça(s) Selecionada(s)'
            Caption = '&Exclui'
            Color = 8421631
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TextShadowColor = 5460819
            TextShadowDepth = 1
            TabOrder = 25
            TextStyle = tsShadow
            OnClick = RzButton6Click
          end
          object btnIncPecas: TRzButton
            Left = 680
            Top = 113
            Width = 45
            Height = 21
            Hint = 'Adiciona novas Peças/Produtos'#13'na lista abaixo'
            Caption = '&Inclui'
            Color = 8421631
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
            OnClick = btnIncPecasClick
          end
          object cbApoio: TRzCheckGroup
            Left = 361
            Top = 112
            Width = 56
            Height = 25
            Hint = 'Marque esta opção se a saída é'#13'sem NF'
            BorderSides = [sdTop]
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            GroupStyle = gsCustom
            ItemHotTrack = True
            ItemFont.Charset = DEFAULT_CHARSET
            ItemFont.Color = 12615680
            ItemFont.Height = -9
            ItemFont.Name = 'Tahoma'
            ItemFont.Style = [fsBold]
            Items.Strings = (
              '&Apoio')
            ParentFont = False
            TabOnEnter = True
            TabOrder = 5
            Visible = False
            CheckStates = (
              0)
          end
          object edApoio: TRzNumericEdit
            Left = 248
            Top = 114
            Width = 51
            Height = 19
            AutoSize = False
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 26
            Visible = False
            IntegersOnly = False
            DisplayFormat = ',###,##0.00;-,###,##0.00'
          end
          object edAtual: TRzNumericEdit
            Left = 190
            Top = 114
            Width = 51
            Height = 19
            AutoSize = False
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 27
            IntegersOnly = False
            DisplayFormat = ',###,##0.00;-,###,##0.00'
          end
          object edQtde: TRzNumericEdit
            Left = 314
            Top = 114
            Width = 49
            Height = 19
            AutoSize = False
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
            ParentFont = False
            TabOnEnter = True
            TabOrder = 4
            OnEnter = edQtdeEnter
            IntegersOnly = False
            DisplayFormat = ',###,##0.00;-,###,##0.00'
          end
          object edPeca: TRzEdit
            Left = 12
            Top = 114
            Width = 161
            Height = 19
            Hint = 
              'Digite o Código do Sistema ou '#13'código de barras ou'#13'referência ou' +
              ' Equivalência ou'#13'parte da descricao do produto.         '#13#13'Obs.: ' +
              'colocando um ''@'' após'#13'a descricao do prod. desejado'#13'critica-se t' +
              'ambém a aplicação.'
            AutoSize = False
            CharCase = ecUpperCase
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
            ParentFont = False
            TabOnEnter = True
            TabOrder = 3
            OnExit = edPecaExit
          end
          object edDescPecaPorc: TRzDBNumericEdit
            Left = 252
            Top = 397
            Width = 74
            Height = 19
            Hint = 
              'O Desconto aqui informado '#13'será ratiado e adicionado'#13'a cada item' +
              ' de produto.'
            DataSource = dm.dsOSes
            DataField = 'DESCONTOPECAPORC'
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 28
            Visible = False
            IntegersOnly = False
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object edDescPecaVal: TRzDBNumericEdit
            Left = 252
            Top = 417
            Width = 74
            Height = 19
            Hint = 
              'O Desconto aqui informado '#13'será ratiado e adicionado'#13'a cada item' +
              ' de produto.'
            DataSource = dm.dsOSes
            DataField = 'DESCONTOPECAS'
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 29
            Visible = False
            IntegersOnly = False
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object edCodiInterno: TRzEdit
            Left = 12
            Top = 138
            Width = 104
            Height = 34
            AutoSize = False
            CharCase = ecUpperCase
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = [sdTop]
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            ReadOnlyColor = clSkyBlue
            TabOnEnter = True
            TabOrder = 30
          end
          object edDataCad: TRzDBDateTimeEdit
            Left = 12
            Top = 63
            Width = 93
            Height = 21
            DataSource = dm.dsAcertos_Estoque
            DataField = 'DTCADASTRO'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameSides = [sdRight, sdBottom]
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 1
            CaptionTodayBtn = 'Hoje'
            CaptionClearBtn = 'Limpa'
            HowToUseMsg = 'Digite ou Selecione uma data'#13'clicando na seta ao lado'
            EditType = etDate
            Format = 'dd/mm/yyyy'
            FlatButtons = True
          end
          object rgTipo: TRzDBRadioGroup
            Left = 766
            Top = 15
            Width = 85
            Height = 102
            DataField = 'TIPOOS'
            DataSource = dm.dsOSes
            Items.Strings = (
              'Orçamento'
              'OS. / Venda'
              'Garantia'
              'Transfer.'
              'Acerto')
            Values.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5')
            Color = 15790320
            Ctl3D = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GroupStyle = gsCustom
            ItemHotTrack = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 31
            Visible = False
          end
          object cbApoioSai: TRzCheckGroup
            Left = 477
            Top = 112
            Width = 56
            Height = 25
            Hint = 'Marque esta opção se a saída é'#13'sem NF'
            BorderSides = [sdTop]
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            GroupStyle = gsCustom
            ItemHotTrack = True
            ItemFont.Charset = DEFAULT_CHARSET
            ItemFont.Color = 12615680
            ItemFont.Height = -9
            ItemFont.Name = 'Tahoma'
            ItemFont.Style = [fsBold]
            Items.Strings = (
              '&Apoio')
            ParentFont = False
            TabOnEnter = True
            TabOrder = 7
            Visible = False
            CheckStates = (
              0)
          end
          object edQtdeSai: TRzNumericEdit
            Left = 430
            Top = 114
            Width = 49
            Height = 19
            AutoSize = False
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
            ParentFont = False
            TabOnEnter = True
            TabOrder = 6
            IntegersOnly = False
            DisplayFormat = ',###,##0.00;-,###,##0.00'
          end
          object edEquipamento: TRzDBEdit
            Left = 113
            Top = 63
            Width = 412
            Height = 21
            DataSource = dm.dsAcertos_Estoque
            DataField = 'EQUIPAMENTO'
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
            MaxLength = 130
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 2
          end
          object edCorredor: TRzEdit
            Left = 544
            Top = 114
            Width = 65
            Height = 19
            Hint = 
              'Digite o Código do Sistema ou '#13'código de barras ou'#13'referência ou' +
              ' Equivalência ou'#13'parte da descricao do produto.         '#13#13'Obs.: ' +
              'colocando um ''@'' após'#13'a descricao do prod. desejado'#13'critica-se t' +
              'ambém a aplicação.'
            AutoSize = False
            CharCase = ecUpperCase
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
            ParentFont = False
            TabOnEnter = True
            TabOrder = 8
          end
          object edPrateleira: TRzEdit
            Left = 616
            Top = 114
            Width = 65
            Height = 19
            Hint = 
              'Digite o Código do Sistema ou '#13'código de barras ou'#13'referência ou' +
              ' Equivalência ou'#13'parte da descricao do produto.         '#13#13'Obs.: ' +
              'colocando um ''@'' após'#13'a descricao do prod. desejado'#13'critica-se t' +
              'ambém a aplicação.'
            AutoSize = False
            CharCase = ecUpperCase
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
            ParentFont = False
            TabOnEnter = True
            TabOrder = 9
          end
          object RzDBNumericEdit2: TRzDBNumericEdit
            Left = 94
            Top = 415
            Width = 67
            Height = 19
            DataSource = dm.dsAcertos_Estoque
            DataField = 'QTDE_SAIDA'
            ReadOnly = True
            AutoSize = False
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            ReadOnlyColor = clSkyBlue
            TabOnEnter = True
            TabOrder = 32
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object edRetorno: TRzEdit
            Left = 572
            Top = 67
            Width = 45
            Height = 19
            Text = 'KG'
            AutoSize = False
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = [sdTop]
            FrameVisible = True
            MaxLength = 3
            ParentFont = False
            TabOnEnter = True
            TabOrder = 33
            Visible = False
          end
          object cgIncluir: TRzCheckGroup
            Left = 192
            Top = 19
            Width = 144
            Height = 19
            Hint = 'Faz a inclusão automática do lançamento'
            BorderSides = [sdTop]
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GroupStyle = gsCustom
            ItemHotTrack = True
            Items.Strings = (
              'Incluir após o código')
            ParentFont = False
            TabOnEnter = True
            TabOrder = 34
            CheckStates = (
              0)
          end
          object RzDBCheckBox4: TRzDBCheckBox
            Left = 96
            Top = 23
            Width = 97
            Height = 19
            DataField = 'FRACIONAMENTO'
            DataSource = dm.dsAcertos_Estoque
            NullAsUnchecked = False
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            Caption = 'Fracionamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            HotTrack = True
            HotTrackColor = clRed
            ParentFont = False
            TabOnEnter = True
            TabOrder = 35
          end
          object RzDBRadioGroup1: TRzDBRadioGroup
            Left = 532
            Top = 15
            Width = 235
            Height = 73
            DataField = 'TIPOOS'
            DataSource = dm.dsAcertos_Estoque
            Items.Strings = (
              'Acerto de Estoque Padrão'
              'Troca Saída ( Saída para Distribuidora )'
              'Troca Entrada ( Cliente devolveu )'
              'Troca Retorno ( Retorno da Distribuidora )')
            Values.Strings = (
              '2'
              '3'
              '4'
              '5')
            Color = 15790320
            Ctl3D = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GroupStyle = gsCustom
            ItemHotTrack = True
            ItemHeight = 15
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 36
            OnExit = RzDBRadioGroup1Exit
          end
        end
      end
      object TabSheet1: TRzTabSheet
        Color = clWhite
        TabVisible = False
        Caption = '&2. Observação'
        object paDados7: TRzPanel
          Left = 3
          Top = 6
          Width = 779
          Height = 447
          BorderOuter = fsFlatRounded
          Color = 15790320
          TabOrder = 0
          object RzLabel82: TRzLabel
            Left = 13
            Top = 11
            Width = 216
            Height = 13
            AutoSize = False
            Caption = 'Observação( 60 caracteres por linha )'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzDBEdit15: TRzDBEdit
            Left = 12
            Top = 26
            Width = 500
            Height = 19
            DataSource = dm.dsOSes
            DataField = 'OBS1'
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 0
          end
          object RzDBEdit16: TRzDBEdit
            Left = 12
            Top = 46
            Width = 500
            Height = 19
            DataSource = dm.dsOSes
            DataField = 'OBS2'
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 1
          end
          object RzDBEdit18: TRzDBEdit
            Left = 12
            Top = 66
            Width = 500
            Height = 19
            DataSource = dm.dsOSes
            DataField = 'OBS3'
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 2
          end
          object RzDBEdit17: TRzDBEdit
            Left = 12
            Top = 86
            Width = 500
            Height = 19
            DataSource = dm.dsOSes
            DataField = 'OBS4'
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 3
          end
        end
      end
      object TabSheet2: TRzTabSheet
        Color = clWhite
        Caption = '&2. Observações'
        object RzPanel1: TRzPanel
          Left = 3
          Top = 6
          Width = 779
          Height = 447
          BorderOuter = fsFlatRounded
          Color = 15790320
          TabOrder = 0
          object RzLabel21: TRzLabel
            Left = 12
            Top = 16
            Width = 241
            Height = 13
            AutoSize = False
            Caption = 'Observação'
            Color = 15984858
            FocusControl = RzDBEdit1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzDBEdit1: TRzDBEdit
            Left = 13
            Top = 31
            Width = 572
            Height = 21
            DataSource = dm.dsAcertos_Estoque
            DataField = 'OBS1'
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
            TabOrder = 0
          end
          object RzDBEdit2: TRzDBEdit
            Left = 13
            Top = 54
            Width = 572
            Height = 21
            DataSource = dm.dsAcertos_Estoque
            DataField = 'OBS2'
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
          object RzDBEdit3: TRzDBEdit
            Left = 13
            Top = 77
            Width = 572
            Height = 21
            DataSource = dm.dsAcertos_Estoque
            DataField = 'OBS3'
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
          end
        end
      end
      object tabPagamento: TRzTabSheet
        Color = clWhite
        TabVisible = False
        Caption = '&3. Fechamento'
        object paDados1: TRzPanel
          Left = 3
          Top = 6
          Width = 779
          Height = 447
          BorderOuter = fsFlatRounded
          Color = 15790320
          TabOrder = 0
          object RzLabel61: TRzLabel
            Left = 36
            Top = 55
            Width = 45
            Height = 13
            AutoSize = False
            Caption = 'Parcelas'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel63: TRzLabel
            Left = 8
            Top = 75
            Width = 18
            Height = 13
            AutoSize = False
            Caption = 'em'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel66: TRzLabel
            Left = 500
            Top = 56
            Width = 93
            Height = 13
            AutoSize = False
            Caption = 'Data Base ( 1ª )'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object labJuros: TRzLabel
            Left = 224
            Top = 55
            Width = 61
            Height = 13
            AutoSize = False
            Caption = 'Juros ( % )'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel67: TRzLabel
            Left = 192
            Top = 75
            Width = 21
            Height = 13
            AutoSize = False
            Caption = 'com'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel58: TRzLabel
            Left = 73
            Top = 75
            Width = 12
            Height = 13
            AutoSize = False
            Caption = 'x'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object Shape12: TShape
            Left = 196
            Top = 392
            Width = 109
            Height = 43
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel60: TRzLabel
            Left = 201
            Top = 382
            Width = 70
            Height = 15
            AutoSize = False
            Caption = ' Total Geral  '
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object Shape13: TShape
            Left = 312
            Top = 392
            Width = 109
            Height = 43
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel68: TRzLabel
            Left = 317
            Top = 382
            Width = 97
            Height = 15
            AutoSize = False
            Caption = ' Total Informado  '
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object RzLabel57: TRzLabel
            Left = 288
            Top = 75
            Width = 21
            Height = 13
            AutoSize = False
            Caption = 'e'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel65: TRzLabel
            Left = 304
            Top = 55
            Width = 81
            Height = 13
            AutoSize = False
            Caption = 'Taxa Adm( % )'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel69: TRzLabel
            Left = 96
            Top = 75
            Width = 34
            Height = 13
            AutoSize = False
            Caption = 'a cada'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel70: TRzLabel
            Left = 144
            Top = 55
            Width = 45
            Height = 13
            AutoSize = False
            Caption = 'Dias'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object Shape14: TShape
            Left = 428
            Top = 392
            Width = 109
            Height = 43
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel71: TRzLabel
            Left = 433
            Top = 382
            Width = 97
            Height = 15
            AutoSize = False
            Caption = ' Total Juros ( + )  '
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object Shape15: TShape
            Left = 544
            Top = 392
            Width = 109
            Height = 43
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel72: TRzLabel
            Left = 549
            Top = 382
            Width = 96
            Height = 15
            AutoSize = False
            Caption = ' Total Taxas ( - )   '
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object Shape16: TShape
            Left = 660
            Top = 392
            Width = 109
            Height = 43
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel73: TRzLabel
            Left = 665
            Top = 382
            Width = 90
            Height = 15
            AutoSize = False
            Caption = ' Total Corrigido  '
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object RzLabel85: TRzLabel
            Left = 404
            Top = 55
            Width = 83
            Height = 13
            AutoSize = False
            Caption = 'Créd. / 1ª para'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel96: TRzLabel
            Left = 444
            Top = 75
            Width = 42
            Height = 13
            AutoSize = False
            Caption = 'dias'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel50: TRzLabel
            Left = 8
            Top = 8
            Width = 162
            Height = 13
            AutoSize = False
            Caption = '&Forma de Pagamento ( Alt + F )'
            Color = 15984858
            FocusControl = edLkpFormaPagto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel59: TRzLabel
            Left = 284
            Top = 7
            Width = 45
            Height = 13
            AutoSize = False
            Caption = 'Valor'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel98: TRzLabel
            Left = 404
            Top = 7
            Width = 93
            Height = 13
            AutoSize = False
            Caption = 'N° do Documento'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzButton15: TRzButton
            Left = 598
            Top = 70
            Width = 49
            Height = 21
            Hint = 'Inclui a(s) Parcela(s) na'#13'lista abaixo'
            Caption = '&Inclui'
            Color = 8421631
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
          object edParcelas: TRzNumericEdit
            Left = 36
            Top = 71
            Width = 33
            Height = 19
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 3
            Value = 1.000000000000000000
            DisplayFormat = ',0;(,0)'
          end
          object RzButton16: TRzButton
            Left = 650
            Top = 70
            Width = 49
            Height = 21
            Hint = 'Exclui a(s) Parcela(s) selecionada(s)'
            Caption = '&Exclui'
            Color = 8421631
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
          object edJuros: TRzNumericEdit
            Left = 224
            Top = 71
            Width = 49
            Height = 19
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 5
            IntegersOnly = False
            DisplayFormat = '##0.00#;-##0.00#'
          end
          object gridPagamento: TRzDBGrid
            Left = 1
            Top = 104
            Width = 777
            Height = 261
            Hint = 'Duplo Click'#13#13'Altera o número do documento'
            BorderStyle = bsNone
            Color = clWhite
            DataSource = dm.dsOSesPagto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentFont = False
            TabOrder = 12
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            FrameHotColor = clRed
            FrameVisible = True
          end
          object RzDBNumericEdit13: TRzDBNumericEdit
            Left = 206
            Top = 407
            Width = 90
            Height = 19
            DataSource = dsTotaliza_OS
            DataField = 'TOTAL_GERAL'
            ReadOnly = True
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 13
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object RzDBNumericEdit14: TRzDBNumericEdit
            Left = 322
            Top = 407
            Width = 90
            Height = 19
            DataSource = dsTotaliza_Pagto
            DataField = 'TOTAL_PAGTO'
            ReadOnly = True
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 14
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object edDtPagamento: TRzDBDateTimeEdit
            Left = 500
            Top = 71
            Width = 93
            Height = 21
            DataSource = dm.dsOSes
            DataField = 'DTAVULSO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 8
            CaptionTodayBtn = 'Hoje'
            CaptionClearBtn = 'Limpa'
            HowToUseMsg = 'Digite ou Selecione uma data'#13'clicando na seta ao lado'
            EditType = etDate
            Format = 'dd/mm/yyyy'
            FlatButtons = True
          end
          object edTaxa: TRzNumericEdit
            Left = 304
            Top = 71
            Width = 49
            Height = 19
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 6
            IntegersOnly = False
            DisplayFormat = '##0.00#;-##0.00#'
          end
          object edDias: TRzNumericEdit
            Left = 144
            Top = 71
            Width = 33
            Height = 19
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 4
            DisplayFormat = ',0;(,0)'
          end
          object RzDBNumericEdit15: TRzDBNumericEdit
            Left = 438
            Top = 407
            Width = 90
            Height = 19
            DataSource = dsTotaliza_Pagto
            DataField = 'TOTAL_JUROS'
            ReadOnly = True
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 15
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object RzDBNumericEdit16: TRzDBNumericEdit
            Left = 554
            Top = 407
            Width = 90
            Height = 19
            DataSource = dsTotaliza_Pagto
            DataField = 'TOTAL_TAXAS'
            ReadOnly = True
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 16
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object RzDBNumericEdit17: TRzDBNumericEdit
            Left = 670
            Top = 407
            Width = 90
            Height = 19
            DataSource = dsTotaliza_Pagto
            DataField = 'TOTAL_CORRIGIDO'
            ReadOnly = True
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 17
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object RzCheckGroup1: TRzCheckGroup
            Left = 632
            Top = 26
            Width = 73
            Height = 25
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            GroupStyle = gsCustom
            ItemHotTrack = True
            ItemFont.Charset = DEFAULT_CHARSET
            ItemFont.Color = 12615680
            ItemFont.Height = -9
            ItemFont.Name = 'Tahoma'
            ItemFont.Style = [fsBold]
            Items.Strings = (
              'Dia Fixo')
            ParentFont = False
            TabOrder = 10
            Visible = False
            CheckStates = (
              0)
          end
          object edEncerra: TRzButton
            Left = 702
            Top = 70
            Width = 67
            Height = 21
            Hint = 'Encerra / Fecha a OS'
            Caption = 'E&ncerra'
            Color = 8421631
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TextShadowColor = 5460819
            TextShadowDepth = 1
            TabOrder = 18
            TextStyle = tsShadow
            OnClick = edEncerraClick
          end
          object edDiasCred: TRzNumericEdit
            Left = 404
            Top = 71
            Width = 33
            Height = 19
            Hint = 
              'Dias para Créd. no caso de ADM, se não,'#13'Carência para primeira p' +
              'arcela.'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 7
            DisplayFormat = ',0;(,0)'
          end
          object edLkpFormaPagto: TRzDBLookupComboBox
            Left = 8
            Top = 23
            Width = 245
            Height = 21
            Hint = 'É possível lançar ''n'' Formas de Pagamento'
            BevelInner = bvNone
            BevelOuter = bvNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            KeyField = 'CODIGO'
            ListField = 'DESCRICAO'
            ListSource = dsLkpFormaPagto
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            FlatButtons = True
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotStyle = fsFlat
            FrameHotTrack = True
            FrameSides = []
            FrameVisible = True
            TabOnEnter = True
          end
          object RzButton14: TRzButton
            Left = 256
            Top = 22
            Width = 19
            Height = 21
            Hint = 'Adiciona nova Forma de Pagamento'
            Caption = '+'
            Color = 8421631
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TextShadowColor = 5460819
            TextShadowDepth = 1
            TabOrder = 19
            TextStyle = tsShadow
            Visible = False
          end
          object edValParcelas: TRzNumericEdit
            Left = 284
            Top = 23
            Width = 110
            Height = 19
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotTrack = True
            FrameHotStyle = fsFlat
            FrameSides = []
            FrameVisible = True
            ParentFont = False
            TabOnEnter = True
            TabOrder = 1
            IntegersOnly = False
            DisplayFormat = ',###,##0.00#;-,###,##0.00#'
          end
          object edNumDoc: TRzEdit
            Left = 404
            Top = 23
            Width = 189
            Height = 19
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 2
          end
        end
      end
      object tabPesquisa: TRzTabSheet
        Color = clWhite
        Caption = '&3. Pesquisa'
        OnClick = tabPesquisaClick
        object paPesquisa: TRzPanel
          Left = 3
          Top = 6
          Width = 779
          Height = 447
          BorderOuter = fsFlatRounded
          Color = 15790320
          TabOrder = 0
          object Shape1: TShape
            Left = 8
            Top = 14
            Width = 469
            Height = 103
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel7: TRzLabel
            Left = 16
            Top = 71
            Width = 36
            Height = 13
            AutoSize = False
            Caption = 'Código'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object Shape3: TShape
            Left = 637
            Top = 14
            Width = 133
            Height = 103
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel11: TRzLabel
            Left = 646
            Top = 6
            Width = 116
            Height = 15
            AutoSize = False
            Caption = ' Ordem da Pesquisa '
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object Shape2: TShape
            Left = 481
            Top = 14
            Width = 152
            Height = 103
            Brush.Color = 15790320
            Pen.Color = clSilver
            Shape = stRoundRect
          end
          object RzLabel10: TRzLabel
            Left = 494
            Top = 6
            Width = 117
            Height = 15
            AutoSize = False
            Caption = ' Escopo da Pesquisa '
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object RzLabel8: TRzLabel
            Left = 76
            Top = 71
            Width = 137
            Height = 13
            AutoSize = False
            Caption = 'Histórico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel9: TRzLabel
            Left = 22
            Top = 6
            Width = 326
            Height = 15
            AutoSize = False
            Caption = '  Campos para Pesquisa ( <ENTER> em branco = TODOS )'
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
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
          object RzLabel77: TRzLabel
            Left = 16
            Top = 28
            Width = 101
            Height = 13
            AutoSize = False
            Caption = 'Empresa'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel79: TRzLabel
            Left = 172
            Top = 28
            Width = 101
            Height = 13
            AutoSize = False
            Caption = 'Situação'
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
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel14: TRzLabel
            Left = 340
            Top = 23
            Width = 53
            Height = 13
            AutoSize = False
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            Visible = False
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object RzLabel2: TRzLabel
            Left = 10
            Top = 144
            Width = 27
            Height = 13
            Caption = 'Obs.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            Blinking = True
            BlinkColor = 15790320
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object labObs: TRzLabel
            Left = 42
            Top = 144
            Width = 27
            Height = 13
            Caption = 'Obs.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            BlinkColor = 15790320
            BlinkIntervalOff = 700
            ShadowColor = clMaroon
            ShadowDepth = 0
            TextStyle = tsShadow
          end
          object edPesq1: TRzEdit
            Left = 16
            Top = 87
            Width = 53
            Height = 19
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 2
            OnKeyDown = edPesq1KeyDown
            OnKeyPress = edPesq1KeyPress
          end
          object edPesq3: TRzEdit
            Left = 76
            Top = 87
            Width = 201
            Height = 19
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 4
            OnKeyDown = edPesq3KeyDown
          end
          object chkDecrescente: TRzCheckGroup
            Left = 652
            Top = 68
            Width = 97
            Height = 25
            Color = 15790320
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            GroupStyle = gsCustom
            ItemHotTrack = True
            ItemFont.Charset = DEFAULT_CHARSET
            ItemFont.Color = 12615680
            ItemFont.Height = -9
            ItemFont.Name = 'Tahoma'
            ItemFont.Style = [fsBold]
            Items.Strings = (
              'Decrescente')
            ParentFont = False
            TabOrder = 5
            CheckStates = (
              0)
          end
          object grpPesquisa: TRzRadioGroup
            Left = 636
            Top = 24
            Width = 153
            Height = 49
            Cursor = crHandPoint
            Color = 15790320
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsUnderline]
            GroupStyle = gsCustom
            ItemHotTrack = True
            ItemFont.Charset = DEFAULT_CHARSET
            ItemFont.Color = 12615680
            ItemFont.Height = -9
            ItemFont.Name = 'Tahoma'
            ItemFont.Style = [fsBold]
            ItemIndex = 1
            Items.Strings = (
              'Por Código'
              'Por Cliente')
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 6
            Transparent = True
          end
          object grpEscopo: TRzRadioGroup
            Left = 480
            Top = 24
            Width = 148
            Height = 61
            Cursor = crHandPoint
            Color = 15790320
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsUnderline]
            GroupStyle = gsCustom
            ItemHotTrack = True
            ItemFont.Charset = DEFAULT_CHARSET
            ItemFont.Color = 12615680
            ItemFont.Height = -9
            ItemFont.Name = 'Tahoma'
            ItemFont.Style = [fsBold]
            ItemIndex = 2
            Items.Strings = (
              'A Esquerda da Palavra'
              'A Direita da Palavra'
              'Em QQ Parte da Palavra')
            ParentCtl3D = False
            ParentFont = False
            TextShadowDepth = 1
            TabOrder = 7
            Transparent = True
          end
          object edLkpEmpresa: TRzDBLookupComboBox
            Left = 16
            Top = 43
            Width = 149
            Height = 19
            Hint = 
              'É possível filtrar para que sejam'#13'exibidas apenas os clientes de' +
              ' uma'#13'determinada empresa'
            BevelInner = bvNone
            BevelOuter = bvNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            KeyField = 'CODIGO'
            ListField = 'DESCRICAO'
            ListSource = dm.dsEmpresas
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            FlatButtons = True
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotStyle = fsFlat
            FrameHotTrack = True
            FrameSides = []
            FrameVisible = True
            TabOnEnter = True
          end
          object edLkpSituacao: TRzDBLookupComboBox
            Left = 172
            Top = 43
            Width = 113
            Height = 19
            BevelInner = bvNone
            BevelOuter = bvNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            KeyField = 'CODIGO'
            ListField = 'DESCRICAO'
            ListSource = dsLkpSituacoes
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            Visible = False
            FlatButtons = True
            FocusColor = clInfoBk
            FrameHotColor = clRed
            FrameHotStyle = fsFlat
            FrameHotTrack = True
            FrameSides = []
            FrameVisible = True
            TabOnEnter = True
          end
          object edPesq2: TRzEdit
            Left = 340
            Top = 39
            Width = 185
            Height = 19
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
            FrameSides = []
            FrameVisible = True
            ParentCtl3D = False
            ParentFont = False
            TabOnEnter = True
            TabOrder = 3
            Visible = False
            OnKeyDown = edPesq2KeyDown
          end
          object gridConsulta: TRzDBGrid
            Left = 1
            Top = 168
            Width = 777
            Height = 278
            Hint = 
              'Para selecionar vários registros,'#13'segure a tecla [CTRL] enquando' +
              #13'clica sobre o(s) registro(s).'
            BorderStyle = bsNone
            Color = clWhite
            DataSource = dsGeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentFont = False
            TabOrder = 8
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = gridConsultaDrawColumnCell
            OnDblClick = gridConsultaDblClick
            OnKeyDown = gridConsultaKeyDown
            FrameHotTrack = True
            FrameVisible = True
          end
        end
      end
    end
    inline frameBarraSup: Tframe_tela_sup
      Left = 0
      Top = 0
      Width = 792
      Height = 56
      Color = clWhite
      ParentColor = False
      TabOrder = 1
    end
    inline frameBotoes: Tframe_tela_inf
      Left = 0
      Top = 547
      Width = 792
      Height = 54
      Color = clBtnFace
      ParentColor = False
      TabOrder = 2
      inherited btnCadastra: TRzBmpButton
        OnClick = frameBotoesbtnCadastraClick
      end
      inherited btnAltera: TRzBmpButton
        OnClick = frameBotoesbtnAlteraClick
      end
      inherited btnExclui: TRzBmpButton
        OnClick = frameBotoesbtnExcluiClick
      end
      inherited btnConfirma: TRzBmpButton
        OnClick = frameBotoesbtnConfirmaClick
      end
      inherited btnCancela: TRzBmpButton
        OnClick = frameBotoesbtnCancelaClick
      end
      inherited btnPesquisa: TRzBmpButton
        OnClick = frameBotoesbtnPesquisaClick
      end
      inherited btnSai: TRzBmpButton
        OnClick = frameBotoesbtnSaiClick
      end
    end
  end
  inline frameConsultaGeral: TframeConsulta
    Left = 828
    Top = 128
    Width = 792
    Height = 372
    TabOrder = 1
    Visible = False
    inherited paConsulta: TRzPanel
      inherited gridConsultaGeral: TRzDBGrid
        OnColEnter = frameConsultaGeralgridConsultaGeralColEnter
        OnDblClick = frameConsultaGeralgridConsultaGeralDblClick
        OnEnter = frameConsultaGeralgridConsultaGeralEnter
        OnKeyDown = frameConsultaGeralgridConsultaGeralKeyDown
        OnMouseEnter = frameConsultaGeralgridConsultaGeralMouseEnter
      end
    end
  end
  object lbMenu: TRzListBox
    Left = 808
    Top = 356
    Width = 197
    Height = 213
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    FrameHotTrack = True
    FrameHotStyle = fsFlat
    FrameVisible = True
    ItemHeight = 15
    Items.Strings = (
      '//Impressão Básica'
      'Emite OS'
      'Emite Recibo Ref. a OS '
      ''
      '//Impressão Fiscal'
      'Emite NF'
      'Emite Cupom Dinheiro'
      'Emite Cupom Cartão'
      'Emite Cupom Cheque'
      ''
      '//Diversos'
      'Estornar OS')
    ParentFont = False
    ShowGroups = True
    Style = lbOwnerDrawFixed
    TabOnEnter = True
    TabOrder = 2
    Visible = False
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
    Left = 852
    Top = 504
  end
  object dsCadGeral: TDataSource
    DataSet = zQryCadGeral
    Left = 855
    Top = 551
  end
  object zQryGeral: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    Params = <>
    Left = 780
    Top = 408
  end
  object dsGeral: TDataSource
    DataSet = zQryGeral
    Left = 783
    Top = 455
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
    Left = 852
    Top = 408
  end
  object dsLkpTipoPagto: TDataSource
    DataSet = zQryLkpTipoPagto
    Left = 852
    Top = 455
  end
  object zQryDelete: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    Params = <>
    Left = 780
    Top = 504
  end
  object dsDelete: TDataSource
    DataSet = zQryDelete
    Left = 783
    Top = 551
  end
  object dsLkpCliente: TDataSource
    DataSet = zQryLkpCliente
    Left = 784
    Top = 67
  end
  object zQryLkpCliente: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome, CodiFunc, CodiCliPai from Clientes'
      'order by Nome'
      ' ')
    Params = <>
    Left = 784
    Top = 20
  end
  object zQryLkpFuncionario: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 856
    Top = 20
  end
  object dsLkpFuncionario: TDataSource
    DataSet = zQryLkpFuncionario
    Left = 856
    Top = 67
  end
  object zQryLkpGerente: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 856
    Top = 116
  end
  object dsLkpGerente: TDataSource
    DataSet = zQryLkpGerente
    Left = 856
    Top = 163
  end
  object dsLkpSeguradora: TDataSource
    DataSet = zQryLkpSeguradora
    Left = 784
    Top = 163
  end
  object zQryLkpSeguradora: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo, Fantasia from Seguradoras'
      'order by Fantasia'
      ' ')
    Params = <>
    Left = 784
    Top = 116
  end
  object zQryLkpCarros: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select * from Carros'
      ''
      'order by Descricao'
      ' ')
    Params = <>
    Left = 784
    Top = 216
  end
  object dsLkpCarros: TDataSource
    DataSet = zQryLkpCarros
    Left = 783
    Top = 263
  end
  object zQryTotaliza_OS: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'Select * from sp_totaliza_os( 1 )')
    Params = <>
    Left = 860
    Top = 216
    object zQryTotaliza_OSTOTAL_PECA: TFloatField
      FieldName = 'TOTAL_PECA'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_DESC_PECA: TFloatField
      FieldName = 'TOTAL_DESC_PECA'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_QTDE_PECA: TFloatField
      FieldName = 'TOTAL_QTDE_PECA'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_SERV: TFloatField
      FieldName = 'TOTAL_SERV'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_DESC_SERV: TFloatField
      FieldName = 'TOTAL_DESC_SERV'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_QTDE_SERV: TFloatField
      FieldName = 'TOTAL_QTDE_SERV'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_GERAL: TFloatField
      FieldName = 'TOTAL_GERAL'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSDESC_CONV: TFloatField
      FieldName = 'DESC_CONV'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_BRUTO: TFloatField
      FieldName = 'TOTAL_BRUTO'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_PECA_BRUTO: TFloatField
      FieldName = 'TOTAL_PECA_BRUTO'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_SERV_BRUTO: TFloatField
      FieldName = 'TOTAL_SERV_BRUTO'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_OSTOTAL_DESC_EXTRA: TFloatField
      FieldName = 'TOTAL_DESC_EXTRA'
    end
    object zQryTotaliza_OSTOTAL_FRANQUIA: TFloatField
      FieldName = 'TOTAL_FRANQUIA'
    end
    object zQryTotaliza_OSTOTAL_JUROS: TFloatField
      FieldName = 'TOTAL_JUROS'
    end
  end
  object dsTotaliza_OS: TDataSource
    DataSet = zQryTotaliza_OS
    Left = 859
    Top = 263
  end
  object zQryLkpFormaPagto: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Fp.Codigo,  Fp.Descricao , TP.Descricao as Tipo '
      ''
      'from FormasPagamento FP'
      ''
      'left join TiposPagamento TP'
      'on TP.Codigo = FP.CodiTipo'
      ''
      'order by FP.Descricao'
      ' ')
    Params = <>
    Left = 784
    Top = 312
  end
  object dsLkpFormaPagto: TDataSource
    DataSet = zQryLkpFormaPagto
    Left = 784
    Top = 359
  end
  object zQryTotaliza_Pagto: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'Select * from sp_total_os_pagto( 23 )')
    Params = <>
    Left = 860
    Top = 312
    object zQryTotaliza_PagtoTOTAL_PAGTO: TFloatField
      FieldName = 'TOTAL_PAGTO'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_PagtoTOTAL_JUROS: TFloatField
      FieldName = 'TOTAL_JUROS'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_PagtoTOTAL_TAXAS: TFloatField
      FieldName = 'TOTAL_TAXAS'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
    object zQryTotaliza_PagtoTOTAL_CORRIGIDO: TFloatField
      FieldName = 'TOTAL_CORRIGIDO'
      DisplayFormat = ',###,##0.00#;-,###,##0.00#'
    end
  end
  object dsTotaliza_Pagto: TDataSource
    DataSet = zQryTotaliza_Pagto
    Left = 859
    Top = 359
  end
  object zQryLkpFunc1: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 952
    Top = 20
  end
  object dsLkpFunc1: TDataSource
    DataSet = zQryLkpFunc1
    Left = 952
    Top = 67
  end
  object zQryLkpFunc2: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 952
    Top = 116
  end
  object dsLkpFunc2: TDataSource
    DataSet = zQryLkpFunc2
    Left = 952
    Top = 163
  end
  object zQryLkpFunc3: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 952
    Top = 212
  end
  object dsLkpFunc3: TDataSource
    DataSet = zQryLkpFunc3
    Left = 952
    Top = 259
  end
  object zQryLkpFunc4: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 952
    Top = 308
  end
  object dsLkpFunc4: TDataSource
    DataSet = zQryLkpFunc4
    Left = 952
    Top = 355
  end
  object zQryLkpFunc5: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 952
    Top = 404
  end
  object dsLkpFunc5: TDataSource
    DataSet = zQryLkpFunc5
    Left = 952
    Top = 451
  end
  object zQryLkpSituacoes: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select * from SituacoesOses'
      'order by Descricao'
      ' ')
    Params = <>
    Left = 712
    Top = 236
  end
  object dsLkpSituacoes: TDataSource
    DataSet = zQryLkpSituacoes
    Left = 712
    Top = 283
  end
  object zQryLkpTiposOses: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select * from TipoOses'
      'order by Descricao'
      ' ')
    Params = <>
    Left = 640
    Top = 236
  end
  object dsLkpTiposOSes: TDataSource
    DataSet = zQryLkpTiposOses
    Left = 640
    Top = 283
  end
  object MenuPopImprimir: TPopupMenu
    Left = 952
    Top = 552
    object Oramento1: TMenuItem
      Caption = 'Nota de Venda'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ECFDinheiro1: TMenuItem
      Caption = 'ECF Dinheiro'
    end
    object ECFCheque1: TMenuItem
      Caption = 'ECF Cheque'
    end
    object ECFCarto1: TMenuItem
      Caption = 'ECF Cartão'
    end
    object CancelarltCupom1: TMenuItem
      Caption = 'Cancelar Últ. Cupom'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object NF1: TMenuItem
      Caption = 'NF'
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Boleto1: TMenuItem
      Caption = 'Preencher Boleto'
    end
  end
  object zQryLkpVendedor: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 236
    Top = 324
  end
  object dsLkpVendedor: TDataSource
    DataSet = zQryLkpVendedor
    Left = 236
    Top = 371
  end
  object zQryLkpEmpresas: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select * from Empresas'
      'order by Descricao'
      ' ')
    Params = <>
    Left = 696
    Top = 360
  end
  object dsLkpEmpresas: TDataSource
    DataSet = zQryLkpEmpresas
    Left = 696
    Top = 407
  end
  object zQryLkpTipoVenda: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select * from TipoVenda'
      'order by Descricao'
      ' ')
    Params = <>
    Left = 640
    Top = 328
  end
  object dsLkpTipoVenda: TDataSource
    DataSet = zQryLkpTipoVenda
    Left = 640
    Top = 375
  end
  object zQryLkpTurnos: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select * from Turnos'
      'order by Descricao'
      ' ')
    Params = <>
    Left = 568
    Top = 328
  end
  object dsLkpTurnos: TDataSource
    DataSet = zQryLkpTurnos
    Left = 568
    Top = 375
  end
  object zQryLkpCapataz1: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 20
    Top = 324
  end
  object dsLkpCapataz1: TDataSource
    DataSet = zQryLkpCapataz1
    Left = 20
    Top = 371
  end
  object dsLkpCapataz2: TDataSource
    DataSet = zQryLkpCapataz2
    Left = 76
    Top = 371
  end
  object zQryLkpCapataz2: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 76
    Top = 324
  end
  object dsLkpClienteResp: TDataSource
    DataSet = zQryLkpClienteResp
    Left = 160
    Top = 371
  end
  object zQryLkpClienteResp: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome, CodiFunc, CodiCliPai from Clientes'
      'order by Nome'
      ' ')
    Params = <>
    Left = 160
    Top = 324
  end
  object zQryOPERACOES: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 628
    Top = 24
  end
  object dsOPERACOES: TDataSource
    DataSet = zQryOPERACOES
    Left = 628
    Top = 71
  end
  object zQryAtualizar: TZQuery
    Connection = dm.ZConnection
    CachedUpdates = True
    ReadOnly = True
    SQL.Strings = (
      'select Codigo,  Nome from Funcionarios'
      'order by Nome'
      ' ')
    Params = <>
    Left = 716
    Top = 20
  end
  object DataSource1: TDataSource
    DataSet = zQryAtualizar
    Left = 716
    Top = 67
  end
  object MenuPopOpcoes: TPopupMenu
    Left = 952
    Top = 508
    object RecomporESTOQUE1: TMenuItem
      Caption = 'Listar ACERTO'
      OnClick = RecomporESTOQUE1Click
    end
    object ListarACERTOcomESTOQUEANTERIOR1: TMenuItem
      Caption = 'Listar ACERTO com ESTOQUE ANTERIOR'
      OnClick = ListarACERTOcomESTOQUEANTERIOR1Click
    end
  end
end


}
end.
