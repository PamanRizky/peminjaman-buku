unit Anggota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls;

type
  TFormAnggota = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    Edtnokartuanggota: TEdit;
    Edtnama: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    bbatal: TButton;
    bprint: TButton;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    frxDBDatasetAnggota: TfrxDBDataset;
    lbl3: TLabel;
    lbl4: TLabel;
    Edtjurusan: TEdit;
    Edtnoinduk: TEdit;
    frxReport1: TfrxReport;
    dsanggota: TDataSource;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnggota: TFormAnggota;
  no_kartu_anggota: string;

implementation

{$R *.dfm}

{ TFormAnggota }

procedure TFormAnggota.edtbersih;
begin
Edtnokartuanggota.Clear;
Edtnama.Clear;
Edtjurusan.Clear;
Edtnoinduk.Clear;
end;

procedure TFormAnggota.edtenable;
begin
Edtnokartuanggota.Enabled:= True;
Edtnama.Enabled:= True;
Edtjurusan.Enabled:= True;
Edtnoinduk.Enabled:= True;
end;

procedure TFormAnggota.posisiawal;
begin
edtbersih;
Edtnokartuanggota.Enabled:= False;
Edtnama.Enabled:= False;
Edtjurusan.Enabled:= False;
Edtnoinduk.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormAnggota.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormAnggota.bbaruClick(Sender: TObject);
begin
edtenable;
edtbersih;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormAnggota.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormAnggota.bsimpanClick(Sender: TObject);
begin
  if (Edtnokartuanggota.Text='') or (Edtnama.Text='') or (Edtjurusan.Text='') or (Edtnoinduk.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (zqry1.Locate('no_kartu_anggota', Edtnokartuanggota.Text,[])) then
  begin
    ShowMessage('DATA KARTU ANGGOTA SUDAH DIGUNAKAN!');
    posisiawal;
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into anggota values ("'+Edtnokartuanggota.Text+'","'+Edtnama.Text+'","'+Edtjurusan.Text+'","'+Edtnoinduk.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from anggota');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormAnggota.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnokartuanggota.Text:= zqry1.FieldList[0].AsString;
Edtnama.Text:= zqry1.FieldList[1].AsString;
Edtjurusan.Text:= zqry1.FieldList[2].AsString;
Edtnoinduk.Text:= zqry1.FieldList[3].AsString;
end;

procedure TFormAnggota.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
no_kartu_anggota:=dbgrd1.DataSource.DataSet.FieldByName('no_kartu_anggota').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from anggota where no_kartu_anggota="'+no_kartu_anggota+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from anggota');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;


end;

procedure TFormAnggota.beditClick(Sender: TObject);
begin
  if (Edtnokartuanggota.Text='') or (Edtnama.Text='') or (Edtjurusan.Text='') or (Edtnoinduk.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtnokartuanggota.Text = zqry1.FieldList[1].AsString) and (Edtnama.Text = zqry1.FieldList[2].AsString) and (Edtjurusan.Text = zqry1.FieldList[3].AsString) and (Edtnoinduk.Text = zqry1.FieldList[4].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
  no_kartu_anggota:=dbgrd1.DataSource.DataSet.FieldByName('no_kartu_anggota').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update anggota set nama_anggota="'+Edtnama.Text+'", jurusan="'+Edtjurusan.Text+'", no_induk="'+Edtnoinduk.Text+'" where no_kartu_anggota="'+no_kartu_anggota+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from anggota');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormAnggota.bprintClick(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
