object Form1: TForm1
  Left = 196
  Top = 149
  Width = 696
  Height = 475
  Caption = 'Form1'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 40
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 568
    Top = 384
    Width = 75
    Height = 25
    Caption = '&End'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Kind = bkClose
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 80
    OnTimer = Timer1Timer
    Left = 328
    Top = 392
  end
end
