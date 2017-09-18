object FrmAdminConfig: TFrmAdminConfig
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es Administrativas'
  ClientHeight = 469
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxNavBar1: TdxNavBar
    Left = 0
    Top = 0
    Width = 137
    Height = 469
    Align = alLeft
    ActiveGroupIndex = 0
    TabOrder = 0
    View = 19
    OptionsView.Common.ShowGroupCaptions = False
    OptionsView.NavigationPane.OverflowPanelUseSmallImages = False
    OptionsView.NavigationPane.ShowHeader = False
    OptionsView.NavigationPane.ShowOverflowPanel = False
    object dxNavBar1Group1: TdxNavBarGroup
      Caption = 'Principal'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = dxNavBar1Item1
        end
        item
          Item = dxNavBar1Item2
        end
        item
          Item = dxNavBar1Item3
        end>
    end
    object dxNavBar1Item1: TdxNavBarItem
      Caption = 'Cad. Point Cliente'
      LargeImageIndex = 18
      SmallImageIndex = 18
      OnClick = dxNavBar1Item1Click
    end
    object dxNavBar1Item2: TdxNavBarItem
      Caption = 'Cad. Empresas'
      LargeImageIndex = 18
      SmallImageIndex = 18
      OnClick = dxNavBar1Item2Click
    end
    object dxNavBar1Item3: TdxNavBarItem
      Caption = 'Sair'
      LargeImageIndex = 0
      SmallImageIndex = 0
      OnClick = dxNavBar1Item3Click
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 137
    Top = 0
    Width = 592
    Height = 469
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 469
    ClientRectRight = 592
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'inicio'
      ImageIndex = 0
      object Label1: TLabel
        Left = 16
        Top = 40
        Width = 241
        Height = 19
        Caption = 'Selecione uma op'#231#227'o ao lado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'pointcliente'
      ImageIndex = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 30
        Width = 592
        Height = 187
        TabOrder = 1
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsSysPoint
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Appending = True
          OptionsSelection.InvertSelect = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxGrid1DBTableView1STATUS: TcxGridDBColumn
            Caption = 'St.'
            DataBinding.FieldName = 'STATUS'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              'A'
              'I')
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Width = 38
          end
          object cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn
            Caption = 'Raz'#227'o Social'
            DataBinding.FieldName = 'RAZAO_SOCIAL'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Width = 326
          end
          object cxGrid1DBTableView1CNPJ: TcxGridDBColumn
            DataBinding.FieldName = 'CNPJ'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditMask = '!00.000.000/0000-00'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Width = 133
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 404
        Width = 592
        Height = 41
        Align = alBottom
        TabOrder = 2
        object JvImgBtn1: TJvImgBtn
          Left = 408
          Top = 6
          Width = 81
          Height = 32
          Caption = '&Gravar'
          TabOrder = 0
          OnClick = JvImgBtn1Click
        end
        object JvImgBtn2: TJvImgBtn
          Left = 495
          Top = 5
          Width = 81
          Height = 32
          Caption = '&Cancelar'
          TabOrder = 1
          OnClick = JvImgBtn2Click
        end
      end
      object JvGradientHeaderPanel2: TJvGradientHeaderPanel
        Left = 0
        Top = 0
        Width = 592
        Height = 30
        GradientStyle = grHorizontal
        LabelCaption = 'Point Cliente'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWhite
        LabelFont.Height = -13
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = [fsBold]
        LabelAlignment = taLeftJustify
        Align = alTop
        TabOrder = 0
      end
      object JvMemo1: TJvMemo
        Left = 6
        Top = 232
        Width = 571
        Height = 73
        TabOrder = 3
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 311
        Width = 592
        Height = 93
        Align = alBottom
        DataSource = DataSource1
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Empresa'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 404
        Width = 592
        Height = 41
        Align = alBottom
        TabOrder = 3
        object JvImgBtn3: TJvImgBtn
          Left = 408
          Top = 6
          Width = 81
          Height = 32
          Caption = '&Gravar'
          TabOrder = 1
          OnClick = JvImgBtn3Click
        end
        object JvImgBtn4: TJvImgBtn
          Left = 495
          Top = 5
          Width = 81
          Height = 32
          Caption = '&Cancelar'
          TabOrder = 0
          OnClick = JvImgBtn4Click
        end
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 30
        Width = 592
        Height = 374
        Align = alClient
        TabOrder = 1
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsEmpresa
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.Appending = True
          OptionsSelection.InvertSelect = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxGridDBTableView1IDSYS_POINT_CLIENTE: TcxGridDBColumn
            Caption = 'Point Cliente'
            DataBinding.FieldName = 'IDSYS_POINT_CLIENTE'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Visible = False
            Options.Filtering = False
            Width = 88
          end
          object cxGridDBTableView1Column1: TcxGridDBColumn
            Caption = 'Cliente'
            DataBinding.FieldName = 'FK_POINT_CLIENTE'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = cxGridDBTableView1Column1PropertiesButtonClick
            Options.Filtering = False
            Width = 248
          end
          object cxGridDBTableView1Column2: TcxGridDBColumn
            Caption = 'Raz'#227'o social'
            DataBinding.FieldName = 'RAZAO_SOCIAL'
            Options.Filtering = False
            Width = 172
          end
          object cxGridDBTableView1STATUS: TcxGridDBColumn
            Caption = 'St.'
            DataBinding.FieldName = 'STATUS'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              'A'
              'I')
            Options.Filtering = False
            Width = 29
          end
          object cxGridDBTableView1NOME_FANTASIA: TcxGridDBColumn
            Caption = 'Nome Fantasia'
            DataBinding.FieldName = 'NOME_FANTASIA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Options.Filtering = False
            Width = 266
          end
          object cxGridDBTableView1CNPJ: TcxGridDBColumn
            DataBinding.FieldName = 'CNPJ'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditMask = '!00.000.000/0000-00'
            Options.Filtering = False
          end
          object cxGridDBTableView1IE: TcxGridDBColumn
            DataBinding.FieldName = 'IE'
            Options.Filtering = False
            Width = 124
          end
          object cxGridDBTableView1FK_CIDADE_DESC: TcxGridDBColumn
            Caption = 'Cidade'
            DataBinding.FieldName = 'FK_CIDADE_DESC'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Options.Editing = False
            Options.Filtering = False
            Width = 307
          end
          object cxGridDBTableView1FK_CIDADE_UF: TcxGridDBColumn
            Caption = 'UF'
            DataBinding.FieldName = 'FK_CIDADE_UF'
            Options.Editing = False
            Options.Filtering = False
            Width = 38
          end
          object cxGridDBTableView1CEP: TcxGridDBColumn
            DataBinding.FieldName = 'CEP'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditMask = '!00000-000'
            Options.Filtering = False
            Width = 108
          end
          object cxGridDBTableView1ENDERECO: TcxGridDBColumn
            Caption = 'Endere'#231'o'
            DataBinding.FieldName = 'ENDERECO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Options.Filtering = False
            Width = 270
          end
          object cxGridDBTableView1NUMERO: TcxGridDBColumn
            Caption = 'N'#250'mero'
            DataBinding.FieldName = 'NUMERO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Options.Filtering = False
            Width = 80
          end
          object cxGridDBTableView1COMPLEMENTO: TcxGridDBColumn
            Caption = 'Cmpl'
            DataBinding.FieldName = 'COMPLEMENTO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Options.Filtering = False
            Width = 85
          end
          object cxGridDBTableView1BAIRRO: TcxGridDBColumn
            Caption = 'Bairro'
            DataBinding.FieldName = 'BAIRRO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Options.Filtering = False
            Width = 175
          end
          object cxGridDBTableView1TELEFONE: TcxGridDBColumn
            Caption = 'Telefone'
            DataBinding.FieldName = 'TELEFONE'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditMask = '!(00) 9009-0000'
            Options.Filtering = False
          end
          object cxGridDBTableView1TELEFONE2: TcxGridDBColumn
            Caption = 'Telefone 2'
            DataBinding.FieldName = 'TELEFONE2'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditMask = '!(00) 9009-0000'
            Options.Filtering = False
            Width = 78
          end
          object cxGridDBTableView1Column3: TcxGridDBColumn
            Caption = 'Nota Fiscal Eletronica'
            DataBinding.FieldName = 'USA_NFE'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              'S'
              'N')
            Options.Filtering = False
            Options.Sorting = False
            Width = 111
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object JvGradientHeaderPanel1: TJvGradientHeaderPanel
        Left = 0
        Top = 0
        Width = 592
        Height = 30
        GradientStyle = grHorizontal
        LabelCaption = 'Empresas'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWhite
        LabelFont.Height = -13
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = [fsBold]
        LabelAlignment = taLeftJustify
        Align = alTop
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 6
        Top = 64
        Width = 291
        Height = 209
        TabOrder = 2
        Visible = False
        object JvDBGrid1: TJvDBGrid
          Left = 8
          Top = 11
          Width = 273
          Height = 154
          DataSource = dsSysPoint
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyPress = JvDBGrid1KeyPress
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'RAZAO_SOCIAL'
              Title.Caption = 'Descri'#231#227'o'
              Width = 227
              Visible = True
            end>
        end
        object JvImgBtn5: TJvImgBtn
          Left = 200
          Top = 171
          Width = 81
          Height = 32
          Caption = '&Confirma'
          TabOrder = 1
          OnClick = JvImgBtn5Click
        end
      end
    end
  end
  object dsSysPoint: TDataSource
    DataSet = cdsSysPoint
    Left = 32
    Top = 248
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 32
    Top = 360
  end
  object cdsEmpresa: TRESTDWClientSQL
    FieldDefs = <
      item
        Name = 'IDSYS_POINT_CLIENTE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 38
      end
      item
        Name = 'IDEMPRESA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 38
      end
      item
        Name = 'DTHR_CADASTRO'
        DataType = ftTimeStamp
      end
      item
        Name = 'DTHR_MODIFICACAO'
        DataType = ftTimeStamp
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'NOME_FANTASIA'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDCIDADE'
        DataType = ftInteger
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TELEFONE2'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TIPO_EMPRESA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO_CAD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CODMUN'
        DataType = ftInteger
      end
      item
        Name = 'CPAIS'
        DataType = ftInteger
      end
      item
        Name = 'XPAIS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'USA_NFE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME_CONTADOR'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CPF_CONTADOR'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CRC_CONTADOR'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CNPJ_CONTADOR'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CEP_CONTADOR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'END_CONTADOR'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'NUM_CONTADOR'
        DataType = ftInteger
      end
      item
        Name = 'COMPLEMENTO_CONTADOR'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'BAIRRO_CONTADOR'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'FONE_CONTADOR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAX_CONTADOR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'EMAIL_CONTADOR'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CODCIDADE_CONTADOR'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'E116_DT_VCTO'
        DataType = ftDate
      end
      item
        Name = 'E116_COD_REC'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'E116_COD_OR'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'IND_PERFIL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SPED_IND_NAT_PJ'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SPED_IND_ATIV'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SPED_COD_INC_TRIB'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SPED_IND_APRO_CRED'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SPED_COD_TIPO_CONT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SPED_IND_REG_CUM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INSCESTADUAL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CNPJBOLETO'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'M200RM205'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'M600RM605'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SMTPEMAIL'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'USUARIOEMAIL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SENHAEMAIL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PORTAEMAIL'
        DataType = ftInteger
      end>
    MasterCascadeDelete = True
    Inactive = False
    DataCache = False
    Params = <>
    DataBase = DM.Coneccao
    SQL.Strings = (
      ' select * from EMPRESA')
    CacheUpdateRecords = True
    Left = 32
    Top = 304
    object cdsEmpresaIDSYS_POINT_CLIENTE: TStringField
      FieldName = 'IDSYS_POINT_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object cdsEmpresaIDEMPRESA: TStringField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object cdsEmpresaDTHR_CADASTRO: TSQLTimeStampField
      FieldName = 'DTHR_CADASTRO'
    end
    object cdsEmpresaDTHR_MODIFICACAO: TSQLTimeStampField
      FieldName = 'DTHR_MODIFICACAO'
    end
    object cdsEmpresaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object cdsEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 70
    end
    object cdsEmpresaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 70
    end
    object cdsEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object cdsEmpresaIE: TStringField
      FieldName = 'IE'
      Size = 30
    end
    object cdsEmpresaIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object cdsEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 150
    end
    object cdsEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsEmpresaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 30
    end
    object cdsEmpresaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object cdsEmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object cdsEmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsEmpresaTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Size = 15
    end
    object cdsEmpresaTIPO_EMPRESA: TStringField
      FieldName = 'TIPO_EMPRESA'
      Size = 1
    end
    object cdsEmpresaTIPO_CAD: TStringField
      FieldName = 'TIPO_CAD'
      Size = 30
    end
    object cdsEmpresaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsEmpresaCODMUN: TIntegerField
      FieldName = 'CODMUN'
    end
    object cdsEmpresaCPAIS: TIntegerField
      FieldName = 'CPAIS'
    end
    object cdsEmpresaXPAIS: TStringField
      FieldName = 'XPAIS'
      Size = 30
    end
    object cdsEmpresaUSA_NFE: TStringField
      FieldName = 'USA_NFE'
      Size = 1
    end
    object cdsEmpresaNOME_CONTADOR: TStringField
      FieldName = 'NOME_CONTADOR'
      Size = 70
    end
    object cdsEmpresaCPF_CONTADOR: TStringField
      FieldName = 'CPF_CONTADOR'
      Size = 14
    end
    object cdsEmpresaCRC_CONTADOR: TStringField
      FieldName = 'CRC_CONTADOR'
      Size = 30
    end
    object cdsEmpresaCNPJ_CONTADOR: TStringField
      FieldName = 'CNPJ_CONTADOR'
      Size = 18
    end
    object cdsEmpresaCEP_CONTADOR: TStringField
      FieldName = 'CEP_CONTADOR'
      Size = 10
    end
    object cdsEmpresaEND_CONTADOR: TStringField
      FieldName = 'END_CONTADOR'
      Size = 150
    end
    object cdsEmpresaNUM_CONTADOR: TIntegerField
      FieldName = 'NUM_CONTADOR'
    end
    object cdsEmpresaCOMPLEMENTO_CONTADOR: TStringField
      FieldName = 'COMPLEMENTO_CONTADOR'
      Size = 100
    end
    object cdsEmpresaBAIRRO_CONTADOR: TStringField
      FieldName = 'BAIRRO_CONTADOR'
      Size = 40
    end
    object cdsEmpresaFONE_CONTADOR: TStringField
      FieldName = 'FONE_CONTADOR'
      Size = 15
    end
    object cdsEmpresaFAX_CONTADOR: TStringField
      FieldName = 'FAX_CONTADOR'
      Size = 15
    end
    object cdsEmpresaEMAIL_CONTADOR: TStringField
      FieldName = 'EMAIL_CONTADOR'
      Size = 100
    end
    object cdsEmpresaCODCIDADE_CONTADOR: TStringField
      FieldName = 'CODCIDADE_CONTADOR'
      Size = 8
    end
    object cdsEmpresaE116_DT_VCTO: TDateField
      FieldName = 'E116_DT_VCTO'
    end
    object cdsEmpresaE116_COD_REC: TStringField
      FieldName = 'E116_COD_REC'
      Size = 30
    end
    object cdsEmpresaE116_COD_OR: TStringField
      FieldName = 'E116_COD_OR'
      Size = 3
    end
    object cdsEmpresaIND_PERFIL: TStringField
      FieldName = 'IND_PERFIL'
      Size = 1
    end
    object cdsEmpresaSPED_IND_NAT_PJ: TStringField
      FieldName = 'SPED_IND_NAT_PJ'
      Size = 1
    end
    object cdsEmpresaSPED_IND_ATIV: TStringField
      FieldName = 'SPED_IND_ATIV'
      Size = 1
    end
    object cdsEmpresaSPED_COD_INC_TRIB: TStringField
      FieldName = 'SPED_COD_INC_TRIB'
      Size = 1
    end
    object cdsEmpresaSPED_IND_APRO_CRED: TStringField
      FieldName = 'SPED_IND_APRO_CRED'
      Size = 1
    end
    object cdsEmpresaSPED_COD_TIPO_CONT: TStringField
      FieldName = 'SPED_COD_TIPO_CONT'
      Size = 1
    end
    object cdsEmpresaSPED_IND_REG_CUM: TStringField
      FieldName = 'SPED_IND_REG_CUM'
      Size = 1
    end
    object cdsEmpresaINSCESTADUAL: TStringField
      FieldName = 'INSCESTADUAL'
      Size = 30
    end
    object cdsEmpresaCNPJBOLETO: TStringField
      FieldName = 'CNPJBOLETO'
      Size = 18
    end
    object cdsEmpresaM200RM205: TStringField
      FieldName = 'M200RM205'
      Size = 30
    end
    object cdsEmpresaM600RM605: TStringField
      FieldName = 'M600RM605'
      Size = 30
    end
    object cdsEmpresaSMTPEMAIL: TStringField
      FieldName = 'SMTPEMAIL'
      Size = 250
    end
    object cdsEmpresaUSUARIOEMAIL: TStringField
      FieldName = 'USUARIOEMAIL'
      Size = 100
    end
    object cdsEmpresaSENHAEMAIL: TStringField
      FieldName = 'SENHAEMAIL'
      Size = 100
    end
    object cdsEmpresaPORTAEMAIL: TIntegerField
      FieldName = 'PORTAEMAIL'
    end
  end
  object cdsSysPoint: TRESTDWClientSQL
    FieldDefs = <
      item
        Name = 'IDSYS_POINT_CLIENTE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 38
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'MENSAGEM'
        DataType = ftMemo
      end>
    MasterCascadeDelete = True
    Inactive = False
    DataCache = False
    Params = <>
    DataBase = DM.Coneccao
    SQL.Strings = (
      ' select *  from SYS_POINT_CLIENTE')
    CacheUpdateRecords = True
    Left = 40
    Top = 192
    object cdsSysPointIDSYS_POINT_CLIENTE: TStringField
      FieldName = 'IDSYS_POINT_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object cdsSysPointSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object cdsSysPointRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 70
    end
    object cdsSysPointCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object cdsSysPointMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      BlobType = ftMemo
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 288
    Top = 344
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable2
    Left = 512
    Top = 344
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 401
    Top = 344
  end
end
