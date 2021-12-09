object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 729
  ClientWidth = 1004
  Color = clBackground
  Constraints.MinHeight = 390
  Constraints.MinWidth = 880
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1004
    729)
  PixelsPerInch = 96
  TextHeight = 23
  object labelHelp: TLabel
    Left = 7
    Top = 299
    Width = 989
    Height = 23
    Alignment = taCenter
    Anchors = [akTop]
    AutoSize = False
  end
  object buttonCheck: TButton
    Left = 337
    Top = 255
    Width = 329
    Height = 33
    Anchors = [akTop]
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1087#1080#1089#1100#1084#1072
    TabOrder = 1
    OnClick = buttonCheckClick
  end
  object groupboxSelectMO: TGroupBox
    Left = 8
    Top = 126
    Width = 988
    Height = 109
    Anchors = [akTop]
    TabOrder = 2
    object labelSelectMo: TLabel
      Left = 128
      Top = 23
      Width = 113
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
    object LabelSelectMonth: TLabel
      Left = 112
      Top = 68
      Width = 129
      Height = 23
      AutoSize = False
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1052#1077#1089#1103#1094':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object comboboxSelectMO: TComboBox
      Left = 247
      Top = 15
      Width = 610
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
    object comboboxSelectMonth: TComboBox
      Left = 247
      Top = 60
      Width = 483
      Height = 31
      Style = csDropDownList
      DropDownCount = 14
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = '<'#1074#1089#1077'>'
      OnSelect = comboboxSelectMonthSelect
      Items.Strings = (
        '<'#1074#1089#1077'>'
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object SpinEditYear: TSpinEdit
      Left = 736
      Top = 59
      Width = 121
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 3000
      MinValue = 2021
      ParentFont = False
      TabOrder = 2
      Value = 2021
      OnChange = SpinEditYearChange
    end
  end
  object groupboxSelectDirectory: TGroupBox
    Left = 8
    Top = 8
    Width = 988
    Height = 105
    Anchors = [akTop]
    TabOrder = 3
    object labelDirectorySentMails: TLabel
      Left = 98
      Top = 8
      Width = 268
      Height = 41
      Hint = 
        #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1086#1088#1085#1077#1074#1091#1102' '#1087#1072#1087#1082#1091', '#1074' '#1082#1086#1090#1086#1088#1086#1081' '#1093#1088#1072#1085#1103#1090#1089#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085 +
        #1099#1077' '#1087#1080#1089#1100#1084#1072' '#1058#1072#1085#1080
      AutoSize = False
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1086#1090#1089#1083#1077#1078#1080#1074#1072#1085#1080#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1093' '#1087#1080#1089#1077#1084':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object labelDirectoryCryptoarm: TLabel
      Left = 100
      Top = 53
      Width = 266
      Height = 41
      Hint = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1086#1088#1085#1077#1074#1091#1102' '#1087#1072#1087#1082#1091' '#1050#1088#1080#1087#1090#1086#1040#1088#1084'-'#1072#1074#1090#1086#1087#1088#1086#1094#1077#1089#1089#1080#1085#1075#1072
      AutoSize = False
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1089#1088#1072#1074#1085#1077#1085#1080#1103' '#1089' '#1087#1088#1080#1085#1103#1090#1099#1084#1080' '#1087#1080#1089#1100#1084#1072#1084#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object editDirectorySentMails: TEdit
      Left = 372
      Top = 12
      Width = 469
      Height = 31
      Hint = 
        #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1086#1088#1085#1077#1074#1091#1102' '#1087#1072#1087#1082#1091', '#1074' '#1082#1086#1090#1086#1088#1086#1081' '#1093#1088#1072#1085#1103#1090#1089#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085 +
        #1099#1077' '#1087#1080#1089#1100#1084#1072' '#1058#1072#1085#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'E:\Proba\'#1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1087#1080#1089#1100#1084#1072
    end
    object buttonDirectorySentMails: TButton
      Left = 847
      Top = 14
      Width = 26
      Height = 25
      Hint = 
        #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1086#1088#1085#1077#1074#1091#1102' '#1087#1072#1087#1082#1091', '#1074' '#1082#1086#1090#1086#1088#1086#1081' '#1093#1088#1072#1085#1103#1090#1089#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085 +
        #1099#1077' '#1087#1080#1089#1100#1084#1072' '#1058#1072#1085#1080
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = buttonDirectorySentMailsClick
    end
    object editDirectoryCryptoarm: TEdit
      Left = 372
      Top = 56
      Width = 469
      Height = 31
      Hint = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1086#1088#1085#1077#1074#1091#1102' '#1087#1072#1087#1082#1091' '#1050#1088#1080#1087#1090#1086#1040#1088#1084'-'#1072#1074#1090#1086#1087#1088#1086#1094#1077#1089#1089#1080#1085#1075#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'E:\Proba\AutoProcessingFiles'
    end
    object buttonDirectoryCryptoarm: TButton
      Left = 847
      Top = 58
      Width = 26
      Height = 25
      Hint = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1086#1088#1085#1077#1074#1091#1102' '#1087#1072#1087#1082#1091' '#1050#1088#1080#1087#1090#1086#1040#1088#1084'-'#1072#1074#1090#1086#1087#1088#1086#1094#1077#1089#1089#1080#1085#1075#1072
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = buttonDirectoryCryptoarmClick
    end
  end
  object stringgridMails: TStringGrid
    Left = 8
    Top = 336
    Width = 988
    Height = 385
    Anchors = [akTop, akBottom]
    ColCount = 6
    DefaultRowHeight = 32
    DrawingStyle = gdsGradient
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goTabs]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnDrawCell = stringgridMailsDrawCell
    OnMouseEnter = stringgridMailsMouseEnter
    ColWidths = (
      68
      105
      102
      139
      329
      228)
  end
end
