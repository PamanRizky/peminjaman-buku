program peminjaman_buku;

uses
  Forms,
  Login in 'Login.pas' {FormLogin},
  MainMenu in 'MainMenu.pas' {FormMainMenu},
  PendaftaranUser in 'PendaftaranUser.pas' {FormUser},
  Anggota in 'Anggota.pas' {FormAnggota},
  Petugas in 'Petugas.pas' {FormPetugas},
  Denda in 'Denda.pas' {FormDenda},
  Pengembalian in 'Pengembalian.pas' {FormPengembalian},
  Buku in 'Buku.pas' {FormBuku},
  Peminjaman in 'Peminjaman.pas' {FormPeminjaman},
  DetailIsi in 'DetailIsi.pas' {FormDetailIsi};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormMainMenu, FormMainMenu);
  Application.CreateForm(TFormUser, FormUser);
  Application.CreateForm(TFormAnggota, FormAnggota);
  Application.CreateForm(TFormPetugas, FormPetugas);
  Application.CreateForm(TFormDenda, FormDenda);
  Application.CreateForm(TFormPengembalian, FormPengembalian);
  Application.CreateForm(TFormBuku, FormBuku);
  Application.CreateForm(TFormPeminjaman, FormPeminjaman);
  Application.CreateForm(TFormDetailIsi, FormDetailIsi);
  Application.Run;
end.
