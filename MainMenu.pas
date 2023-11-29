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
    procedure PendaftaranUser2Click(Sender: TObject);
    procedure FormAnggota1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainMenu: TFormMainMenu;

implementation

uses PendaftaranUser, Anggota;

{$R *.dfm}

procedure TFormMainMenu.PendaftaranUser2Click(Sender: TObject);
begin
    FormUser.ShowModal;
end;

procedure TFormMainMenu.FormAnggota1Click(Sender: TObject);
begin
    FormAnggota.ShowModal;
end;

end.
