program Project1;

{$APPTYPE CONSOLE}

uses
    SysUtils;
var a, b, c, d, x1, x2:real;
begin
    writeln('vvedit" a, b, c');
    readln(a, b, c);
    if (a=0) and (b=0)then
    begin
        writeln(' rivnanna e nesymisne');
        readln;
        Halt;
    end;
        if (a=0) and (c=0) then
        begin
            writeln('x1=0');
            readln;
            Halt;
        end;
     if (b=0) and (c=0) then
        begin
            writeln('x1=x2=0');
            readln;
            Halt;
        end;
    if a=0 then
    begin
        writeln('rivnannay ne e kvadratne i mae odun korin');
        x1:=-c/b;
        writeln('x1= ',x1:8:3)  ;
        readln;
        Halt;
    end;
        if b=0 then
        begin
            x1:=sqrt(-c/a) ;
            x2:=-sqrt(-c/a) ;
            writeln('x1=',x1:8:3,'x2=',x2:8:3);
            readln;
            Halt;
        end;
    d:=b*b-4*a*c;
    if d<0 then
    begin
        writeln('diisnyh rozvazkiv nemae');
        readln;
        halt;
    end;
    if d=0 then
    begin
        x1:=(-b)/(2*a);
        writeln('1 rozvazok:x= ',x1:8:3);
        readln;
        halt;
    end;
        x1:=(-b-sqrt(d))/(2*a);
        x2:=(-b+sqrt(d))/(2*a);
        writeln('2 rozvazky ',x1:8:3,x2:8:3);
        readln;
        halt;
end.

