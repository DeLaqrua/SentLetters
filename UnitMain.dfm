object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 604
  ClientWidth = 864
  Color = clBackground
  Constraints.MinHeight = 390
  Constraints.MinWidth = 880
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    864
    604)
  PixelsPerInch = 96
  TextHeight = 23
  object labelPrevious: TLabel
    Left = 96
    Top = 216
    Width = 267
    Height = 23
    Alignment = taCenter
    Anchors = [akTop]
    Caption = #1055#1080#1089#1100#1084#1072' '#1079#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
    ExplicitLeft = 91
  end
  object labelCurrent: TLabel
    Left = 502
    Top = 216
    Width = 267
    Height = 23
    Alignment = taCenter
    Anchors = [akTop]
    AutoSize = False
    Caption = #1055#1080#1089#1100#1084#1072' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
    ExplicitLeft = 487
  end
  object labelPreviousMonth: TLabel
    Left = 96
    Top = 245
    Width = 267
    Height = 23
    Alignment = taCenter
    Anchors = [akTop]
    AutoSize = False
    ExplicitLeft = 91
  end
  object LabelCurrentMonth: TLabel
    Left = 502
    Top = 245
    Width = 267
    Height = 23
    Alignment = taCenter
    Anchors = [akTop]
    AutoSize = False
    ExplicitLeft = 487
  end
  object buttonCheck: TButton
    Left = 264
    Top = 88
    Width = 329
    Height = 33
    Anchors = [akTop]
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1087#1080#1089#1100#1084#1072
    TabOrder = 0
    OnClick = buttonCheckClick
    ExplicitLeft = 254
  end
  object drawgridPreviousMonth: TDrawGrid
    Left = 8
    Top = 288
    Width = 417
    Height = 308
    Anchors = [akTop, akBottom]
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
  object drawgridCurrentMonth: TDrawGrid
    Left = 431
    Top = 288
    Width = 425
    Height = 308
    Anchors = [akTop, akBottom]
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
    TabOrder = 2
  end
  object groupboxSelectMO: TGroupBox
    Left = 208
    Top = 136
    Width = 441
    Height = 65
    Anchors = [akTop]
    TabOrder = 3
    ExplicitLeft = 198
    object labelSelectMo: TLabel
      Left = 48
      Top = 23
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
    object comboboxSelectMO: TComboBox
      Left = 175
      Top = 15
      Width = 223
      Height = 31
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = '<'#1074#1089#1077'>'
      Items.Strings = (
        '<'#1074#1089#1077'>')
    end
  end
  object groupboxSelectDirectory: TGroupBox
    Left = 16
    Top = 8
    Width = 833
    Height = 57
    Anchors = [akTop]
    TabOrder = 4
    object labelSelectDirectory: TLabel
      Left = 40
      Top = 17
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
    object editSelectDirectory: TEdit
      Left = 356
      Top = 11
      Width = 397
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'E:\Proba\'#1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1087#1080#1089#1100#1084#1072
    end
    object buttonSelectDirectory: TButton
      Left = 759
      Top = 14
      Width = 26
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = buttonSelectDirectoryClick
    end
  end
end
