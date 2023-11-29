program peminjaman_buku;

uses
  Forms,
  Login in 'Login.pas' {FormLogin},
  MainMenu in 'MainMenu.pas' {FormMainMenu},
  PendaftaranUser in 'PendaftaranUser.pas' {FormUser},
  Anggota in 'Anggota.pas' {FormAnggota};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormMainMenu, FormMainMenu);
  Application.CreateForm(TFormUser, FormUser);
  Application.CreateForm(TFormAnggota, FormAnggota);
  Application.Run;
end.
