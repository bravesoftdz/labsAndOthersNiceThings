object Form1: TForm1
  Left = 942
  Top = 105
  Width = 347
  Height = 240
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = OnCreate
  OnDestroy = OnDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pm1: TPopupMenu
    Left = 24
    Top = 72
    object N4: TMenuItem
      Caption = #1057#1090#1072#1085#1076#1072#1088#1090#1085#1110' '#1087#1088#1086#1075#1088#1072#1084#1080
      Hint = 'Microsoft Office'#13#10'WMP'#13#10
      object WMP1: TMenuItem
        Caption = 'WMP'
        OnClick = WMP1Click
      end
      object MO1: TMenuItem
        Caption = 'Microsoft Office'
        OnClick = MO1Click
      end
      object Explorer1: TMenuItem
        Caption = 'Explorer'
        OnClick = Explorer1Click
      end
      object Paint1: TMenuItem
        Caption = 'Paint'
        OnClick = Paint1Click
      end
      object CommandPrompt1: TMenuItem
        Caption = 'Command Prompt'
        OnClick = CommandPrompt1Click
      end
      object N6: TMenuItem
        Caption = #1041#1083#1086#1082#1085#1086#1090
        OnClick = N6Click
      end
    end
    object N2: TMenuItem
      Caption = #1030#1075#1088#1080
      object N7: TMenuItem
        Caption = #1063#1077#1088#1074#1080
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1055#1072#1089'"'#1103#1085#1089' '#1087#1072#1091#1082
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1057#1072#1087#1077#1088
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1050#1086#1089#1080#1085#1082#1072
        OnClick = N10Click
      end
    end
    object N11: TMenuItem
      Caption = '"'#1055#1091#1089#1082'"'
      object N12: TMenuItem
        Caption = #1057#1093#1086#1074#1072#1090#1080
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1080
        OnClick = N13Click
      end
      object N14: TMenuItem
        Caption = #1041#1083#1086#1082#1091#1074#1072#1090#1080
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1056#1086#1079#1073#1083#1086#1082#1091#1074#1072#1090#1080
        OnClick = N15Click
      end
    end
    object N3: TMenuItem
      Caption = #1047#1077#1084#1083#1077#1090#1088#1091#1089
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #1055#1077#1088#1077#1079#1072#1075#1088#1091#1079#1080#1090#1080' '#1082#1086#1084#1087
      OnClick = N5Click
    end
    object N1: TMenuItem
      Caption = #1042#1080#1093#1110#1076
      ImageIndex = 0
      OnClick = N1Click
    end
  end
  object timer1: TTimer
    Left = 24
    Top = 152
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 120
    Top = 144
  end
  object ImageList1: TImageList
    Left = 96
    Top = 40
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000100000001000000010000000100
      0000000000000100000001010000000000000100000001000000010101000100
      0000010000000101000001000100010100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000009070500060504000D0907001311
      11000807050007050300050302000A0806000907050009060400090604000E0B
      0700191A1E00060403000C090600080504000000000000000000000000000000
      00000000000000000000010000001C1C1D00171B1A0007000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B080400110D0A0013100C003B4B
      6900363F480014100B00110C09000E0B0700130E0A00100C090014100D00B8C4
      DC0017130E000E0A06000C080400120D09000000000000000000000000000608
      0800222A2D0093BBC80092ACB700707B8B0061697B00687E94008EC5CB00201B
      1B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000019130E0015100B000E0A05001F21
      26008B95A10090A1B40017110B0015100B00231B150043434500ECF2F7004657
      7900150F0800110D0700110C06000E09050000000000000000000A0A0A002423
      24008AC1D300545970006A748A00697389006A718E0066708200698FA7003537
      39002E2E2F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002019140017110A0018130B002821
      1800262C3B00BAC7D300B3C5D8002B292900A0A5AD00D8DCDE005D6477004047
      5700140E0700120C0700120B0700110A0700000000000A0A0A00252526002C2C
      2E00000000008EC2FF006D80A9006980AC005D6EA30082A8EB000C0500003233
      36002F2F31001616160000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E1810001E180F001F1810002C22
      19002F374E00272423009BAAB9009FADBE00CBCFD300ADB1BB005B687F003327
      1F00231A0F00160E09001810090019100A00000000003F3F3F00191918003233
      350047494F001E2013005D85FD006080E000647FE1004F7CA2003A3C44003B3D
      410037393B003636380000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000292116002B2117002B211700221A
      1000201F220031323400454850007F8C9C00C9CDD100687080006A7994002215
      0E0012090600130B08001C110A001A0E09002222220046464500272829003132
      360036383F00353B4200A0B7C200344348008CC1C700262233003D424C002325
      29003B3D4000383738000F0F0F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002A2014002A20150031251A00271D
      110094A0B400989CA5005D5E6200848A97006A788800A7AEB900AFB9C8003735
      3C00403021001E120A001D100900281A0F006464640046474700100E0C002824
      2100353637002C293C00383A520076D6FF00568BC90056586E003A373C00302F
      3800272529001A1011002E2E2E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000413023004B382B0045434200B5C1
      D6009AA2B1006D74810024262B000505070023252F007B808800E3E6EB007B87
      9700495B770044301B00291B0E003423130081818100728F9000769DB500688B
      BF005B85F2008CE4FF00303B430079CDFF008AEBFF005276960079B4FF007491
      D7008CABC800ABEFFF000B020000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000047352300848C9C00969DAD003A3D
      46001013190022242B001F222700030404005F67790007090E00000000000405
      0A006A6D7100BCCADE00352D23003F2D18005457570046585900676F7E005F64
      8400576493005568D4002A425B003A6C750033314B005886FF005E72B2006875
      990085939F007B9EAB003A373200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E4A0029282F0037353B003735
      3C0034303900322E32000002100005050700333A4900464C5C00211F28002624
      2C002C2A30001D1B2500261F2A00382A1A001010100023201B0065737F00747C
      8D005C668800455292006BA8FF003B3F490069868B004A5CC7005B689700535B
      79006F75820080AEB5001B1B1B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000503A2700513A2700593F2E006143
      30007252380076563E00040F2D0002020300303A4D00563E2E00593E29003B26
      150038241300412D15004731180051371F0000000000615F5F009CD1E1005A5D
      69005F6B7B006F81A200314B6500505B69006D6B7B0079A7ED00515B73004E52
      6A00717E8A005358580000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A412C005C412E0071503A007251
      3800B0826000896244004136370008090D002E41620064452B004B331C005037
      1F00452E17003821110075503400472D160000000000202020000500000090B0
      BC005B5D6A0092B7D0001E141300575A6200656B7500465769005A5F6F006264
      70005E828B003837380000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B5840007F5B41008E6446007B57
      3E00996C4D00B98763009E76530001081C0044455500734F340051371F00482E
      18004B321A0038201000734D2F004A301600000000000000000040404000140E
      10009AC9D300547E890044474A005F6165003E3F4200423A3D009DDCEE007B9D
      A400525152000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B6444008F67470089614300B17E
      59008B614300D7A27B00C48C640004123D00986D4E00614228006A492B005236
      1C00593C1E00472C15007A523500724C2E000000000000000000000000003D3D
      3D00A49D9D00363536004747460050505000464646004B4B4B002A2821005155
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E644900A8775400956A4A00EEB3
      8C0095674500DCA07700D6997100534142008A603D00AE7651006B472A006043
      200050311B005F3F21006B472600644522000000000000000000000000000000
      0000000000001F1F1F007B7B7B00767676008F8F8F0039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF000000FFFF000000000000F01F00000000
      0000E007000000000000C0030000000000008003000000000000800100000000
      0000000100000000000000010000000000000001000000000000000100000000
      0000000100000000000080010000000000008003000000000000C00700000000
      0000E00F000000000000F83F00000000}
  end
end
