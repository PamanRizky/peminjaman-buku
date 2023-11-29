object FormMainMenu: TFormMainMenu
  Left = 192
  Top = 151
  Width = 1044
  Height = 541
  Caption = 'Main Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 24
    Top = 8
    object PendaftaranUser1: TMenuItem
      Caption = 'Menu'
      object PendaftaranUser2: TMenuItem
        Caption = 'Pendaftaran User'
        OnClick = PendaftaranUser2Click
      end
      object FormAnggota1: TMenuItem
        Caption = 'Form Anggota'
        OnClick = FormAnggota1Click
      end
      object FormPetugas1: TMenuItem
        Caption = 'Form Petugas'
        OnClick = FormPetugas1Click
      end
      object FormDenda1: TMenuItem
        Caption = 'Form Denda'
        OnClick = FormDenda1Click
      end
      object FormPengembalian1: TMenuItem
        Caption = 'Form Pengembalian'
        OnClick = FormPengembalian1Click
      end
    end
  end
end
