object Form1: TForm1
  Left = 311
  Top = 385
  Width = 858
  Height = 583
  Caption = 'Spline Interpolator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 145
    Width = 850
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    MinSize = 140
    ResizeStyle = rsUpdate
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 145
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 586
      Height = 145
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object NodeView: TValueListEditor
        Left = 0
        Top = 0
        Width = 586
        Height = 145
        Align = alClient
        DisplayOptions = [doColumnTitles, doKeyColFixed]
        KeyOptions = [keyEdit, keyAdd, keyDelete, keyUnique]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
        ScrollBars = ssVertical
        Strings.Strings = (
          '0=0')
        TabOrder = 0
        TitleCaptions.Strings = (
          'Xi'
          'F (Xi)')
        OnValidate = NodeViewValidate
        ColWidths = (
          150
          540)
      end
    end
    object Panel4: TPanel
      Left = 586
      Top = 0
      Width = 264
      Height = 145
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Button2: TButton
        Left = 8
        Top = 40
        Width = 25
        Height = 25
        Caption = '-'
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 80
        Top = 112
        Width = 90
        Height = 25
        Caption = 'Interpolate'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button1: TButton
        Left = 8
        Top = 9
        Width = 25
        Height = 25
        Caption = '+'
        TabOrder = 2
      end
      object CheckBox1: TCheckBox
        Left = 39
        Top = 36
        Width = 97
        Height = 17
        Caption = 'Nodes'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CheckBox3Click
      end
      object CheckBox2: TCheckBox
        Left = 39
        Top = 59
        Width = 97
        Height = 17
        Caption = 'Lines'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CheckBox3Click
      end
      object CheckBox3: TCheckBox
        Left = 39
        Top = 13
        Width = 97
        Height = 17
        Caption = 'Values'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = CheckBox3Click
      end
      object Edit1: TEdit
        Left = 128
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 6
        Text = '0.3'
      end
      object Edit2: TEdit
        Left = 128
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 7
        Text = '0.7'
      end
      object Edit3: TEdit
        Left = 128
        Top = 72
        Width = 121
        Height = 21
        TabOrder = 8
        Text = '0.11'
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 148
    Width = 850
    Height = 381
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PaintBox1: TPaintBox
      Left = 0
      Top = 0
      Width = 850
      Height = 381
      Align = alClient
      Constraints.MinHeight = 21
      Constraints.MinWidth = 11
      OnPaint = PaintBox1Paint
    end
  end
  object MainMenu1: TMainMenu
    Left = 616
    Top = 120
    object File1: TMenuItem
      Caption = 'File'
      object Save1: TMenuItem
        Caption = 'Save'
        OnClick = Save1Click
      end
      object Load1: TMenuItem
        Caption = 'Load'
        OnClick = Load1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 584
    Top = 112
  end
end
