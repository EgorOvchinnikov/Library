object Form9: TForm9
  Left = 0
  Top = 0
  Caption = #1041#1080#1073#1083#1080#1086#1090#1077#1095#1085#1099#1081' '#1091#1095#1105#1090
  ClientHeight = 667
  ClientWidth = 907
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 907
    Height = 667
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1050#1085#1080#1075#1080
      object Label8: TLabel
        Left = 320
        Top = 468
        Width = 106
        Height = 15
        Alignment = taCenter
        Caption = #1050#1086#1084#1091' '#1074#1099#1076#1072#1085#1072' '#1082#1085#1080#1075#1072
      end
      object AddEditDeleteBooksPanel: TPanel
        Left = 0
        Top = 583
        Width = 684
        Height = 57
        BevelOuter = bvNone
        TabOrder = 0
        object Label12: TLabel
          Left = 12
          Top = 21
          Width = 113
          Height = 15
          Caption = #1044#1077#1081#1089#1090#1074#1080#1103' '#1089' '#1082#1085#1080#1075#1072#1084#1080':'
        end
        object AddBookButton: TButton
          Left = 141
          Top = 16
          Width = 140
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 0
          OnClick = AddBookButtonClick
        end
        object EditBookButton: TButton
          Left = 303
          Top = 16
          Width = 140
          Height = 25
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          OnClick = EditBookButtonClick
        end
        object DeleteBookButton: TButton
          Left = 464
          Top = 16
          Width = 140
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 2
          OnClick = DeleteBookButtonClick
        end
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 489
        Width = 777
        Height = 88
        DataSource = DataModule10.DS_Q_v_whos_book
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid3DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'readName'
            Title.Caption = #1060#1048#1054' '#1095#1080#1090#1072#1090#1077#1083#1103
            Width = 370
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'readTicket'
            Title.Caption = #8470' '#1073#1080#1083#1077#1090#1072
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'readPhone'
            Title.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'giveDate'
            Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'backDate'
            Title.Caption = #1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
            Width = 90
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 141
        Width = 680
        Height = 75
        BevelOuter = bvNone
        TabOrder = 2
        object Label10: TLabel
          Left = 11
          Top = 3
          Width = 35
          Height = 15
          Caption = #1055#1086#1080#1089#1082
        end
        object DBText1: TDBText
          Left = 52
          Top = 56
          Width = 65
          Height = 17
        end
        object Label4: TLabel
          Left = 12
          Top = 55
          Width = 34
          Height = 15
          Caption = #1042#1089#1077#1075#1086':'
        end
        object Books_Filter: TEdit
          Left = 11
          Top = 20
          Width = 347
          Height = 23
          TabOrder = 0
          TextHint = #1046#1072#1085#1088', '#1072#1074#1090#1086#1088', '#1085#1072#1079#1074#1072#1085#1080#1077
          OnChange = Books_FilterChange
        end
        object ShowFiltersButton: TButton
          Left = 383
          Top = 18
          Width = 130
          Height = 25
          Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1092#1080#1083#1100#1090#1088#1099
          TabOrder = 1
          OnClick = ShowFiltersButtonClick
        end
        object HideFiltersButton: TButton
          Left = 534
          Top = 18
          Width = 130
          Height = 25
          Caption = #1057#1082#1088#1099#1090#1100' '#1092#1080#1083#1100#1090#1088#1099
          TabOrder = 2
          OnClick = HideFiltersButtonClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 220
        Width = 897
        Height = 241
        DataSource = DataModule10.DS_Q_v_books
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'genName'
            Title.Caption = #1046#1072#1085#1088
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'auName'
            Title.Caption = #1040#1074#1090#1086#1088
            Width = 275
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'bookName'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 330
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'bookCount'
            Title.Caption = #1042#1089#1077#1075#1086
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'booksIssued'
            Title.Caption = #1042#1099#1076#1072#1085#1099
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'booksRemaining'
            Title.Caption = #1054#1089#1090#1072#1083#1086#1089#1100
            Width = 57
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = -3
        Width = 680
        Height = 141
        BevelOuter = bvNone
        TabOrder = 4
        Visible = False
        object GroupBox1: TGroupBox
          Left = 0
          Top = 6
          Width = 281
          Height = 66
          Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1078#1072#1085#1088#1091
          TabOrder = 0
          object DBLookupComboBox3: TDBLookupComboBox
            Left = 11
            Top = 24
            Width = 145
            Height = 23
            KeyField = 'genName'
            ListField = 'genName'
            ListSource = DataModule10.DS_T_genres
            TabOrder = 0
            OnCloseUp = DBLookupComboBox3CloseUp
          end
          object Button1: TButton
            Left = 176
            Top = 24
            Width = 89
            Height = 25
            Caption = #1057#1073#1088#1086#1089
            TabOrder = 1
            OnClick = Button1Click
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 72
          Width = 281
          Height = 66
          Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1072#1074#1090#1086#1088#1091
          TabOrder = 1
          object DBLookupComboBox4: TDBLookupComboBox
            Left = 11
            Top = 24
            Width = 145
            Height = 23
            KeyField = 'auName'
            ListField = 'auName'
            ListSource = DataModule10.DS_T_authors
            TabOrder = 0
            OnCloseUp = DBLookupComboBox4CloseUp
          end
          object Button2: TButton
            Left = 176
            Top = 24
            Width = 89
            Height = 25
            Caption = #1057#1073#1088#1086#1089
            TabOrder = 1
            OnClick = Button2Click
          end
        end
        object GroupBox3: TGroupBox
          Left = 287
          Top = 4
          Width = 377
          Height = 134
          Caption = #1060#1080#1083#1100#1090#1088#1099' '#1087#1086' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1091
          TabOrder = 2
          object Label1: TLabel
            Left = 16
            Top = 30
            Width = 34
            Height = 15
            Caption = #1042#1089#1077#1075#1086':'
          end
          object Label2: TLabel
            Left = 16
            Top = 67
            Width = 47
            Height = 15
            Caption = #1042#1099#1076#1072#1085#1099':'
          end
          object Label3: TLabel
            Left = 16
            Top = 103
            Width = 55
            Height = 15
            Caption = #1054#1089#1090#1072#1083#1086#1089#1100':'
          end
          object CountCondition: TComboBox
            Left = 80
            Top = 27
            Width = 113
            Height = 23
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = #1073#1086#1083#1100#1096#1077
            Items.Strings = (
              #1073#1086#1083#1100#1096#1077
              #1086#1090
              #1084#1077#1085#1100#1096#1077
              #1088#1072#1074#1085#1086)
          end
          object IssuedCondition: TComboBox
            Left = 80
            Top = 64
            Width = 113
            Height = 23
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = #1073#1086#1083#1100#1096#1077
            Items.Strings = (
              #1073#1086#1083#1100#1096#1077
              #1086#1090
              #1084#1077#1085#1100#1096#1077
              #1088#1072#1074#1085#1086)
          end
          object RemainingCondition: TComboBox
            Left = 80
            Top = 100
            Width = 113
            Height = 23
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 2
            Text = #1073#1086#1083#1100#1096#1077
            Items.Strings = (
              #1073#1086#1083#1100#1096#1077
              #1086#1090
              #1084#1077#1085#1100#1096#1077
              #1088#1072#1074#1085#1086)
          end
          object SpinCountValue: TSpinEdit
            Left = 209
            Top = 27
            Width = 65
            Height = 24
            MaxValue = 0
            MinValue = 0
            TabOrder = 3
            Value = 0
          end
          object SpinIssuedValue: TSpinEdit
            Left = 209
            Top = 64
            Width = 65
            Height = 24
            MaxValue = 0
            MinValue = 0
            TabOrder = 4
            Value = 0
          end
          object SpinRemainingValue: TSpinEdit
            Left = 209
            Top = 100
            Width = 65
            Height = 24
            MaxValue = 0
            MinValue = 0
            TabOrder = 5
            Value = 0
          end
          object ChkCount: TCheckBox
            Left = 293
            Top = 30
            Width = 81
            Height = 17
            Caption = #1042#1082#1083#1102#1095#1080#1090#1100
            TabOrder = 6
            OnClick = ChkCountClick
          end
          object ChkIssued: TCheckBox
            Left = 293
            Top = 67
            Width = 81
            Height = 17
            Caption = #1042#1082#1083#1102#1095#1080#1090#1100
            TabOrder = 7
            OnClick = ChkIssuedClick
          end
          object ChkRemaining: TCheckBox
            Left = 293
            Top = 103
            Width = 81
            Height = 17
            Caption = #1042#1082#1083#1102#1095#1080#1090#1100
            TabOrder = 8
            OnClick = ChkRemainingClick
          end
        end
      end
      object Panel4: TPanel
        Left = 680
        Top = 0
        Width = 217
        Height = 216
        BevelOuter = bvNone
        TabOrder = 5
        object Books_Image: TDBImage
          AlignWithMargins = True
          Left = 6
          Top = 3
          Width = 211
          Height = 211
          BorderStyle = bsNone
          DataField = 'bookPhoto'
          DataSource = DataModule10.DS_T_books
          Proportional = True
          Stretch = True
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1063#1080#1090#1072#1090#1077#1083#1080
      ImageIndex = 1
      object Label9: TLabel
        Left = 344
        Top = 397
        Width = 92
        Height = 15
        Alignment = taCenter
        Caption = #1042#1099#1076#1072#1085#1085#1099#1077' '#1082#1085#1080#1075#1080
      end
      object Label15: TLabel
        Left = 8
        Top = 81
        Width = 34
        Height = 15
        Caption = #1042#1089#1077#1075#1086':'
      end
      object DBText2: TDBText
        Left = 48
        Top = 81
        Width = 65
        Height = 17
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 102
        Width = 897
        Height = 289
        DataSource = DataModule10.DS_Q_v_readers
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnTitleClick = DBGrid2TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'readTicket'
            Title.Caption = #8470' '#1073#1080#1083#1077#1090#1072
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'readName'
            Title.Caption = #1060#1048#1054' '#1095#1080#1090#1072#1090#1077#1083#1103
            Width = 550
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'readBirth'
            Title.Caption = #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'readPhone'
            Title.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
            Width = 130
            Visible = True
          end>
      end
      object AddEditDeleteReadersPanel: TPanel
        Left = 0
        Top = 537
        Width = 760
        Height = 57
        BevelOuter = bvNone
        TabOrder = 1
        object Label14: TLabel
          Left = 8
          Top = 21
          Width = 131
          Height = 15
          Caption = #1044#1077#1081#1089#1090#1074#1080#1103' '#1089' '#1095#1080#1090#1072#1090#1077#1083#1103#1084#1080':'
        end
        object AddReaderButton: TButton
          Left = 161
          Top = 16
          Width = 140
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 0
          OnClick = AddReaderButtonClick
        end
        object EditReaderButton: TButton
          Left = 324
          Top = 16
          Width = 140
          Height = 25
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          OnClick = EditReaderButtonClick
        end
        object DeleteReaderButton: TButton
          Left = 487
          Top = 16
          Width = 140
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 2
          OnClick = DeleteReaderButtonClick
        end
      end
      object PanelToInputReaderValues: TPanel
        Left = 0
        Top = 536
        Width = 760
        Height = 98
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        object Label5: TLabel
          Left = 16
          Top = 8
          Width = 79
          Height = 15
          Caption = #1060#1048#1054' '#1095#1080#1090#1072#1090#1077#1083#1103
        end
        object Label6: TLabel
          Left = 416
          Top = 8
          Width = 77
          Height = 15
          Caption = #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
        end
        object Label7: TLabel
          Left = 568
          Top = 8
          Width = 94
          Height = 15
          Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 24
          Width = 369
          Height = 23
          DataField = 'readName'
          DataSource = DataModule10.DS_T_readers
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 416
          Top = 24
          Width = 121
          Height = 23
          DataField = 'readBirth'
          DataSource = DataModule10.DS_T_readers
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 568
          Top = 24
          Width = 145
          Height = 23
          DataField = 'readPhone'
          DataSource = DataModule10.DS_T_readers
          MaxLength = 15
          TabOrder = 2
        end
        object SaveReaderButton: TButton
          Left = 16
          Top = 64
          Width = 140
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 3
          OnClick = SaveReaderButtonClick
        end
        object CancelReaderButton: TButton
          Left = 184
          Top = 64
          Width = 140
          Height = 25
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 4
          OnClick = CancelReaderButtonClick
        end
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 418
        Width = 777
        Height = 112
        DataSource = DataModule10.DS_Q_v_readershand
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid4DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'expr1'
            Title.Caption = #1050#1085#1080#1075#1072
            Width = 540
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'giveDate'
            Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'backDate'
            Title.Caption = #1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
            Width = 100
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 10
        Width = 899
        Height = 65
        BevelOuter = bvNone
        TabOrder = 4
        object Label11: TLabel
          Left = 8
          Top = 8
          Width = 35
          Height = 15
          Caption = #1055#1086#1080#1089#1082
        end
        object Readers_Filter: TEdit
          Left = 8
          Top = 29
          Width = 401
          Height = 23
          TabOrder = 0
          TextHint = #1060#1048#1054', '#8470' '#1073#1080#1083#1077#1090#1072', '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1080#1083#1080' '#1085#1086#1084#1077#1088' '#1090#1077#1083'.'
          OnChange = Readers_FilterChange
        end
        object GroupBox4: TGroupBox
          Left = 432
          Top = 8
          Width = 326
          Height = 55
          Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1075#1086#1076#1091' '#1088#1086#1078#1076#1077#1085#1080#1103
          TabOrder = 1
          object Label13: TLabel
            Left = 207
            Top = 24
            Width = 14
            Height = 15
            Caption = #1087#1086
          end
          object CheckBox2: TCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089
            TabOrder = 0
            OnClick = CheckBox2Click
          end
          object SpinEdit3: TSpinEdit
            Left = 119
            Top = 24
            Width = 82
            Height = 24
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object SpinEdit4: TSpinEdit
            Left = 230
            Top = 24
            Width = 83
            Height = 24
            MaxValue = 0
            MinValue = 0
            TabOrder = 2
            Value = 0
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 152
    Top = 65528
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1046#1072#1085#1088#1099' '#1080' '#1072#1074#1090#1086#1088#1099
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1042#1099#1076#1072#1085#1085#1099#1077' '#1082#1085#1080#1075#1080
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #1043#1088#1072#1092#1080#1082#1080
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #1054#1090#1095#1105#1090#1099
      object N7: TMenuItem
        Caption = #1063#1080#1090#1072#1090#1077#1083#1100#1089#1082#1080#1077' '#1073#1080#1083#1077#1090#1099
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1050#1085#1080#1078#1085#1099#1077' '#1082#1072#1088#1090#1086#1095#1082#1080
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1082#1085#1080#1075
        OnClick = N9Click
      end
    end
  end
end
