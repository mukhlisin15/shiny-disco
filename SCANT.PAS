Program scant;
uses crt;
var
it     : integer;
X0, X1, X2, M, tol: real;
pil : char;

label 1,2,3;


function f(x:real) : real;
begin
f:=exp(x)-5*x*x;
end;

begin
clrscr;
    tol := 0.00001;

1:
	{1. Proses Penginputan}
        gotoxy(20,9); write ('+================================');
        textbackground(11);write('_');normvideo;textbackground(9);write('=');normvideo;textbackground(4);write('X');normvideo;
        writeln('+');
	gotoxy(20,10);write('#');textbackground(34);write('      PROGRAM METODE SECANT        ');normvideo;writeln('#');
        gotoxy(20,11);writeln ('#===================================#');
        gotoxy(20,12);writeln ('# Dengan Nilai Toleransi= 0.00001   #');
        gotoxy(20,13);writeln ('# Masukkan X0           =           #');
	gotoxy(20,14);writeln ('# Masukkan X1           =           #');
        gotoxy(20,15);writeln ('+===================================+');
        gotoxy(46,13);readln(x0);
        gotoxy(46,14);readln(x1);

2:
	{Proses Pencarian Akar}
clrscr;

    textbackground(1);
	writeln ('+==========================================================================+');
	writeln ('#NO|    X0   |    X1   |   X2    |  F(X0)   |  F(X1)  |  F(X2)  |    M     #');
        writeln ('+==|=========|=========|=========|==========|=========|=========|==========+');
	normvideo;

	it:=0;
	writeln(it:2,'  ',X0:9:6,' ',X1:9:6,' ',X2:9:6,' ',f(x0):9:6,'  ',f(x1):9:6,' ',f(x2):9:6,' ',M:9:6);
	repeat

                        X2:=X2-(f(x1)*(x1-x0)/(f(x1)-f(x0)));
                        M:=ABS(X1-X0);
			x0:=x1;
			x1:=x2;
		it:=it+1;

        writeln(it:2,'  ',X0:9:6,' ',X1:9:6,' ',X2:9:6,' ',f(x0):9:6,'  ',f(x1):9:6,' ',f(x2):9:6,' ',M:9:6);
	until M<tol;

	{Output dari hasil Penginputan (hasil akar)}
     writeln;
     write ('Hampiran akar x = ');textcolor(4); write(x2:10:6); normvideo; write(' pada iterasi ke- '); textcolor(4);write(it);
     normvideo; writeln;

3:
  {Optional/pilihan}
  write('Ingin mencoba lagi? '); textbackground(2);write ('1. Ya '); normvideo;textbackground(12);write('2. Tidak');normvideo;
  readln(pil);
  if pil = '1'  then
     begin
          clrscr;goto 1;
     end;
  if pil = '2' then
  begin
  exit;
  end;

  if pil <> '1' then
  begin
  clrscr;
        gotoxy(20,9); write ('                                 ');
        textbackground(11);write('_');normvideo;textbackground(9);write('=');normvideo;textbackground(4);write('X');normvideo;
	gotoxy(20,10);;textbackground(15);textcolor(0);
        gotoxy(20,11);writeln ('                                     ');
        gotoxy(20,12);writeln ('                                     ');
        gotoxy(20,13);writeln ('     MOHON MAAF, NOMOR YANG ANDA     ');
	gotoxy(20,14);writeln ('        MASUKKAN TIDAK BENAR!        ');
        gotoxy(20,15);writeln ('                                     ');
	gotoxy(20,15);writeln ('                                     ');
        gotoxy(20,15);writeln ('                                     ');writeln;writeln;
	normvideo;
        read;gotoxy(20,17);
        goto 3;
        end;
end.

{
X0 = X SEBELUMNYA
X1 = X SEKARANG
X2 = Xr+1
}