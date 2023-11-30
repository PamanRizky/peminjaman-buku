unit DetailIsi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, frxClass, frxDBSet, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids,
  Buttons;

type
  TFormDetailIsi = class(TForm)
    lbl1: TLabel;
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
    cbb1: TComboBox;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    frxdbdtstAnggota: TfrxDBDataset;
    frxrprt1: TfrxReport;
    dsdetailisi: TDataSource;
    zqry2: TZQuery;
    Edtjenisbuku: TEdit;
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
  FormDetailIsi: TFormDetailIsi;
  no_pinjam: string;

implementation

{$R *.dfm}

{ TFormDetailIsi }

procedure TFormDetailIsi.edtbersih;
begin
Edtnopinjam.Clear;
Edtjenisbuku.Clear;
end;

procedure TFormDetailIsi.edtenable;
begin
Edtnopinjam.Enabled:= True;
cbb1.Enabled:= True;
Edtjenisbuku.Enabled:= True;
end;

procedure TFormDetailIsi.posisiawal;
begin
edtbersih;
Edtnopinjam.Enabled:= False;
cbb1.Enabled:= False;
Edtjenisbuku.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;
end;

procedure TFormDetailIsi.FormShow(Sender: TObject);
begin
  posisiawal;

// Menampilkan kode_buku ke dalam ComboBox
cbb1.Items.Clear;
zqry2.SQL.Clear;
zqry2.SQL.Add('SELECT kode_buku FROM buku');
zqry2.Open;

while not zqry2.Eof do
begin
  cbb1.Items.Add(zqry2.FieldByName('kode_buku').AsString);
  zqry2.Next;
end;

zqry2.Close;


// Menampilkan data dari tabel detail isi
zqry1.SQL.Clear;
zqry1.SQL.Add('SELECT * FROM detail_isi');
zqry1.Open;

// Menghubungkan tabel peminjaman dengan DataSource
dsdetailisi.DataSet := zqry1;
dbgrd1.DataSource := dsdetailisi;

end;

procedure TFormDetailIsi.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormDetailIsi.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormDetailIsi.bsimpanClick(Sender: TObject);
begin
  if (Edtnopinjam.Text='') or (Edtjenisbuku.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into detail_isi values ("'+Edtnopinjam.Text+'","'+cbb1.Text+'","'+Edtjenisbuku.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from detail_isi');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormDetailIsi.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnopinjam.Text:= zqry1.FieldList[0].AsString;
cbb1.Text:= zqry1.FieldList[1].AsString;
Edtjenisbuku.Text:= zqry1.FieldList[2].AsString;

end;

procedure TFormDetailIsi.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
no_pinjam:=dbgrd1.DataSource.DataSet.FieldByName('no_pinjam').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from detail_isi where no_pinjam="'+no_pinjam+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from detail_isi');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormDetailIsi.beditClick(Sender: TObject);
begin
  if (Edtnopinjam.Text='') or (Edtjenisbuku.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtnopinjam.Text = zqry1.FieldList[0].AsString) and (cbb1.Text = zqry1.FieldList[1].AsString) AND (Edtjenisbuku.Text = zqry1.FieldList[2].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    no_pinjam:=dbgrd1.DataSource.DataSet.FieldByName('no_pinjam').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update detail_isi set kode_buku="'+cbb1.Text+'", jenis_buku="'+Edtjenisbuku.Text+'" where no_pinjam="'+no_pinjam+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from detail_isi');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormDetailIsi.bprintClick(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

procedure TFormDetailIsi.btn1Click(Sender: TObject);
begin
close
end;

end.

