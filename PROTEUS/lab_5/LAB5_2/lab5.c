#include <stdio.h>
#include "REG51.h"
void delay (int N)
{ int k;
for (k=0; k<N; k++)
{ TMOD=0x01;
TH0=0xD8;
TL0=0xF0;
TR0=1;
while (!TF0) {};
TR0=0;
TF0=0;
}
}
void main ()
{ int N;
while (1) {
N=50;
P1 = 0x01; 
delay (N);
P1 = 0x02;
delay (N);
P1 = 0x04;
delay (N);
P1 = 0x08;
delay (N);
P1 = 0x10;
delay (N);
P1 = 0x20;
delay (N);
P1 = 0x40;
delay (N);
P1 = 0x80;
delay (N);
}
return;
}