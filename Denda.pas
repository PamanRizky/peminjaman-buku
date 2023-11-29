unit Denda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, frxClass, frxDBSet, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids, StdCtrls;

type
  TFormDenda = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Edtnodenda: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    bbatal: TButton;
    bprint: TButton;
    Edtjumlahdenda: TEdit;
    Edtnokembali: TEdit;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    frxDBDatasetDenda: TfrxDBDataset;
    frxReport1: TfrxReport;
    dsdenda: TDataSource;
    lbl5: TLabel;
    Edtjenisdenda: TEdit;
    dtp1: TDateTimePicker;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDenda: TFormDenda;
  no_denda: string;

implementation

{$R *.dfm}

{ TFormDenda }

procedure TFormDenda.edtbersih;
begin
Edtnodenda.Clear;
Edtjenisdenda.Clear;
Edtjumlahdenda.Clear;
Edtnokembali.Clear;
end;

procedure TFormDenda.edtenable;
begin
Edtnodenda.Enabled:= True;
dtp1.Enabled:= True;
Edtjenisdenda.Enabled:= True;
Edtjumlahdenda.Enabled:= True;
Edtnokembali.Enabled:= True;
end;

procedure TFormDenda.posisiawal;
begin
edtbersih;
Edtnodenda.Enabled:= False;
dtp1.Enabled:= False;
Edtjenisdenda.Enabled:= False;
Edtjumlahdenda.Enabled:= False;
Edtnokembali.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;


end;

procedure TFormDenda.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormDenda.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormDenda.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormDenda.bsimpanClick(Sender: TObject);
begin
  if (Edtnodenda.Text='') or (Edtjenisdenda.Text='') or (Edtjumlahdenda.Text='') or (Edtnokembali.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into denda values ("'+Edtnodenda.Text+'","'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'","'+Edtjenisdenda.Text+'","'+Edtjumlahdenda.Text+'","'+Edtnokembali.Text+'")');
  zqry1.ExecSQL;

  //ZQuery1.Active:= False;
  //ZQuery1.Active:= True;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from denda');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;


end;

procedure TFormDenda.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnodenda.Text:= zqry1.FieldList[0].AsString;
dtp1.Date := StrToDate(zqry1.FieldList[1].AsString);
Edtjenisdenda.Text:= zqry1.FieldList[2].AsString;
Edtjumlahdenda.Text:= zqry1.FieldList[3].AsString;
Edtnokembali.Text:= zqry1.FieldList[4].AsString;

end;

procedure TFormDenda.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
no_denda:=dbgrd1.DataSource.DataSet.FieldByName('no_denda').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from denda where no_denda="'+no_denda+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from denda');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormDenda.beditClick(Sender: TObject);
begin
  if (Edtnodenda.Text='') or (Edtjenisdenda.Text='') or (Edtjumlahdenda.Text='') or (Edtnokembali.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtnodenda.Text = zqry1.FieldList[1].AsString) and (Edtjenisdenda.Text = zqry1.FieldList[3].AsString) AND (Edtjumlahdenda.Text = zqry1.FieldList[4].AsString) and (Edtnokembali.Text = zqry1.FieldList[5].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    no_denda:=dbgrd1.DataSource.DataSet.FieldByName('no_denda').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update denda set tgl_denda="'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'", jenis_denda="'+Edtjenisdenda.Text+'", jumlah_denda="'+Edtjumlahdenda.Text+'", no_kembali="'+Edtnokembali.Text+'" where no_denda="'+no_denda+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from denda');
  zqry1.Open;
  posisiawal;
  end;


end;

procedure TFormDenda.bprintClick(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
