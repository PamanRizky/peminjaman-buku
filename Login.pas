unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractConnection, ZConnection, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls;

type
  TFormLogin = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    Edt1: TEdit;
    Edt2: TEdit;
    b1: TButton;
    zqry1: TZQuery;
    ZConnection1: TZConnection;
    procedure b1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

uses MainMenu;

{$R *.dfm}

procedure TFormLogin.b1Click(Sender: TObject);
begin
  with zqry1 do
  begin
    SQL.Clear;
    SQL.Add('select * from users where username='+QuotedStr(Edt1.Text));
    Open;
  end;
  //jika tidak ada akun muncul pesan dibawah
  if zqry1.RecordCount=0 then
  Application.MessageBox('Username anda tidak terdaftar','informasi',MB_OK or MB_ICONINFORMATION)
  else
  begin
  if zqry1.FieldByName('password').AsString<>Edt2.Text then
  Application.MessageBox('Silahkan cek password dengan benar','error',MB_OK or MB_ICONERROR)
  else
  begin
    Hide;
    FormMainMenu.Show;
    MessageDlg('Anda berhasil login',mtInformation,[mbOK],0);
  end;
  end;

end;

end.
