object Form3: TForm3
  Left = 294
  Top = 576
  Width = 249
  Height = 68
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1055#1077#1088#1077#1081#1090#1080
  Color = clActiveBorder
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
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 19
    Height = 16
    Caption = '0%'
    Color = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Button1: TButton
    Left = 168
    Top = 16
    Width = 73
    Height = 25
    Caption = #1055#1077#1088#1077#1081#1090#1080
    TabOrder = 0
    OnClick = Button1Click
  end
  object ScrollBar1: TScrollBar
    Left = 0
    Top = 24
    Width = 153
    Height = 17
    PageSize = 0
    Position = 1
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
end
