object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 604
  ClientWidth = 864
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 23
  object labelPrevious: TLabel
    Left = 96
    Top = 216
    Width = 267
    Height = 23
    Alignment = taCenter
    Caption = #1055#1080#1089#1100#1084#1072' '#1079#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
  end
  object labelCurrent: TLabel
    Left = 512
    Top = 216
    Width = 267
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1080#1089#1100#1084#1072' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
  end
  object labelPreviousMonth: TLabel
    Left = 96
    Top = 245
    Width = 267
    Height = 23
    Alignment = taCenter
    AutoSize = False
  end
  object LabelCurrentMonth: TLabel
    Left = 512
    Top = 245
    Width = 267
    Height = 23
    Alignment = taCenter
    AutoSize = False
  end
  object labelSelectMo: TLabel
    Left = 243
    Top = 165
    Width = 121
    Height = 23
    AutoSize = False
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1052#1054':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object labelSelectDirectory: TLabel
    Left = 24
    Top = 25
    Width = 310
    Height = 23
    AutoSize = False
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1084#1086#1085#1080#1090#1086#1088#1080#1085#1075#1072' '#1087#1080#1089#1077#1084':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object buttonCheck: TButton
    Left = 264
    Top = 88
    Width = 329
    Height = 33
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1087#1080#1089#1100#1084#1072
    TabOrder = 0
  end
  object drawgridPreviousMonth: TDrawGrid
    Left = 24
    Top = 288
    Width = 401
    Height = 297
    ColCount = 3
    DrawingStyle = gdsGradient
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goTabs]
    ParentFont = False
    TabOrder = 1
  end
  object comboboxSelectMO: TComboBox
    Left = 370
    Top = 159
    Width = 223
    Height = 31
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Items.Strings = (
      '<'#1074#1089#1077'>')
  end
  object drawgridCurrentMonth: TDrawGrid
    Left = 439
    Top = 288
    Width = 401
    Height = 297
    ColCount = 3
    DrawingStyle = gdsGradient
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goTabs]
    ParentFont = False
    TabOrder = 3
  end
  object editSelectDirectory: TEdit
    Left = 340
    Top = 19
    Width = 397
    Height = 31
    TabOrder = 4
    Text = 'editSelectDirectory'
  end
  object buttonSelectDirectory: TButton
    Left = 743
    Top = 22
    Width = 26
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
end
