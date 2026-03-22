object Form10: TForm10
  Left = 0
  Top = 0
  Caption = #1046#1072#1085#1088#1099' '#1080' '#1072#1074#1090#1086#1088#1099
  ClientHeight = 385
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 624
    Height = 385
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 452
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 305
    Height = 273
    DataSource = DataModule10.DS_T_genres
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
        FieldName = 'genName'
        Title.Caption = #1046#1072#1085#1088
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 319
    Top = 8
    Width = 297
    Height = 273
    DataSource = DataModule10.DS_T_authors
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'auName'
        Title.Caption = #1040#1074#1090#1086#1088#1099
        Visible = True
      end>
  end
  object InsertDeleteGenrePanel: TPanel
    Left = 8
    Top = 287
    Width = 305
    Height = 94
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 88
      Top = 18
      Width = 133
      Height = 15
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1059#1076#1072#1083#1080#1090#1100' '#1078#1072#1085#1088
    end
    object AddGenreButton: TButton
      Left = 16
      Top = 45
      Width = 129
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = AddGenreButtonClick
    end
    object DeleteGenreButton: TButton
      Left = 168
      Top = 45
      Width = 121
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = DeleteGenreButtonClick
    end
  end
  object InsertDeleteAuthorPanel: TPanel
    Left = 319
    Top = 287
    Width = 297
    Height = 94
    BevelOuter = bvNone
    TabOrder = 4
    object Label2: TLabel
      Left = 80
      Top = 18
      Width = 141
      Height = 15
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1059#1076#1072#1083#1080#1090#1100' '#1072#1074#1090#1086#1088#1072
    end
    object AddAuthorButton: TButton
      Left = 16
      Top = 45
      Width = 121
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = AddAuthorButtonClick
    end
    object DeleteAuthorButton: TButton
      Left = 168
      Top = 45
      Width = 113
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = DeleteAuthorButtonClick
    end
  end
  object PanelToPutGenreValue: TPanel
    Left = 8
    Top = 287
    Width = 305
    Height = 94
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    object Label3: TLabel
      Left = 16
      Top = 3
      Width = 73
      Height = 15
      Caption = #1053#1086#1074#1099#1081' '#1078#1072#1085#1088':'
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 24
      Width = 273
      Height = 23
      DataField = 'genName'
      DataSource = DataModule10.DS_T_genres
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1078#1072#1085#1088#1072
    end
    object SaveGenreButton: TButton
      Left = 16
      Top = 61
      Width = 129
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      OnClick = SaveGenreButtonClick
    end
    object CancelGenre: TButton
      Left = 168
      Top = 61
      Width = 121
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = CancelGenreClick
    end
  end
  object PanelToPutAuthorValue: TPanel
    Left = 319
    Top = 287
    Width = 297
    Height = 94
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    object Label4: TLabel
      Left = 16
      Top = 3
      Width = 75
      Height = 15
      Caption = #1053#1086#1074#1099#1081' '#1072#1074#1090#1086#1088':'
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 24
      Width = 265
      Height = 23
      DataField = 'auName'
      DataSource = DataModule10.DS_T_authors
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103' '#1085#1086#1074#1086#1075#1086' '#1072#1074#1090#1086#1088#1072
    end
    object SaveAuthorButton: TButton
      Left = 16
      Top = 62
      Width = 121
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      OnClick = SaveAuthorButtonClick
    end
    object CancelAuthorButton: TButton
      Left = 168
      Top = 62
      Width = 113
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = CancelAuthorButtonClick
    end
  end
end
