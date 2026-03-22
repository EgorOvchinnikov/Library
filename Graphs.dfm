object Form14: TForm14
  Left = 0
  Top = 0
  Caption = #1043#1088#1072#1092#1080#1082#1080
  ClientHeight = 594
  ClientWidth = 762
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
    Width = 762
    Height = 594
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1087#1091#1083#1103#1088#1085#1099#1077' '#1082#1085#1080#1075#1080
      object DBChart3: TDBChart
        Left = 0
        Top = 40
        Width = 754
        Height = 540
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Text.Strings = (
          #1053#1072#1080#1073#1086#1083#1077#1077' '#1087#1086#1087#1091#1083#1103#1088#1085#1099#1077' '#1074#1099#1076#1072#1085#1085#1099#1077' '#1082#1085#1080#1075#1080)
        BottomAxis.Increment = 1.000000000000000000
        Legend.Visible = False
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series3: THorizBarSeries
          HoverElement = []
          BarBrush.Gradient.Direction = gdLeftRight
          Marks.Visible = False
          DataSource = DataModule10.Q_popular_books
          XLabelsSource = 'AuthorBook'
          Gradient.Direction = gdLeftRight
          XValues.Name = 'Bar'
          XValues.Order = loNone
          XValues.ValueSource = 'GivenBookCount'
          YValues.Name = 'Y'
          YValues.Order = loAscending
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 754
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label3: TLabel
          Left = 311
          Top = 13
          Width = 13
          Height = 15
          Caption = #1076#1086
        end
        object SpinEdit1: TSpinEdit
          Left = 248
          Top = 10
          Width = 57
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object CheckBox2: TCheckBox
          Left = 56
          Top = 13
          Width = 186
          Height = 17
          Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1087#1086' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1091' '#1086#1090
          TabOrder = 1
          OnClick = CheckBox2Click
        end
        object SpinEdit2: TSpinEdit
          Left = 330
          Top = 10
          Width = 55
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1080#1085#1072#1084#1080#1082#1072' '#1074#1099#1076#1072#1095#1080' '#1082#1085#1080#1075
      ImageIndex = 1
      object DBChart2: TDBChart
        Left = 0
        Top = 64
        Width = 754
        Height = 500
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Text.Strings = (
          #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1099#1076#1072#1085#1085#1099#1093' '#1082#1085#1080#1075' '#1087#1086' '#1076#1072#1090#1072#1084)
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.Minimum = 1.000000000000000000
        Legend.Visible = False
        View3D = False
        Align = alBottom
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series2: TLineSeries
          HoverElement = [heCurrent]
          DataSource = DataModule10.Q_given_count
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'giveDate'
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'TotalBooksGiven'
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 754
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 40
          Top = 24
          Width = 3
          Height = 15
        end
        object Label2: TLabel
          Left = 235
          Top = 24
          Width = 14
          Height = 15
          Caption = #1087#1086
        end
        object DateTimePicker1: TDateTimePicker
          Left = 136
          Top = 24
          Width = 89
          Height = 23
          Date = 45642.000000000000000000
          Time = 0.659819953703845400
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 262
          Top = 24
          Width = 89
          Height = 23
          Date = 45642.000000000000000000
          Time = 0.659923784725833700
          TabOrder = 1
        end
        object CheckBox1: TCheckBox
          Left = 33
          Top = 24
          Width = 97
          Height = 17
          Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089
          TabOrder = 2
          OnClick = CheckBox1Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1078#1072#1085#1088#1072#1084
      ImageIndex = 2
      object DBChart1: TDBChart
        Left = 0
        Top = 0
        Width = 754
        Height = 564
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Margins.Left = 11
        Title.Margins.Units = maPixels
        Title.Text.Strings = (
          #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1082#1085#1080#1075' '#1087#1086' '#1078#1072#1085#1088#1072#1084)
        Title.TextAlignment = taRightJustify
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TPieSeries
          HoverElement = []
          Marks.Tail.Margin = 2
          DataSource = DataModule10.Q_genres_count
          XLabelsSource = 'genName'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'BookCount'
          CustomXRadius = 180
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          OtherSlice.Legend.Visible = False
        end
      end
    end
  end
end
