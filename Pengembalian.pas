unit Pengembalian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, frxClass, frxDBSet, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids, StdCtrls, Buttons;

type
  TFormPengembalian = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Edtnokembali: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    bbatal: TButton;
    bprint: TButton;
    Edtnopinjam: TEdit;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    frxDBDatasetAnggota: TfrxDBDataset;
    frxReport1: TfrxReport;
    dsanggota: TDataSource;
    dtp1: TDateTimePicker;
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
  FormPengembalian: TFormPengembalian;
  no_kembali: string;

implementation

{$R *.dfm}

procedure TFormPengembalian.edtbersih;
begin
Edtnokembali.Clear;
Edtnopinjam.Clear;
end;

procedure TFormPengembalian.edtenable;
begin
Edtnokembali.Enabled:= True;
Edtnopinjam.Enabled:= True;
end;

procedure TFormPengembalian.posisiawal;
begin
edtbersih;
Edtnokembali.Enabled:= False;
Edtnopinjam.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormPengembalian.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormPengembalian.bbaruClick(Sender: TObject);
begin
edtenable;
edtbersih;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormPengembalian.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormPengembalian.bsimpanClick(Sender: TObject);
begin
  if (Edtnokembali.Text='') or (Edtnopinjam.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (zqry1.Locate('no_kembali', Edtnokembali.Text,[])) then
  begin
    ShowMessage('DATA NO KEMBALI SUDAH DIGUNAKAN!');
    posisiawal;
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into pengembalian values ("'+Edtnokembali.Text+'","'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'","'+Edtnopinjam.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from pengembalian');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormPengembalian.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnokembali.Text:= zqry1.FieldList[0].AsString;
dtp1.Date:= StrToDate(zqry1.FieldList[1].AsString);
Edtnopinjam.Text:= zqry1.FieldList[2].AsString;

end;

procedure TFormPengembalian.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
no_kembali:=dbgrd1.DataSource.DataSet.FieldByName('no_kembali').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from pengembalian where no_kembali="'+no_kembali+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from pengembalian');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormPengembalian.beditClick(Sender: TObject);
begin
if (Edtnokembali.Text='') or (Edtnopinjam.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtnokembali.Text = zqry1.FieldList[1].AsString) and (Edtnopinjam.Text = zqry1.FieldList[3].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
  no_kembali:=dbgrd1.DataSource.DataSet.FieldByName('no_kembali').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update pengembalian set tgl_kembali="'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'", no_pinjam="'+Edtnopinjam.Text+'" where no_kembali="'+no_kembali+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from pengembalian');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormPengembalian.bprintClick(Sender: TObject);
begin
frxReport1.ShowReport();
end;

procedure TFormPengembalian.btn1Click(Sender: TObject);
begin
close
end;

end.
