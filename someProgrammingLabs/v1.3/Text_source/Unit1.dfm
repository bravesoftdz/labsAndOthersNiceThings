object Form1: TForm1
  Left = 268
  Top = 148
  BiDiMode = bdLeftToRight
  Caption = 'Text'
  ClientHeight = 469
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF0000000000
    FFFFFFFFFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFFFFFFFFFFFF000000F
    FFFFFFFFFFFFFFFFFFFFFFFFF00000FFF0000000000000000000000FFF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    F0000000000000000000000FFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFF0000000000000000000000FFF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    F0000000000000000000000FFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFF0000000000000000000000FFF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    F0000000000000000000000FFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFF0000000000000000000000FFF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFF000000F
    FFFFFFFFFFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
    00FFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFC00003FF000000FE000
    0007E0000007C0000003C0000003C0000003C0000003C0000003C0000003C000
    0003C0000003C0000003C0000003C0000003C0000003C0000003C0000003C000
    0003C0000003C0000003C0000003C0000003C0000003E0000007E0000007F000
    000FFC00003FFFFFFFFFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000FF
    FFFFFFFFFF000FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00F000000000000F00FFF
    FFFFFFFFFFF00F000000000000F00FFFFFFFFFFFFFF00F000000000000F00FFF
    FFFFFFFFFFF00F000000000000F00FFFFFFFFFFFFFF00F000000000000F00FFF
    FFFFFFFFFFF000FFFFFFFFFFFF000000000000000000FFFF0000C00300008001
    0000800100008001000080010000800100008001000080010000800100008001
    0000800100008001000080010000C0030000FFFF0000}
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 452
    Width = 705
    Height = 17
    Align = alBottom
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 97
      Height = 17
      Color = clBtnShadow
      Enabled = False
      TabOrder = 0
      OnDblClick = Panel2DblClick
    end
    object Panel3: TPanel
      Left = 96
      Top = 0
      Width = 81
      Height = 17
      Color = clBtnShadow
      Enabled = False
      TabOrder = 1
      OnDblClick = Panel3DblClick
    end
    object Panel4: TPanel
      Left = 176
      Top = 0
      Width = 73
      Height = 17
      Color = clBtnShadow
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 248
      Top = 0
      Width = 89
      Height = 17
      Color = clBtnShadow
      TabOrder = 3
    end
    object Panel6: TPanel
      Left = 336
      Top = 0
      Width = 97
      Height = 17
      Color = clBtnShadow
      TabOrder = 4
      OnDblClick = Panel6DblClick
    end
    object Panel7: TPanel
      Left = 438
      Top = 1
      Width = 266
      Height = 15
      Align = alRight
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Visible = False
      OnMouseMove = Panel7MouseMove
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 27
        Height = 13
        Caption = 'PLAY'
        Color = clBtnFace
        ParentColor = False
        OnClick = Label1Click
        OnMouseLeave = Label1MouseLeave
      end
      object Label2: TLabel
        Left = 40
        Top = 0
        Width = 29
        Height = 13
        Caption = 'STOP'
        OnClick = Label2Click
        OnMouseLeave = Label2MouseLeave
      end
      object Label3: TLabel
        Left = 80
        Top = 0
        Width = 36
        Height = 13
        Caption = 'PAUSE'
        OnClick = Label3Click
        OnMouseLeave = Label3MouseLeave
      end
      object Label4: TLabel
        Left = 168
        Top = 0
        Width = 29
        Height = 13
        Caption = 'NEXT'
        OnClick = Label4Click
        OnMouseLeave = Label4MouseLeave
      end
      object Label5: TLabel
        Left = 128
        Top = 0
        Width = 29
        Height = 13
        Caption = 'PREV'
        OnClick = Label5Click
        OnMouseLeave = Label5MouseLeave
      end
      object Label6: TLabel
        Left = 208
        Top = 0
        Width = 6
        Height = 13
        Caption = '--'
        OnClick = Label6Click
        OnMouseLeave = Label6MouseLeave
      end
      object Label7: TLabel
        Left = 232
        Top = 0
        Width = 12
        Height = 13
        Caption = '++'
        OnClick = Label7Click
        OnMouseLeave = Label7MouseLeave
      end
    end
  end
  object RichEdit1: TRichEdit
    Tag = 10
    Left = 0
    Top = 0
    Width = 705
    Height = 452
    Align = alClient
    BevelInner = bvNone
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    PlainText = True
    PopupMenu = PopupMenu1
    ScrollBars = ssBoth
    TabOrder = 1
    WantTabs = True
    OnChange = RichEdit1Change
    OnContextPopup = RichEdit1ContextPopup
    OnKeyDown = RichEdit1KeyDown
    OnKeyPress = RichEdit1KeyPress
    OnKeyUp = RichEdit1KeyUp
    OnMouseMove = RichEdit1MouseMove
    ExplicitLeft = -1
    ExplicitTop = -5
  end
  object MainMenu1: TMainMenu
    object File1: TMenuItem
      Caption = #1060#1072#1081#1083
      object New1: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        ShortCut = 16462
        OnClick = New1Click
      end
      object NewWindow1: TMenuItem
        Caption = #1053#1086#1074#1086#1077' '#1086#1082#1085#1086
        ShortCut = 24654
        OnClick = NewWindow1Click
      end
      object N44: TMenuItem
        Caption = '-'
      end
      object N1: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
        ShortCut = 16463
        OnClick = N1Click
      end
      object N45: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Enabled = False
        ShortCut = 16467
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        ShortCut = 24659
        OnClick = N3Click
      end
      object N46: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1090#1088#1072#1085#1080#1094#1099'...'
        ShortCut = 24656
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100'...'
        ShortCut = 16464
        OnClick = N5Click
      end
      object N47: TMenuItem
        Caption = '-'
      end
      object N16: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        ShortCut = 32883
        OnClick = N16Click
      end
    end
    object N6: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object N7: TMenuItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
        ShortCut = 16474
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1100
        Enabled = False
        ShortCut = 24666
      end
      object N48: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #1042#1099#1088#1077#1079#1072#1090#1100
        ShortCut = 16472
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        ShortCut = 16451
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #1042#1089#1090#1072#1074#1080#1090#1100
        ShortCut = 16470
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        ShortCut = 46
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
        ShortCut = 16473
        OnClick = N13Click
      end
      object N49: TMenuItem
        Caption = '-'
      end
      object N14: TMenuItem
        Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
        ShortCut = 16449
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077
        ShortCut = 24641
        OnClick = N15Click
      end
      object N50: TMenuItem
        Caption = '-'
      end
      object N17: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1074' '#1073#1091#1092#1077#1088
        ShortCut = 24643
        OnClick = N17Click
      end
      object N93: TMenuItem
        Caption = #1042#1089#1090#1072#1074#1082#1072' '#1080#1079' '#1073#1091#1092#1077#1088#1072
        ShortCut = 24662
        OnClick = N93Click
      end
      object N94: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088
        ShortCut = 24644
        OnClick = N94Click
      end
      object N51: TMenuItem
        Caption = '-'
      end
      object N19: TMenuItem
        Caption = #1053#1072#1081#1090#1080'...'
        ShortCut = 16454
        OnClick = N19Click
      end
      object N20: TMenuItem
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100'...'
        ShortCut = 16466
        OnClick = N20Click
      end
      object N21: TMenuItem
        Caption = #1048#1089#1082#1072#1090#1100' '#1076#1072#1083#1077#1077
        Enabled = False
        ShortCut = 16460
        OnClick = N21Click
      end
      object N52: TMenuItem
        Caption = '-'
      end
      object N23: TMenuItem
        Caption = #1055#1077#1088#1077#1081#1090#1080'...'
        Enabled = False
        ShortCut = 16455
        OnClick = N23Click
      end
    end
    object N22: TMenuItem
      Caption = #1042#1080#1076
      object N63: TMenuItem
        Caption = #1058#1086#1083#1100#1082#1086' '#1095#1090#1077#1085#1080#1077
        object N64: TMenuItem
          Caption = #1042#1082#1083#1102#1095#1080#1090#1100
          ShortCut = 16496
          OnClick = N64Click
        end
      end
      object N24: TMenuItem
        Caption = #1042#1085#1077#1096#1085#1080#1081' '#1074#1080#1076
        object N62: TMenuItem
          Caption = #1064#1088#1080#1092#1090
          ShortCut = 24689
          OnClick = N62Click
        end
        object N18: TMenuItem
          Caption = #1055#1088#1086#1079#1088#1072#1095#1085#1086#1089#1090#1100
          ShortCut = 121
          OnClick = N18Click
        end
      end
      object N68: TMenuItem
        Caption = '-'
      end
      object N69: TMenuItem
        Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1086' '#1089#1083#1086#1074#1072#1084' '#1074#1099#1082#1083
        ShortCut = 113
        OnClick = N69Click
      end
      object N53: TMenuItem
        Caption = '-'
      end
      object N25: TMenuItem
        Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1096#1088#1080#1092#1090
        ShortCut = 16571
        OnClick = N25Click
      end
      object N26: TMenuItem
        Caption = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1096#1088#1080#1092#1090
        ShortCut = 16573
        OnClick = N26Click
      end
      object N54: TMenuItem
        Caption = '-'
      end
      object N27: TMenuItem
        Caption = #1053#1086#1088#1084#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1084#1077#1088' '#1086#1082#1085#1072
        ShortCut = 49275
        OnClick = N27Click
      end
      object N55: TMenuItem
        Caption = #1053#1086#1088#1084#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072
        ShortCut = 49200
        OnClick = N55Click
      end
      object N56: TMenuItem
        Caption = '-'
      end
      object N28: TMenuItem
        Caption = #1053#1072' '#1074#1077#1089#1100' '#1101#1082#1088#1072#1085
        ShortCut = 122
        OnClick = N28Click
      end
      object N29: TMenuItem
        Caption = #1042#1089#1077#1075#1076#1072' '#1087#1086#1074#1077#1088#1093' '#1076#1088#1091#1075#1080#1093'  '#1074#1082#1083
        ShortCut = 24660
        OnClick = N29Click
      end
    end
    object N31: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1082#1072
      object N32: TMenuItem
        Caption = #1042#1088#1077#1084#1103' '#1080' '#1076#1072#1090#1072
        ShortCut = 16452
        OnClick = N32Click
      end
      object N33: TMenuItem
        Caption = #1042#1085#1077#1096#1085#1080#1081' '#1092#1072#1081#1083'...'
        ShortCut = 16453
        OnClick = N33Click
      end
    end
    object N58: TMenuItem
      Caption = #1058#1077#1082#1089#1090
      object N30: TMenuItem
        Caption = #1040#1074#1090#1086#1087#1088#1086#1082#1088#1091#1090#1082#1072
        ShortCut = 16450
        OnClick = N30Click
      end
      object N65: TMenuItem
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100
        object N66: TMenuItem
          Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100
          ShortCut = 8379
          OnClick = N66Click
        end
        object N88: TMenuItem
          Caption = #1059#1084#1077#1085#1100#1096#1080#1090#1100
          ShortCut = 8381
          OnClick = N88Click
        end
      end
      object N89: TMenuItem
        Caption = '-'
      end
      object N90: TMenuItem
        Caption = #1055#1086#1076#1089#1074#1077#1090#1082#1072
        OnClick = N90Click
      end
      object N95: TMenuItem
        Caption = #1055#1086#1076#1089#1074#1077#1090#1082#1072' '#1089#1080#1085#1090#1072#1082#1089#1080#1089#1072
        ShortCut = 16460
        OnClick = N95Click
      end
      object N96: TMenuItem
        Caption = #1057#1080#1085#1090#1072#1082#1089#1080#1089
        OnClick = N96Click
      end
      object N70: TMenuItem
        Caption = '-'
      end
      object N71: TMenuItem
        Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072
        object Win1: TMenuItem
          Caption = 'WIN'
          ShortCut = 49239
          OnClick = Win1Click
        end
        object DOS1: TMenuItem
          Caption = 'DOS'
          ShortCut = 49220
          OnClick = DOS1Click
        end
      end
      object N67: TMenuItem
        Caption = '-'
      end
      object N61: TMenuItem
        Caption = #1064#1088#1080#1092#1090
        OnClick = N61Click
      end
    end
    object N72: TMenuItem
      Caption = #1047#1072#1082#1083#1072#1076#1082#1080
      object N73: TMenuItem
        Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
        OnClick = N73Click
      end
      object N74: TMenuItem
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1079#1072#1082#1083#1072#1076#1082#1091
        OnClick = N74Click
      end
      object N75: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
        OnClick = N75Click
      end
    end
    object N34: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object N35: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        ShortCut = 16461
        OnClick = N35Click
      end
      object N57: TMenuItem
        Caption = '-'
      end
      object N41: TMenuItem
        Caption = #1052#1099#1096#1100
        object N42: TMenuItem
          Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
          OnClick = N42Click
        end
        object N91: TMenuItem
          Caption = #1042#1082#1083#1102#1095#1080#1090#1100
          Enabled = False
          OnClick = N91Click
        end
        object N92: TMenuItem
          Caption = '-'
        end
        object N43: TMenuItem
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          Enabled = False
        end
      end
    end
    object N36: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N37: TMenuItem
        Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
        Enabled = False
      end
      object N59: TMenuItem
        Caption = '-'
      end
      object N38: TMenuItem
        Caption = #1048#1089#1090#1086#1088#1080#1103
        Enabled = False
      end
      object N39: TMenuItem
        Caption = #1057#1072#1081#1090
        OnClick = N39Click
      end
      object N60: TMenuItem
        Caption = '-'
      end
      object N40: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = N40Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'txt|*.txt|all|*.*'
    Left = 32
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'txt|*.txt|all|*.*'
    Left = 64
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 96
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 128
  end
  object FindDialog1: TFindDialog
    Ctl3D = False
    OnFind = FindDialog1Find
    Left = 160
  end
  object ReplaceDialog1: TReplaceDialog
    OnFind = ReplaceDialog1Find
    OnReplace = ReplaceDialog1Replace
    Left = 192
  end
  object XPColorMap1: TXPColorMap
    HighlightColor = 14410210
    BtnSelectedColor = clBtnFace
    UnusedColor = 14410210
    Left = 224
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 264
    Top = 8
    object N121211: TMenuItem
      Caption = #1042#1099#1088#1077#1079#1072#1090#1100
      OnClick = N121211Click
    end
    object ffer1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = ffer1Click
    end
    object N77: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      OnClick = N77Click
    end
    object N76: TMenuItem
      Caption = '-'
    end
    object N78: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N78Click
    end
    object N79: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnClick = N79Click
    end
    object N80: TMenuItem
      Caption = '-'
    end
    object N81: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = N81Click
    end
    object N82: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077
      OnClick = N82Click
    end
    object N83: TMenuItem
      Caption = '-'
    end
    object N84: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
      OnClick = N84Click
    end
    object N85: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1079#1072#1082#1083#1072#1076#1082#1091
      OnClick = N85Click
    end
    object N86: TMenuItem
      Caption = '-'
    end
    object N87: TMenuItem
      Caption = #1040#1074#1090#1086#1087#1088#1086#1082#1088#1091#1090#1082#1072
      OnClick = N87Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2500
    OnTimer = Timer1Timer
    Left = 304
    Top = 8
  end
  object PrintDialog1: TPrintDialog
    Left = 344
    Top = 8
  end
  object PageSetupDialog1: TPageSetupDialog
    MinMarginLeft = 0
    MinMarginTop = 0
    MinMarginRight = 0
    MinMarginBottom = 0
    MarginLeft = 2500
    MarginTop = 2500
    MarginRight = 2500
    MarginBottom = 2500
    PageWidth = 21000
    PageHeight = 29700
    Left = 384
    Top = 8
  end
end
