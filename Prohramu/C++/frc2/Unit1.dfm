object Form1: TForm1
  Left = 132
  Top = 167
  Width = 1090
  Height = 758
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 184
    Top = 0
    Width = 25
    Height = 729
    Cursor = crHSplit
    Align = alCustom
    Color = clAqua
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 193
    Height = 729
    Color = clAqua
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 48
      Top = 616
      Width = 105
      Height = 33
      Caption = 'Build'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object CSpinEdit1: TCSpinEdit
      Left = 24
      Top = 152
      Width = 145
      Height = 22
      Color = clAqua
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Value = 1
    end
    object ComboBox1: TComboBox
      Left = 24
      Top = 24
      Width = 145
      Height = 21
      Color = clAqua
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      OnChange = ComboBox1Change
      Items.Strings = (
        'Trykutnyk Serpins'#39'koho'
        'Derevo'
        'Dracon Hartera - Hejtujeya'
        'Snizjynka Koha')
    end
    object LabeledEdit1: TLabeledEdit
      Left = 32
      Top = 216
      Width = 49
      Height = 21
      Color = clAqua
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = 'LeftAngle'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clBlue
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 3
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object LabeledEdit2: TLabeledEdit
      Left = 104
      Top = 216
      Width = 49
      Height = 21
      Color = clAqua
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = 'RightAngle'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clBlue
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 3
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object LabeledEdit3: TLabeledEdit
      Left = 56
      Top = 264
      Width = 97
      Height = 21
      Color = clAqua
      EditLabel.Width = 99
      EditLabel.Height = 13
      EditLabel.Caption = 'Dodatne tcile chyslo '
      EditLabel.Color = clAqua
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clBlue
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentColor = False
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 3
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object LabeledEdit4: TLabeledEdit
      Left = 32
      Top = 320
      Width = 121
      Height = 21
      Color = clAqua
      EditLabel.Width = 34
      EditLabel.Height = 13
      EditLabel.Caption = 'Height '
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clBlue
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      EditLabel.Layout = tlCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 3
      ParentFont = False
      TabOrder = 5
      Visible = False
    end
    object LabeledEdit5: TLabeledEdit
      Left = 32
      Top = 368
      Width = 121
      Height = 21
      Color = clAqua
      EditLabel.Width = 126
      EditLabel.Height = 13
      EditLabel.Caption = 'Vvedit'#39' dovil'#39'ne tcile chyslo'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clBlue
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 3
      ParentFont = False
      TabOrder = 6
      Visible = False
    end
    object LabeledEdit6: TLabeledEdit
      Left = 32
      Top = 416
      Width = 121
      Height = 21
      Color = clAqua
      EditLabel.Width = 115
      EditLabel.Height = 13
      EditLabel.Caption = 'Pocaznyk zmenshennya'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clBlue
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 3
      ParentFont = False
      TabOrder = 7
      Visible = False
    end
    object LabeledEdit7: TLabeledEdit
      Left = 32
      Top = 456
      Width = 121
      Height = 21
      Color = clAqua
      EditLabel.Width = 83
      EditLabel.Height = 13
      EditLabel.Caption = 'Dil'#39'nyk dlya kuta  '
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clBlue
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 3
      ParentFont = False
      TabOrder = 8
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 208
    Top = 0
    Width = 873
    Height = 729
    Color = clAqua
    TabOrder = 1
    object Image1: TImage
      Left = -8
      Top = 0
      Width = 873
      Height = 729
    end
  end
end
