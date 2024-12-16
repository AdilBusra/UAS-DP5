Program Ifra_D_Cafe;

uses crt;

type
  Booking = record
    Makanan : string;
    Minuman : string;
    JumlahMakanan : Integer;
    JumlahMinuman : Integer;
    JumlahHargaMakanan : LongInt;
    JumlahHargaMinuman : LongInt;
  end;

var
  Data : array [1..99] of Booking;
  Nama, JumlahOrang, Token, TokenAnda : string;
  Pilih, Lanjut, NoMeja : char;
  n, i : Integer;
  TotalKeseluruhan : LongInt;

function HitungHargaMakanan(Makanan : string): LongInt;
  begin
    case Makanan of
      'Wagyu' : HitungHargaMakanan:= 700000;
      'wagyu' : HitungHargaMakanan:= 700000;
      'Kaviar' : HitungHargaMakanan:= 700000;
      'kaviar' : HitungHargaMakanan:= 700000;
      'Oyster' : HitungHargaMakanan:= 600000;
      'oyster' : HitungHargaMakanan:= 600000;
      'Truffle' : HitungHargaMakanan:= 600000;
      'truffle' : HitungHargaMakanan:= 600000;
      'Salad' : HitungHargaMakanan:= 500000;
      'salad' : HitungHargaMakanan:= 500000;
      'Crab' : HitungHargaMakanan:= 400000;
      'crab' : HitungHargaMakanan:= 400000;
      'Guacamole' : HitungHargaMakanan:= 300000;
      'guacamole' : HitungHargaMakanan:= 300000;
    else
      HitungHargaMakanan:= 0;    
    end;
  end;

function HitungHargaMinuman(Minuman : string): LongInt;
  begin
    case Minuman of
      'Wine' : HitungHargaMinuman:= 500000;
      'wine' : HitungHargaMinuman:= 500000;
      'Mojito' : HitungHargaMinuman:= 500000;
      'mojito' : HitungHargaMinuman:= 500000;
      'Affogato' : HitungHargaMinuman:= 400000;
      'affogato' : HitungHargaMinuman:= 400000;
      'Cappucino' : HitungHargaMinuman:= 400000;
      'cappucino' : HitungHargaMinuman:= 400000;
      'Espresso' : HitungHargaMinuman:= 300000;
      'espresso' : HitungHargaMinuman:= 300000;
      'Mocha' : HitungHargaMinuman:= 200000;
      'mocha' : HitungHargaMinuman:= 200000;
      'Mineral' : HitungHargaMinuman:= 100000;
      'mineral' : HitungHargaMinuman:= 100000;
    else
      HitungHargaMinuman:= 0;    
    end;
  end;

function GenerateToken: string;
  const
    Angka = '0123456789';
  var
    i: Integer;
    temp: string;
  begin
    Randomize;
    temp := '';
    for i := 1 to 12 do
      begin
        temp := temp + Angka[Random(Length(Angka))+1];
        if (i mod 4 = 0) and (i < 12) then
          begin
            temp := temp + ' '; 
          end;
      end;
    GenerateToken := temp;
  end;

procedure PesanMenu;
  label 
    1;
  var
    Makanan, Minuman : string;
    JumlahMakanan, JumlahMinuman : Integer;
    JumlahHargaMakanan, JumlahHargaMinuman : LongInt;
    PesanLagi : Char;
  begin
    n := 0;
    TotalKeseluruhan := 0; 
    repeat
      1:
      writeln('Menu Makanan   :');
      writeln('Wagyu-----------------Rp.700.000');
      writeln('Kaviar----------------Rp.700.000');
      writeln('Oyster----------------Rp.600.000');
      writeln('Truffle---------------Rp.600.000');
      writeln('Salad-----------------Rp.500.000');
      writeln('Crab------------------Rp.400.000');
      writeln('Guacsmole-------------Rp.300.000');
      writeln('Tidak Pesan-----------Ketik "Tidak"');
      writeln;
      write('Pesan Makanan  : ');
      readln(Makanan);
      write('Jumlah  : ');
      readln(JumlahMakanan);
      writeln;
      writeln('Menu Minuman   :');
      writeln('Wine------------------Rp.500.000');
      writeln('Mojito----------------Rp.500.000');
      writeln('Affogato--------------Rp.400.000');
      writeln('Cappucino-------------Rp.400.000');
      writeln('Espresso--------------Rp.300.000');
      writeln('Mocha-----------------Rp.200.000');
      writeln('Mineral---------------Rp.100.000');
      writeln('Tidak Pesan-----------Ketik "Tidak"');
      writeln;
      write('Pesan Minuman  : ');
      readln(Minuman);
      write('Jumlah  : ');
      readln(JumlahMinuman);
      writeln;
      JumlahHargaMakanan := (HitungHargaMakanan(Makanan) * JumlahMakanan);
      JumlahHargaMinuman := (HitungHargaMinuman(Minuman) * JumlahMinuman);
      if (JumlahHargaMakanan > 0) or (JumlahHargaMinuman > 0) then
        begin
          n := n + 1;
          if (JumlahHargaMakanan > 0) then
            begin
              Data[n].Makanan := Makanan;
              Data[n].JumlahMakanan := JumlahMakanan;
              Data[n].JumlahHargaMakanan := JumlahHargaMakanan;
            end
          else
            begin
              Data[n].Makanan := 'Tidak Ada';
              Data[n].JumlahMakanan := 0;
            end;
          if (JumlahHargaMinuman > 0) then
            begin
              Data[n].Minuman := Minuman;
              Data[n].JumlahMinuman := JumlahMinuman;
              Data[n].JumlahHargaMinuman := JumlahHargaMinuman;
            end
          else
            begin
              Data[n].Minuman := 'Tidak Ada';
              Data[n].JumlahMinuman := 0;
            end;
          TotalKeseluruhan := TotalKeseluruhan + JumlahHargaMakanan + JumlahHargaMinuman;
          writeln('Booking berhasil disimpan. Total Harga Pesanan ini : Rp.', JumlahHargaMakanan + JumlahHargaMinuman);
          writeln('Total Harga Keseluruhan : Rp.', TotalKeseluruhan);
        end
      else
        begin
          writeln('Makanan atau Minuman tidak valid.');
          writeln('Jumlah Makanan atau Minuman harus lebih dari 0.');
          writeln('Maaf Anda harus memesan.');
          goto 1;
        end;
      writeln('Pesan lagi? (Y/N)');
      readln(PesanLagi);
      writeln;
    until (PesanLagi = 'N') or (PesanLagi = 'n');
  end;

procedure Bayar;
  begin
    repeat
    writeln('Masukkan token Anda:');
    readln(TokenAnda);
    writeln;
    if TokenAnda = Token then
      begin
        writeln('Token valid! Berikut detail pembelian Anda:');
        writeln;
        writeln('Token      : ', Token);
        writeln('Nama       : ', Nama);
        writeln('Nomor Meja : ', NoMeja);
        for i := 1 to n do
          begin
            writeln(Data[i].Makanan, ' - ', Data[i].JumlahMakanan, ' Pcs - Rp.', Data[i].JumlahHargaMakanan);
            writeln(Data[i].Minuman, ' - ', Data[i].JumlahMinuman, ' Pcs - Rp.', Data[i].JumlahHargaMinuman);
          end;
        writeln;
        writeln('Total Keseluruhan: Rp.', TotalKeseluruhan);
        writeln('Terima kasih telah menggunakan layanan kami.');
      end
    else
      begin
        writeln('Token tidak valid. Silahkan coba lagi.');
      end;
    until TokenAnda = Token;
  end;

begin

  clrscr;

  writeln('Selamat Datang di Layanan Reservasi Ifra D Cafe');
  writeln;
  
  write('Masukkan Nama Anda: ');
  readln(Nama);
  writeln;

  write('Piih Nomor Meja (1-9): ');
  readln(NoMeja);
  writeln;

  PesanMenu;
  writeln;

  Token := GenerateToken;
  writeln('Token Anda : ', Token);
  writeln;

  writeln('Apakah Anda ingin melanjutkan ke pembayaran via online? (Y/N)');
  readln(Lanjut);
  writeln;

  if (Lanjut = 'Y') or (Lanjut = 'y') then
    begin
      Bayar;  
    end
  else
    begin
      writeln('Anda bisa melakukan pembayaran langsung ditempat.');
      writeln('Terima kasih telah menggunakan layanan kami.');  
    end;
  
  readln;

end.