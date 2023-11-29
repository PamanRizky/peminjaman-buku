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
    procedure PendaftaranUser2Click(Sender: TObject);
    procedure FormAnggota1Click(Sender: TObject);
    procedure FormPetugas1Click(Sender: TObject);
    procedure FormDenda1Click(Sender: TObject);
    procedure FormPengembalian1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainMenu: TFormMainMenu;

implementation

uses PendaftaranUser, Anggota, Petugas, Denda, Pengembalian;

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

end.
