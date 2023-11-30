unit Petugas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, frxClass, frxDBSet, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls,
  Buttons;

type
  TFormPetugas = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Edtkodepetugas: TEdit;
    Edtnama: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    bbatal: TButton;
    bprint: TButton;
    Edtalamat: TEdit;
    Edtnotelp: TEdit;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    frxDBDatasetPetugas: TfrxDBDataset;
    frxReport1: TfrxReport;
    dspetugas: TDataSource;
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
  FormPetugas: TFormPetugas;
  kode_petugas: string;

implementation

{$R *.dfm}

procedure TFormPetugas.edtbersih;
begin
Edtkodepetugas.Clear;
Edtnama.Clear;
Edtalamat.Clear;
Edtnotelp.Clear;
end;

procedure TFormPetugas.edtenable;
begin
Edtkodepetugas.Enabled:= True;
Edtnama.Enabled:= True;
Edtalamat.Enabled:= True;
Edtnotelp.Enabled:= True;
end;

procedure TFormPetugas.posisiawal;
begin
edtbersih;
Edtkodepetugas.Enabled:= False;
Edtnama.Enabled:= False;
Edtalamat.Enabled:= False;
Edtnotelp.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormPetugas.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormPetugas.bbaruClick(Sender: TObject);
begin
edtenable;
edtbersih;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormPetugas.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormPetugas.bsimpanClick(Sender: TObject);
begin
  if (Edtkodepetugas.Text='') or (Edtnama.Text='') or (Edtalamat.Text='') or (Edtnotelp.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (zqry1.Locate('kode_petugas', Edtkodepetugas.Text,[])) then
  begin
    ShowMessage('DATA KODE PETUGAS SUDAH DIGUNAKAN!');
    posisiawal;
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into petugas values ("'+Edtkodepetugas.Text+'","'+Edtnama.Text+'","'+Edtalamat.Text+'","'+Edtnotelp.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from petugas');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;


end;

procedure TFormPetugas.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtkodepetugas.Text:= zqry1.FieldList[0].AsString;
Edtnama.Text:= zqry1.FieldList[1].AsString;
Edtalamat.Text:= zqry1.FieldList[2].AsString;
Edtnotelp.Text:= zqry1.FieldList[3].AsString;
end;

procedure TFormPetugas.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
kode_petugas:=dbgrd1.DataSource.DataSet.FieldByName('kode_petugas').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from petugas where kode_petugas="'+kode_petugas+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from petugas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;


end;

procedure TFormPetugas.beditClick(Sender: TObject);
begin
if (Edtkodepetugas.Text='') or (Edtnama.Text='') or (Edtalamat.Text='') or (Edtnotelp.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtkodepetugas.Text = zqry1.FieldList[1].AsString) and (Edtnama.Text = zqry1.FieldList[2].AsString) and (Edtalamat.Text = zqry1.FieldList[3].AsString) and (Edtnotelp.Text = zqry1.FieldList[4].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
  kode_petugas:=dbgrd1.DataSource.DataSet.FieldByName('kode_petugas').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update petugas set nama_petugas="'+Edtnama.Text+'", alamat="'+Edtalamat.Text+'", no_telp="'+Edtnotelp.Text+'" where kode_petugas="'+kode_petugas+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from petugas');
  zqry1.Open;
  posisiawal;
  end;


end;

procedure TFormPetugas.bprintClick(Sender: TObject);
begin
  frxReport1.ShowReport();
end;

procedure TFormPetugas.btn1Click(Sender: TObject);
begin
              close
end;

end.
