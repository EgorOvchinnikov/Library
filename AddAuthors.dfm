object Form12: TForm12
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1085#1080#1075#1091
  ClientHeight = 415
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 178
    Width = 578
    Height = 6
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 178
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 11
      Width = 31
      Height = 15
      Caption = #1046#1072#1085#1088
    end
    object Label2: TLabel
      Left = 192
      Top = 11
      Width = 52
      Height = 15
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label3: TLabel
      Left = 32
      Top = 69
      Width = 65
      Height = 15
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 32
      Top = 32
      Width = 130
      Height = 23
      DataField = 'IDgen'
      DataSource = DataModule10.DS_T_books
      KeyField = 'IDgen'
      ListField = 'genName'
      ListSource = DataModule10.DS_T_genres
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 192
      Top = 32
      Width = 354
      Height = 23
      DataField = 'bookName'
      DataSource = DataModule10.DS_T_books
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 32
      Top = 90
      Width = 130
      Height = 23
      DataField = 'bookCount'
      DataSource = DataModule10.DS_T_books
      TabOrder = 2
    end
    object Button1: TButton
      Left = 192
      Top = 89
      Width = 130
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1074#1090#1086#1088#1086#1074
      TabOrder = 3
      OnClick = Button1Click
    end
    object SetImageButton: TButton
      Left = 408
      Top = 89
      Width = 138
      Height = 25
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1091
      TabOrder = 4
      OnClick = SetImageButtonClick
    end
    object ClearImageButton: TButton
      Left = 408
      Top = 136
      Width = 138
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1091
      TabOrder = 5
      OnClick = ClearImageButtonClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 184
    Width = 578
    Height = 231
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object Label4: TLabel
      Left = 32
      Top = 6
      Width = 33
      Height = 15
      Caption = #1040#1074#1090#1086#1088
    end
    object AddAuthorButton: TButton
      Left = 200
      Top = 27
      Width = 130
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = AddAuthorButtonClick
    end
    object DBGrid1: TDBGrid
      Left = 32
      Top = 72
      Width = 298
      Height = 73
      DataSource = DataModule10.DS_Q_v_books_authors
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'auName'
          Title.Caption = #1057#1087#1080#1089#1086#1082' '#1072#1074#1090#1086#1088#1086#1074' '#1082#1085#1080#1075#1080
          Width = 298
          Visible = True
        end>
    end
    object SaveAuthorButton: TButton
      Left = 32
      Top = 184
      Width = 130
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 2
      OnClick = SaveAuthorButtonClick
    end
    object CancelAuthorButton: TButton
      Left = 200
      Top = 184
      Width = 130
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 3
      OnClick = CancelAuthorButtonClick
    end
    object DeleteAuthorButton: TButton
      Left = 352
      Top = 27
      Width = 130
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 4
      OnClick = DeleteAuthorButtonClick
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 32
      Top = 27
      Width = 145
      Height = 23
      DataField = 'IDau'
      DataSource = DataModule10.DS_T_books_authors
      KeyField = 'IDau'
      ListField = 'auName'
      ListSource = DataModule10.DS_T_authors
      TabOrder = 5
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 344
    Top = 128
  end
end
