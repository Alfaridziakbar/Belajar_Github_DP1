program ManajemenCatatan;
uses crt;
const
  MAX_CATATAN = 100;

type
  Catatan = record
    Judul: string;
    Isi: string;
  end;

var
  DaftarCatatan: array [1..MAX_CATATAN] of Catatan;
  JumlahCatatan,Pilihan: integer;
  

procedure TambahCatatan;
begin
  clrscr;
  if JumlahCatatan < MAX_CATATAN then
  begin
    writeln('Masukkan Judul Catatan: ');
    readln(DaftarCatatan[JumlahCatatan + 1].Judul);
    
    writeln('Masukkan Isi Catatan: ');
    readln(DaftarCatatan[JumlahCatatan + 1].Isi);
    
    JumlahCatatan := JumlahCatatan + 1;
    
    writeln('Catatan berhasil Ditambahkan.');
  end
  else
  textcolor(4);
    writeln('Daftar Catatan Sudah Penuh.');
end;

procedure TampilkanCatatan;
var
  i: integer;
begin
  clrscr;
  writeln('Daftar Catatan:');
  writeln('------------------------');
  
  for i := 1 to JumlahCatatan do
  begin
    writeln('Judul: ', DaftarCatatan[i].Judul);
    writeln('Isi: ', DaftarCatatan[i].Isi);
    writeln('------------------------');
  end;
  
  writeln;

  readln;
end;

procedure HapusCatatan;
var
  i, index: integer;
  JudulHapus: string;
begin
clrscr;
TampilkanCatatan;
  write('Masukkan Judul Catatan Yang Ingin Dihapus: ');
  readln(JudulHapus);
  
  index := 0;
  for i := 1 to JumlahCatatan do
  begin
    if DaftarCatatan[i].Judul = JudulHapus then
    begin
      index := i;
      break;
    end;
  end;
  
  if index > 0 then
  begin
    for i := index to JumlahCatatan - 1 do
      DaftarCatatan[i] := DaftarCatatan[i + 1];
    
    JumlahCatatan := JumlahCatatan - 1;
    
    writeln('Catatan Berhasil Dihapus.');
    writeln;
    writeln('Tekan Sembarang Tombol Untuk Kembali Ke Program Utama');
    readln;
  end
  else
  begin
  textcolor(4);
    writeln('Catatan tidak ditemukan.');
    writeln;
    textcolor(10);
    writeln('Tekan Sembarang Tombol Untuk Kembali Ke Program Utama');
    readln;
  end;
end;

procedure EditCatatan;
var
  i: integer;
  JudulEdit: string;
begin
clrscr;
TampilkanCatatan;
  write('Masukkan Judul Catatan Yang Ingin Diedit: ');
  readln(JudulEdit);
  
  for i := 1 to JumlahCatatan do
  begin
    if DaftarCatatan[i].Judul = JudulEdit then
    begin
      writeln('Masukkan Judul Baru: ');
      readln(DaftarCatatan[i].Judul);
      
      writeln('Masukkan Isi Baru:');
      readln(DaftarCatatan[i].Isi);
      
      writeln('Catatan Berhasil Diedit.');
      writeln;
      writeln('Tekan Sembarang Tombol Untuk Kembali Ke Program Utama');
    readln;
      exit;
    end;
  end;
  
  textcolor(4);
  writeln('Catatan Tidak Ditemukan.');
  writeln;
  textcolor(10);
  writeln('Tekan Sembarang Tombol Untuk Kembali Ke Program Utama');
    readln;
  
  
end;

procedure Diary;
var
  vartext: Text;
  pesan: string;
  i: integer;
begin
  clrscr;
  Assign(vartext, 'tes.txt'); // Sesuaikan dengan lokasi penyimpanan yang diinginkan
  append(vartext);
  writeln(vartext, 'Daftar Catatan:');
  writeln(vartext, '------------------------');
  
  for i := 1 to JumlahCatatan do
  begin
    writeln(vartext, 'Judul: ', DaftarCatatan[i].Judul);
    writeln(vartext, 'Isi: ', DaftarCatatan[i].Isi);
    writeln(vartext, '------------------------');
  end;
  
  Close(vartext);
  writeln('Catatan sudah disimpan di file.');
  writeln('Tekan Sembarang Tombol Untuk Kembali Ke Program Utama');
  readln;
end;



begin
textbackground(0);
  JumlahCatatan := 0;

  repeat
    clrscr;
    textbackground(0);
    textcolor(10);
 writeln('            |~~~~~~~~~~~~~~~~~~~~~~~~~~~|');
 writeln('            |  MANAJEMEN CATATAN PRIBADI|');
 writeln('            |~~~~~~~~~~~~~~~~~~~~~~~~~~~|');
 writeln('            |    1. Tambah Catatan      |'); 
 writeln('            |    2. Tampilkan Catatan   |');
 writeln('            |    3. Hapus Catatan       |');
 writeln('            |    4. Edit Catatan        |');
 writeln('            |    5. Diary               |');
 writeln('            |    0. Keluar              |');
 writeln('            |~~~~~~~~~~~~~~~~~~~~~~~~~~~|');
 writeln;
 
 textcolor(14);
 writeln('---------------------');
 writeln('[PETUNJUK PENGGUNAAN]');
 writeln('---------------------');
 writeln;
 writeln('|Opsi [1] Digunakan Untuk Menambah Catatan Yang Ingin Dibuat|');
 writeln('|Opsi [2] Digunakan Untuk Menampilkan Daftar Catatan        |');
 writeln('|Opsi [3] Digunakan Untuk Menghapus Catatan Yang Diinginkan |');
 writeln('|Opsi [4] Digunakan Untuk Mengedit Catatan Yang Sudah Dibuat|');
 writeln('|Opsi [5] Digunakan Untuk Memindahkan Isi Catatan Ke Notepad|');
 writeln('|Opsi [0] Digunakan Untuk Keluar Dari Program               |');
 writeln;
 
 textcolor(10);
 writeln('--------------------');
 write('Pilih Opsi (0-5): ');
 readln(Pilihan);
 
 
 
    
 
 
    case Pilihan of
      1: TambahCatatan;
      2: TampilkanCatatan;
      3: HapusCatatan;
      4: EditCatatan;
      5: Diary;
    end;
  until Pilihan = 0;
end.
