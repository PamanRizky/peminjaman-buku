unit Peminjaman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, frxClass, frxDBSet, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids, Buttons;

type
  TFormPeminjaman = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Edtnopinjam: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    bbatal: TButton;
    bprint: TButton;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    frxdbdtstAnggota: TfrxDBDataset;
    frxrprt1: TfrxReport;
    dsanggota: TDataSource;
    dtp1: TDateTimePicker;
    cbb1: TComboBox;
    cbb2: TComboBox;
    zqry2: TZQuery;
    zqry3: TZQuery;
    btn1: TBitBtn;
    procedure edtbersih;
    procedure edtenable;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bbaruClick(Sender: TObject);
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
  FormPeminjaman: TFormPeminjaman;
  no_pinjam: string;

implementation

{$R *.dfm}

procedure TFormPeminjaman.edtbersih;
begin
Edtnopinjam.Clear;
end;

procedure TFormPeminjaman.edtenable;
begin
Edtnopinjam.Enabled:= True;
dtp1.Enabled:= True;
cbb1.Enabled:= True;
cbb2.Enabled:= True;
end;

procedure TFormPeminjaman.posisiawal;
begin
edtbersih;
Edtnopinjam.Enabled:= False;
dtp1.Enabled:= False;
cbb1.Enabled:= False;
cbb2.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormPeminjaman.FormShow(Sender: TObject);
begin
  posisiawal;

// Menampilkan no_kartu_anggota ke dalam ComboBox
cbb1.Items.Clear;
zqry2.SQL.Clear;
zqry2.SQL.Add('SELECT no_kartu_anggota FROM anggota');
zqry2.Open;

while not zqry2.Eof do
begin
  cbb1.Items.Add(zqry2.FieldByName('no_kartu_anggota').AsString);
  zqry2.Next;
end;

zqry2.Close;

// Menampilkan kode_petugas ke dalam ComboBox
cbb2.Items.Clear;
zqry3.SQL.Clear;
zqry3.SQL.Add('SELECT kode_petugas FROM petugas');
zqry3.Open;

while not zqry3.Eof do
begin
  cbb2.Items.Add(zqry3.FieldByName('kode_petugas').AsString);
  zqry3.Next;
end;

zqry3.Close;

// Menampilkan data dari tabel hub
zqry1.SQL.Clear;
zqry1.SQL.Add('SELECT * FROM peminjaman');
zqry1.Open;

// Menghubungkan tabel peminjaman dengan DataSource
dsanggota.DataSet := zqry1;
dbgrd1.DataSource := dsanggota;


end;

procedure TFormPeminjaman.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormPeminjaman.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormPeminjaman.bsimpanClick(Sender: TObject);
begin
if (Edtnopinjam.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into peminjaman values ("'+Edtnopinjam.Text+'","'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'","'+cbb1.Text+'","'+cbb2.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from peminjaman');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormPeminjaman.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnopinjam.Text:= zqry1.FieldList[0].AsString;
dtp1.Date := StrToDate(zqry1.FieldList[1].AsString);
cbb1.Text:= zqry1.FieldList[2].AsString;
cbb2.Text:= zqry1.FieldList[3].AsString;

end;

procedure TFormPeminjaman.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
no_pinjam:=dbgrd1.DataSource.DataSet.FieldByName('no_pinjam').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from peminjaman where no_pinjam="'+no_pinjam+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from peminjaman');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormPeminjaman.beditClick(Sender: TObject);
begin
  if (Edtnopinjam.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtnopinjam.Text = zqry1.FieldList[0].AsString) and (cbb1.Text = zqry1.FieldList[2].AsString) AND (cbb2.Text = zqry1.FieldList[3].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    no_pinjam:=dbgrd1.DataSource.DataSet.FieldByName('no_pinjam').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update peminjaman set tgl_pinjam="'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'", no_kartu_anggota="'+cbb1.Text+'", kode_petugas="'+cbb2.Text+'" where no_pinjam="'+no_pinjam+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from peminjaman');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormPeminjaman.bprintClick(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

procedure TFormPeminjaman.btn1Click(Sender: TObject);
begin
close
end;

end.
