program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a, b, c, z, E:Real;
    k, kmax:integer;
Function F(x:Real):Real;
begin
    F:=x*x-4;
end;
BEGIN
    Writeln ('Vvedit korektni DODATNI mezi a, b' );
    Readln (a, b) ;
    Writeln ('Vvedit velychyny poxybku znaxodzenna korena E= ta maksymalny kilkist iteraziy kmax=' ) ;
    Readln (E, kmax) ;
    if (a<0) or (b<0) then
    begin
        writeln('Shanovnuy korustyvach, vam potribni okylyaru');
        readln;
        halt;
    end;
    if abs(b-a)<(2*E) then
    begin
        writeln ('vvedeni mezi nadto mali');
        readln;
        halt;
    end;
    if E<=0 then
    begin
        writeln ('Shanovnuy korustyvach, z vashoy pohubkoy znaytu korin ne mozluvo');
        readln;
        halt;
    end;
    if kmax<0 then
    begin
        writeln ('Shanovnuy korustyvach, kilkist iteraziy ne moze bytu vidjemna');
        readln;
        halt;
    end;
    if a=b then
    begin
        if abs(F(a))<E then
            writeln ('Vvedena vamu tochka je korenem rivnaynnay')
        else
            writeln ('vvedeni mezi je nekorektni');
        readln;
        halt;
    end;
    if a>b then
    begin
        z:=a;
        a:=b;
        b:=z;
    end;
    k:=0;
    if abs(F(a))<E then
    begin
        writeln ('korenem je meza a=', a);
        readln;
        halt;
    end
    else
    if abs(F(b))<E then
    begin
        writeln ('korenem je meza b=', b);
        readln;
        halt;
    end;
        repeat
            c:=0.5*(b-a)+a;
            k:=k+1;
            if F(a)*F(c)>0 then a:= c else b:=c;
            if k>kmax then
            begin
                writeln ('vvedeni mezi e nekorektni abo za zadanu kilkist iteraziy  znaytu korin ne mozlyvo');
                readln;
                halt;
            end;
        until (abs(F(c))<E);
        writeln ('korin x=', c:15:5, ' za K=', k, ' podiliv');
    readln;
    readln;
END.