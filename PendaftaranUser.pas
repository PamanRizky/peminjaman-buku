unit PendaftaranUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls,
  Buttons;

type
  TFormUser = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    Edtusername: TEdit;
    Edtpassword: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    bbatal: TButton;
    bprint: TButton;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    btn1: TBitBtn;
    procedure edtbersih;
    procedure edtenable;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure bbaruClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure bprintClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUser: TFormUser;
  id: string;

implementation

{$R *.dfm}

procedure TFormUser.edtbersih;
begin
Edtusername.Clear;
Edtpassword.Clear;
end;

procedure TFormUser.edtenable;
begin
Edtusername.Enabled:= True;
Edtpassword.Enabled:= True;
end;

procedure TFormUser.posisiawal;
begin
edtbersih;
Edtusername.Enabled:= False;
Edtpassword.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;
end;

procedure TFormUser.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormUser.bbaruClick(Sender: TObject);
begin
edtenable;
edtbersih;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormUser.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormUser.bsimpanClick(Sender: TObject);
begin
  if (Edtusername.Text='') or (Edtpassword.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (zqry1.Locate('username', Edtusername.Text,[])) then
  begin
    ShowMessage('DATA USERNAME SUDAH DIGUNAKAN!');
    posisiawal;
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into users values (null,"'+Edtusername.Text+'","'+Edtpassword.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from users');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormUser.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtusername.Text:= zqry1.FieldList[1].AsString;
Edtpassword.Text:= zqry1.FieldList[2].AsString;
end;

procedure TFormUser.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from users where id="'+id+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from users');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormUser.beditClick(Sender: TObject);
begin
if (Edtusername.Text='') or (Edtpassword.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtusername.Text = zqry1.FieldList[1].AsString) and (Edtpassword.Text = zqry1.FieldList[2].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update users set username="'+Edtusername.Text+'", password="'+Edtpassword.Text+'" where id="'+id+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from users');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormUser.bprintClick(Sender: TObject);
begin
frxReport1.ShowReport();
end;

procedure TFormUser.btn1Click(Sender: TObject);
begin
close
end;

end.
