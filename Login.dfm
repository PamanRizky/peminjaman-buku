object FormLogin: TFormLogin
  Left = 192
  Top = 152
  Width = 1044
  Height = 540
  Caption = 'FormLogin'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 24
    Width = 122
    Height = 23
    Caption = 'USERNAME :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 24
    Top = 80
    Width = 125
    Height = 23
    Caption = 'PASSWORD :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edt1: TEdit
    Left = 168
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object Edt2: TEdit
    Left = 168
    Top = 80
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object b1: TButton
    Left = 224
    Top = 136
    Width = 97
    Height = 33
    Caption = 'LOGIN'
    TabOrder = 2
    OnClick = b1Click
  end
  object zqry1: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from users')
    Params = <>
    Left = 352
    Top = 32
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'controls_cp=GET_ACP')
    HostName = 'localhost'
    Port = 3306
    Database = 'db_peminjaman_buku'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\User\Documents\Peminjamanbuku\libmysql.dll'
    Left = 352
    Top = 96
  end
end
