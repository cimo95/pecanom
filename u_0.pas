unit u_0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ComCtrls, StdCtrls, XPMan;

type
  T_0 = class(TForm)
    _3: TListView;
    _2: TEdit;
    _1: TLabel;
    XPManifest1: TXPManifest;
    procedure _2Change(Sender: TObject);
    procedure _2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure _4;
  end;

const
  //pecahan yang tersedia
  _5: array[0..13] of Int64 = (100000, 50000, 20000, 10000, 5000, 2000, 1000, 500, 200, 100,
  //back-compat pecahan lama :D
    50, 25, 10, 1);

var
  _0: T_0;
  //penghitung jumlah pecahan yang ada untuk ditampilkan dalam list
  _6: array[0..13] of Integer = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

implementation

{$R *.dfm}
procedure t_0._4;
var
  _7: Int64;
  _8, _9: integer;
  _A: tlistitem;
begin
  //reset ini dari penghitung jumlah pecahan
  for _8 := 0 to 13 do
    _6[_8] := 0;

  //kosongkan list pecahan
  _3.Items.Clear;
  //ambil nominal
  _7 := StrToInt64(_2.Text);
  //inisialisasi posisi awal array pecahan
  _8 := 0;
  //ulangi hingga sebanyak pecahan yang tersedia atau hasil pengurangan = 0
  repeat
    //uji nominal dikurangi pecahan yang tersedia ke-_8
    _9 := _7 - _5[_8];
    //jika hasil uji dibawah 0 berarti pecahan ke-_8 terlalu besar
    if _9 < 0 then
      //lanjutkan ke pecahan yang lebih kecil
      Inc(_8)
    else
    begin
      //jika hasil uji lebih dari nol, berarti pecahan ke-_8 sudah benar
      //tambahkan jumlah pecahan ke-_8
      Inc(_6[_8]);
      //atur nominal ke hasil dari pengurangan tadi
      _7 := _9;
    end;
  until (_8 = 14) or (_9 = 0);

  //ulangi hingga sebanyak jumlah pecahan
  for _8 := 0 to 13 do
  begin
    //jika jumlah pecahan ke-_8 tidak sama dengan nol, berarti pecahan dipakai, tambahkan kedalam list pecahan
    if _6[_8] <> 0 then
    begin
      _A := _3.Items.add;
      _A.Caption := 'Rp.' + IntToStr(_5[_8]) + ',-';
      _A.SubItems.Add(IntToStr(_6[_8]));
    end;
  end;
end;

procedure T_0._2Change(Sender: TObject);
begin
  //eksekusi prosedur _4, jika terjadi masalah/exception, isi kotak input (_2) dengan nol
  try
    _4;
  except
    _2.Text := '0';
  end;
end;

procedure T_0._2keyPress(Sender: TObject; var key: Char);
begin
  //abaikan karakter selain angka dan backspace
  if not (key in ['0'..'9', #8]) then
    key := #0;
end;

end.

