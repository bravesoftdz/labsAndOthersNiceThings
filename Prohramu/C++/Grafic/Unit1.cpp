//---------------------------------------------------------------------------

#include <vcl.h>
#include<stdio.h>
#include<conio.h>
#include<math.h>
#include<stdlib.h>

float f3(float x)
{
        float z;
        z = x*sin(x);
        return z;
}
float  f1(float x)
{
        float z;
        z = sin(x);
        return z;
}
float f2(float x)
{
        float z;
        z = cos(x);
        return z;
}
float f4(float x)
{
        float z;
        z = x*cos(x);
        return z;
}


int main()
{
float Xe[640];
float Ye[640];
int l, g, t, j, gx0, gy0, i,Ne,krokx,kroky,mx,my;
float al,bl,h,krx,kry,maxx,maxy,minx,miny,kx,ky,zx,zy,gx,gy,ax,by,cx,cy;
float xx,yy;
bool grafs = false;
Image1->Canvas->Brush->Style = bsClear;
Image1->Canvas->FillRect(Rect(0,0, Image1->Width, Image1->Height));
try {
al = StrToFloat(Edit1->Text);
bl = StrToFloat(Edit2->Text);
Ne=305;
h=(bl-al)/(Ne-1);
switch (ComboBox1->ItemIndex)
      {
      case 0: {
            Image1->Refresh();
            grafs = false;
            Xe[0] = al;
            for (i=0; i<Ne-1; i++)             //��������� ������� sin(x)
            {
              Ye[i] = f1(Xe[i]);
              Xe[i+1] = Xe[i]+h;
            }
            break;
          }

     case 1: {
            Image1->Refresh();
            grafs = false;
            Xe[0] = al;
            for (i=0; i<Ne-1; i++)             //{��������� ������� cos(x)}
            {
              Ye[i] = f2(Xe[i]);
              Xe[i+1] = Xe[i]+h;
            }
            break;
          }
          
     case 2: {
            Image1->Refresh();
            grafs = false;
            Xe[0] = al;
            for (i=0; i<Ne-1; i++)            //{��������� ������� x*sin(x)}
           {
              Ye[i] = f3(Xe[i]);
              Xe[i+1] = Xe[i]+h;
            }
            break;
          }
          
  }

  switch (ComboBox2->ItemIndex)
  {
    case   0: {
              Image1->Refresh();
              grafs = true;
              Xe[0] = al;
              for (i=0; i<Ne-1; i++)             //{��������� ������� x*sin(x) �� x*cos(x)}
              {
                Ye[i] = f3(Xe[i]);
                Xe[i+1] = Xe[i]+h;
              }
              Xe[Ne+1] = al;
              for (i=Ne+1; i<2*Ne; i++)
              {
                Ye[i] = f4(Xe[i]);
                Xe[i+1] = Xe[i]+h;
              }
              break;
              }
     case   1:  {
              Image1->Refresh();
              grafs = true;
              Xe[0] = al;
              for (i=0; i<Ne-1; i++)              //{��������� ������� sin(x) �� cos(x)}
              {
                Ye[i] = f1(Xe[i]);
                Xe[i+1] = Xe[i]+h;
              }
              Xe[Ne+1] = al;
              for (i=Ne+1; i<2*Ne; i++)
              {
                Ye[i] = f2(Xe[i]);
                Xe[i+1] = Xe[i]+h;
              }
              break;
          }
     case  2:  {
              Image1->Refresh();
              grafs = true;
              Xe[0] = al;
              for (i=0; i<Ne-1; i++)            //{��������� ������� sin(x) �� x*cos(x)}
              {
                Ye[i] = f1(Xe[i]);
                Xe[i+1] = Xe[i]+h ;
              }
              Xe[Ne+1] = al;
              for (i=Ne+1; i<2*Ne; i++)
              {
                Ye[i] = f4(Xe[i]);
                Xe[i+1] = Xe[i]+h;
              }
              break;
          }
    }
l=60;
maxx=Xe[Ne-1];
minx=Xe[0];
maxy=Ye[0];
miny=Ye[0];
for(i=0;i<Ne-1;i++)
{
if (maxy<Ye[i])
{
        maxy=Ye[i];
}
if (miny>Ye[i])
{
        miny=Ye[i];}
}
if (grafs == true)
        for (i=Ne+1; i<2*Ne; i++)
                {
                        if (maxy<Ye[i])
                                maxy = Ye[i];
                        if (miny>Ye[i])
                                miny = Ye[i];
                }
mx=640;
my=480;
kx=(mx-2*l)/(maxx-minx);
ky=(my-2*l)/(miny-maxy);
zx=(mx*minx-l*(minx+maxx))/(minx-maxx);
zy=(my*maxy-l*(miny+maxy))/(maxy-miny);
if (minx*maxx<=0)                 //{"��������" ��}
{gx=0;}
if (minx*maxx>0)
{gx=minx;}
if ((minx*maxx>0) && (minx<0))
{gx=maxx;}
if (miny*maxy<=0)
{gy=0;}
if ((miny*maxy>0) && (miny>0))
{gy=miny;}
if ((miny*maxy>0) && (miny<0))
{gy=maxy;}
gx0=kx*gx+zx;            //{���������� (0,0)}
gy0=ky*gy+zy;

krokx=(mx-2*l)/10;
kroky=(my-2*l)/10;

if (minx* maxx<0)
        cx =(abs(minx)*krokx)/(gx0-l);
else
        cx =(abs(maxx-minx)*krokx)/(mx-2*l);
if (miny*maxy<0)
  cy =(abs(maxy)*kroky)/(gy0-l);
else
  cy =(abs(maxy-miny)*kroky)/(my-2*l);
g = 0;
while ((gx0+g*krokx)<(mx-l))
{        // {�������� ������������ ��� ������ � 1, 4 �������}
  Image1->Canvas->MoveTo(gx0+g*krokx, l);
  Image1->Canvas->LineTo(gx0+g*krokx, my-l);
  Image1->Canvas->Pen->Color = clTeal;
  Image1->Canvas->Pen->Style = psDash;
  Image1->Canvas->Pen->Width = 1;
  if ((gx0+g*krokx)<(mx-l-10))
   {
        Image1->Canvas->MoveTo(gx0+g*krokx, gy0-5);
        Image1->Canvas->LineTo(gx0+g*krokx, gy0+5);
   }
  g = g+1;
}
for (i=1; i<g-1; i++)
  {
    if (minx*maxx<0)
      {
        Image1->Canvas->TextOutA(gx0+i*krokx, gy0+10, FloatToStrF((0+i*cx),ffGeneral,2,5));
      }
    else
        Image1->Canvas->TextOutA(gx0+i*krokx, gy0+10, FloatToStrF((minx+i*cx),ffGeneral,2,5));
   }
g = 0;
while ((gx0-g*krokx)>l)
  {       //{�������� ������������ ��� ������ � 2, 3 �������}
    Image1->Canvas->MoveTo(gx0-g*krokx, l);
    Image1->Canvas->LineTo(gx0-g*krokx, my-l);
    Image1->Canvas->Pen->Color = clTeal;
    Image1->Canvas->Pen->Style = psDash;
    Image1->Canvas->Pen->Width =1;
    Image1->Canvas->MoveTo(gx0-g*krokx, gy0-5);
    Image1->Canvas->LineTo(gx0-g*krokx, gy0+5);
    g=g+1;
  }
for (i=1; i<g-1; i++)
  {
    if (minx*maxx<0)
      Image1->Canvas->TextOutA(gx0-i*krokx, gy0+10, FloatToStrF((0-i*cx), ffGeneral,2,5));
    else
      Image1->Canvas->TextOutA(gx0-i*krokx, gy0+10, FloatToStrF((maxx-i*cx), ffGeneral,2,5));
  }
t = 1;
while ((gy0-t*kroky)>l)
  {             //{�������� �������������� ��� ������ � 1, 2 �������}
    Image1->Canvas->MoveTo(l,gy0-t*kroky);
    Image1->Canvas->LineTo(mx-l,gy0-t*kroky);
    Image1->Canvas->Pen->Color =clTeal;
    Image1->Canvas->Pen->Style =psDash;
    Image1->Canvas->Pen->Width =1;
  Image1->Canvas->MoveTo(gx0-5,gy0-t*kroky);
  Image1->Canvas->LineTo(gx0+5, gy0-t*kroky);
  t = t+1;
}
for (i=1;i<t-1; i++)
  {
    if (miny*maxy<0)
      Image1->Canvas->TextOutA(gx0-28, gy0-i*kroky, FloatToStrF((0+i*cy), ffGeneral,2,5));
  else
      Image1->Canvas->TextOutA(gx0-28, gy0-i*kroky, FloatToStrF((miny+i*cy), ffGeneral,2,5));
  }
t = 1;
while ((gy0+t*kroky)<(my-l))
  {          //{�������� �������������� ��� ������ � 1, 2 �������}
     Image1->Canvas->MoveTo(l, gy0+t*kroky);
     Image1->Canvas->LineTo(mx-l, gy0+t*kroky);
     Image1->Canvas->Pen->Color = clTeal;
     Image1->Canvas->Pen->Style = psDash;
     Image1->Canvas->Pen->Width = 1;
     Image1->Canvas->MoveTo(gx0-5,gy0+t*kroky);
     Image1->Canvas->LineTo(gx0+5, gy0+t*kroky);
     t = t+1;
  }
for (i=1;i<t-1; i++)
  {
    if (maxy*miny<0)
      Image1->Canvas->TextOutA(gx0-28, gy0+i*kroky, FloatToStrF((0-i*cy), ffGeneral,2,5));
  else
      Image1->Canvas->TextOutA(gx0-28, gy0+i*kroky, FloatToStrF((maxy-i*cy), ffGeneral,2,5));
  }
if (minx*maxx<=0)
  if (miny*maxy<=0)
    Image1->Canvas->TextOutA(gx0, gy0+10, FloatToStr((0.0)));     // {�������� ����}
    Image1->Canvas->Pen->Color=clTeal;
    Image1->Canvas->Pen->Style =psSolid;
    Image1->Canvas->Pen->Width =3;
    Image1->Canvas->MoveTo(l, gy0);
    Image1->Canvas->LineTo( floor(mx-l), gy0);
    Image1->Canvas->MoveTo(gx0,l);
    Image1->Canvas->LineTo(gx0,  floor(my-l));
  Image1->Canvas->MoveTo(  floor(mx-l), gy0);                       //{�������� ������}
  Image1->Canvas->LineTo(  floor(mx-l)-10, gy0-5);
  Image1->Canvas->MoveTo(  floor(mx-l), gy0);
  Image1->Canvas->LineTo(  floor(mx-l)-10, gy0+5);
  Image1->Canvas->MoveTo(gx0,l);
  Image1->Canvas->LineTo(gx0-5,l+10);
  Image1->Canvas->MoveTo(gx0,l);
  Image1->Canvas->LineTo(gx0+5,l+10);
  switch (ComboBox3->ItemIndex)
  {
    case   0: {    //{���� ����� �����������}
                Image1->Canvas->Pen->Style = psSolid;
                Image1->Canvas->Pen->Width = 2;

              break;
              }
     case   1:  {    //{���� ����� �����������}
                Image1->Canvas->Pen->Style = psDot;
                Image1->Canvas->Pen->Width = 1;

              break;
          }
     case   2:  {    //{���� ����� �����������}
                Image1->Canvas->Pen->Style = psInsideFrame;
                Image1->Canvas->Pen->Width = 3;

              break;
          }
  }
  Image1->Canvas->MoveTo(floor(kx*Xe[0]+zx), floor(ky*Ye[0]+zy));       // {�������� ������ �������}
      for (i=0; i<Ne-1; i++)
        {
          Image1->Canvas->Pen->Color = clBlue;
          Image1->Canvas->LineTo (floor(kx*Xe[i]+zx),floor(ky*Ye[i]+zy));
        }
        if (grafs == true)
        {
          Image1->Canvas->MoveTo(floor(kx*Xe[Ne+1]+zx), floor(ky*Ye[Ne+1]+zy));     //{�������� ������� �������}
          for (i = Ne+1; i<Ne*2; i++)
          {
            Image1->Canvas->Pen->Color = clAqua;
            Image1->Canvas->LineTo (floor(kx*Xe[i]+zx),floor(ky*Ye[i]+zy));
          }
        }
      }
    catch(EConvertError &e)
    {
       ShowMessage("�������� ����������, �� ����� �� ������� ���");
    }
}
//---------------------------------------------------------------------------

