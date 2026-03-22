object DataModule10: TDataModule10
  Height = 563
  Width = 833
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="Driver=MySQL ODBC 8.0 Unicode Driver;SERVER=YOUR_SERVER;UID=YO' +
      'UR_USERNAME;PWD=YOUR_PASSWORD;DATABASE=library;PORT=3306;CHARSET=utf8mb4;COLUMN_SIZE_S32=1"'
    Left = 48
    Top = 24
  end
  object T_authors: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'authors'
    Left = 152
    Top = 96
    object T_authorsIDau: TAutoIncField
      FieldName = 'IDau'
      ReadOnly = True
    end
    object T_authorsauName: TWideStringField
      FieldName = 'auName'
      Size = 50
    end
  end
  object T_genres: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'genres'
    Left = 152
    Top = 24
    object T_genresIDgen: TAutoIncField
      FieldName = 'IDgen'
      ReadOnly = True
    end
    object T_genresgenName: TWideStringField
      FieldName = 'genName'
      Size = 50
    end
  end
  object T_readers: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterPost = T_readersAfterPost
    AfterDelete = T_readersAfterDelete
    IndexFieldNames = 'IDread'
    TableName = 'readers'
    Left = 152
    Top = 256
    object T_readersIDread: TAutoIncField
      FieldName = 'IDread'
      ReadOnly = True
    end
    object T_readersreadName: TWideStringField
      FieldName = 'readName'
      Size = 50
    end
    object T_readersreadBirth: TWideStringField
      FieldName = 'readBirth'
      Size = 4
    end
    object T_readersreadPhone: TWideStringField
      FieldName = 'readPhone'
      EditMask = '!\+7-000-000-0000;0;_'
      Size = 11
    end
    object T_readersreadTicket: TWideStringField
      FieldName = 'readTicket'
      Size = 255
    end
  end
  object T_given_books: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterPost = T_given_booksAfterPost
    AfterDelete = T_given_booksAfterDelete
    TableName = 'given_books'
    Left = 152
    Top = 336
    object T_given_booksIDread: TIntegerField
      FieldName = 'IDread'
    end
    object T_given_booksIDbook: TIntegerField
      FieldName = 'IDbook'
    end
    object T_given_booksgiveDate: TDateField
      FieldName = 'giveDate'
    end
    object T_given_booksbackDate: TDateField
      FieldName = 'backDate'
    end
  end
  object Q_v_books: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_v_booksAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM view_books ')
    Left = 384
    Top = 24
    object Q_v_booksIDbook: TIntegerField
      FieldName = 'IDbook'
    end
    object Q_v_booksgenName: TWideStringField
      FieldName = 'genName'
      Size = 50
    end
    object Q_v_booksauName: TWideStringField
      FieldName = 'auName'
      Size = 50
    end
    object Q_v_booksbookName: TWideStringField
      FieldName = 'bookName'
      Size = 191
    end
    object Q_v_booksbookCount: TIntegerField
      FieldName = 'bookCount'
    end
    object Q_v_booksbooksIssued: TIntegerField
      FieldName = 'booksIssued'
    end
    object Q_v_booksbooksRemaining: TIntegerField
      FieldName = 'booksRemaining'
    end
  end
  object Q_v_readers_hand: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_v_readers_handAfterScroll
    DataSource = DS_Q_v_readers
    Parameters = <
      item
        Name = 'IDread'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 188
        Precision = 255
        Value = 24
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM view_readers_hand'
      'WHERE view_readers_hand.IDread = :IDread')
    Left = 384
    Top = 96
    object Q_v_readers_handIDread: TIntegerField
      FieldName = 'IDread'
    end
    object Q_v_readers_handexpr1: TWideStringField
      FieldName = 'expr1'
      Size = 450
    end
    object Q_v_readers_handgiveDate: TDateField
      FieldName = 'giveDate'
    end
    object Q_v_readers_handbackDate: TDateField
      FieldName = 'backDate'
    end
    object Q_v_readers_handIDbook: TAutoIncField
      FieldName = 'IDbook'
      ReadOnly = True
    end
  end
  object Q_v_whos_book: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_v_whos_bookAfterScroll
    DataSource = DS_Q_v_books
    Parameters = <
      item
        Name = 'IDbook'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 188
        Precision = 255
        Value = 55
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM view_whos_book'
      'WHERE view_whos_book.IDbook = :IDbook')
    Left = 384
    Top = 176
    object Q_v_whos_bookIDbook: TIntegerField
      FieldName = 'IDbook'
    end
    object Q_v_whos_bookreadName: TWideStringField
      FieldName = 'readName'
      Size = 50
    end
    object Q_v_whos_bookreadPhone: TWideStringField
      FieldName = 'readPhone'
      EditMask = '!\+7-000-000-0000;0;_'
      Size = 11
    end
    object Q_v_whos_bookgiveDate: TDateField
      FieldName = 'giveDate'
    end
    object Q_v_whos_bookbackDate: TDateField
      FieldName = 'backDate'
    end
    object Q_v_whos_bookIDread: TAutoIncField
      FieldName = 'IDread'
      ReadOnly = True
    end
    object Q_v_whos_bookreadTicket: TWideStringField
      FieldName = 'readTicket'
      Size = 255
    end
  end
  object DS_T_genres: TDataSource
    DataSet = T_genres
    Left = 256
    Top = 24
  end
  object DS_T_authors: TDataSource
    DataSet = T_authors
    Left = 256
    Top = 96
  end
  object DS_T_readers: TDataSource
    DataSet = T_readers
    Left = 256
    Top = 256
  end
  object DS_T_given_books: TDataSource
    DataSet = T_given_books
    Left = 256
    Top = 336
  end
  object DS_Q_v_books: TDataSource
    DataSet = Q_v_books
    Left = 504
    Top = 24
  end
  object DS_Q_v_readershand: TDataSource
    DataSet = Q_v_readers_hand
    Left = 504
    Top = 96
  end
  object DS_Q_v_whos_book: TDataSource
    DataSet = Q_v_whos_book
    Left = 504
    Top = 176
  end
  object T_books: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterPost = T_booksAfterPost
    AfterDelete = T_booksAfterDelete
    TableName = 'books'
    Left = 152
    Top = 176
    object T_booksIDbook: TAutoIncField
      FieldName = 'IDbook'
      ReadOnly = True
    end
    object T_booksIDgen: TIntegerField
      FieldName = 'IDgen'
    end
    object T_booksbookName: TWideStringField
      FieldName = 'bookName'
      Size = 191
    end
    object T_booksbookCount: TIntegerField
      FieldName = 'bookCount'
    end
    object T_booksbooksIssued: TIntegerField
      FieldName = 'booksIssued'
    end
    object T_booksbooksRemaining: TIntegerField
      FieldName = 'booksRemaining'
    end
    object T_booksbookPhoto: TBlobField
      FieldName = 'bookPhoto'
    end
  end
  object DS_T_books: TDataSource
    DataSet = T_books
    Left = 256
    Top = 176
  end
  object Q_v_readers: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_v_readersAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM view_readers')
    Left = 384
    Top = 248
    object Q_v_readersIDread: TAutoIncField
      FieldName = 'IDread'
      ReadOnly = True
    end
    object Q_v_readersreadName: TWideStringField
      FieldName = 'readName'
      Size = 50
    end
    object Q_v_readersreadBirth: TWideStringField
      FieldName = 'readBirth'
      Size = 4
    end
    object Q_v_readersreadPhone: TWideStringField
      FieldName = 'readPhone'
      EditMask = '!\+7-000-000-0000;0;_'
      Size = 11
    end
    object Q_v_readersreadTicket: TWideStringField
      FieldName = 'readTicket'
      Size = 255
    end
  end
  object DS_Q_v_readers: TDataSource
    DataSet = Q_v_readers
    Left = 504
    Top = 248
  end
  object Q_v_given_books: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_v_given_booksAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM view_given_books'
      'ORDER BY IDbook')
    Left = 384
    Top = 336
    object Q_v_given_booksexpr1: TWideStringField
      FieldName = 'expr1'
      Size = 244
    end
    object Q_v_given_booksexpr2: TWideStringField
      FieldName = 'expr2'
      EditMask = '!+7-000-000-0000;0;_'
      Size = 68
    end
    object Q_v_given_booksgiveDate: TDateField
      FieldName = 'giveDate'
    end
    object Q_v_given_booksbackDate: TDateField
      FieldName = 'backDate'
    end
    object Q_v_given_booksreadTicket: TWideStringField
      FieldName = 'readTicket'
      Size = 255
    end
    object Q_v_given_booksIDbook: TIntegerField
      FieldName = 'IDbook'
    end
    object Q_v_given_booksIDread: TIntegerField
      FieldName = 'IDread'
    end
  end
  object DS_Q_v_given_books: TDataSource
    DataSet = Q_v_given_books
    Left = 504
    Top = 336
  end
  object T_books_authors: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'books_authors'
    Left = 152
    Top = 408
  end
  object DS_T_books_authors: TDataSource
    DataSet = T_books_authors
    Left = 256
    Top = 408
  end
  object Q_v_books_authors: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDbook'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 96
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT ba.IDbook, ba.IDau, a.auName'
      'FROM books_authors ba'
      'JOIN authors a ON ba.IDau = a.IDau'
      'WHERE ba.IDbook = :IDbook')
    Left = 384
    Top = 408
    object Q_v_books_authorsIDbook: TIntegerField
      FieldName = 'IDbook'
    end
    object Q_v_books_authorsIDau: TIntegerField
      FieldName = 'IDau'
    end
    object Q_v_books_authorsauName: TWideStringField
      FieldName = 'auName'
      Size = 50
    end
  end
  object DS_Q_v_books_authors: TDataSource
    DataSet = Q_v_books_authors
    Left = 504
    Top = 408
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 632
    Top = 24
  end
  object Q_v_available_books: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_v_available_booksAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM view_available_books')
    Left = 384
    Top = 488
    object Q_v_available_booksIDbook: TIntegerField
      FieldName = 'IDbook'
    end
    object Q_v_available_booksexpr1: TWideStringField
      FieldName = 'expr1'
      Size = 450
    end
    object Q_v_available_booksbooksRemaining: TIntegerField
      FieldName = 'booksRemaining'
    end
  end
  object DS_Q_v_available_books: TDataSource
    DataSet = Q_v_available_books
    Left = 504
    Top = 488
  end
  object Q_genres_count: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM view_genres_count')
    Left = 632
    Top = 96
  end
  object Q_given_count: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'#11
      'FROM view_given_count')
    Left = 632
    Top = 176
  end
  object Q_popular_books: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM view_popular_books'
      'WHERE GivenBookCount > 1')
    Left = 632
    Top = 248
    object Q_popular_booksAuthorBook: TWideStringField
      FieldName = 'AuthorBook'
      Size = 244
    end
    object Q_popular_booksGivenBookCount: TLargeintField
      FieldName = 'GivenBookCount'
    end
  end
  object DS_reader_tickets: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = Q_v_readers
    BCDToCurrency = False
    DataSetOptions = []
    Left = 752
    Top = 24
    FieldDefs = <
      item
        FieldName = 'IDread'
      end
      item
        FieldName = 'readName'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'readBirth'
        FieldType = fftString
      end
      item
        FieldName = 'readPhone'
        FieldType = fftString
        Size = 11
      end
      item
        FieldName = 'readTicket'
        FieldType = fftString
        Size = 255
      end>
  end
  object Rep_reader_tickets: TfrxReport
    Version = '2025.1.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45643.426027511600000000
    ReportOptions.LastChange = 45643.426027511600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 752
    Top = 96
    Datasets = <
      item
        DataSet = DS_reader_tickets
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 2
      ColumnWidth = 95.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '95')
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 219.212740000000000000
        Top = 18.897650000000000000
        Width = 359.055350000000000000
        DataSet = DS_reader_tickets
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 15.118122400000000000
          Width = 173.858378830000000000
          Height = 22.677181670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clLavender
          HAlign = haRight
          Memo.UTF8W = (
            #1063#1080#1090#1072#1090#1077#1083#1100#1089#1082#1080#1081' '#1073#1080#1083#1077#1090' '#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417443180000000000
          Top = 15.118123260000000000
          Width = 166.299305470000000000
          Height = 22.677174040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'readTicket'
          DataSet = DS_reader_tickets
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clLavender
          Memo.UTF8W = (
            '[frxDBDataset1."readTicket"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 52.913422360000000000
          Width = 113.385902640000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '  '#1060#1048#1054':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181193880000000000
          Top = 52.913422360000000000
          Width = 136.063080730000000000
          Height = 37.795294040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'readName'
          DataSet = DS_reader_tickets
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."readName"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060050000000000
          Top = 98.267787420000000000
          Width = 113.385896440000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '  '#1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181202400000000000
          Top = 98.267787420000000000
          Width = 181.417433100000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'readBirth'
          DataSet = DS_reader_tickets
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."readBirth"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060050000000000
          Top = 132.283542980000000000
          Width = 132.283546440000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '  '#1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181199830000000000
          Top = 132.283542980000000000
          Width = 181.417440730000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = DS_reader_tickets
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '+7[frxDBDataset1."readPhone"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330100000000000
          Top = 166.299306120000000000
          Width = 105.826839780000000000
          Height = 18.897674560000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1041#1080#1073#1083#1080#1086#1090#1077#1082#1072' '#1057#1080#1073#1043#1059)
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 11.338593300000000000
          Top = 90.708720400000000000
          Width = 321.260043190000000000
          Color = clBlack
          ArrowWidth = 2
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 120.944960000000000000
          Width = 321.260043190000000000
          Color = clBlack
          ArrowWidth = 2
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 154.960730000000000000
          Width = 321.260043190000000000
          Color = clBlack
          ArrowWidth = 2
          Frame.Typ = [ftTop]
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 211.653673060000000000
          Top = 166.299333210000000000
          Width = 18.897650730000000000
          Height = 18.897644040000000000
          Frame.Typ = []
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000D70000
            00EA0803000000064720F4000000C3504C5445FFFFFF89BE5C7F7E7C4B79BB7C
            7B797978764173B84575B987BD5983BB524877BAC5C4C3A0A09E85BC56829FCD
            86BD58ADC1DE81BA4E8DC0613C70B7EFEFEFAACF8C878684E8F2E0F5F5F5E7E7
            E7F8FBF5F4F7FBCAD6E9D8E9CBA4CC83F9F9F993C36ACEE3BEB6D69EF1F7ECA1
            CB7FA3B8DADAE3F05E86C1DBDBDABBD9A59BC776C4DEB08CA7D1EBF0F78B8A88
            F3F8EF648BC4BECDE5C1C1C0DEECD27194C85480BEDFDEDEAFAEAD989796D2D2
            D1E1E8F3C9E0B6B0D39499B0D5CFDAEB6C90C57AB74291D5D89800001BEB4944
            415478DAED5D895BDB48B26F1D5832186313C017E0D8246402310C909D83C9E6
            FDED6FDFCEDB999D49B22413B2B9809083C3DC186C838F956CF5DD2DC9B63293
            79CFF57DF9021696F4EBFA7555757575B7027E67895E2CB7FE7F1E3AF99C8F51
            7E775CD55AEB7F6DB08FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8F
            AB8FAB8FEBFF39AE743D347D7430F19CC3F503D8BE4A163FFD0971CDC42AFBE3
            2F4C00F45A6A83C375EBB0029A49BD917AA3050BEEB3E29A6994EAD73510AA56
            EDDF22E33CAEE9D333000CA351B3D0A9D7A1B75F3EAEB43670D2AC3890802BAE
            B61803357344BDAE07A3B7CF836BF1ACFEDED4AFABD4871EB81C6C95294D0D40
            6D9F0157DAD08A57A133EE731FB86C895EE9897AB557AD058E6B25BC561380F2
            8FAB05CDD4A71F7D41B8D24678532F492EFAC7D5829618D2D7BE0C5C8B57FF36
            9B55D9554311D9F9BDEBAAF4EF4385D77B7F3CAE99E68E4455B61DD707A27AE2
            470ED7FCB97A6679025D8C2EA20F57BB441614AE9966118850198A59494C1E9B
            2765C7127071543A1CABC48F3681AE0A28195587C7BBEA68C1E04A8F7C10A0B2
            AC36C829E60E65DB24F1613A55A97E14E92D7A353ED085DDF7852B79F3CD81DB
            F51F9EF2A80C0524D4F80E67AFDDE2DE954BE57D8DEBA1117D7EA763647E7025
            275EC41B72602B877B15F633D34C2907C2AEE111CFCF24F73E02165A449D7C1E
            3CAEE4C47A431D5577C557D3D725EE356ACDDC91ACBF7B8F5366CC9D668DD1BF
            99B8D15937F3C6956C1C35005047C51ACBEDB2463002E26E5DDDD7F82B71FB57
            856E2D23ACA73B71679EB86C6DD9FF0B81CD5C17690A1A4AE5AB2BD7CEE0735C
            B958BBD8A391450686DE07870BC2B2803526582A4E150D3A6C552AAB9B1E919D
            FFF172EEB459269119CACADF03C3B5F0A20E7F541BA394C6D2D735EAD50C253C
            B2E9F9C04EF200531AADB34869D96F2FF3C295DA531B081845C54498368366F8
            EE8777DE0FEC2CBF6121231F6284D33E0DA367FF4A1501010C5BC5DC01E543A3
            6AF2D4D7D8A2D3BCCD0F8F29C3648ED77C3DC6DB1E8E1D111A43547CF09C7C2D
            43F11D14749C8F4AE71F91E39E4869C24FC8E8C37F89A898B822BBB419F66FAA
            BAC8B3256E6C12643406623E1EE627DE105171651DF568231CAFF8E146A17A59
            2A1C879FB7BF67FCE5B01A294EBFFBE807D9FCA706A132F3E68B407081B113C0
            5131517152326638E765A4B2C6D0B5FE2202C0395034D41CF5261806A03C172E
            D5CEBC0CCE8C41AA2C36EF69F0FDC5F3422A5EB60C476C7EC3555999999D9127
            B1734503E201A4056F18E45FAA1355776CF39F08E67B5B0F9FE31411151367CD
            AA118EB9B9ACCCC4DB3B6B848EA462D4C062F9E483DB9FAC3C8E60C368E6D603
            C1C5007334B66F2634B919CC4C689BE7BA2724247AE4DCFCFA9D5C6B699D08DA
            2237AE5C35E67B5C29A46263407AF3D9D08B58A9E61B544B8C7A247F32FEBFD2
            EB77B77C03F33F5E963968A12C45FF013A5015219A627CFD37D9C5A9031C57B9
            03EB200F903A684A422A46B2A7B7373A5515164B695307B29E96D8C79DCC1558
            27F90D79AC48C992BE2175B93A68E2474BCD891196225B3C3DC4C0A64EA4C03A
            CADBF8A1E2D2E5810095016C737EBE38F86471B7D8FA643CB9B674B9667D26F4
            0046F85E53CCC6740C7BB2487C3B105CDE545C1DF8ADCCBEA5016A409FDA5117
            8E9FB17F9ECDE84F1B779E36057D518F5C67B9BF6FC9AD8F0898291D91759867
            73A76226BFCEF52B3D52FAAEB1197FE672D3C271EE7C1D28DC379B921072BC84
            81E525E316FFB8665A9EEA9BC7722A3E2CAFD5E9EF18B5E15CBDF6CCC7DD0BEF
            6F71CECEEA668342A33F8D1D9939260E827DE3CA1F875AE3033915EFEDD014B4
            6288B9AD215F71AD032DB1C9D8123D32FA5AF4A72415A3C2618B5F5CB993B2D2
            BE03AD31046CF57093529651ABDFBD7AE51B545B66431B355A69B17B472275DF
            DA8356D118344546D127AEC4650918D5090718C28581C52EE9FEA1D587A7FCF0
            8F9542E5238D4CAFA504263F1D3A8603978859EC1A57FB36061869037B823503
            812D6D1324B474353CE223D72194CC20832C26E262FA0879879828E7E10FD778
            A5A576C3858A93FBE865B47AFED27FB71220CB3FAA93CA8F5DC7F946B21904AF
            87F82EE60BD754C931B86E549C2CB7356684534A370C2465F5B701D20669B912
            DF4EE8A5AC2E76D415AE998FE81950E73415DBE67E72DFFE4C5B0CFFCDC73DBD
            643245FA0C7D618037F8F31BD0280ADCB31F5CD3C750E5B88F4AA8086AD9D73E
            EEE84728B7A16B93BC6DC5EF158BB05ECC07AEDC2E6C17D2A68AA9980F44596D
            99DCD1B0CA8CDA4D0E58BA7259E55FCC2FAEF4B1D8078AA8F8F06D2FF682954C
            6A130752463DCB014B9CC1578B2C324CF4C6E5D842C005632273EF25D98B8129
            ADF553FDFDF590A72BB8FDCE5D63B88BC5F27452CC13D7CA3A6A93C41BFAD257
            6F040E5A2A63B7ABAFF2BBC7F883E6687263F6F2C0F56B93451C58196086B3B3
            731F1DF76CE4E9448E27AEB90DE4FFA6D98935111585924D37CAEB8A35A66C50
            1FABD6E39B73E1D37FCB1FBFFAB38E5C99BEF089A5F9CC276413977FEC0457EE
            0452DC4CF219B5EF7FF1A1B16CFA5995834483330A9F649C2C5C6D6160778FD9
            3FFBE131326AA3A4E9F0C0953E879D2B3AFE4670DD1B586A7AF3B829C384BEAA
            C4736F2584CC8CAF2356682657E38198D82E53F289EBEE076434C4E381EF7F75
            A5622AFB08D4811FD18031BC230616C12385589D1D6A629B68A6895CA63BAE99
            7D048BCBF5DF565AE6E9ABB772AB68A1F2541516559120CBC65F202AC6C26C74
            9FDF71805181BD3BAE7C11D1F094B9648583ED1080D618016C6CE67107A8DAC8
            96DF898C4F2682FA98315F618C62760F1A369252AEB8B0BA626C1A3EB36B58D8
            04C0101597FFA5C918A84A8D8856FFF61F828F0BAF90B9D70BBF3217513C442A
            CC15175217EB1D00B8FFAC6645EE37A4541CBBF58847A55A4FAB8F81A4F5E3EE
            81FD8B409FDA8AA86669F5116622D7C5902B22062C6EB87004C5654796B65B37
            D7B3122A0E5559955830E297B3C6D6B56ED8B63A5BADE5B586F24F8DC3A63644
            2A6B0F165A6D5C5F6162FBA903E73DA321A430375CF3DB8EBAA219465D05E777
            4342C56F1FD3CAB240AD3C8B0A8C42F62A557BC142D3967FE6FFF2AFEB504D3C
            136FEE3A0AC326D105571ABD071B7C816805BE774C44C53CCD41CD0235268F05
            C7A66B2F6864DACA166F3E6CE63BCF6499B80213E7D887B9E042FD91EB5D0429
            AA736DF3446A0CA8E45B6A60797B07B8CB571FAA1432918BCFA41FC387D6C798
            780AF6303C5E71C185BB233B6AFBCB731C333E717EA280116FA82CBFF513E9A7
            CE29646A23C1B585D3A7EDA69AFD8DBE84720228D893E34A5CC1A446728BBE12
            BB8410C807888059AED6F4357EB1E49BCA0B52E5CA1807ECDE2BF45C76C8027B
            18A2961CD783B512D3068E6430F797C9009B07A6C567FE01FCCBF253C288AA60
            9C03A6C11F38D381C25F68EAE5B8C2D0C8C79931361EEC31410D0B4C336E7496
            441C4B132A63CBCC801DE34026C6E6E97C43FAC8E91970E02CC585BD3815275B
            EA3A80BE9F6B3532BAB71ADCB8E808952DA4835047C36CB3209BA8DFFD177D05
            851066D91DD7ADA213FFB359C7BFFEEC3C9A7790E0BB5F892495E66505454279
            C2FB3F3157571FC136651586AC811342C8702D6EC0108AB11AD95D786BCE2A91
            ADADC53D66D6654226F078078D1A95E30AB4DED1916D375C8886ACD540C6D000
            71C68B106DADADFC04BA9454FD0803BBCFD89D4C1166CB599388B3810B6B2EB8
            D082187396CE6ADC790F6FFCEDFFD05F19C3D9E41E6059F751313035C6D80E64
            B4F4DB345B16B7E00BB78828C185622847AD489049326AE38CBA70E752E79E76
            0F8BAA78E4BA58E6D89947E1B253E3576D606D8B28C18542649686B07C905717
            66A167D58A97A48A988921C6A8A21EC616302222B6FC92041772CA6DB62229BC
            44C670966EAEE43EFA511DEFC6128ADB0800A60A1C0D318DA997D485C597D054
            DA51BA04D7A893F966B350C86AE8069319C2B690EBEC5D087137D62622C63843
            0924D022B6D2D2625C3347D01BD0D946C26A7C47FB8FD481F445BA12DC593526
            507C082B8BD99E0063A9966712E3C2569ECEAEADBE84568321018854E0F281B9
            D36E676049193B41A6C364168AFC058E57967FA13E47AE39167D27C1056D0B20
            CA995ADF8034D498692E425D332E59E90E64F919BA23A33064EA591706B19873
            8F24B860F762E7DAFFEB17D837D3B4D5C0EA3265CB463B958575C92D0B9F2444
            84DAB0739D425C28BFC658F9D57F41E7314B879D63A7A8716FF466E2B1E0490D
            D6397FFD4AFC16B0F7D8C64E880BCD0D31312F1AB1B2BE0399AF608C465B90E9
            D00A8FA90B98887728D6C00E66670384B8F07419DDBDD0803576878AE4B365D8
            A0EA5850EA221536B64F5D5885DE0D67215A82E66523837B425C708A92F55ED0
            CA1B5374DD0172A341AA8B5418638BE07BB031220C6AAD1051880B660B2293D4
            64030A36D8FB61AB11F39BCDF023A8B958CB015D33EB6DE0E0D2F2CC225C8B30
            6A65CC068A79B5794AFFD94F92E7F72A13B095B46BEAF3A5E7908826C51B6438
            4245112E34A5C478653C46A007CA9886014450A4607344DF18597A66D40C5FDC
            C8AF8B70A160DEC85055FFF7D71DEFC538FA6F1F411A66820835B0206FAFAED0
            FD5633DA6FC2D86544349012E1FAE1699B4E46922EE486692E760C0EE912340D
            B16F660774307FC346DFD03098B3225CB0FB19939439CC54C47E1E8D9682A621
            4144C620C11EC11A8E5B1FDAB8622111AEE962A8F5FF55848AA2565F3AEA88D0
            6E0377AFC0620D28683A83B1F4D07018D5498AF90F9E41432FD4179CB898A206
            29B336DAEDD60F94D9808DDAE3E85F2468B0CA841CB387705CF135F52A709ADF
            4C06B09F03749F6CE70E42D0BDE9AE9B298A437A68E82393BDE3CA8E389D9B4B
            450420D0D4B25C8063306D82CAA4434B1EBDD13B2ECC95A57F068E0B8FC2A6A8
            8E04437AC6D0C3C8371AEA1D171AA3041B44B5456693A0A167C6B728A2CF2B43
            BD3EFA1EF4CA633D66D744823C333368BEF7DAC145BB1C9897B170E9BD6AAC89
            121B819B4322CDC1187A98456422F0348C60B3CA4450E4E1673F0210DC79699F
            8F70310147FC4F822B0B67B6195C28E0D0C5B8E27F725CACBEE0246B1FD79F03
            D79F8587684EAD435C5945557B7DF69769E723BD3EFADEAF7FA05F6670A1F992
            6CEF71144ECD8F7ECE386A84BA39DA9D441A47F5FC684C952F27EE35260218A7
            C0646FF069001FE3143AE30713F0D14280E3CA6093BDF4BD3B1D578E0BF3518E
            71AD5ED0937A4567057C919974806D1ABCA197E501D0FCA24ECF72C30A57332F
            CEDBE8ED2FD10B32670FCFDB3F0C1F527F3E74F53BE46D688EC3CC335B1B03A7
            FBC5F90D9867632ABE509E8D99B0C6B638A0A94A2C9E79B6793A438B261EE644
            B8A036D99A14946565D2F330D6093E71E3951735E6E80C2DCC8B8AF38730FBC1
            D6F5A2C13733FF89A6534067CB1B3CC5338FAD4F53EE0B550945865DE71D988A
            4AA47D66FE1377B0808988BC9774DE812EEC846B9A8DE496709E0856AE30F329
            38CB9AA47A2BCEDC7CB679A234E595F13C113D7D8FD26CE36F5CE7F598F92F3C
            11CF14A5E022924043293CAFC77810181DB2133B70BF22CBE0097141B3C2CC57
            A2F94FB68361223233DCBD09EAB76C2483E66199510A9C3F36977F14E282696E
            767E19B61357E6808A639830AE27C101357357346FCEEE6D1C823C9B7B24C485
            27F6E85D5111AFB5FB74652F6ED90015866FCA0468B8EA877E0DBC887461CDBD
            2E85A9DF4075298C7D254A12981EDE8310F7640A8990F79AA7D7C722FF94DCF2
            A82362CBD950A50BE3E771D14F70C12FAE2362AC06365F4CE1348C93ECE55262
            5CD3FBE2F2433473CED6FEE142C8A04661C816715E11D39031CBA41917E342CB
            22986595288EE66ACC71EB0693E6C045D0DC0DE1AA1FD68DA22480DD7BC4B870
            953DB3BA174E9DB3F7241516745D2543003457C95A79BC42E35C5A070B3F6617
            71E0922B76CF2AE2450288A6F0F89F8B61701D2CB3E401795DBBB85056B7EC4C
            40B3A12FEAB3AC0B23BD4DEF5107B1FC8F2D822EBC451BF6D0AB7C50D0DB8A92
            24B8B04E076922A2952FDC02695C6ADC73296C0A3F93738898314CC92A72BAB1
            D1B7525C78F500B3011A2A41E4140626D032859E963BD8A37FBC2E60942ED1B3
            D74DC3CA69BAF8108D95DB1493E56DE072229688D909D87E9CC2885D2B34A387
            C01E6FA1CEBB64A2468BB11AA8F8B0BDE25F868B5B00C7DD985718EEECBD00A3
            60B12CCCEEC075376CB3E2151A2D132EC385422936A647590EB65A1350CBBFBA
            A622B9EA866F1DBCF88C6D55680D9D755DD2FC21DE2785AE85C5C5B06C786697
            72606FADDDFDD48D55FCE65772834576C11E36866CA32EC27EEFE8C17B1D22BB
            86BEF0122DC162F78A4A92AB8ED5C66CE77E6CF919B1DA97C9C9536D5A65D6A8
            A29264A7DF4871A1CD01B88D521017D8F2657247F7D67B751A79244BE4EBAACB
            6CA4899670F0460B46EA7079A13C8F8DD63CB0B1D4EACFD0D4EADFFD37098BE8
            190EB0BB662741F0F76F8F095882743F5A0FCE2D1BC556C31981C8710916DD3B
            8217FA92D154FB3C125A546579D7AF8B6676B610C02288C2AA0BAD7235E39F3C
            7011BB24304B11F1FA6862AF2A9684E84F0B877E90B19BAB08606116728BB450
            9C8EF6FD72C185BA22B7B70D5EA98F6C224F42F486F2AD8690A4A61F53D19E0A
            6E71362793C6BB12DC611618F37DC66D9F8A0BD82A50B94850946884DB8C2049
            A836C6688C5AD39C74318DD97493D9B448B4EB01B13706B704126F6580A223B7
            F92FBC869B5518F42346AD9DAAA7CEB60031FD26B3098CAA3457D44DD16CCBD8
            6D0B14BBAFC8CA0E4FDD988638C2AE3D2316EF229FE4860B0D40D95596F02946
            B8ED1DA995B9ADB666374C6941BBDFFC6D7E036D369754460607CA2FF87D6014
            514EEBE14F38466386FF38EF4E6C5CE93A5F89B6D2E34C622B830361512474B6
            61F8EA15BF1B516B3BB6D12418B47EBE6C6DDC23D8DD4C8BDF14F886C23AF42D
            3C0B0975E134932B2E622F2D76B72F8B89A0D62E426548086DC4B7B2DDA3DA05
            23926B8AD097677675BC8114930AC3ABBAC87D46DDE797D1725F7E77B6A5EDF3
            7909091DF946156CB5E42AAAB2D21039F2CCAD9F102C7EB30514C9925941775C
            5861DCD63D201AE52D21B31788154074B48F996C1B12BC658F601081B7E12137
            E3F4A807400AE3368371842621B720FBFB8B173E91A9CADD21499DC4FDA7D866
            707B48E01DFFA824AE072E14FE4B0E9991921023B3373FF4DE2710180509AA4C
            0AC3E2E24269CB7BD56F109BE40A360AA4DD7142BC7C7E6CFAC3B11B347B27B0
            C96D594842F42DC1A673C436A1F4AE495EB8D0DC0B88C6B7D88B1E24C4924A85
            EC1DCB3823685BFEFA37573BF26F16D6F13E9CFC3644207B0EB7BA652C9B67BD
            0DDEAF83DB9BDF9B8484246383AFF2BF69D467F57B1BB397276E451F0F7F2460
            59E3A22D261079F008EDEA4A2704BDEB88D01080FDAA2F12D2AD5B5546E24FEF
            0C583F5EBF5C383E6D7AD5B1C42EE9DDE8B51C1D42A1B114173978E3C2D19491
            6C12CD4564F91009573F06B9602F3BBCC31E82A1CD913BA72E3E8551885165B2
            303EEABE08D3412C08139170F6507220435732AB6CF27E9D02864F0DE03632F4
            53CF86B65C25B6AD149170F603A837FD1FC3E621B7DF29A233730860F8B822FE
            CC003FB8882DECEDAD125AB004249C7DA755E567687428B383EB44D732881304
            103072037AEE8C075FF5878889705F7D2109B79C52E2C8684FA705D89289533D
            4B5F785D26ACFD5CB175FFF94F286698E34E8CF35757E910199E832021211A49
            2CBEEE8D8CB1736A90A37D7FF48C386601690C02139D7AE30FD7E27BDBFD1903
            833C2C87840F7F264F3ED172834F7CDD58244B3A75BC8C114ED931E1C3E75883
            FACDF6FE046D1E090206DFE78CD8E18A61DC6AA95BE88EF1F69FCECBE46BFBDD
            B03173719B3E8DCAA887DBBFE34D32192A464DC14ED07EEB7BAD3B384315893B
            9E3CA2CED0B0919D989D9E5F51885536CA8C276EC2D889A6220216139EF0E7BB
            6E79FA5C008B8C09A9DDFD5BC86A8A11FDE0F7FE961B1ED59E3273AB0E0721B0
            72990736BEBD21BA996F5CE9949C848E2C3D65721A463D52CE9F34FDF031A39C
            5586D9C3A8B4C51DAA5D4454CC89CF63ECB0CEDC3DD42DBC1B60031F0BDAC9D2
            9B890B376C99A1FD5B4F6225F6F8363D923A66BE26A2A2583AC3E536E86F3F38
            B5C6C53EF6C1A2F5078DD285005C666828A2FE5D139C496739F84BFE68119A8A
            C7F268B4235C94B624E3ADD8ED35C14188AD5345C1C903FB18BA5CEB934DFB20
            BABFC70038D74527916A8B35A1A71051B1575CFEC65B99C177D2231E6DD55932
            0C5A95F8D2B35541EC447A6E934F2A7680CB938418D976B3BBC32BDBE0C327C3
            2EC7A189AC622FB8FC90104AF6347150EE0A99A5D139C53D56F14545DFB8C6D2
            EB1C091383F2436F27CF063A391CD641152EE747E52701FDF066AF0DCC9B8A7E
            71894898D88FC537E45F29BC4F1C9CFB38CB1762B24CCBBD33B7E0EBC17325DE
            DA70C78755F4894B4442FB00663357753BD77C757DF19770C90734A3366CB939
            D793EB12E1C39201DA3B095154141D0EE613979084A7B6358B5C8FBB9F365ED0
            AFAF3787CF15F979B116A6F3B961F7232EEDBC987DE46D547334E645455FB8B2
            651109DB39134359D9F03ADDBC701C1E79126B1D036ECF4DDBDF33EC32BBD641
            E0F997EA82E73154E96BE72C4E04CC838A7E7009FB56FB14705B22A565AF03CE
            6DC964B74B85B5D9A1D332880270161EB9A8C49F2DD47C65B0A60E7474E049D5
            17157DE01292F0AC49641FC27A7ACDFB3E48B2D6BF4EF27133D7C441D9207A96
            F741456F5C221282F4E04772C940A4B4FAA3E78DBA95F96D40967FC574E7906E
            8A8AB90ADD529EB86451C6DDAD2669E6622337FC90B17399BA28932D6828389B
            4E6A0CA606FCE21291D0796091AA0E31C2C3D53D10B4AC9C1E52714B64204734
            9F0B15BD702DE01DFCD9E069C6D8A496AF44AF226AB0C81246314455D6C4866B
            94ED25A918CB916B123DF5851CB2E02489F90D8A8B20AAEA0122B37455A3EA2A
            A38D05B617638D3144F4EC5F109870609208EFD12B8EA2EA70F3BDD72D7DC994
            71D8A0ABA06229416C0381E9778B1DF52F3879278BE0EFEE324F8F5E25329B5E
            8EDA4B166B177B340341449F139ADC3615B9A3F7FCF82F4B63A2E34CDA92B8B1
            4993D13259E6F0F84EF7D0D29A7158E1EE991992B8481B186B0DFDC51B363097
            69BBDC69B9C27C145595B97257D0D2A9F08F66883D45CF4CD4E5EC9EDC077C84
            E82B3E1C3BBAEF56F799368F1BEC9B1803B5B0668E7612865816B651AA9775AE
            423DA2274FDDDA6849E7CE7FEC34CF267BA1B312D7C6C030AE2CC33258F3876D
            F168A0B10742556E4C13A9AD9C77D63CC1E1B25DCD39A733D0521B484C1E9B27
            657983A7C3B14AFCC329A85D0BC669915A774E31285C16B2E14311B2B6DE42F1
            C1E2D8E8F6158894C12708A70442D33BE7E3BBD7355DAD0AC79E11BD5B87181C
            2E0B59A3526BCA326CC068385BEDA836FA28FAAD2A4BB6194AE886E2361AFFBD
            7059FD2CB4570E9DF57E1F60133031A477DEAF3E0F2EB1F3E95C5A2EB0A7F141
            D0B82C99312FF6F4EB1EF2A203B55CBCD4BDAA3E172E4B12A3CA26E88A90911A
            C82907BD07CF9F07970DEDD6DE47B3D691DAA20DBD118AA8DD9A8ADF0717B063
            A24B6543013E3869D8C6B2326304A0A8DF01570B5B7D3073B45B6E1974013CC3
            0057D6B51B7AA37919E898F473E36A830B5FB51C70D904000D70A32AA834937A
            F2F872D42D1AF9927121592C950CB8F5406127520C1CCE1F840BE0B506FC5283
            3EAE3EAE3EAE3EAE3EAE3EAE2F1F57B4F09ABBA605E7A7FF305C761CC5C8E2DB
            6052E07F2C2E5EB822F83EAE3EAE3EAE3EAEFFD3B8AEA4692A7A25E19F0DD741
            5C76E93A161CAEFF00D585B13E148C98490000000049454E44AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559060390000000000
          Top = 15.118126360000000000
          Width = 340.157696920000000000
          Height = 173.858374040000000000
          Frame.Typ = []
        end
      end
    end
  end
  object DS_book_inners1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = DS_Q_v_given_books
    BCDToCurrency = False
    DataSetOptions = []
    Left = 752
    Top = 176
    FieldDefs = <
      item
        FieldName = 'expr1'
        FieldType = fftString
        Size = 244
      end
      item
        FieldName = 'expr2'
        FieldType = fftString
        Size = 68
      end
      item
        FieldName = 'giveDate'
        FieldType = fftDateTime
      end
      item
        FieldName = 'backDate'
        FieldType = fftDateTime
      end
      item
        FieldName = 'readTicket'
        FieldType = fftString
        Size = 255
      end
      item
        FieldName = 'IDbook'
      end
      item
        FieldName = 'IDread'
      end>
  end
  object Rep_book_inners: TfrxReport
    Version = '2025.1.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45643.462630821800000000
    ReportOptions.LastChange = 45643.462630821800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 752
    Top = 248
    Datasets = <
      item
        DataSet = DS_book_inners1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 2
      ColumnWidth = 95.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '95')
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677183340000000000
        Top = 170.078850000000000000
        Width = 359.055350000000000000
        DataSet = DS_book_inners1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060100000000000
          Top = 0.000001669999999995
          Width = 113.385899780000000000
          Height = 22.677181670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'readTicket'
          DataSet = DS_book_inners1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."readTicket"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944962360000000000
          Top = 0.000006729999999996
          Width = 113.385900730000000000
          Height = 22.677174040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'giveDate'
          DataSet = DS_book_inners1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."giveDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330865620000000000
          Top = 0.000005829999999998
          Width = 113.385900730000000000
          Height = 22.677174040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'backDate'
          DataSet = DS_book_inners1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."backDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 128.504044560000000000
        Top = 18.897650000000000000
        Width = 359.055350000000000000
        Condition = 'frxDBDataset1."IDbook"'
        KeepTogether = True
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118119340000000000
          Top = 64.252021470000000000
          Width = 325.039578830000000000
          Height = 34.015771670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'expr1'
          DataSet = DS_book_inners1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."expr1"]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060190000000000
          Top = 109.606385750000000000
          Width = 113.385898830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #8470' '#1095#1080#1090'. '#1073#1080#1083#1077#1090#1072)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944953060000000000
          Top = 109.606381510000000000
          Width = 113.385900730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330858850000000000
          Top = 109.606381510000000000
          Width = 113.385915990000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 241.889925620000000000
          Top = 18.897660850000000000
          Width = 98.267780730000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1041#1080#1073#1083#1080#1086#1090#1077#1082#1072' '#1057#1080#1073#1043#1059)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120190000000000
          Top = 45.354371470000000000
          Width = 94.488248830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1053#1072#1079#1074#1072#1085#1080#1077':')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 15.118110120000000000
          Top = 98.267787750000000000
          Width = 325.039569550000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 222.992283050000000000
          Top = 18.897650570000000000
          Width = 18.897620210000000000
          Height = 18.897644040000000000
          Frame.Typ = []
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000D70000
            00EA0803000000064720F4000000C3504C5445FFFFFF89BE5C7F7E7C4B79BB7C
            7B797978764173B84575B987BD5983BB524877BAC5C4C3A0A09E85BC56829FCD
            86BD58ADC1DE81BA4E8DC0613C70B7EFEFEFAACF8C878684E8F2E0F5F5F5E7E7
            E7F8FBF5F4F7FBCAD6E9D8E9CBA4CC83F9F9F993C36ACEE3BEB6D69EF1F7ECA1
            CB7FA3B8DADAE3F05E86C1DBDBDABBD9A59BC776C4DEB08CA7D1EBF0F78B8A88
            F3F8EF648BC4BECDE5C1C1C0DEECD27194C85480BEDFDEDEAFAEAD989796D2D2
            D1E1E8F3C9E0B6B0D39499B0D5CFDAEB6C90C57AB74291D5D89800001BEB4944
            415478DAED5D895BDB48B26F1D5832186313C017E0D8246402310C909D83C9E6
            FDED6FDFCEDB999D49B22413B2B9809083C3DC186C838F956CF5DD2DC9B63293
            79CFF57DF9021696F4EBFA7555757575B7027E67895E2CB7FE7F1E3AF99C8F51
            7E775CD55AEB7F6DB08FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8F
            AB8FAB8FEBFF39AE743D347D7430F19CC3F503D8BE4A163FFD0971CDC42AFBE3
            2F4C00F45A6A83C375EBB0029A49BD917AA3050BEEB3E29A6994EAD73510AA56
            EDDF22E33CAEE9D333000CA351B3D0A9D7A1B75F3EAEB43670D2AC3890802BAE
            B61803357344BDAE07A3B7CF836BF1ACFEDED4AFABD4871EB81C6C95294D0D40
            6D9F0157DAD08A57A133EE731FB86C895EE9897AB557AD058E6B25BC561380F2
            8FAB05CDD4A71F7D41B8D24678532F492EFAC7D5829618D2D7BE0C5C8B57FF36
            9B55D9554311D9F9BDEBAAF4EF4385D77B7F3CAE99E68E4455B61DD707A27AE2
            470ED7FCB97A6679025D8C2EA20F57BB441614AE9966118850198A59494C1E9B
            2765C7127071543A1CABC48F3681AE0A28195587C7BBEA68C1E04A8F7C10A0B2
            AC36C829E60E65DB24F1613A55A97E14E92D7A353ED085DDF7852B79F3CD81DB
            F51F9EF2A80C0524D4F80E67AFDDE2DE954BE57D8DEBA1117D7EA763647E7025
            275EC41B72602B877B15F633D34C2907C2AEE111CFCF24F73E02165A449D7C1E
            3CAEE4C47A431D5577C557D3D725EE356ACDDC91ACBF7B8F5366CC9D668DD1BF
            99B8D15937F3C6956C1C35005047C51ACBEDB2463002E26E5DDDD7F82B71FB57
            856E2D23ACA73B71679EB86C6DD9FF0B81CD5C17690A1A4AE5AB2BD7CEE0735C
            B958BBD8A391450686DE07870BC2B2803526582A4E150D3A6C552AAB9B1E919D
            FFF172EEB459269119CACADF03C3B5F0A20E7F541BA394C6D2D735EAD50C253C
            B2E9F9C04EF200531AADB34869D96F2FF3C295DA531B081845C54498368366F8
            EE8777DE0FEC2CBF6121231F6284D33E0DA367FF4A1501010C5BC5DC01E543A3
            6AF2D4D7D8A2D3BCCD0F8F29C3648ED77C3DC6DB1E8E1D111A43547CF09C7C2D
            43F11D14749C8F4AE71F91E39E4869C24FC8E8C37F89A898B822BBB419F66FAA
            BAC8B3256E6C12643406623E1EE627DE105171651DF568231CAFF8E146A17A59
            2A1C879FB7BF67FCE5B01A294EBFFBE807D9FCA706A132F3E68B407081B113C0
            5131517152326638E765A4B2C6D0B5FE2202C0395034D41CF5261806A03C172E
            D5CEBC0CCE8C41AA2C36EF69F0FDC5F3422A5EB60C476C7EC3555999999D9127
            B1734503E201A4056F18E45FAA1355776CF39F08E67B5B0F9FE31411151367CD
            AA118EB9B9ACCCC4DB3B6B848EA462D4C062F9E483DB9FAC3C8E60C368E6D603
            C1C5007334B66F2634B919CC4C689BE7BA2724247AE4DCFCFA9D5C6B699D08DA
            2237AE5C35E67B5C29A46263407AF3D9D08B58A9E61B544B8C7A247F32FEBFD2
            EB77B77C03F33F5E963968A12C45FF013A5015219A627CFD37D9C5A9031C57B9
            03EB200F903A684A422A46B2A7B7373A5515164B695307B29E96D8C79DCC1558
            27F90D79AC48C992BE2175B93A68E2474BCD891196225B3C3DC4C0A64EA4C03A
            CADBF8A1E2D2E5810095016C737EBE38F86471B7D8FA643CB9B674B9667D26F4
            0046F85E53CCC6740C7BB2487C3B105CDE545C1DF8ADCCBEA5016A409FDA5117
            8E9FB17F9ECDE84F1B779E36057D518F5C67B9BF6FC9AD8F0898291D91759867
            73A76226BFCEF52B3D52FAAEB1197FE672D3C271EE7C1D28DC379B921072BC84
            81E525E316FFB8665A9EEA9BC7722A3E2CAFD5E9EF18B5E15CBDF6CCC7DD0BEF
            6F71CECEEA668342A33F8D1D9939260E827DE3CA1F875AE3033915EFEDD014B4
            6288B9AD215F71AD032DB1C9D8123D32FA5AF4A72415A3C2618B5F5CB993B2D2
            BE03AD31046CF57093529651ABDFBD7AE51B545B66431B355A69B17B472275DF
            DA8356D118344546D127AEC4650918D5090718C28581C52EE9FEA1D587A7FCF0
            8F9542E5238D4CAFA504263F1D3A8603978859EC1A57FB36061869037B823503
            812D6D1324B474353CE223D72194CC20832C26E262FA0879879828E7E10FD778
            A5A576C3858A93FBE865B47AFED27FB71220CB3FAA93CA8F5DC7F946B21904AF
            87F82EE60BD754C931B86E549C2CB7356684534A370C2465F5B701D20669B912
            DF4EE8A5AC2E76D415AE998FE81950E73415DBE67E72DFFE4C5B0CFFCDC73DBD
            643245FA0C7D618037F8F31BD0280ADCB31F5CD3C750E5B88F4AA8086AD9D73E
            EEE84728B7A16B93BC6DC5EF158BB05ECC07AEDC2E6C17D2A68AA9980F44596D
            99DCD1B0CA8CDA4D0E58BA7259E55FCC2FAEF4B1D8078AA8F8F06D2FF682954C
            6A130752463DCB014B9CC1578B2C324CF4C6E5D842C005632273EF25D98B8129
            ADF553FDFDF590A72BB8FDCE5D63B88BC5F27452CC13D7CA3A6A93C41BFAD257
            6F040E5A2A63B7ABAFF2BBC7F883E6687263F6F2C0F56B93451C58196086B3B3
            731F1DF76CE4E9448E27AEB90DE4FFA6D98935111585924D37CAEB8A35A66C50
            1FABD6E39B73E1D37FCB1FBFFAB38E5C99BEF089A5F9CC276413977FEC0457EE
            0452DC4CF219B5EF7FF1A1B16CFA5995834483330A9F649C2C5C6D6160778FD9
            3FFBE131326AA3A4E9F0C0953E879D2B3AFE4670DD1B586A7AF3B829C384BEAA
            C4736F2584CC8CAF2356682657E38198D82E53F289EBEE076434C4E381EF7F75
            A5622AFB08D4811FD18031BC230616C12385589D1D6A629B68A6895CA63BAE99
            7D048BCBF5DF565AE6E9ABB772AB68A1F2541516559120CBC65F202AC6C26C74
            9FDF71805181BD3BAE7C11D1F094B9648583ED1080D618016C6CE67107A8DAC8
            96DF898C4F2682FA98315F618C62760F1A369252AEB8B0BA626C1A3EB36B58D8
            04C0101597FFA5C918A84A8D8856FFF61F828F0BAF90B9D70BBF3217513C442A
            CC15175217EB1D00B8FFAC6645EE37A4541CBBF58847A55A4FAB8F81A4F5E3EE
            81FD8B409FDA8AA86669F5116622D7C5902B22062C6EB87004C5654796B65B37
            D7B3122A0E5559955830E297B3C6D6B56ED8B63A5BADE5B586F24F8DC3A63644
            2A6B0F165A6D5C5F6162FBA903E73DA321A430375CF3DB8EBAA219465D05E777
            4342C56F1FD3CAB240AD3C8B0A8C42F62A557BC142D3967FE6FFF2AFEB504D3C
            136FEE3A0AC326D105571ABD071B7C816805BE774C44C53CCD41CD0235268F05
            C7A66B2F6864DACA166F3E6CE63BCF6499B80213E7D887B9E042FD91EB5D0429
            AA736DF3446A0CA8E45B6A60797B07B8CB571FAA1432918BCFA41FC387D6C798
            780AF6303C5E71C185BB233B6AFBCB731C333E717EA280116FA82CBFF513E9A7
            CE29646A23C1B585D3A7EDA69AFD8DBE84720228D893E34A5CC1A446728BBE12
            BB8410C807888059AED6F4357EB1E49BCA0B52E5CA1807ECDE2BF45C76C8027B
            18A2961CD783B512D3068E6430F797C9009B07A6C567FE01FCCBF253C288AA60
            9C03A6C11F38D381C25F68EAE5B8C2D0C8C79931361EEC31410D0B4C336E7496
            441C4B132A63CBCC801DE34026C6E6E97C43FAC8E91970E02CC585BD3815275B
            EA3A80BE9F6B3532BAB71ADCB8E808952DA4835047C36CB3209BA8DFFD177D05
            851066D91DD7ADA213FFB359C7BFFEEC3C9A7790E0BB5F892495E66505454279
            C2FB3F3157571FC136651586AC811342C8702D6EC0108AB11AD95D786BCE2A91
            ADADC53D66D6654226F078078D1A95E30AB4DED1916D375C8886ACD540C6D000
            71C68B106DADADFC04BA9454FD0803BBCFD89D4C1166CB599388B3810B6B2EB8
            D082187396CE6ADC790F6FFCEDFFD05F19C3D9E41E6059F751313035C6D80E64
            B4F4DB345B16B7E00BB78828C185622847AD489049326AE38CBA70E752E79E76
            0F8BAA78E4BA58E6D89947E1B253E3576D606D8B28C18542649686B07C905717
            66A167D58A97A48A988921C6A8A21EC616302222B6FC92041772CA6DB62229BC
            44C670966EAEE43EFA511DEFC6128ADB0800A60A1C0D318DA997D485C597D054
            DA51BA04D7A893F966B350C86AE8069319C2B690EBEC5D087137D62622C63843
            0924D022B6D2D2625C3347D01BD0D946C26A7C47FB8FD481F445BA12DC593526
            507C082B8BD99E0063A9966712E3C2569ECEAEADBE84568321018854E0F281B9
            D36E676049193B41A6C364168AFC058E57967FA13E47AE39167D27C1056D0B20
            CA995ADF8034D498692E425D332E59E90E64F919BA23A33064EA591706B19873
            8F24B860F762E7DAFFEB17D837D3B4D5C0EA3265CB463B958575C92D0B9F2444
            84DAB0739D425C28BFC658F9D57F41E7314B879D63A7A8716FF466E2B1E0490D
            D6397FFD4AFC16B0F7D8C64E880BCD0D31312F1AB1B2BE0399AF608C465B90E9
            D00A8FA90B98887728D6C00E66670384B8F07419DDBDD0803576878AE4B365D8
            A0EA5850EA221536B64F5D5885DE0D67215A82E66523837B425C708A92F55ED0
            CA1B5374DD0172A341AA8B5418638BE07BB031220C6AAD1051880B660B2293D4
            64030A36D8FB61AB11F39BCDF023A8B958CB015D33EB6DE0E0D2F2CC225C8B30
            6A65CC068A79B5794AFFD94F92E7F72A13B095B46BEAF3A5E7908826C51B6438
            4245112E34A5C478653C46A007CA9886014450A4607344DF18597A66D40C5FDC
            C8AF8B70A160DEC85055FFF7D71DEFC538FA6F1F411A66820835B0206FAFAED0
            FD5633DA6FC2D86544349012E1FAE1699B4E46922EE486692E760C0EE912340D
            B16F660774307FC346DFD03098B3225CB0FB19939439CC54C47E1E8D9682A621
            4144C620C11EC11A8E5B1FDAB8622111AEE962A8F5FF55848AA2565F3AEA88D0
            6E0377AFC0620D28683A83B1F4D07018D5498AF90F9E41432FD4179CB898A206
            29B336DAEDD60F94D9808DDAE3E85F2468B0CA841CB387705CF135F52A709ADF
            4C06B09F03749F6CE70E42D0BDE9AE9B298A437A68E82393BDE3CA8E389D9B4B
            450420D0D4B25C8063306D82CAA4434B1EBDD13B2ECC95A57F068E0B8FC2A6A8
            8E04437AC6D0C3C8371AEA1D171AA3041B44B5456693A0A167C6B728A2CF2B43
            BD3EFA1EF4CA633D66D744823C333368BEF7DAC145BB1C9897B170E9BD6AAC89
            121B819B4322CDC1187A98456422F0348C60B3CA4450E4E1673F0210DC79699F
            8F70310147FC4F822B0B67B6195C28E0D0C5B8E27F725CACBEE0246B1FD79F03
            D79F8587684EAD435C5945557B7DF69769E723BD3EFADEAF7FA05F6670A1F992
            6CEF71144ECD8F7ECE386A84BA39DA9D441A47F5FC684C952F27EE35260218A7
            C0646FF069001FE3143AE30713F0D14280E3CA6093BDF4BD3B1D578E0BF3518E
            71AD5ED0937A4567057C919974806D1ABCA197E501D0FCA24ECF72C30A57332F
            CEDBE8ED2FD10B32670FCFDB3F0C1F527F3E74F53BE46D688EC3CC335B1B03A7
            FBC5F90D9867632ABE509E8D99B0C6B638A0A94A2C9E79B6793A438B261EE644
            B8A036D99A14946565D2F330D6093E71E3951735E6E80C2DCC8B8AF38730FBC1
            D6F5A2C13733FF89A6534067CB1B3CC5338FAD4F53EE0B550945865DE71D988A
            4AA47D66FE1377B0808988BC9774DE812EEC846B9A8DE496709E0856AE30F329
            38CB9AA47A2BCEDC7CB679A234E595F13C113D7D8FD26CE36F5CE7F598F92F3C
            11CF14A5E022924043293CAFC77810181DB2133B70BF22CBE0097141B3C2CC57
            A2F94FB68361223233DCBD09EAB76C2483E66199510A9C3F36977F14E282696E
            767E19B61357E6808A639830AE27C101357357346FCEEE6D1C823C9B7B24C485
            27F6E85D5111AFB5FB74652F6ED90015866FCA0468B8EA877E0DBC887461CDBD
            2E85A9DF4075298C7D254A12981EDE8310F7640A8990F79AA7D7C722FF94DCF2
            A82362CBD950A50BE3E771D14F70C12FAE2362AC06365F4CE1348C93ECE55262
            5CD3FBE2F2433473CED6FEE142C8A04661C816715E11D39031CBA41917E342CB
            22986595288EE66ACC71EB0693E6C045D0DC0DE1AA1FD68DA22480DD7BC4B870
            953DB3BA174E9DB3F7241516745D2543003457C95A79BC42E35C5A070B3F6617
            71E0922B76CF2AE2450288A6F0F89F8B61701D2CB3E401795DBBB85056B7EC4C
            40B3A12FEAB3AC0B23BD4DEF5107B1FC8F2D822EBC451BF6D0AB7C50D0DB8A92
            24B8B04E076922A2952FDC02695C6ADC73296C0A3F93738898314CC92A72BAB1
            D1B7525C78F500B3011A2A41E4140626D032859E963BD8A37FBC2E60942ED1B3
            D74DC3CA69BAF8108D95DB1493E56DE072229688D909D87E9CC2885D2B34A387
            C01E6FA1CEBB64A2468BB11AA8F8B0BDE25F868B5B00C7DD985718EEECBD00A3
            60B12CCCEEC075376CB3E2151A2D132EC385422936A647590EB65A1350CBBFBA
            A622B9EA866F1DBCF88C6D55680D9D755DD2FC21DE2785AE85C5C5B06C786697
            72606FADDDFDD48D55FCE65772834576C11E36866CA32EC27EEFE8C17B1D22BB
            86BEF0122DC162F78A4A92AB8ED5C66CE77E6CF919B1DA97C9C9536D5A65D6A8
            A29264A7DF4871A1CD01B88D521017D8F2657247F7D67B751A79244BE4EBAACB
            6CA4899670F0460B46EA7079A13C8F8DD63CB0B1D4EACFD0D4EADFFD37098BE8
            190EB0BB662741F0F76F8F095882743F5A0FCE2D1BC556C31981C8710916DD3B
            8217FA92D154FB3C125A546579D7AF8B6676B610C02288C2AA0BAD7235E39F3C
            7011BB24304B11F1FA6862AF2A9684E84F0B877E90B19BAB08606116728BB450
            9C8EF6FD72C185BA22B7B70D5EA98F6C224F42F486F2AD8690A4A61F53D19E0A
            6E71362793C6BB12DC611618F37DC66D9F8A0BD82A50B94850946884DB8C2049
            A836C6688C5AD39C74318DD97493D9B448B4EB01B13706B704126F6580A223B7
            F92FBC869B5518F42346AD9DAAA7CEB60031FD26B3098CAA3457D44DD16CCBD8
            6D0B14BBAFC8CA0E4FDD988638C2AE3D2316EF229FE4860B0D40D95596F02946
            B8ED1DA995B9ADB666374C6941BBDFFC6D7E036D369754460607CA2FF87D6014
            514EEBE14F38466386FF38EF4E6C5CE93A5F89B6D2E34C622B830361512474B6
            61F8EA15BF1B516B3BB6D12418B47EBE6C6DDC23D8DD4C8BDF14F886C23AF42D
            3C0B0975E134932B2E622F2D76B72F8B89A0D62E426548086DC4B7B2DDA3DA05
            23926B8AD097677675BC8114930AC3ABBAC87D46DDE797D1725F7E77B6A5EDF3
            7909091DF946156CB5E42AAAB2D21039F2CCAD9F102C7EB30514C9925941775C
            5861DCD63D201AE52D21B31788154074B48F996C1B12BC658F601081B7E12137
            E3F4A807400AE3368371842621B720FBFB8B173E91A9CADD21499DC4FDA7D866
            707B48E01DFFA824AE072E14FE4B0E9991921023B3373FF4DE2710180509AA4C
            0AC3E2E24269CB7BD56F109BE40A360AA4DD7142BC7C7E6CFAC3B11B347B27B0
            C96D594842F42DC1A673C436A1F4AE495EB8D0DC0B88C6B7D88B1E24C4924A85
            EC1DCB3823685BFEFA37573BF26F16D6F13E9CFC3644207B0EB7BA652C9B67BD
            0DDEAF83DB9BDF9B8484246383AFF2BF69D467F57B1BB397276E451F0F7F2460
            59E3A22D261079F008EDEA4A2704BDEB88D01080FDAA2F12D2AD5B5546E24FEF
            0C583F5EBF5C383E6D7AD5B1C42EE9DDE8B51C1D42A1B114173978E3C2D19491
            6C12CD4564F91009573F06B9602F3BBCC31E82A1CD913BA72E3E8551885165B2
            303EEABE08D3412C08139170F6507220435732AB6CF27E9D02864F0DE03632F4
            53CF86B65C25B6AD149170F603A837FD1FC3E621B7DF29A233730860F8B822FE
            CC003FB8882DECEDAD125AB004249C7DA755E567687428B383EB44D732881304
            103072037AEE8C075FF5878889705F7D2109B79C52E2C8684FA705D89289533D
            4B5F785D26ACFD5CB175FFF94F286698E34E8CF35757E910199E832021211A49
            2CBEEE8D8CB1736A90A37D7FF48C386601690C02139D7AE30FD7E27BDBFD1903
            833C2C87840F7F264F3ED172834F7CDD58244B3A75BC8C114ED931E1C3E75883
            FACDF6FE046D1E090206DFE78CD8E18A61DC6AA95BE88EF1F69FCECBE46BFBDD
            B03173719B3E8DCAA887DBBFE34D32192A464DC14ED07EEB7BAD3B384315893B
            9E3CA2CED0B0919D989D9E5F51885536CA8C276EC2D889A6220216139EF0E7BB
            6E79FA5C008B8C09A9DDFD5BC86A8A11FDE0F7FE961B1ED59E3273AB0E0721B0
            72990736BEBD21BA996F5CE9949C848E2C3D65721A463D52CE9F34FDF031A39C
            5586D9C3A8B4C51DAA5D4454CC89CF63ECB0CEDC3DD42DBC1B60031F0BDAC9D2
            9B890B376C99A1FD5B4F6225F6F8363D923A66BE26A2A2583AC3E536E86F3F38
            B5C6C53EF6C1A2F5078DD285005C666828A2FE5D139C496739F84BFE68119A8A
            C7F268B4235C94B624E3ADD8ED35C14188AD5345C1C903FB18BA5CEB934DFB20
            BABFC70038D74527916A8B35A1A71051B1575CFEC65B99C177D2231E6DD55932
            0C5A95F8D2B35541EC447A6E934F2A7680CB938418D976B3BBC32BDBE0C327C3
            2EC7A189AC622FB8FC90104AF6347150EE0A99A5D139C53D56F14545DFB8C6D2
            EB1C091383F2436F27CF063A391CD641152EE747E52701FDF066AF0DCC9B8A7E
            71894898D88FC537E45F29BC4F1C9CFB38CB1762B24CCBBD33B7E0EBC17325DE
            DA70C78755F4894B4442FB00663357753BD77C757DF19770C90734A3366CB939
            D793EB12E1C39201DA3B095154141D0EE613979084A7B6358B5C8FBB9F365ED0
            AFAF3787CF15F979B116A6F3B961F7232EEDBC987DE46D547334E645455FB8B2
            651109DB39134359D9F03ADDBC701C1E79126B1D036ECF4DDBDF33EC32BBD641
            E0F997EA82E73154E96BE72C4E04CC838A7E7009FB56FB14705B22A565AF03CE
            6DC964B74B85B5D9A1D332880270161EB9A8C49F2DD47C65B0A60E7474E049D5
            17157DE01292F0AC49641FC27A7ACDFB3E48B2D6BF4EF27133D7C441D9207A96
            F741456F5C221282F4E04772C940A4B4FAA3E78DBA95F96D40967FC574E7906E
            8A8AB90ADD529EB86451C6DDAD2669E6622337FC90B17399BA28932D6828389B
            4E6A0CA606FCE21291D0796091AA0E31C2C3D53D10B4AC9C1E52714B64204734
            9F0B15BD702DE01DFCD9E069C6D8A496AF44AF226AB0C81246314455D6C4866B
            94ED25A918CB916B123DF5851CB2E02489F90D8A8B20AAEA0122B37455A3EA2A
            A38D05B617638D3144F4EC5F109870609208EFD12B8EA2EA70F3BDD72D7DC994
            71D8A0ABA06229416C0381E9778B1DF52F3879278BE0EFEE324F8F5E25329B5E
            8EDA4B166B177B340341449F139ADC3615B9A3F7FCF82F4B63A2E34CDA92B8B1
            4993D13259E6F0F84EF7D0D29A7158E1EE991992B8481B186B0DFDC51B363097
            69BBDC69B9C27C145595B97257D0D2A9F08F66883D45CF4CD4E5EC9EDC077C84
            E82B3E1C3BBAEF56F799368F1BEC9B1803B5B0668E7612865816B651AA9775AE
            423DA2274FDDDA6849E7CE7FEC34CF267BA1B312D7C6C030AE2CC33258F3876D
            F168A0B10742556E4C13A9AD9C77D63CC1E1B25DCD39A733D0521B484C1E9B27
            657983A7C3B14AFCC329A85D0BC669915A774E31285C16B2E14311B2B6DE42F1
            C1E2D8E8F6158894C12708A70442D33BE7E3BBD7355DAD0AC79E11BD5B87181C
            2E0B59A3526BCA326CC068385BEDA836FA28FAAD2A4BB6194AE886E2361AFFBD
            7059FD2CB4570E9DF57E1F60133031A477DEAF3E0F2EB1F3E95C5A2EB0A7F141
            D0B82C99312FF6F4EB1EF2A203B55CBCD4BDAA3E172E4B12A3CA26E88A90911A
            C82907BD07CF9F07970DEDD6DE47B3D691DAA20DBD118AA8DD9A8ADF0717B063
            A24B6543013E3869D8C6B2326304A0A8DF01570B5B7D3073B45B6E1974013CC3
            0057D6B51B7AA37919E898F473E36A830B5FB51C70D904000D70A32AA834937A
            F2F872D42D1AF9927121592C950CB8F5406127520C1CCE1F840BE0B506FC5283
            3EAE3EAE3EAE3EAE3EAE3EAE2F1F57B4F09ABBA605E7A7FF305C761CC5C8E2DB
            6052E07F2C2E5EB822F83EAE3EAE3EAE3EAEFFD3B8AEA4692A7A25E19F0DD741
            5C76E93A161CAEFF00D585B13E148C98490000000049454E44AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Shape19: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559056530000000000
          Top = 11.338590000000000000
          Width = 340.157708360000000000
          Height = 98.267804560000000000
          Frame.Typ = []
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 238.110399300000000000
        Top = 215.433210000000000000
        Width = 359.055350000000000000
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559059340000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 0.000007019999999996
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 0.000007019999999996
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 22.677187020000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 22.677187020000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape6: TfrxShapeView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 22.677187020000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape7: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 45.354367020000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape8: TfrxShapeView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 45.354367020000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape9: TfrxShapeView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 45.354367020000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape10: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 68.031547020000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape11: TfrxShapeView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 68.031547020000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape12: TfrxShapeView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 68.031547020000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape13: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 90.708720000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape14: TfrxShapeView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 90.708720000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape15: TfrxShapeView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 90.708720000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape16: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 113.385900000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape17: TfrxShapeView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 113.385900000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape18: TfrxShapeView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 113.385900000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape20: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 136.063080000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape21: TfrxShapeView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 136.063080000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape22: TfrxShapeView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 136.063080000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape23: TfrxShapeView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 158.740260000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape24: TfrxShapeView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 158.740260000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
        object Shape25: TfrxShapeView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 158.740260000000000000
          Width = 113.385898830000000000
          Height = 22.677189300000000000
          Frame.Typ = []
        end
      end
    end
  end
  object DS_all_books: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = Q_v_books
    BCDToCurrency = False
    DataSetOptions = []
    Left = 752
    Top = 320
  end
  object Rep_all_books: TfrxReport
    Version = '2025.1.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45643.634504444400000000
    ReportOptions.LastChange = 45643.634504444400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 752
    Top = 392
    Datasets = <
      item
        DataSet = DS_all_books
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 98.267783260000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."genName"'
        KeepTogether = True
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000000390000000000
          Top = 71.811071590000000000
          Width = 188.976496920000000000
          Height = 26.456711670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1040#1074#1090#1086#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500570000000000
          Top = 71.811071590000000000
          Width = 340.157700730000000000
          Height = 26.456711670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1053#1072#1079#1074#1072#1085#1080#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134209450000000000
          Top = 71.811071590000000000
          Width = 94.488220210000000000
          Height = 26.456711670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622437420000000000
          Top = 71.811070000000000000
          Width = 94.488281250000000000
          Height = 26.456711670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1059#1095#1105#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000009790000000000
          Top = 45.354359960000000000
          Width = 718.110700730000000000
          Height = 26.456711670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clAliceblue
          Memo.UTF8W = (
            '    [frxDBDataset1."genName"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015775100000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        DataSet = DS_all_books
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = -0.000000470000000000
          Top = 0.000003429999999999
          Width = 188.976504550000000000
          Height = 34.015771670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '  [frxDBDataset1."auName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976503100000000000
          Top = 0.000003429999999999
          Width = 340.157700730000000000
          Height = 34.015771670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '  [frxDBDataset1."bookName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134191580000000000
          Top = 0.000003429999999999
          Width = 94.488281250000000000
          Height = 34.015771670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."bookCount"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488281250000000000
          Height = 34.015771670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 41.574828770000000000
          Width = 226.771800730000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            #1056#1077#1074#1080#1079#1080#1086#1085#1085#1099#1081' '#1087#1077#1088#1077#1095#1077#1085#1100' '#1082#1085#1080#1075)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 612.283886430000000000
          Width = 98.267750210000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1041#1080#1073#1083#1080#1086#1090#1077#1082#1072' '#1057#1080#1073#1043#1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 593.386215710000000000
          Top = 0.000004960000000000
          Width = 18.897635470000000000
          Height = 18.897644040000000000
          Frame.Typ = []
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000D70000
            00EA0803000000064720F4000000C3504C5445FFFFFF89BE5C7F7E7C4B79BB7C
            7B797978764173B84575B987BD5983BB524877BAC5C4C3A0A09E85BC56829FCD
            86BD58ADC1DE81BA4E8DC0613C70B7EFEFEFAACF8C878684E8F2E0F5F5F5E7E7
            E7F8FBF5F4F7FBCAD6E9D8E9CBA4CC83F9F9F993C36ACEE3BEB6D69EF1F7ECA1
            CB7FA3B8DADAE3F05E86C1DBDBDABBD9A59BC776C4DEB08CA7D1EBF0F78B8A88
            F3F8EF648BC4BECDE5C1C1C0DEECD27194C85480BEDFDEDEAFAEAD989796D2D2
            D1E1E8F3C9E0B6B0D39499B0D5CFDAEB6C90C57AB74291D5D89800001BEB4944
            415478DAED5D895BDB48B26F1D5832186313C017E0D8246402310C909D83C9E6
            FDED6FDFCEDB999D49B22413B2B9809083C3DC186C838F956CF5DD2DC9B63293
            79CFF57DF9021696F4EBFA7555757575B7027E67895E2CB7FE7F1E3AF99C8F51
            7E775CD55AEB7F6DB08FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8FAB8F
            AB8FAB8FEBFF39AE743D347D7430F19CC3F503D8BE4A163FFD0971CDC42AFBE3
            2F4C00F45A6A83C375EBB0029A49BD917AA3050BEEB3E29A6994EAD73510AA56
            EDDF22E33CAEE9D333000CA351B3D0A9D7A1B75F3EAEB43670D2AC3890802BAE
            B61803357344BDAE07A3B7CF836BF1ACFEDED4AFABD4871EB81C6C95294D0D40
            6D9F0157DAD08A57A133EE731FB86C895EE9897AB557AD058E6B25BC561380F2
            8FAB05CDD4A71F7D41B8D24678532F492EFAC7D5829618D2D7BE0C5C8B57FF36
            9B55D9554311D9F9BDEBAAF4EF4385D77B7F3CAE99E68E4455B61DD707A27AE2
            470ED7FCB97A6679025D8C2EA20F57BB441614AE9966118850198A59494C1E9B
            2765C7127071543A1CABC48F3681AE0A28195587C7BBEA68C1E04A8F7C10A0B2
            AC36C829E60E65DB24F1613A55A97E14E92D7A353ED085DDF7852B79F3CD81DB
            F51F9EF2A80C0524D4F80E67AFDDE2DE954BE57D8DEBA1117D7EA763647E7025
            275EC41B72602B877B15F633D34C2907C2AEE111CFCF24F73E02165A449D7C1E
            3CAEE4C47A431D5577C557D3D725EE356ACDDC91ACBF7B8F5366CC9D668DD1BF
            99B8D15937F3C6956C1C35005047C51ACBEDB2463002E26E5DDDD7F82B71FB57
            856E2D23ACA73B71679EB86C6DD9FF0B81CD5C17690A1A4AE5AB2BD7CEE0735C
            B958BBD8A391450686DE07870BC2B2803526582A4E150D3A6C552AAB9B1E919D
            FFF172EEB459269119CACADF03C3B5F0A20E7F541BA394C6D2D735EAD50C253C
            B2E9F9C04EF200531AADB34869D96F2FF3C295DA531B081845C54498368366F8
            EE8777DE0FEC2CBF6121231F6284D33E0DA367FF4A1501010C5BC5DC01E543A3
            6AF2D4D7D8A2D3BCCD0F8F29C3648ED77C3DC6DB1E8E1D111A43547CF09C7C2D
            43F11D14749C8F4AE71F91E39E4869C24FC8E8C37F89A898B822BBB419F66FAA
            BAC8B3256E6C12643406623E1EE627DE105171651DF568231CAFF8E146A17A59
            2A1C879FB7BF67FCE5B01A294EBFFBE807D9FCA706A132F3E68B407081B113C0
            5131517152326638E765A4B2C6D0B5FE2202C0395034D41CF5261806A03C172E
            D5CEBC0CCE8C41AA2C36EF69F0FDC5F3422A5EB60C476C7EC3555999999D9127
            B1734503E201A4056F18E45FAA1355776CF39F08E67B5B0F9FE31411151367CD
            AA118EB9B9ACCCC4DB3B6B848EA462D4C062F9E483DB9FAC3C8E60C368E6D603
            C1C5007334B66F2634B919CC4C689BE7BA2724247AE4DCFCFA9D5C6B699D08DA
            2237AE5C35E67B5C29A46263407AF3D9D08B58A9E61B544B8C7A247F32FEBFD2
            EB77B77C03F33F5E963968A12C45FF013A5015219A627CFD37D9C5A9031C57B9
            03EB200F903A684A422A46B2A7B7373A5515164B695307B29E96D8C79DCC1558
            27F90D79AC48C992BE2175B93A68E2474BCD891196225B3C3DC4C0A64EA4C03A
            CADBF8A1E2D2E5810095016C737EBE38F86471B7D8FA643CB9B674B9667D26F4
            0046F85E53CCC6740C7BB2487C3B105CDE545C1DF8ADCCBEA5016A409FDA5117
            8E9FB17F9ECDE84F1B779E36057D518F5C67B9BF6FC9AD8F0898291D91759867
            73A76226BFCEF52B3D52FAAEB1197FE672D3C271EE7C1D28DC379B921072BC84
            81E525E316FFB8665A9EEA9BC7722A3E2CAFD5E9EF18B5E15CBDF6CCC7DD0BEF
            6F71CECEEA668342A33F8D1D9939260E827DE3CA1F875AE3033915EFEDD014B4
            6288B9AD215F71AD032DB1C9D8123D32FA5AF4A72415A3C2618B5F5CB993B2D2
            BE03AD31046CF57093529651ABDFBD7AE51B545B66431B355A69B17B472275DF
            DA8356D118344546D127AEC4650918D5090718C28581C52EE9FEA1D587A7FCF0
            8F9542E5238D4CAFA504263F1D3A8603978859EC1A57FB36061869037B823503
            812D6D1324B474353CE223D72194CC20832C26E262FA0879879828E7E10FD778
            A5A576C3858A93FBE865B47AFED27FB71220CB3FAA93CA8F5DC7F946B21904AF
            87F82EE60BD754C931B86E549C2CB7356684534A370C2465F5B701D20669B912
            DF4EE8A5AC2E76D415AE998FE81950E73415DBE67E72DFFE4C5B0CFFCDC73DBD
            643245FA0C7D618037F8F31BD0280ADCB31F5CD3C750E5B88F4AA8086AD9D73E
            EEE84728B7A16B93BC6DC5EF158BB05ECC07AEDC2E6C17D2A68AA9980F44596D
            99DCD1B0CA8CDA4D0E58BA7259E55FCC2FAEF4B1D8078AA8F8F06D2FF682954C
            6A130752463DCB014B9CC1578B2C324CF4C6E5D842C005632273EF25D98B8129
            ADF553FDFDF590A72BB8FDCE5D63B88BC5F27452CC13D7CA3A6A93C41BFAD257
            6F040E5A2A63B7ABAFF2BBC7F883E6687263F6F2C0F56B93451C58196086B3B3
            731F1DF76CE4E9448E27AEB90DE4FFA6D98935111585924D37CAEB8A35A66C50
            1FABD6E39B73E1D37FCB1FBFFAB38E5C99BEF089A5F9CC276413977FEC0457EE
            0452DC4CF219B5EF7FF1A1B16CFA5995834483330A9F649C2C5C6D6160778FD9
            3FFBE131326AA3A4E9F0C0953E879D2B3AFE4670DD1B586A7AF3B829C384BEAA
            C4736F2584CC8CAF2356682657E38198D82E53F289EBEE076434C4E381EF7F75
            A5622AFB08D4811FD18031BC230616C12385589D1D6A629B68A6895CA63BAE99
            7D048BCBF5DF565AE6E9ABB772AB68A1F2541516559120CBC65F202AC6C26C74
            9FDF71805181BD3BAE7C11D1F094B9648583ED1080D618016C6CE67107A8DAC8
            96DF898C4F2682FA98315F618C62760F1A369252AEB8B0BA626C1A3EB36B58D8
            04C0101597FFA5C918A84A8D8856FFF61F828F0BAF90B9D70BBF3217513C442A
            CC15175217EB1D00B8FFAC6645EE37A4541CBBF58847A55A4FAB8F81A4F5E3EE
            81FD8B409FDA8AA86669F5116622D7C5902B22062C6EB87004C5654796B65B37
            D7B3122A0E5559955830E297B3C6D6B56ED8B63A5BADE5B586F24F8DC3A63644
            2A6B0F165A6D5C5F6162FBA903E73DA321A430375CF3DB8EBAA219465D05E777
            4342C56F1FD3CAB240AD3C8B0A8C42F62A557BC142D3967FE6FFF2AFEB504D3C
            136FEE3A0AC326D105571ABD071B7C816805BE774C44C53CCD41CD0235268F05
            C7A66B2F6864DACA166F3E6CE63BCF6499B80213E7D887B9E042FD91EB5D0429
            AA736DF3446A0CA8E45B6A60797B07B8CB571FAA1432918BCFA41FC387D6C798
            780AF6303C5E71C185BB233B6AFBCB731C333E717EA280116FA82CBFF513E9A7
            CE29646A23C1B585D3A7EDA69AFD8DBE84720228D893E34A5CC1A446728BBE12
            BB8410C807888059AED6F4357EB1E49BCA0B52E5CA1807ECDE2BF45C76C8027B
            18A2961CD783B512D3068E6430F797C9009B07A6C567FE01FCCBF253C288AA60
            9C03A6C11F38D381C25F68EAE5B8C2D0C8C79931361EEC31410D0B4C336E7496
            441C4B132A63CBCC801DE34026C6E6E97C43FAC8E91970E02CC585BD3815275B
            EA3A80BE9F6B3532BAB71ADCB8E808952DA4835047C36CB3209BA8DFFD177D05
            851066D91DD7ADA213FFB359C7BFFEEC3C9A7790E0BB5F892495E66505454279
            C2FB3F3157571FC136651586AC811342C8702D6EC0108AB11AD95D786BCE2A91
            ADADC53D66D6654226F078078D1A95E30AB4DED1916D375C8886ACD540C6D000
            71C68B106DADADFC04BA9454FD0803BBCFD89D4C1166CB599388B3810B6B2EB8
            D082187396CE6ADC790F6FFCEDFFD05F19C3D9E41E6059F751313035C6D80E64
            B4F4DB345B16B7E00BB78828C185622847AD489049326AE38CBA70E752E79E76
            0F8BAA78E4BA58E6D89947E1B253E3576D606D8B28C18542649686B07C905717
            66A167D58A97A48A988921C6A8A21EC616302222B6FC92041772CA6DB62229BC
            44C670966EAEE43EFA511DEFC6128ADB0800A60A1C0D318DA997D485C597D054
            DA51BA04D7A893F966B350C86AE8069319C2B690EBEC5D087137D62622C63843
            0924D022B6D2D2625C3347D01BD0D946C26A7C47FB8FD481F445BA12DC593526
            507C082B8BD99E0063A9966712E3C2569ECEAEADBE84568321018854E0F281B9
            D36E676049193B41A6C364168AFC058E57967FA13E47AE39167D27C1056D0B20
            CA995ADF8034D498692E425D332E59E90E64F919BA23A33064EA591706B19873
            8F24B860F762E7DAFFEB17D837D3B4D5C0EA3265CB463B958575C92D0B9F2444
            84DAB0739D425C28BFC658F9D57F41E7314B879D63A7A8716FF466E2B1E0490D
            D6397FFD4AFC16B0F7D8C64E880BCD0D31312F1AB1B2BE0399AF608C465B90E9
            D00A8FA90B98887728D6C00E66670384B8F07419DDBDD0803576878AE4B365D8
            A0EA5850EA221536B64F5D5885DE0D67215A82E66523837B425C708A92F55ED0
            CA1B5374DD0172A341AA8B5418638BE07BB031220C6AAD1051880B660B2293D4
            64030A36D8FB61AB11F39BCDF023A8B958CB015D33EB6DE0E0D2F2CC225C8B30
            6A65CC068A79B5794AFFD94F92E7F72A13B095B46BEAF3A5E7908826C51B6438
            4245112E34A5C478653C46A007CA9886014450A4607344DF18597A66D40C5FDC
            C8AF8B70A160DEC85055FFF7D71DEFC538FA6F1F411A66820835B0206FAFAED0
            FD5633DA6FC2D86544349012E1FAE1699B4E46922EE486692E760C0EE912340D
            B16F660774307FC346DFD03098B3225CB0FB19939439CC54C47E1E8D9682A621
            4144C620C11EC11A8E5B1FDAB8622111AEE962A8F5FF55848AA2565F3AEA88D0
            6E0377AFC0620D28683A83B1F4D07018D5498AF90F9E41432FD4179CB898A206
            29B336DAEDD60F94D9808DDAE3E85F2468B0CA841CB387705CF135F52A709ADF
            4C06B09F03749F6CE70E42D0BDE9AE9B298A437A68E82393BDE3CA8E389D9B4B
            450420D0D4B25C8063306D82CAA4434B1EBDD13B2ECC95A57F068E0B8FC2A6A8
            8E04437AC6D0C3C8371AEA1D171AA3041B44B5456693A0A167C6B728A2CF2B43
            BD3EFA1EF4CA633D66D744823C333368BEF7DAC145BB1C9897B170E9BD6AAC89
            121B819B4322CDC1187A98456422F0348C60B3CA4450E4E1673F0210DC79699F
            8F70310147FC4F822B0B67B6195C28E0D0C5B8E27F725CACBEE0246B1FD79F03
            D79F8587684EAD435C5945557B7DF69769E723BD3EFADEAF7FA05F6670A1F992
            6CEF71144ECD8F7ECE386A84BA39DA9D441A47F5FC684C952F27EE35260218A7
            C0646FF069001FE3143AE30713F0D14280E3CA6093BDF4BD3B1D578E0BF3518E
            71AD5ED0937A4567057C919974806D1ABCA197E501D0FCA24ECF72C30A57332F
            CEDBE8ED2FD10B32670FCFDB3F0C1F527F3E74F53BE46D688EC3CC335B1B03A7
            FBC5F90D9867632ABE509E8D99B0C6B638A0A94A2C9E79B6793A438B261EE644
            B8A036D99A14946565D2F330D6093E71E3951735E6E80C2DCC8B8AF38730FBC1
            D6F5A2C13733FF89A6534067CB1B3CC5338FAD4F53EE0B550945865DE71D988A
            4AA47D66FE1377B0808988BC9774DE812EEC846B9A8DE496709E0856AE30F329
            38CB9AA47A2BCEDC7CB679A234E595F13C113D7D8FD26CE36F5CE7F598F92F3C
            11CF14A5E022924043293CAFC77810181DB2133B70BF22CBE0097141B3C2CC57
            A2F94FB68361223233DCBD09EAB76C2483E66199510A9C3F36977F14E282696E
            767E19B61357E6808A639830AE27C101357357346FCEEE6D1C823C9B7B24C485
            27F6E85D5111AFB5FB74652F6ED90015866FCA0468B8EA877E0DBC887461CDBD
            2E85A9DF4075298C7D254A12981EDE8310F7640A8990F79AA7D7C722FF94DCF2
            A82362CBD950A50BE3E771D14F70C12FAE2362AC06365F4CE1348C93ECE55262
            5CD3FBE2F2433473CED6FEE142C8A04661C816715E11D39031CBA41917E342CB
            22986595288EE66ACC71EB0693E6C045D0DC0DE1AA1FD68DA22480DD7BC4B870
            953DB3BA174E9DB3F7241516745D2543003457C95A79BC42E35C5A070B3F6617
            71E0922B76CF2AE2450288A6F0F89F8B61701D2CB3E401795DBBB85056B7EC4C
            40B3A12FEAB3AC0B23BD4DEF5107B1FC8F2D822EBC451BF6D0AB7C50D0DB8A92
            24B8B04E076922A2952FDC02695C6ADC73296C0A3F93738898314CC92A72BAB1
            D1B7525C78F500B3011A2A41E4140626D032859E963BD8A37FBC2E60942ED1B3
            D74DC3CA69BAF8108D95DB1493E56DE072229688D909D87E9CC2885D2B34A387
            C01E6FA1CEBB64A2468BB11AA8F8B0BDE25F868B5B00C7DD985718EEECBD00A3
            60B12CCCEEC075376CB3E2151A2D132EC385422936A647590EB65A1350CBBFBA
            A622B9EA866F1DBCF88C6D55680D9D755DD2FC21DE2785AE85C5C5B06C786697
            72606FADDDFDD48D55FCE65772834576C11E36866CA32EC27EEFE8C17B1D22BB
            86BEF0122DC162F78A4A92AB8ED5C66CE77E6CF919B1DA97C9C9536D5A65D6A8
            A29264A7DF4871A1CD01B88D521017D8F2657247F7D67B751A79244BE4EBAACB
            6CA4899670F0460B46EA7079A13C8F8DD63CB0B1D4EACFD0D4EADFFD37098BE8
            190EB0BB662741F0F76F8F095882743F5A0FCE2D1BC556C31981C8710916DD3B
            8217FA92D154FB3C125A546579D7AF8B6676B610C02288C2AA0BAD7235E39F3C
            7011BB24304B11F1FA6862AF2A9684E84F0B877E90B19BAB08606116728BB450
            9C8EF6FD72C185BA22B7B70D5EA98F6C224F42F486F2AD8690A4A61F53D19E0A
            6E71362793C6BB12DC611618F37DC66D9F8A0BD82A50B94850946884DB8C2049
            A836C6688C5AD39C74318DD97493D9B448B4EB01B13706B704126F6580A223B7
            F92FBC869B5518F42346AD9DAAA7CEB60031FD26B3098CAA3457D44DD16CCBD8
            6D0B14BBAFC8CA0E4FDD988638C2AE3D2316EF229FE4860B0D40D95596F02946
            B8ED1DA995B9ADB666374C6941BBDFFC6D7E036D369754460607CA2FF87D6014
            514EEBE14F38466386FF38EF4E6C5CE93A5F89B6D2E34C622B830361512474B6
            61F8EA15BF1B516B3BB6D12418B47EBE6C6DDC23D8DD4C8BDF14F886C23AF42D
            3C0B0975E134932B2E622F2D76B72F8B89A0D62E426548086DC4B7B2DDA3DA05
            23926B8AD097677675BC8114930AC3ABBAC87D46DDE797D1725F7E77B6A5EDF3
            7909091DF946156CB5E42AAAB2D21039F2CCAD9F102C7EB30514C9925941775C
            5861DCD63D201AE52D21B31788154074B48F996C1B12BC658F601081B7E12137
            E3F4A807400AE3368371842621B720FBFB8B173E91A9CADD21499DC4FDA7D866
            707B48E01DFFA824AE072E14FE4B0E9991921023B3373FF4DE2710180509AA4C
            0AC3E2E24269CB7BD56F109BE40A360AA4DD7142BC7C7E6CFAC3B11B347B27B0
            C96D594842F42DC1A673C436A1F4AE495EB8D0DC0B88C6B7D88B1E24C4924A85
            EC1DCB3823685BFEFA37573BF26F16D6F13E9CFC3644207B0EB7BA652C9B67BD
            0DDEAF83DB9BDF9B8484246383AFF2BF69D467F57B1BB397276E451F0F7F2460
            59E3A22D261079F008EDEA4A2704BDEB88D01080FDAA2F12D2AD5B5546E24FEF
            0C583F5EBF5C383E6D7AD5B1C42EE9DDE8B51C1D42A1B114173978E3C2D19491
            6C12CD4564F91009573F06B9602F3BBCC31E82A1CD913BA72E3E8551885165B2
            303EEABE08D3412C08139170F6507220435732AB6CF27E9D02864F0DE03632F4
            53CF86B65C25B6AD149170F603A837FD1FC3E621B7DF29A233730860F8B822FE
            CC003FB8882DECEDAD125AB004249C7DA755E567687428B383EB44D732881304
            103072037AEE8C075FF5878889705F7D2109B79C52E2C8684FA705D89289533D
            4B5F785D26ACFD5CB175FFF94F286698E34E8CF35757E910199E832021211A49
            2CBEEE8D8CB1736A90A37D7FF48C386601690C02139D7AE30FD7E27BDBFD1903
            833C2C87840F7F264F3ED172834F7CDD58244B3A75BC8C114ED931E1C3E75883
            FACDF6FE046D1E090206DFE78CD8E18A61DC6AA95BE88EF1F69FCECBE46BFBDD
            B03173719B3E8DCAA887DBBFE34D32192A464DC14ED07EEB7BAD3B384315893B
            9E3CA2CED0B0919D989D9E5F51885536CA8C276EC2D889A6220216139EF0E7BB
            6E79FA5C008B8C09A9DDFD5BC86A8A11FDE0F7FE961B1ED59E3273AB0E0721B0
            72990736BEBD21BA996F5CE9949C848E2C3D65721A463D52CE9F34FDF031A39C
            5586D9C3A8B4C51DAA5D4454CC89CF63ECB0CEDC3DD42DBC1B60031F0BDAC9D2
            9B890B376C99A1FD5B4F6225F6F8363D923A66BE26A2A2583AC3E536E86F3F38
            B5C6C53EF6C1A2F5078DD285005C666828A2FE5D139C496739F84BFE68119A8A
            C7F268B4235C94B624E3ADD8ED35C14188AD5345C1C903FB18BA5CEB934DFB20
            BABFC70038D74527916A8B35A1A71051B1575CFEC65B99C177D2231E6DD55932
            0C5A95F8D2B35541EC447A6E934F2A7680CB938418D976B3BBC32BDBE0C327C3
            2EC7A189AC622FB8FC90104AF6347150EE0A99A5D139C53D56F14545DFB8C6D2
            EB1C091383F2436F27CF063A391CD641152EE747E52701FDF066AF0DCC9B8A7E
            71894898D88FC537E45F29BC4F1C9CFB38CB1762B24CCBBD33B7E0EBC17325DE
            DA70C78755F4894B4442FB00663357753BD77C757DF19770C90734A3366CB939
            D793EB12E1C39201DA3B095154141D0EE613979084A7B6358B5C8FBB9F365ED0
            AFAF3787CF15F979B116A6F3B961F7232EEDBC987DE46D547334E645455FB8B2
            651109DB39134359D9F03ADDBC701C1E79126B1D036ECF4DDBDF33EC32BBD641
            E0F997EA82E73154E96BE72C4E04CC838A7E7009FB56FB14705B22A565AF03CE
            6DC964B74B85B5D9A1D332880270161EB9A8C49F2DD47C65B0A60E7474E049D5
            17157DE01292F0AC49641FC27A7ACDFB3E48B2D6BF4EF27133D7C441D9207A96
            F741456F5C221282F4E04772C940A4B4FAA3E78DBA95F96D40967FC574E7906E
            8A8AB90ADD529EB86451C6DDAD2669E6622337FC90B17399BA28932D6828389B
            4E6A0CA606FCE21291D0796091AA0E31C2C3D53D10B4AC9C1E52714B64204734
            9F0B15BD702DE01DFCD9E069C6D8A496AF44AF226AB0C81246314455D6C4866B
            94ED25A918CB916B123DF5851CB2E02489F90D8A8B20AAEA0122B37455A3EA2A
            A38D05B617638D3144F4EC5F109870609208EFD12B8EA2EA70F3BDD72D7DC994
            71D8A0ABA06229416C0381E9778B1DF52F3879278BE0EFEE324F8F5E25329B5E
            8EDA4B166B177B340341449F139ADC3615B9A3F7FCF82F4B63A2E34CDA92B8B1
            4993D13259E6F0F84EF7D0D29A7158E1EE991992B8481B186B0DFDC51B363097
            69BBDC69B9C27C145595B97257D0D2A9F08F66883D45CF4CD4E5EC9EDC077C84
            E82B3E1C3BBAEF56F799368F1BEC9B1803B5B0668E7612865816B651AA9775AE
            423DA2274FDDDA6849E7CE7FEC34CF267BA1B312D7C6C030AE2CC33258F3876D
            F168A0B10742556E4C13A9AD9C77D63CC1E1B25DCD39A733D0521B484C1E9B27
            657983A7C3B14AFCC329A85D0BC669915A774E31285C16B2E14311B2B6DE42F1
            C1E2D8E8F6158894C12708A70442D33BE7E3BBD7355DAD0AC79E11BD5B87181C
            2E0B59A3526BCA326CC068385BEDA836FA28FAAD2A4BB6194AE886E2361AFFBD
            7059FD2CB4570E9DF57E1F60133031A477DEAF3E0F2EB1F3E95C5A2EB0A7F141
            D0B82C99312FF6F4EB1EF2A203B55CBCD4BDAA3E172E4B12A3CA26E88A90911A
            C82907BD07CF9F07970DEDD6DE47B3D691DAA20DBD118AA8DD9A8ADF0717B063
            A24B6543013E3869D8C6B2326304A0A8DF01570B5B7D3073B45B6E1974013CC3
            0057D6B51B7AA37919E898F473E36A830B5FB51C70D904000D70A32AA834937A
            F2F872D42D1AF9927121592C950CB8F5406127520C1CCE1F840BE0B506FC5283
            3EAE3EAE3EAE3EAE3EAE3EAE2F1F57B4F09ABBA605E7A7FF305C761CC5C8E2DB
            6052E07F2C2E5EB822F83EAE3EAE3EAE3EAEFFD3B8AEA4692A7A25E19F0DD741
            5C76E93A161CAEFF00D585B13E148C98490000000049454E44AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
    end
  end
end
