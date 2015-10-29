unit Prdip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtDlgs, ExtCtrls, StdCtrls,jpeg, TeEngine, Series, TeeProcs,
  Chart,Math;
  Type mas=array [1..256] of real48;
      mas2=array [1..256,1..256] of real48;
type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    Edit1: TEdit;
    Label1: TLabel;
    Image3: TImage;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Chart1: TChart;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    N12: TMenuItem;
    Image2: TImage;
    Image1: TImage;
    N13: TMenuItem;
    N6: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Image4: TImage;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    Label2: TLabel;
    N20: TMenuItem;
    Series1: TBarSeries;
    N21: TMenuItem;
    N901: TMenuItem;
    N1801: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;

    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N901Click(Sender: TObject);
    procedure N1801Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);

  private
    { Private declarations }

    nh,nw,n,k:integer;
    a,b:array[1..256,1..256] of byte;
    c,d:array[0..255] of longword;
    imre,imim,imre1,imim1:mas2;
    cl:TColor;
    imet:byte;
    cmax:real48;
    bgist,bspk:boolean;
  public
    { Public declarations }
         Bitmap1,Bitmap2,Bitmap3,Bitmap4: TBitmap;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
procedure pfur( d,n:integer; var xre,xim:mas);
label 1,2,3;
var k,l,l1,l2,i,j,i1,n2,m1,m:integer;
    u1,u2,u3,a2,c,s,t1,t2,t3,t4:real;
begin
  m:=0;
  repeat m:=m+1 until((n-1) shr m)=0;
  n2:= n div 2; l2:=n+n; l1:=n;
  for l:=1 to m do
    begin
      l2:=l2 div 2;
      l1:=l1 div 2;
      u1:=1.0; u2:=0.0;
      a2:=pi/l1; c:=cos(a2); s:=d*sin(a2);
      for j:=1 to l1 do
        begin
          i:=j; while i<=n do
                  begin
                    i1:=i+l1;
                    t1:=xre[i]+xre[i1];
                    t2:=xim[i]+xim[i1];
                    t3:=xre[i]-xre[i1];
                    t4:=xim[i]-xim[i1];
                    xre[i1]:=t3*u1-t4*u2;
                    xim[i1]:=t4*u1+t3*u2;
                    xre[i]:=t1; xim[i]:=t2;
                    i:=i+l2;
                  end;
          u3:=u1*c-u2*s;
          u2:=u2*c+u1*s; u1:=u3;
        end;
    end;
  m1:=n-1; j:=1;
  for i:=1 to m1 do
    begin
      if i>=j then goto 1;
      t1:=xre[j]; t2:=xim[j];
      xre[j]:=xre[i];
      xim[j]:=xim[i];
      xre[i]:=t1; xim[i]:=t2;
   1: k:=n2;
   2: if k>=j then goto 3;
      j:=j-k;
      k:=k div 2;
      goto 2;
   3: j:=j+k;
    end;
  if d=-1 then for i:=1 to n do begin
        xre[i]:=xre[i]/n; xim[i]:=xim[i]/n;end;
end;

procedure pfur2(d,n:integer; var imre,imim:mas2);
var i,k:integer;
    xre,xim:mas;
begin

  for k:=1 to n do begin
    for i:=1 to n do
      begin
        xre[i]:=imre[i,k];
        xim[i]:=imim[i,k];
      end;
    pfur(d,n,xre,xim);
    for i:=1 to n do
      begin
      imre[i,k]:=xre[i]; imim[i,k]:=xim[i]; end;
    end;
  for i:=1 to n do begin
    for k:=1 to n do
      begin
      xre[k]:=imre[i,k]; xim[k]:=imim[i,k]; end;
    pfur(d,n,xre,xim);
    for k:=1 to n do
      begin
       imre[i,k]:=xre[k]; imim[i,k]:=xim[k]; end;
    end;
end;


                 {������}
procedure TForm1.N3Click(Sender: TObject);
var i,j:integer;
    fname:string;
    c:byte;
    jp: TJPEGImage;
begin
  Bitmap1 := TBitmap.Create;
  jp := TJPEGImage.Create;
   if OpenPictureDialog1.Execute then
     fname:=OpenPictureDialog1.FileName;
          if (Extractfileext(fname)='.bmp') or (Extractfileext(fname)='.BMP')
          then Bitmap1.LoadFromFile(fname);
         if Extractfileext(fname)='.jpg'
           then
            begin
                jp.LoadFromFile(fname);
                Bitmap1.Assign(jp);
            end;
    Image1.Picture.Assign(BitMap1);
    nh:=256;
    nw:=256;
    n:=nh*nw;
    for i:=1 to nh do
      for j:=1 to nw do
         begin
         c:=Lo(BitMap1.Canvas.Pixels[i,j] and $000000FF);
        a[i,j]:=c;
         end;
   bgist:=False;
   bspk:=False;
end;

                {��������������}
procedure TForm1.N5Click(Sender: TObject);
begin
    Label1.Visible:=True;
    Label2.Visible:=True;
    Label1.Caption:='������ ���������� ������������� :';
    Edit1.Visible:=True;
    Edit1.SetFocus;
    imet:=1;
end;

procedure TForm1.N6Click(Sender: TObject);
                {������ ���'�}
var  i,j:integer;
     r:real48;
     spim,j1,i1:byte;
begin
  for i:=1 to nh do
     for j:=1 to nw do
       begin
       imre[i,j]:=a[i,j];
       imim[i,j]:=0;
       end;
     pfur2(-1,nh,imre,imim);
   cmax:=0;
   for i:=1 to nh do
     for j:=1 to nw do
       begin
       r:=sqrt(sqr(imre[i,j])+sqr(imim[i,j]));
       if cmax<r then cmax:=r;
       end;
    Bitmap2:= TBitmap.Create;
    Bitmap2.PixelFormat := pf24bit;
    Bitmap2.Width := Image2.Width;
    Bitmap2.Height := Image2.Height;
    for i:=1 to nh do
     for j:=1 to nw do
       begin
         spim:=round(2000*ln(sqrt(sqr(imre[i,j])+sqr(imim[i,j]))/cmax*255+1));
         cl:=spim+256*spim+65536*spim;
         j1:=127+j; i1:=127+i;
         BitMap2.Canvas.Pixels[j1,i1]:=cl;
       end;
     Image2.Picture.Assign(Bitmap2);
     bspk:=True;
end;


procedure TForm1.N7Click(Sender: TObject);
                    {�� �����}
var  i,j:integer;
     spim:byte;
begin
    Bitmap1:= TBitmap.Create;
    Bitmap1.PixelFormat := pf24bit;
    Bitmap1.Width := Image1.Width;
    Bitmap1.Height := Image1.Height;


     Image1.Picture.Assign(Bitmap1);
     bgist:=False;
     bspk:=False;
end;

procedure TForm1.N8Click(Sender: TObject);
               {ó�������� -> c}
var i,j:integer;
begin
   Chart1.Visible:=True;
   Series1.Clear;


   bgist:=True;
end;

procedure TForm1.N9Click(Sender: TObject);
                {����������� ���������}
var i,j:integer;
begin
   if not bgist then N8Click(Self);


     Image3.Picture.Assign(Bitmap3);
end;

procedure TForm1.N10Click(Sender: TObject);
                {����� ���������}
begin
    Label1.Visible:=True;
    Label2.Visible:=True;
    Label1.Caption:='����������:';
    Edit1.Visible:=True;
    Edit1.SetFocus;
    imet:=2;
end;

procedure TForm1.N11Click(Sender: TObject);
                  {��������}
var fname:string;
begin
  if SavePictureDialog1.Execute
  then
    begin
    fname:=SavePictureDialog1.FileName+'.bmp';
    BitMap3.SaveToFile(fname);
    end
    else
      Application.MessageBox('����� �� �������','������� ������',MB_OKCANCEL);
end;

procedure TForm1.N12Click(Sender: TObject);
                {�����������}
  begin
    Label1.Visible:=True;
    Label2.Visible:=True;
    Label1.Caption:='������ ������� ���� ���������:';
    Edit1.Visible:=True;
    Edit1.SetFocus;
    imet:=3;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    BitMap3:= TBitmap.Create;
    BitMap3.PixelFormat := pf24bit;
    BitMap3.Width := Image3.Width;
    BitMap3.Height := Image3.Height;
    bgist:=False;
    bspk:=False;
end;

procedure TForm1.N15Click(Sender: TObject);
                {����� ���}
begin
  Label1.Visible:=True;
  Label2.Visible:=True;
  Label1.Caption:='������ ���������� ����:';
  Edit1.Visible:=True;
  Edit1.SetFocus;
  imet:=4;
end;

procedure TForm1.N16Click(Sender: TObject);
                {��������� ���}
begin
  if not bspk then N6Click(Self);
  Label1.Visible:=True;
  Label2.Visible:=True;
  Label1.Caption:='������ ������� ����:';
  Edit1.Visible:=True;
  Edit1.SetFocus;
  imet:=5;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i1,j1,spim:byte;
    i,j,k1:integer;
    ls:longint;
    r:real48;
  begin
  if Key=VK_RETURN then
    begin
    case imet of
    1:begin
        {dyskr}
       k:=StrToInt(Edit1.Text);


      end;
      2:begin
     {Stysk}
     k:=StrToInt(Edit1.Text);

      end;
         3:begin
        {Kvant}
    k:=StrToInt(Edit1.Text);


        end;
        4:begin
     {Shym}
  k:=StrToInt(Edit1.Text);


        end;
        5,6:begin
     {FNCh}
   Chart1.Visible:=False;
   k:=StrToInt(Edit1.Text);


     end;
       7:begin
             k:=StrToInt(Edit1.Text);

            
         end; {7}
    end; {case}
    case imet of
      1..4,7:
          begin
            for i:=1 to 256 do
              for j:=1 to 256 do
                begin
                  cl:=b[i,j]+256*b[i,j]+65536*b[i,j];
                  BitMap3.Canvas.Pixels[i-1,j-1]:=cl;
                end;
             Image3.Picture.Assign(BitMap3);
           end;
         5,6:begin
           Bitmap4:= TBitmap.Create;
           Bitmap4.PixelFormat := pf24bit;
           Bitmap4.Width := Image4.Width;
           Bitmap4.Height := Image4.Height;
           for i:=1 to 256 do
             for j:=1 to 256 do
               begin
                 spim:=round(2000*ln(sqrt(sqr(imre1[i,j])+sqr(imim1[i,j]))/cmax*255+1));
                 cl:=spim+256*spim+65536*spim;
                 j1:=127+j; i1:=127+i;
                 BitMap4.Canvas.Pixels[j1,i1]:=cl;
                end;
            Image4.Picture.Assign(Bitmap4);
            end;
         end;  {case}
  end;
end;

procedure TForm1.N17Click(Sender: TObject);
        {�������� ���}
var i,j:integer;
begin
  pfur2(1,nh,imre1,imim1);
  for i:=1 to 256 do
    for j:=1 to 256 do
      b[i,j]:=round(imre1[i,j]);
  for i:=1 to 256 do
    for j:=1 to 256 do
      begin
        cl:=b[i,j]+256*b[i,j]+65536*b[i,j];
        BitMap3.Canvas.Pixels[i-1,j-1]:=cl;
      end;
  Image3.Picture.Assign(BitMap3);
end;

procedure TForm1.N18Click(Sender: TObject);
                {��������� ���}
begin
  Label1.Visible:=True;
  Label2.Visible:=True;
  Label1.Caption:='������ ������� ����:';
  Edit1.Visible:=True;
  Edit1.SetFocus;
  imet:=6;
end;

procedure TForm1.N19Click(Sender: TObject);
                {ѳ�� � ������}
begin
  Label1.Visible:=True;
  Label2.Visible:=True;
  Label1.Caption:='������ ���������� ���� (<32000):';
  Edit1.Visible:=True;
  Edit1.SetFocus;
  imet:=7;
end;
                    {����}
procedure TForm1.N20Click(Sender: TObject);
var i,j:integer;
     r:byte;
begin
  Label1.Visible:=False;
  Label2.Visible:=False;
  Edit1.Visible:=False;
  for i:=1 to 255 do
    for j:=1 to 255 do
      begin
      r:=a[i,j];
      a[i,j]:=b[i,j];
      b[i,j]:=r;
      BitMap1.Canvas.Pixels[i-1,j-1]:=a[i,j]+a[i,j] shl 8+a[i,j] shl 16;
      BitMap3.Canvas.Pixels[i-1,j-1]:=r+r shl 8+r shl 16;
      end;
    Image3.Picture.Assign(BitMap3);
    Image1.Picture.Assign(BitMap1);
end;

        {������� �� 90 �������}
procedure TForm1.N901Click(Sender: TObject);
begin

end;

          {������� �� 180 �������}
procedure TForm1.N1801Click(Sender: TObject);
begin

end;

        {������� �� ������� ���}
procedure TForm1.N23Click(Sender: TObject);
begin
  
end;
                   {��������} 
procedure TForm1.N24Click(Sender: TObject);
begin

end;
                    {��������}
procedure TForm1.N25Click(Sender: TObject);
begin
  Label1.Visible:=True;
  Label2.Visible:=True;
  Label1.Caption:='������ ���������� ��������� (<?????):';
  Edit1.Visible:=True;
  Edit1.SetFocus;
end;

end.
