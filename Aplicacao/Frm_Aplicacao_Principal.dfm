object Form_Aplicacao_Principal: TForm_Aplicacao_Principal
  Left = 219
  Top = 123
  Caption = 'APP - Tarefas'
  ClientHeight = 576
  ClientWidth = 998
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 557
    Width = 998
    Height = 19
    Panels = <>
  end
  object PcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 998
    Height = 557
    Cursor = crHandPoint
    ActivePage = TSTarefas
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 1
    object TSTarefas: TTabSheet
      Caption = 'Tarefas'
      ImageIndex = 1
      ExplicitLeft = 8
      ExplicitTop = 25
      object LblEdtID: TLabel
        Left = 12
        Top = 27
        Width = 40
        Height = 13
        Caption = 'Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblEdtTitulo: TLabel
        Left = 12
        Top = 83
        Width = 26
        Height = 13
        Caption = 'Titulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblMmoDescricao: TLabel
        Left = 12
        Top = 139
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblcbxPrioridade: TLabel
        Left = 433
        Top = 83
        Width = 48
        Height = 13
        Caption = 'Prioridade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblEdtDat_Criacao: TLabel
        Left = 156
        Top = 29
        Width = 62
        Height = 13
        Caption = 'Data Cria'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblEdtDat_Conclusao: TLabel
        Left = 460
        Top = 29
        Width = 75
        Height = 13
        Caption = 'Data Conclus'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblEdtStatus: TLabel
        Left = 281
        Top = 27
        Width = 31
        Height = 13
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 490
        Width = 990
        Height = 36
        Align = alBottom
        AutoSize = True
        ButtonHeight = 36
        ButtonWidth = 61
        Caption = 'ToolBar1'
        EdgeOuter = esNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Images = ImageList1
        ParentFont = False
        ShowCaptions = True
        TabOrder = 5
        Transparent = False
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Width = 25
          Caption = 'ToolButton1'
          ImageIndex = 0
          Style = tbsSeparator
        end
        object BtnNovo: TToolButton
          Left = 25
          Top = 0
          Caption = 'Novo'
          ImageIndex = 0
          OnClick = BtnNovoClick
        end
        object ToolButton3: TToolButton
          Left = 86
          Top = 0
          Width = 22
          Caption = 'ToolButton3'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object BtnAdicionar: TToolButton
          Left = 108
          Top = 0
          AutoSize = True
          Caption = 'Adicionar'
          ImageIndex = 1
          OnClick = BtnAdicionarClick
        end
        object ToolButton5: TToolButton
          Left = 173
          Top = 0
          Width = 15
          Caption = 'ToolButton5'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object BtnAtualizar: TToolButton
          Left = 188
          Top = 0
          AutoSize = True
          Caption = 'Atualizar'
          Enabled = False
          ImageIndex = 2
          OnClick = BtnAtualizarClick
        end
        object ToolButton7: TToolButton
          Left = 249
          Top = 0
          Width = 22
          Caption = 'ToolButton7'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object BtnRemover: TToolButton
          Left = 271
          Top = 0
          AutoSize = True
          Caption = 'Remover'
          Enabled = False
          ImageIndex = 6
          OnClick = BtnRemoverClick
        end
        object ToolButton8: TToolButton
          Left = 333
          Top = 0
          Width = 28
          Caption = 'ToolButton8'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object BtnSair: TToolButton
          Left = 361
          Top = 0
          AutoSize = True
          Caption = '&Sair'
          ImageIndex = 5
          OnClick = BtnSairClick
        end
        object ToolButton4: TToolButton
          Left = 395
          Top = 0
          Width = 27
          Caption = 'ToolButton4'
          ImageIndex = 6
          Style = tbsSeparator
        end
      end
      object EdtID: TEdit
        Left = 12
        Top = 41
        Width = 112
        Height = 22
        Hint = 'Campo preenchido automaticamente.Usado somente para editar.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = EdtIDExit
      end
      object EdtTitulo: TEdit
        Left = 12
        Top = 97
        Width = 390
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = EdtTituloKeyPress
      end
      object cbxPrioridade: TComboBox
        Left = 433
        Top = 97
        Width = 153
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 3
        OnKeyPress = cbxPrioridadeKeyPress
        Items.Strings = (
          '1'
          '2'
          '3')
      end
      object EdtDat_Criacao: TMaskEdit
        Left = 156
        Top = 42
        Width = 102
        Height = 21
        TabStop = False
        Color = clMenuBar
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 6
        Text = '  /  /    '
      end
      object EdtDat_Conclusao: TMaskEdit
        Left = 460
        Top = 42
        Width = 102
        Height = 21
        TabStop = False
        Color = clMenuBar
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 7
        Text = '  /  /    '
      end
      object MmoDescricao: TMemo
        Left = 12
        Top = 158
        Width = 975
        Height = 326
        TabOrder = 4
        OnKeyPress = MmoDescricaoKeyPress
      end
      object CbxStatus: TComboBox
        Left = 281
        Top = 42
        Width = 153
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 1
        Text = 'Pendente'
        OnChange = CbxStatusChange
        OnKeyPress = CbxStatusKeyPress
        Items.Strings = (
          'Pendente'
          'Concluido')
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Lista de Tarefas'
      ImageIndex = 2
      object SgsListaTarefas: TStringGrid
        Left = 0
        Top = 0
        Width = 990
        Height = 526
        Hint = 'Com duplo click carrega Tarefas'
        Align = alClient
        ColCount = 6
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        FixedColor = clNavy
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = SgsListaTarefasDblClick
        ExplicitTop = -2
        ColWidths = (
          69
          97
          71
          71
          67
          64)
        RowHeights = (
          21)
      end
    end
    object TbEstatisticas: TTabSheet
      Caption = 'Estat'#237'sticas'
      ImageIndex = 2
      OnShow = TbEstatisticasShow
      object ChtTotal: TChart
        Left = 3
        Top = 8
        Width = 984
        Height = 171
        Title.Text.Strings = (
          'Total de tarefas')
        BottomAxis.Visible = False
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMinimum = False
        View3D = False
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series2: TBarSeries
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
        end
      end
      object ChtMedia: TChart
        Left = 3
        Top = 185
        Width = 984
        Height = 171
        Title.Text.Strings = (
          'M'#233'dia de prioridades das tarefas pendentes')
        BottomAxis.Visible = False
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 3.000000000000000000
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TBarSeries
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
        end
      end
      object ChtTotal7Dias: TChart
        Left = 3
        Top = 361
        Width = 984
        Height = 162
        Title.Text.Strings = (
          'Quantidade de tarefas concluidas nos ultimos 7 dias')
        BottomAxis.Visible = False
        TabOrder = 2
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series3: TBarSeries
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 724
    Top = 291
    Bitmap = {
      494C010107000802DC0410001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000000000008F4F2100BFC7CB00D5E1
      ED0093AFCD004876A6004876A6004876A6004876A6004675A500406E9F003C6B
      9C003C6B9C007F9EBE00FFFFFF00FFFFFF000000000000000000000445000004
      4500000445000004450000044500000445000004450000044500000445000004
      4500000445000004450000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C49B000097572500D5DCE3005886
      B60073A0CE0073A0CE00739FCD00729FCD0075A1CF005380AE0089B0D7009CC0
      E500B3D0EE008DB3DA003C6B9C00FFFFFF000000000000000000001156004174
      B8004B7EC2005E91D6006396DB006396DB006598DD006295DA005D90D5004D80
      C4004477BB0000115600000000000000000000000000000000003B46E200616B
      F9003842E000000000000000000000000000000000000000000000000000616B
      F900616BF9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C79F00009F612700E2E9F00073A0
      CD0074A0CE00729ECC00729FCC00729FCC0073A0CD004C7AA9004E7BAA005783
      B0005581AF003F6E9E00537DA800FFFFFF000000000000000000001861003366
      A7002B5EA2002B5EA2002B5EA200497CCE006396DB002B5EA2002B5EA2002B5E
      A2002D60A400001861000000000000000000000000003A44E1005660F1007E87
      FE00626CF90000000000000000000000000000000000000000003842E0007E87
      FE00737CFE003A44E10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CAA20000AC712B00F8FFFF0074A0
      CD0077A2D00074A0CD00719DCB00729FCC00739FCC00527FAE0087AED6009CC1
      E500A2C6EA00A5C8EB008DB3DA00FFFFFF00000000000000000000226D002857
      9B002B5EA2002B5EA2002B5EA2004274C4005B8ED4002B5EA2002B5EA2002B5E
      A2002E61A50000226D00000000000000000000000000464FE7005961F1006B74
      FE007882FE00616BF9003943E1000000000000000000616BF900828CFE006B74
      FE00626BF800464FE7003741DF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CAA20000A6692900EEF5FC0080A9
      D4007FAAD40078A3D0006E99C7006592C0006B98C600527FAE004C79A800507D
      AB005783B000507CAB003F6E9E00FFFFFF000000000000000000002470002451
      95002B5EA2002B5EA2002B5EA2003F70BE00578ACF002B5EA2002B5EA2002B5E
      A2002E61A500002470000000000000000000000000003741DF004851E800646C
      F9006A73FD007B85FE005D67F700000000003B46E2007B85FE00747DFE00646C
      F9005C64F3003741DF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CAA20000A6692900EEF5FC007CA6
      D000B2CEEC008AB2DA0087AFD800759FCA00638FBD006690BC00A1C5E9009ABF
      E400A2C6EA00A6C8EB008DB3DA00FFFFFF00000000000000000000287500183F
      8400245196002B5EA2002B5EA2003766B4004E81C700245196002B5EA2002B5E
      A2002D60A4000028750000000000000000000000000000000000000000004750
      E7005860F100616AF700646DF9006770FB006770FB00616AF7005D65F4004750
      E7003741DF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CAA20000AC712B00F8FFFF007BA4
      CD00A3C4E5009ABDE00090B6DC0084ACD400719CC8006590BC004A78A7005481
      AF005783B000507CAB003F6E9E00FFFFFF000000000000000000002A78001334
      7900193F840028599D002B5EA2003463AF004A7DC200193F8400224F93002B5E
      A2002E61A500002A780000000000000000000000000000000000000000003640
      DE00424AE300575FF0005A62F2005C64F3005C64F300575FF0004E55E9003640
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7630000AF772200A5B4C700ABBF
      D4004472A200ADCBEA00A0C3E50099BDE10097BCE0006F9BC70085ACD40098BD
      E200A6C9EB00A2C6EA008DB3DA00FFFFFF000000000000000000002E7D00477A
      BF00477ABF00477ABF00477ABF00477ABF00477ABF00477ABF00477ABF00477A
      BF0014266900002E7D0000000000000000000000000000000000000000000000
      000000000000575FF0005A62F2005C64F3005C64F300575FF0003640DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BBCBDD0090B4DA00ACCBEA009CC1E4009DC0E3004372A2006690BC0077A0
      C9008BB1D800769FC8004573A300FFFFFF000000000000000000002F7F003260
      AC003260AC00325FAB00325FAC003463AE00477ABF003260AC003160AB003160
      AB003166B400002F7F0000000000000000000000000000000000000000000000
      00003640DE00575FF0005A62F2005C64F3005C64F300575FF0004E55E9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007B9BBC00789FC700A6C8E800A6C8E800557EA900B9CADC00B9CA
      DC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000338400295C
      A000275A9E00275A9E00275A9E003A6AB8005184CA00275A9E00275A9E00275A
      9E002B5EA2000033840000000000000000000000000000000000000000004750
      E7005860F100616AF700646DF9006770FB006770FB00616AF7005D65F4004750
      E7003741DF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F5F7FA004976A600ABCAEB00ABCAEB004572A100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000003586002554
      980026599D0026599D0026599D004172C200598CD20026599D0026599D002659
      9D002B5EA20000358600000000000000000000000000000000003741DF005A62
      F200616AF7006D76FE00717BFE003B46E2006B74FE006D76FE00666FFA005A62
      F2004851E8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007D9DBD00B4D2F000B3D2F0003C6B9C00CAD7E400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000388B001C45
      8A002355990024579B0024579B005286DC006C9FE5002355990024579B002457
      9B00295CA00000388B00000000000000000000000000464FE7005961F1006B74
      FE007882FE00616BF9003943E1000000000000000000616BF900828CFE006B74
      FE00626BF800464FE7003741DF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E3EAF100A7C6E700B4D2F0004976A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000398C00163C
      7F001D4A8D0023569A0023569A005B90E60075A8ED001D4A8D0023569A002356
      9A00295CA00000398C000000000000000000000000004C54EA006169F600757F
      FE00848DFE003842E0000000000000000000000000003842E000636DFA00757F
      FE006972FC004C54EA003842E000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0097B8D900B0CFEE005C86B200C6D4E200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000003C90000A26
      6A000C286900153D7F001942850067A0F80082B5FA000C2A6B00123576001740
      8300214E9200003C9000000000000000000000000000000000003B46E200616B
      F9003842E000000000000000000000000000000000000000000000000000616B
      F900616BF9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00779DC400ACCBEA006891BA00F3F6F900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000003D91005F92
      D700699CE1007DB0F50084B7FC0084B7FC0082B5FA0082B5FA007CAFF4006A9D
      E2006194D900003D910000000000000000000000000000000000000000003A44
      E200000000000000000000000000000000000000000000000000000000003A44
      E2003B46E2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E6ECF300CAD7E400F9FBFC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000003F9400003F
      9400003F9400003F9400003F9400003F9400003F9400003F9400003F9400003F
      9400003F9400003F940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000058A4710058A4710058A4710058A4710058A4710058A471000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D0DED300A2BCA600688A6900688A6900A2BDA700D0DED3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056A26C0084D5B1005ED09D005ED09D0070C79C0053A06A000000
      000000000000000000000000000000000000000000000000000000000000688F
      6C002C5D2E006BB68B0086DBB10084D8AE0084D8AE0086DBB1006BB68B002C5D
      2E00688E6C000000000000000000000000006767670059595900595959005959
      590059595900595959005959590059595900595959005959590059595900C0C0
      C00059595900C0C0C00059595900676767000000000000000000FDFDFD00CECE
      CE00B5815800B4805500B47F5500B4805500B4805500B3805600B4805600B581
      5800CECECE00FDFDFD0000000000000000000000000000000000000000000000
      00000000000053A069008CD8B60062D19F0062D19F0073C89E00509E67000000
      0000000000000000000000000000000000000000000000000000D1E0D4002C61
      330070B78E007ED1A40069BD850059B2710059B2710069BD85007ED1A40070B7
      8E002C613300D0E0D400000000000000000071717100ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00C8C8
      C800ECECEC00C8C8C800ECECEC007171710000000000717171006E6F6F003333
      3300B1805700F4DEC500F3DDC500F4DDC500F4DEC500F4DEC500F3DDC500B27F
      5700333333006E6F6F0071717100000000000000000000000000000000000000
      0000000000004D9A600097DDBE006CD3A5006CD3A5007ACBA2004A985E000000
      00000000000000000000000000000000000000000000689672002B6738008AD6
      AD0055B16C0059B2720059B2720059B2720059B2720059B2720059B2720055B1
      6C008AD6AD002B6737006996730000000000FFFFFF00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00D6D6
      D600ECECEC00D6D6D600ECECEC00FFFFFF000000000087888800838484002323
      2300B4845B00FBF2E700FBF1E700FBF1E800FBF1E800FBF1E700FBF1E700B483
      5B00232323008384840087888800000000000000000000000000000000000000
      00000000000049975C0099DEC00072D5A80072D5A8007FCBA50046955A000000
      000000000000000000000000000000000000000000002A6A39007BBD97005AB1
      70005BB471005DB574005DB574004FAE67005DB573005DB574005DB574005BB4
      71005AB170007BBD97002A69380000000000FFFFFF0088888800888888008888
      8800888888008888880088888800888888008888880088888800888888008888
      8800888888008888880088888800FFFFFF00000000008D8D8E0089898A002727
      2700B6875F00FBF1E700FBF1E700FBF1E800FBF1E800FBF1E800FBF1E700B686
      5E002727270089898A008D8D8E000000000058A4710056A26C0053A069004D9A
      600049975C003E8E500098DEBF007ED8B0007ED8B0008ACFAB003E8E50004695
      5A004A985E00509E670053A06A0058A47100D2E4D80084C4A00097D8B30061B6
      790061B6790051AF69008BCB9B0000000000D1EBD9005FB5770061B6790061B6
      790061B6790097D8B30084C4A000D3E4D900FFFFFF0080808000838586009393
      95009A9A9D00ACACAC00B6B6B800C0C0C000C4C4C300C0C0C300BBBBBE00AAAA
      AC00A1A2A4008D8D900085868600FFFFFF0000000000A4A4A500A3A3A4008484
      85007A7A7B007979790079797900797979007979790079797900797979007A7A
      7B0084848500A3A3A400A4A4A5000000000058A4710074CAA00072C89D0078CB
      A1007ECBA40088CFAA008ED0AD0085DAB40085DAB40077C9A00072C89D0078CB
      A1007ECBA40088CFAA008ED0AD0058A47100A6C9B100B0E6CB007DC6960066B9
      7C0065B87B00A0D6AF0000000000000000000000000049AC640063B7790066B9
      7C0066B97C007DC69600B0E6CB00A7CAB300FFFFFF00DEE0E500E1E0DF00E6E6
      E500ECEBE800F4F2F100F5F5F300FBF9F500FDFAF400FAF8F100F7F4EE00EEED
      E700EBE8E400E2DFDB00E0E2E700FFFFFF0000000000B8B8B800B8B8B800B4B4
      B400B3B3B300B3B3B300B3B3B300B3B3B300B3B3B3000F8F1E00B3B3B3000F8F
      1E00B4B4B400B8B8B800B8B8B8000000000058A4710093DDBC0093DDBC0093DD
      BC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DD
      BC0093DDBC0093DDBC0093DDBC0058A4710067A37E00B3E5CD006DBB820068B9
      7D007CC490000000000000000000FCFDFC000000000000000000F2F9F40067B8
      7D006CBB81006DBB8200B3E5CD0067A37E00FFFFFF00DCDFE400EBCE9000E1C5
      9F00DFC29600D9B88B00D6B38600CFA97A00CBA47300C59A6700C3966100BE8D
      5700BB8A5400BB692600DFE1E600FFFFFF0000000000DADADA00DADADA003F3F
      3F003F3F3F003F3F3F003E3F3F003F3F3E003F3F3F003F3F3F003F3F3F003F3F
      3F003E3F3F00C4C4C400C4C4C5000000000058A4710099DFC00099DFC00099DF
      C00099DFC00099DFC00099DFC00099DFC00099DFC00099DFC00099DFC00099DF
      C00099DFC00099DFC00099DFC00058A4710066A77F00B9E6D00071BD86006FBB
      840065B77C00000000000000000051AF6A0000000000000000000000000068B8
      7D0069B87F0071BD8600B9E6D00066A77F00FFFFFF00DEE0E500EED39A00E5CA
      A100E1C49A00DCBB8D00D9B58700D3AC7B00CFA67500C99C6800C6976200C08F
      5700BE8B5300BD6E2700DFE1E600FFFFFF0000000000DEDEDE00DEDEDE004949
      49006262620090909000B0B0B000E3E4E300EBEBEB00C7C8C700A8A8A8007C7C
      7C00494949008B8C8B008B8B8B000000000058A4710094DDBD0098DEBF0099DE
      C00097DDBE008CD8B60084D5B100A7E3C800A7E3C8007AD0A6009ADFC00099DE
      C00097DDBE008CD8B60084D5B10058A47100A6D0B800C4EADB008ECEA20074C0
      890074C0890070BD85006DBC820074C089006CBB810000000000000000000000
      00008BCB9C008ECEA200C4EADB00A8D2BA00FFFFFF00E1E4E700F2DBAF00EAD3
      B000E7CAA400E1C39600DFBE9100D9B58600D5B08000CFA67300CBA16C00C596
      6000C2915C00C3742D00DFE1E500FFFFFF000000000070707000707070005E5E
      5E005E5D5E005E5E5E005E5E5E005E5E5E005E5D5D005E5E5D005E5D5E005E5E
      5E005E5E5E0070707000707070000000000058A4710053A06A00509E67004A98
      5E0046955A003E8E50008CD8B600ADE5CC00ADE5CC0080D1A9003E8E50004997
      5C004D9A600053A0690056A26C0058A47100D3E9DC0099CFB400B2E0C70079C1
      8A0079C18A0079C18A0079C18A0079C18A0079C18A008FCD9F00000000006CBD
      800072BD8500B2E0C70099CFB400D4E9DE00FFFFFF00E1E4E700F3DFB600EDD9
      BA00E8CFAA00E2C59B00E0C29600DBB98A00D8B48500D1AA7700CEA57100C89B
      6500C5956000C4792F00DFE1E600FFFFFF000000000000000000000000007777
      7700CDA88200F5EEE600F6EDE700F6EEE700F6EDE700F5EEE600F6EDE700CDA7
      8200777777000000000000000000000000000000000000000000000000000000
      00000000000049975C0097DDBE00B9E8D300B9E8D3008CD2AE0046955A000000
      00000000000000000000000000000000000000000000209154009ED2B8007AC2
      8B007BC18D007DC290007DC290007DC290007DC290007DC290007AC18D007BC1
      8D007AC28B009ED2B8001F91540000000000FFFFFF00DFE1E600F3DCB000F2E5
      D100EEDEC200E7CDA600E5C89F00DFC09500DCBB8F00D6B38300D3AE7C00CDA4
      6F00CA9F6800C9833800DFE1E600FFFFFF000000000000000000000000007C7B
      7C00D1AD8900F4ECE400F4ECE500F4ECE500F4ECE400F4ECE400F4ECE400D1AD
      89007C7B7C000000000000000000000000000000000000000000000000000000
      0000000000004D9A600099DEC000BEE9D600BEE9D60091D3B1004A985E000000
      0000000000000000000000000000000000000000000065B78C0020955800C4E6
      D8007DC38C0080C4910080C4910080C4910080C4910080C4910080C491007DC3
      8C00C4E6D8002095580064B68C0000000000FFFFFF00DEE0E500F1D9A700F3E7
      D500F2E5D100EBD4B400E7CFA700E2C59B00E0BF9500D9B68800D5B18200CFA7
      7500CDA26F00CB8A3D00DFE1E500FFFFFF000000000000000000000000007C7C
      7C00D3B08C00F3EBE300F3EBE300F4EBE400F3ECE400F3EBE400F3EBE300D3B1
      8C007C7C7C000000000000000000000000000000000000000000000000000000
      00000000000053A0690098DEBF00C7EBDB00C7EBDB009BD4B500509E67000000
      0000000000000000000000000000000000000000000000000000D3ECDF001F9D
      5E00A9D9C400C9E6DB00A4D5B40089C99A0089C99A00A4D5B400C9E6DB00A9D9
      C4001F9D5E00D3ECDF000000000000000000FFFFFF00DCDFE400EDD19800ECD8
      BA00F1E1C900F3E6D300F2E2CE00ECD6B900E8D1B000E0C29B00DCBD9000D4B1
      8200D1AB7C00D1934700DFE1E600FFFFFF000000000000000000000000008686
      8600D5B59100F0E3D500F0E3D500EFE3D500EFE3D500EFE3D500F0E3D600D6B6
      9100868686000000000000000000000000000000000000000000000000000000
      00000000000056A26C0094DDBD00CAECDD00CAECDD009ED5B70053A06A000000
      00000000000000000000000000000000000000000000000000000000000062BE
      93001B9F5F00ACDCC800E7F2F400E3F0F000E3F0F000E7F2F400ACDCC8001B9F
      5F0063BE9300000000000000000000000000FFFFFF00DCDFE400EECF9200EED3
      9B00F0D8A400F3DFB800F3E0B900F1D9AC00EDD19D00E6C38000E2BB7500DBAC
      6200DAA65B00D3964600DFE1E600FFFFFF00000000000000000000000000F6F6
      F600D9BA9600EEDFCD00EEDFCD00EEDFCD00EEDECE00EEDFCD00EEDFCE00D9BB
      9600F6F6F6000000000000000000000000000000000000000000000000000000
      00000000000058A4710058A4710058A4710058A4710058A4710058A471000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5EEE300AADDC60062C3970062C39700ABDDC600D6EFE3000000
      000000000000000000000000000000000000FFFFFF0082828200858788009593
      95009C9C9E00AEAEAD00B8B8BA00C1C1C100C5C5C400C1C1C400BDBDC000ACAC
      AD00A3A3A4008F8F920087888800FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF008000C003FFFF00000000C003C7E70000
      0000C00387C300000000C003818100000000C003810300000000C003E0070000
      0000C003E00F00000000C003F81F00000000C003F01F00000000C003E0070000
      0000C003C00700000000C003818100000000C003838100000000C003C7E70000
      0000C003EFE700000000C003FFFF0000F81FF81FFFFFFFFFF81FE0070000C003
      F81FC00300008001F81F800100008001F81F8001000080010000010000008001
      0000038000008001000006C000008001000006E0000080010000007000008001
      000000200000E007F81F80010000E007F81F80010000E007F81FC0030000E007
      F81FE0070000E007F81FF81F0000FFFF00000000000000000000000000000000
      000000000000}
  end
end
