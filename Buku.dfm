object FormBuku: TFormBuku
  Left = 180
  Top = 164
  Width = 1044
  Height = 611
  Caption = 'FormBuku'
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
    Width = 80
    Height = 18
    Caption = 'Kode Buku :'
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
    Width = 79
    Height = 18
    Caption = 'Judul Buku :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 360
    Top = 24
    Width = 137
    Height = 18
    Caption = 'Sumber Pengadaan :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 360
    Top = 64
    Width = 113
    Height = 18
    Caption = 'Tanggal Terima :'
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
    Width = 79
    Height = 18
    Caption = 'Pengarang :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 24
    Top = 144
    Width = 176
    Height = 18
    Caption = 'Penerbit, Tempat, Tahun :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 360
    Top = 104
    Width = 81
    Height = 18
    Caption = 'Kondisi Buku'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edtkodebuku: TEdit
    Left = 216
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object bbaru: TButton
    Left = 24
    Top = 200
    Width = 89
    Height = 33
    Caption = 'BARU'
    TabOrder = 1
    OnClick = bbaruClick
  end
  object bsimpan: TButton
    Left = 128
    Top = 200
    Width = 89
    Height = 33
    Caption = 'SIMPAN'
    TabOrder = 2
    OnClick = bsimpanClick
  end
  object bedit: TButton
    Left = 232
    Top = 200
    Width = 89
    Height = 33
    Caption = 'EDIT'
    TabOrder = 3
    OnClick = beditClick
  end
  object bhapus: TButton
    Left = 336
    Top = 200
    Width = 89
    Height = 33
    Caption = 'HAPUS'
    TabOrder = 4
    OnClick = bhapusClick
  end
  object dbgrd1: TDBGrid
    Left = 24
    Top = 256
    Width = 737
    Height = 241
    DataSource = dsbuku
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
        FieldName = 'kode_buku'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'judul_buku'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pengarang'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'penerbit_tempat_tahun'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sumber_pengadaan'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tgl_terima'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kondisi_buku'
        Width = 100
        Visible = True
      end>
  end
  object bbatal: TButton
    Left = 440
    Top = 200
    Width = 89
    Height = 33
    Caption = 'BATAL'
    TabOrder = 6
    OnClick = bbatalClick
  end
  object bprint: TButton
    Left = 544
    Top = 200
    Width = 89
    Height = 33
    Caption = 'PRINT'
    TabOrder = 7
    OnClick = bprintClick
  end
  object Edtsumberpengadaan: TEdit
    Left = 504
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 8
  end
  object Edtjuduli: TEdit
    Left = 216
    Top = 64
    Width = 129
    Height = 21
    TabOrder = 9
  end
  object Edtpengarang: TEdit
    Left = 216
    Top = 104
    Width = 129
    Height = 21
    TabOrder = 10
  end
  object dtp1: TDateTimePicker
    Left = 504
    Top = 64
    Width = 129
    Height = 21
    Date = 45259.708314722220000000
    Time = 45259.708314722220000000
    TabOrder = 11
  end
  object Edtptt: TEdit
    Left = 216
    Top = 144
    Width = 129
    Height = 21
    TabOrder = 12
  end
  object Edtkondisibuku: TEdit
    Left = 504
    Top = 104
    Width = 129
    Height = 21
    TabOrder = 13
  end
  object btn1: TBitBtn
    Left = 648
    Top = 200
    Width = 75
    Height = 33
    Caption = '&Close'
    TabOrder = 14
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
    Top = 512
  end
  object zqry1: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select*from buku')
    Params = <>
    Left = 96
    Top = 512
  end
  object frxDBDatasetDenda: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = zqry1
    BCDToCurrency = False
    Left = 264
    Top = 512
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
    ReportOptions.LastChange = 45260.513838263900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 192
    Top = 512
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
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 362.834880000000000000
          Top = 7.559060000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'LAPORAN DATA BUKU')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 41.574830000000000000
        Top = 86.929190000000000000
        Width = 1046.929810000000000000
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
            'KODE BUKU')
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
            'JUDUL BUKU')
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
            'PENGARANG')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 449.764070000000000000
          Top = 15.118120000000000000
          Width = 191.820502770000000000
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
            'PENERBIT, TEMPAT, TAHUN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 642.520100000000000000
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
            'SUMBER')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 759.685530000000000000
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
            'TANGGAL TERIMA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 894.813082770000000000
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
            'KONDISI BUKU')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 188.976500000000000000
        Width = 1046.929810000000000000
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
          DataField = 'kode_buku'
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
            '[frxDBDataset1."kode_buku"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 187.068024460000000000
          Width = 127.568492770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'judul_buku'
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
            '[frxDBDataset1."judul_buku"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 314.636517230000000000
          Width = 135.127552770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'pengarang'
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
            '[frxDBDataset1."pengarang"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 449.764070000000000000
          Width = 195.600032770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'penerbit_tempat_tahun'
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
            '[frxDBDataset1."penerbit_tempat_tahun"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 642.520100000000000000
          Width = 116.229902770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'sumber_pengadaan'
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
            '[frxDBDataset1."sumber_pengadaan"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 759.685530000000000000
          Width = 135.127552770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'tgl_terima'
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
            '[frxDBDataset1."tgl_terima"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 894.813082770000000000
          Width = 146.466142770000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'kondisi_buku'
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
            '[frxDBDataset1."kondisi_buku"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 41.574830000000000000
        Top = 238.110390000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  object dsbuku: TDataSource
    DataSet = zqry1
    Left = 144
    Top = 512
  end
end
