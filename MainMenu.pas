unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFormMainMenu = class(TForm)
    mm1: TMainMenu;
    PendaftaranUser2: TMenuItem;
    FormAnggota1: TMenuItem;
    FormPetugas1: TMenuItem;
    FormDenda1: TMenuItem;
    FormPengembalian1: TMenuItem;
    FormBuku1: TMenuItem;
    FormPeminjaman1: TMenuItem;
    FormDetailIsi1: TMenuItem;
    Keluar1: TMenuItem;
    procedure PendaftaranUser2Click(Sender: TObject);
    procedure FormAnggota1Click(Sender: TObject);
    procedure FormPetugas1Click(Sender: TObject);
    procedure FormDenda1Click(Sender: TObject);
    procedure FormPengembalian1Click(Sender: TObject);
    procedure FormBuku1Click(Sender: TObject);
    procedure FormPeminjaman1Click(Sender: TObject);
    procedure FormDetailIsi1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainMenu: TFormMainMenu;

implementation

uses PendaftaranUser, Anggota, Petugas, Denda, Pengembalian, Buku, Peminjaman, DetailIsi;

{$R *.dfm}

procedure TFormMainMenu.PendaftaranUser2Click(Sender: TObject);
begin
    FormUser.ShowModal;
end;

procedure TFormMainMenu.FormAnggota1Click(Sender: TObject);
begin
    FormAnggota.ShowModal;
end;

procedure TFormMainMenu.FormPetugas1Click(Sender: TObject);
begin
    FormPetugas.ShowModal;
end;

procedure TFormMainMenu.FormDenda1Click(Sender: TObject);
begin
    FormDenda.ShowModal;
end;

procedure TFormMainMenu.FormPengembalian1Click(Sender: TObject);
begin
    FormPengembalian.ShowModal;
end;

procedure TFormMainMenu.FormBuku1Click(Sender: TObject);
begin
   FormBuku.ShowModal
end;

procedure TFormMainMenu.FormPeminjaman1Click(Sender: TObject);
begin
   FormPeminjaman.ShowModal;
end;

procedure TFormMainMenu.FormDetailIsi1Click(Sender: TObject);
begin
   FormDetailIsi.ShowModal;
end;

procedure TFormMainMenu.Keluar1Click(Sender: TObject);
begin
close;
end;

end.
