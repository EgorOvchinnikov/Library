object Form13: TForm13
  Left = 0
  Top = 0
  Caption = #1042#1099#1076#1072#1090#1100' '#1082#1080#1085#1075#1091'/'#1080#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
  ClientHeight = 491
  ClientWidth = 896
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 71
    Width = 441
    Height = 274
    DataSource = DataModule10.DS_Q_v_available_books
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'expr1'
        Title.Caption = #1050#1085#1080#1075#1072
        Width = 340
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'booksRemaining'
        Title.Caption = #1044#1086#1089#1090#1091#1087#1085#1086
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 447
    Top = 71
    Width = 449
    Height = 274
    DataSource = DataModule10.DS_Q_v_readers
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'readTicket'
        Title.Caption = #8470' '#1073#1080#1083#1077#1090#1072
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'readName'
        Title.Caption = #1060#1048#1054' '#1095#1080#1090#1072#1090#1077#1083#1103
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'readPhone'
        Title.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 896
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 14
      Width = 70
      Height = 15
      Caption = #1055#1086#1080#1089#1082' '#1082#1085#1080#1075#1080
    end
    object Label2: TLabel
      Left = 472
      Top = 14
      Width = 87
      Height = 15
      Caption = #1055#1086#1080#1089#1082' '#1095#1080#1090#1072#1090#1077#1083#1103
    end
    object Edit1: TEdit
      Left = 24
      Top = 35
      Width = 401
      Height = 23
      TabOrder = 0
      TextHint = #1040#1074#1090#1086#1088', '#1085#1072#1079#1074#1072#1085#1080#1077
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 472
      Top = 35
      Width = 401
      Height = 23
      TabOrder = 1
      TextHint = #1060#1048#1054', '#8470' '#1095#1080#1090#1072#1090#1077#1083#1100#1089#1082#1086#1075#1086' '#1073#1080#1083#1077#1090#1072', '#1085#1086#1084#1077#1088' '#1090#1077#1083'.'
      OnChange = Edit2Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 351
    Width = 896
    Height = 138
    BevelOuter = bvNone
    TabOrder = 3
    object Label3: TLabel
      Left = 24
      Top = 59
      Width = 69
      Height = 15
      Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
    end
    object Label4: TLabel
      Left = 232
      Top = 59
      Width = 76
      Height = 15
      Caption = #1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
    end
    object DBText1: TDBText
      Left = 24
      Top = 8
      Width = 274
      Height = 33
      WordWrap = True
    end
    object DBText2: TDBText
      Left = 472
      Top = 8
      Width = 274
      Height = 33
      WordWrap = True
    end
    object PickGiveDate: TDatePicker
      Left = 24
      Top = 80
      Date = 45637.000000000000000000
      DateFormat = 'dd/mm/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 0
    end
    object PickBackDate: TDatePicker
      Left = 232
      Top = 80
      Date = 45637.000000000000000000
      DateFormat = 'dd/mm/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 1
      OnChange = PickBackDateChange
    end
    object PickBookButton: TButton
      Left = 304
      Top = 8
      Width = 121
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1082#1085#1080#1075#1091
      TabOrder = 2
      OnClick = PickBookButtonClick
    end
    object PickReaderButton: TButton
      Left = 752
      Top = 8
      Width = 121
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1095#1080#1090#1072#1090#1077#1083#1103
      TabOrder = 3
      OnClick = PickReaderButtonClick
    end
    object SaveGiveButton: TButton
      Left = 608
      Top = 88
      Width = 121
      Height = 25
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
      TabOrder = 4
      OnClick = SaveGiveButtonClick
    end
    object CancelGiveButton: TButton
      Left = 752
      Top = 88
      Width = 121
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 5
      OnClick = CancelGiveButtonClick
    end
  end
end
