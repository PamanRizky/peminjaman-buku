unit Buku;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, frxClass, frxDBSet, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, ComCtrls, Grids, DBGrids,
  StdCtrls, Buttons;

type
  TFormBuku = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    Edtkodebuku: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    bbatal: TButton;
    bprint: TButton;
    Edtsumberpengadaan: TEdit;
    Edtjuduli: TEdit;
    Edtpengarang: TEdit;
    dtp1: TDateTimePicker;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    frxDBDatasetDenda: TfrxDBDataset;
    frxReport1: TfrxReport;
    dsbuku: TDataSource;
    lbl6: TLabel;
    lbl7: TLabel;
    Edtptt: TEdit;
    Edtkondisibuku: TEdit;
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
  FormBuku: TFormBuku;
  kode_buku: string;

implementation

{$R *.dfm}

{ TFormBuku }

procedure TFormBuku.edtbersih;
begin
Edtkodebuku.Clear;
Edtjuduli.Clear;
Edtpengarang.Clear;
Edtptt.Clear;
Edtsumberpengadaan.Clear;
Edtkondisibuku.Clear;
end;

procedure TFormBuku.edtenable;
begin
Edtkodebuku.Enabled:= True;
Edtjuduli.Enabled:= True;
Edtpengarang.Enabled:= True;
Edtptt.Enabled:= True;
Edtsumberpengadaan.Enabled:= True;
dtp1.Enabled:= True;
Edtkondisibuku.Enabled:= True;
end;

procedure TFormBuku.posisiawal;
begin
edtbersih;
Edtkodebuku.Enabled:= False;
Edtjuduli.Enabled:= False;
Edtpengarang.Enabled:= False;
Edtptt.Enabled:= False;
Edtsumberpengadaan.Enabled:= False;
dtp1.Enabled:= False;
Edtkondisibuku.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormBuku.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormBuku.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormBuku.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormBuku.bsimpanClick(Sender: TObject);
begin
  if (Edtkodebuku.Text='') or (Edtjuduli.Text='') or (Edtpengarang.Text='') or (Edtptt.Text='') or (Edtsumberpengadaan.Text='') or (Edtkondisibuku.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into buku values ("'+Edtkodebuku.Text+'","'+Edtjuduli.Text+'","'+Edtpengarang.Text+'","'+Edtptt.Text+'","'+Edtsumberpengadaan.Text+'","'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'","'+Edtkondisibuku.Text+'")');
  zqry1.ExecSQL;

  //ZQuery1.Active:= False;
  //ZQuery1.Active:= True;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from buku');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormBuku.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtkodebuku.Text:= zqry1.FieldList[0].AsString;
Edtjuduli.Text:= zqry1.FieldList[1].AsString;
Edtpengarang.Text:= zqry1.FieldList[2].AsString;
Edtptt.Text:= zqry1.FieldList[3].AsString;
Edtsumberpengadaan.Text:= zqry1.FieldList[4].AsString;
dtp1.Date := StrToDate(zqry1.FieldList[5].AsString);
Edtkondisibuku.Text:= zqry1.FieldList[6].AsString;

end;

procedure TFormBuku.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
kode_buku:=dbgrd1.DataSource.DataSet.FieldByName('kode_buku').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from buku where kode_buku="'+kode_buku+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from buku');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormBuku.beditClick(Sender: TObject);
begin
  if (Edtkodebuku.Text='') or (Edtjuduli.Text='') or (Edtpengarang.Text='') or (Edtptt.Text='') or (Edtsumberpengadaan.Text='') or (Edtkondisibuku.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtjuduli.Text = zqry1.FieldList[1].AsString) and (Edtpengarang.Text = zqry1.FieldList[2].AsString) and (Edtptt.Text = zqry1.FieldList[3].AsString) and (Edtsumberpengadaan.Text = zqry1.FieldList[4].AsString) and (Edtkondisibuku.Text = zqry1.FieldList[5].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    kode_buku:=dbgrd1.DataSource.DataSet.FieldByName('kode_buku').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update buku set judul_buku="'+Edtjuduli.Text+'", pengarang="'+Edtpengarang.Text+'", penerbit_tempat_tahun="'+Edtptt.Text+'", sumber_pengadaan="'+Edtsumberpengadaan.Text+'", tgl_terima="'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'", kondisi_buku="'+Edtkondisibuku.Text+'" where kode_buku="'+kode_buku+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from buku');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormBuku.bprintClick(Sender: TObject);
begin
  frxReport1.ShowReport();
end;

procedure TFormBuku.btn1Click(Sender: TObject);
begin
Close
end;

end.
