object Form11: TForm11
  Left = 0
  Top = 0
  Caption = #1042#1099#1076#1072#1085#1085#1099#1077' '#1082#1085#1080#1075#1080
  ClientHeight = 438
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 104
    Width = 782
    Height = 217
    DataSource = DataModule10.DS_Q_v_given_books
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'expr1'
        Title.Caption = #1050#1085#1080#1075#1072
        Width = 425
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'readTicket'
        Title.Caption = #8470' '#1095#1080#1090#1072#1090#1077#1083#1100#1089#1082#1086#1075#1086' '#1073#1080#1083#1077#1090#1072
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'giveDate'
        Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'backDate'
        Title.Caption = #1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
        Width = 85
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 98
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 19
      Top = 73
      Width = 35
      Height = 15
      Caption = #1055#1086#1080#1089#1082
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 1
      Width = 313
      Height = 57
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' '#1074#1099#1076#1072#1095#1080
      TabOrder = 0
      object Label1: TLabel
        Left = 199
        Top = 23
        Width = 14
        Height = 15
        Caption = #1087#1086
      end
      object CheckBox1: TCheckBox
        Left = 11
        Top = 23
        Width = 97
        Height = 17
        Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object DateTimePicker1: TDateTimePicker
        Left = 114
        Top = 23
        Width = 79
        Height = 23
        Date = 45612.000000000000000000
        Time = 0.490654560184339100
        TabOrder = 1
        OnChange = DateTimePicker1Change
      end
      object DateTimePicker2: TDateTimePicker
        Left = 220
        Top = 23
        Width = 82
        Height = 23
        Date = 45612.000000000000000000
        Time = 0.490883749997010500
        TabOrder = 2
        OnChange = DateTimePicker2Change
      end
    end
    object GroupBox2: TGroupBox
      Left = 327
      Top = 0
      Width = 314
      Height = 58
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' '#1074#1086#1079#1074#1088#1072#1090#1072
      TabOrder = 1
      object Label2: TLabel
        Left = 201
        Top = 24
        Width = 14
        Height = 15
        Caption = #1087#1086
      end
      object CheckBox2: TCheckBox
        Left = 11
        Top = 24
        Width = 97
        Height = 17
        Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089
        TabOrder = 0
        OnClick = CheckBox2Click
      end
      object DateTimePicker3: TDateTimePicker
        Left = 114
        Top = 24
        Width = 81
        Height = 23
        Date = 45612.000000000000000000
        Time = 0.498128831015492300
        TabOrder = 1
        OnChange = DateTimePicker3Change
      end
      object DateTimePicker4: TDateTimePicker
        Left = 225
        Top = 24
        Width = 77
        Height = 23
        Date = 45612.000000000000000000
        Time = 0.498298263890319500
        TabOrder = 2
        OnChange = DateTimePicker4Change
      end
    end
    object Given_Filter: TEdit
      Left = 60
      Top = 70
      Width = 581
      Height = 23
      TabOrder = 2
      TextHint = #1050#1085#1080#1075#1072', '#1060#1048#1054' '#1095#1080#1090#1072#1090#1077#1083#1103', '#8470' '#1073#1080#1083#1077#1090#1072
      OnChange = Given_FilterChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 327
    Width = 782
    Height = 106
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 19
      Top = 8
      Width = 53
      Height = 15
      Caption = #1063#1080#1090#1072#1090#1077#1083#1100':'
    end
    object DBText1: TDBText
      Left = 78
      Top = 8
      Width = 417
      Height = 17
      DataField = 'expr2'
      DataSource = DataModule10.DS_Q_v_given_books
    end
    object GiveBookButton: TButton
      Left = 327
      Top = 72
      Width = 124
      Height = 25
      Caption = #1042#1099#1076#1072#1090#1100' '#1082#1085#1080#1075#1091
      TabOrder = 0
      OnClick = GiveBookButtonClick
    end
    object EditGivenButton: TButton
      Left = 479
      Top = 72
      Width = 125
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 1
      OnClick = EditGivenButtonClick
    end
    object DeleteGivenButton: TButton
      Left = 640
      Top = 72
      Width = 125
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = DeleteGivenButtonClick
    end
  end
end
