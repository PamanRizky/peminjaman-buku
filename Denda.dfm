object FormDenda: TFormDenda
  Left = 192
  Top = 149
  Width = 1044
  Height = 543
  Caption = 'FormDenda'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 24
    Width = 75
    Height = 18
    Caption = 'No Denda :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 24
    Top = 64
    Width = 109
    Height = 18
    Caption = 'Tanggal Denda :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 328
    Top = 24
    Width = 102
    Height = 18
    Caption = 'Jumlah Denda :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 328
    Top = 64
    Width = 83
    Height = 18
    Caption = 'No Kembali :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 24
    Top = 104
    Width = 88
    Height = 18
    Caption = 'Jenis Denda :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edtnodenda: TEdit
    Left = 184
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object bbaru: TButton
    Left = 24
    Top = 144
    Width = 89
    Height = 33
    Caption = 'BARU'
    TabOrder = 1
    OnClick = bbaruClick
  end
  object bsimpan: TButton
    Left = 128
    Top = 144
    Width = 89
    Height = 33
    Caption = 'SIMPAN'
    TabOrder = 2
    OnClick = bsimpanClick
  end
  object bedit: TButton
    Left = 232
    Top = 144
    Width = 89
    Height = 33
    Caption = 'EDIT'
    TabOrder = 3
    OnClick = beditClick
  end
  object bhapus: TButton
    Left = 336
    Top = 144
    Width = 89
    Height = 33
    Caption = 'HAPUS'
    TabOrder = 4
    OnClick = bhapusClick
  end
  object dbgrd1: TDBGrid
    Left = 24
    Top = 200
    Width = 505
    Height = 241
    DataSource = dsdenda
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'no_denda'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tgl_denda'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jenis_denda'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jumlah_denda'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_kembali'
        Width = 60
        Visible = True
      end>
  end
  object bbatal: TButton
    Left = 440
    Top = 144
    Width = 89
    Height = 33
    Caption = 'BATAL'
    TabOrder = 6
    OnClick = bbatalClick
  end
  object bprint: TButton
    Left = 544
    Top = 144
    Width = 89
    Height = 33
    Caption = 'PRINT'
    TabOrder = 7
    OnClick = bprintClick
  end
  object Edtjumlahdenda: TEdit
    Left = 440
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 8
  end
  object Edtnokembali: TEdit
    Left = 440
    Top = 64
    Width = 129
    Height = 21
    TabOrder = 9
  end
  object Edtjenisdenda: TEdit
    Left = 184
    Top = 104
    Width = 129
    Height = 21
    TabOrder = 10
  end
  object dtp1: TDateTimePicker
    Left = 184
    Top = 64
    Width = 129
    Height = 21
    Date = 45259.708314722220000000
    Time = 45259.708314722220000000
    TabOrder = 11
  end
  object btn1: TBitBtn
    Left = 648
    Top = 144
    Width = 75
    Height = 33
    Caption = '&Close'
    TabOrder = 12
    OnClick = btn1Click
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = True
    Properties.Strings = (
      'controls_cp=GET_ACP'
      'AutoEncodeStrings=True')
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_peminjaman_buku'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\User\Documents\Peminjamanbuku\libmysql.dll'
    Left = 40
    Top = 456
  end
  object zqry1: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select*from denda')
    Params = <>
    Left = 96
    Top = 456
  end
  object frxDBDatasetDenda: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = zqry1
    BCDToCurrency = False
    Left = 264
    Top = 456
  end
  object frxReport1: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45259.647033055600000000
    ReportOptions.LastChange = 45261.241368877320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 192
    Top = 456
    Datasets = <
      item
        DataSet = frxDBDatasetDenda
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 234.330860000000000000
          Top = 11.338590000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'LAPORAN DATA DENDA')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 41.574830000000000000
        Top = 86.929190000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 15.118120000000000000
          Width = 42.398093960000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 46.177623960000000000
          Top = 15.118120000000000000
          Width = 140.890400500000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NO DENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 187.068024460000000000
          Top = 15.118120000000000000
          Width = 127.568492770000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'TANGGAL DENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 314.636517230000000000
          Top = 15.118120000000000000
          Width = 135.127552770000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'JENIS DENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 449.764070000000000000
          Top = 15.118120000000000000
          Width = 146.466142770000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'JUMLAH DENDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 597.165740000000000000
          Top = 15.118120000000000000
          Width = 116.229902770000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NO KEMBALI')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetDenda
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Width = 42.398093960000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 46.177623960000000000
          Width = 140.890400500000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'no_denda'
          DataSet = frxDBDatasetDenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."no_denda"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 187.068024460000000000
          Width = 127.568492770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'tgl_denda'
          DataSet = frxDBDatasetDenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."tgl_denda"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 314.636517230000000000
          Width = 135.127552770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'jenis_denda'
          DataSet = frxDBDatasetDenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."jenis_denda"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 449.764070000000000000
          Width = 146.466142770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'jumlah_denda'
          DataSet = frxDBDatasetDenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."jumlah_denda"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 597.165740000000000000
          Width = 116.229902770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'no_kembali'
          DataSet = frxDBDatasetDenda
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."no_kembali"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 41.574830000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object dsdenda: TDataSource
    DataSet = zqry1
    Left = 144
    Top = 456
  end
end
