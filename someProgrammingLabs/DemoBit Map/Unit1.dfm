object MainForm: TMainForm
  Left = 192
  Top = 114
  Width = 870
  Height = 640
  Caption = 'BitMapViewer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object BitImage: TImage
    Left = 0
    Top = 0
    Width = 862
    Height = 586
    Align = alClient
    Stretch = True
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 96
    object File1: TMenuItem
      Caption = '&File'
      OnClick = File1Click
      object Open1: TMenuItem
        Caption = '&Open'
      end
      object Exit1: TMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    FileName = 'F:\Delphi\DemoBit Map\gfjhgjm.bmp.bmp'
    Filter = 'BitMap|*.bmp|All files|*.*'
    Left = 256
    Top = 96
  end
end
