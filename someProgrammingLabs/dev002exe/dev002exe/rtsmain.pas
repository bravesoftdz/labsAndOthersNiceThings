//******************************************************************************
// Author : Georgy Moshkin
// -----------------------------------------------
// email  : tmtlib@narod.ru
// WWW    : http://www.tmtlib.narod.ru/
//
// License:
// --------
// This unit is freely distributable without licensing fees and is
// provided without guarantee or warrantee expressed or implied. This unit
// is Public Domain. Feel free to use or enhance this code. You can use the
// program for any purpose you see fit.
//
//******************************************************************************

unit rtsmain;

interface

uses BMP,OpenGL,_strman,sysutils,math,windows,_vec2d, Dialogs;


// ��� ��� �������� �������� (���������, ���������� � �.�.)
type TEnergia=record
               nazv  :string; // �������� ������� ��� ����
               max   :single; // ����������� ��������� �������
               vosst :single; // �������� �������������� �������
              end;

// ��� ��� �������� ��������� ������
type TUdar=record
            nazv       :string; // �������� �����
            chto       :string; // ����� ������� ��������� (��������� ��� ���������� � �.�.)
            sila       :single; // ���� ����� (������� ������� ������� ��� �����)
            treb_energ :string; // ��������� �� ��� ����� �����-������ ������ �������
            rash_energ :single; // ������ ������ ������� (���� ��� ���������)
           end;

// ��� ��� �������� ������ ��������
type TDobicha=record
               nazv   :string; // ��� ����� ������ ����
               kolvo  :single; // � ����� ���������� �� ���� ����� (������� ����� ����� � �����)
               vrem   :single; // �����, �� ������� ���� ������ ��������� ���� ����� / ������� ������ � �.�.
              end;

// ��� ��� �������� ���� ������
type TCena=record
            nazv    :string; // �������� ���������� ������� (��������, ������)
            kolvo   :single; // ���� � �������� NAZV
            vrem    :single; // �����, �� ������� ����� ������ ������ � ������ ����������
           end;

// ��� ��� �������� ���������� ����-����
type TKolvo=record
             nazv   :string; // �����, ��� ����� ���������
             kolvo  :single; // ���������� ����� �����
            end;

// ��� ��� �������� ��������
type TUpgrade=record
               nazv    :string; // �������� �����, � ������� �����������
               cena    :array of TCena;   // ������� ����� ����� ������� (������ - ������, ������, ����� � �.�.)
               kolvo   :array of TKolvo;  // ���������� ��������� ��� �������� �������� (����, ������� � �.�.)
              end;

// ��� ��� �������� ������ ��������
type TKadri=record
             texturnum:integer;     // ����� �������� �� ���������
             kadr:array of integer; // ������ ������ (������ ����� �� ���������)
            end;

// ��� ��� �������� �����
type TOpisan=record
              nazv     :string; // �������� ����� (��� ������)
              nazvdisp :string; // ������������ �� ������ �������� (��� ����, ��� ������ � ����)

              spritestex   :array of GLUINT;     // OpenGL-������ ������������� ��������
              posledovatelnost: array of TKadri; // �������� ������� � ��������������������
                                                 // ��������. �������� ���������: 0 - ������,
                                                 // 1 - �����, 2 - �������, 3 - �������������� ������ (� ������ ������)

              radius     : single;  // ������ ��������� ������ ����� ���������� - ������ ��� ��������� �������� ������������

              XSize,YSize:integer;  // ������� �������� �� ���������
              sprX, sprY : integer; // ������� ������� (��������� ������ � ������� �������� �� ���������)

              energia  :array of TEnergia; // ���� ������� �����
              skorost  :array of single;   // ���� �������� ����� (����������� ������������� �� �����, ����, ������ � �.�.)
              udar     :array of TUdar;    // ���� ������, �������� ������� ����
              stroyka  :array of string;   // ������ - �������� ������, ������� ����� ������� ������ ����
              remont   :array of string;   // ������ � ���������� ������, ������� ����� ������ ������ ����
              dobicha  :array of TDobicha; // ����� ������� ����� �������� ����
              upgrade  :array of TUpgrade; // �� ��� ����� ������������ ������ ����

              cena     :array of TCena;  // ���� ����� (���������� � ��������)
              neobh    :array of TKolvo; // ����������� ��� �������� ����� �������

              resurs    :boolean;  // �������� �� ������ ���� �������� (������, ��������, �������� �����)
              resursmax :single;   // ������������ ������� ������� (������� ������ � ���������)

             end;


// ��� ������������ ��� �������� �������� ���� ������ ������ �����
type TRassa = record
               Opisan:array of TOpisan; // ������ � ���������� ������
              end;

// ������ ��� �������� ���� ����������� ����
var Rassa:array of TRassa;

// ������ ��� �������� �������
type TIgrok = record
                Resurs:array[0..2] of single; // �������, ������� ����� ������ �����
                AI:boolean; // ����������� �� ������ ����� � ������� ������������� ���������� (AI)
              end;

// ����������: ����� ����� ���� ����, � ������� - �����
// ������ ����� ������


// ������ ��� �������� ������ ������� 0,1,2,3
var Igroki:array[0..3] of TIgrok;

// ���, ������� ������ ��� �������� ���������� ����������������� �����
type TObyekt = record
nomRas:integer; // ����� �����
nomTip:integer; // ����� ���� -nomTip- ������ ������ ����� -nomRas-
nomDru:integer; // ����� ������

energia :array of single; // �������� ������� �����
resurs  :array of single; // �������� ������� ��������

pos:TVector2; // ��������� ����� - ����� (pos.x, pos.y)
phi :single;  // ���� �������� ����� (� ��������)

TekushKadr:single;  // ������� ���� ��������
TekushPosl:integer; // ������� ������������������ (������, �����, ����� ��������, ���� � �.�.)

TipAtaki:integer; // ��������� ��� �����

MISL1:string; // ������ ����� - �������. ��� � ����������
MISL2:string; // ������ ����� - ��������������. ���, ����� ������� ����������

// ����������: ����� ����, ��� ������� ����� ���������,
// �� � ����� ���������� ��������������:
//
// MISL1:=MISL2
// MISL2:=''
//
// � �������������� ����������.

MISLPROGRESS:integer; // �������� ���������� �����

vibran:boolean; // ������ �� ������ ����

end;

// ������ ��� �������� �������� (�������� ������ ���� - ��� �� ��������������� �����)
var Obyekti:array of TObyekt;

// ����������:
//
// ����� ������������ ����� ����������� � ���,
// ��� ������ ����� ��� ���� �� ������ ����������
// ��������. �� �� ��������� ������ ������������
// ���������, � � �������������� ����������
// �� ������� nomRas � nomTip (����� ����� � ����� ����)


// ����� ������� �������, ���� ������ ����� �� �����
var Komanda:integer=0;

// ����-�� �����-������ ���� ��� �������� �����
var KtoNibudPodKursorom:integer=-1; // ������������� �������� - ��� �������� ������ ���

// �������������, ����������� �� OpenGL-������ ��������, � ������� ��������
// ������� ����� (������, ������� � �.�.)
var MapTexture:GLUINT;

// ���������� �� ������� � ���� �������? true/false
var showEnerg:boolean;

// ��������� ������� ������ (sprX,sprY) �� �������� (XSize,YSize)
procedure Kvadrat(XSize, YSize, sprX, sprY, strok, stolb:integer; flip:boolean);
// XSize, YSize - ������� ��������
// sprX, sprY - ������� ������� ������ ���� ��������
// strok, stolb - ����� ������ � �������, � ������� ��������� ������
// flip (true/false) - ������� �� ���������� �����������

// ��������� �������� �����
procedure ZagruzRassa(fname,fpath:string);
// ������ ����� �����:
///
// ���_�������_����_������.txt
// ���_�������_����_������.txt
// ���_��������_����_������.txt
// ���_���������_����_������.txt
// ...
// � �.�.
//
// fname - ��� �����. ��������, orki.txt
// fpath - ���� � �����

// ��������� �������� �������� ������
procedure ZagruzOpisan(fname:string;var fRassa:TRassa);
// ����������� ���� � ��������� fname.txt
// � ����� fRassa


// ��������� �������� ������ ������� (������ �����)
procedure NewObyekt(nomRas, nomTip, nomDru:integer;x,y,phi:single);
// ������ ����� ���� ���� -nomTip-,
// �������� �������� ���������� � ����� nomRas.
//
// ����������:
// ����� ������ nomDru � ������ �����,
// ������� � ��������� nomDru ����� ��������
// �����������
//
// x,y,phi - ��������� ��������� ����� � 2-D ������������.


// ��������� ��� ������ ������� � ������ ���������� �������
// � ������ ��������
procedure SuperKvadrat(nomerObj,nomerPosl:integer);
//
// nomerObj - ����� �����, ������� ���������� �������
// nomerPosl - ����� ������������������
//
// �������� nomerPosl:
// -1 - ����� �������
// 0 - ������
// 1 - �����/����� ��������
// 2 - �������
// 3 - ������ � ������ (�������������� ������ ������)
//
// ����������:
// � ����������� �������� �� ����� �� ������ ���������:
//
// )�������
// 0 1
// 0 1
// 0 1
// 0 1
//
// ���� �������� ������� �� ����� �������� ����� ����.
// ��� ��� � ������ ������ ������ ������ ���� ���� (1)
// ������� �������� (0), �� �������� �� �����


// ��������� �������� ��������, � �������
// �������� ������� �����, ������ � �.�.
procedure LoadMapTexture;

// ��������� ���������� ���� ������
procedure RenderObjects;

// ��������� ���������� (��������� �� �����) �����
procedure RenderKarta;

// ���������, ����������� ������������ ���������
// ��� ������ playerNum
procedure Intellekt(playerNum:integer);

// ������������� ������
procedure InterpretirovatMisli;

// ����������: ��� ������ ��������� InterpretirovatMisli
// ���������� ������ ����������� MISL1 � MISL2 �������
// �����. �� ������ ������� ������������ ���������
// ���������� � ����������� � ������������, ��������� �
// ������� ����������� ������.


// ��������� ��� ����������� �������
procedure Kursor(tip:integer;dx:single);

// ��������� ��� �������� ������������ � ���������� "��������"
function Centurus(var center1,center2:TVector2;radius1,radius2:single;tip1,tip2:integer):boolean;

// ��������� ��� ��������, ��������� �� ���� i ��� �������� (kursx, kursy)
function podkursorom(i:integer;kursx,kursy:single):boolean;

// ��������� �������������
procedure NujnoDogonyat(i,j:integer);
// i,j - ������ ������
//
// ������ ��������� ����������, �����
// ����� i � j ��������� ������ ���� �� �����
//
// ����� ������� Centurus ����� false,
// ���������� NujnoDogonyat
//
// ������� �����: ���� � ����� ������� ����� - �����,
// �� ���� ������� ������, �� ������
// ������� ����� - �������,
// � �������������� ����� - �����
//
// ��� ������ �� ������� ����� (����), �� Centurus
// ������ true, � �� ������� Stolknulsa


// ��������� ����������
procedure Stolknulsa(i,j:integer);
// i,j - ������ ������
//
// ������ ��������� ��������� ��������� ���� ������������:
// - ������������ ��� ������ ������
// - ������������ ����� ������ (����� NujnoDogonyat)
//
// ���� ��������� ����������� ��� ������, �� �����
// ����� ������� ������� ����� - �����, ������� ��
// ������ �������������� � ��������� NujnoDogonyat

function BlizhZolotnik(objnum:integer):integer;


implementation

//                  ��������      ������    ������  �������
procedure Kvadrat(XSize, YSize, sprX, sprY, strok, stolb:integer; flip:boolean);
begin

if (flip=true) then // ������� � ���������� ����������
begin
glBegin(GL_QUADS);
glTexCoord2f( (SprX+(stolb-1)*sprX)/XSize, 1-(sprY+(strok-1)*sprY)/YSize); glVertex2f(0,0);
glTexCoord2f( (0+(stolb-1)*sprX)/XSize, 1-(sprY+(strok-1)*sprY)/YSize); glVertex2f(sprX,0);
glTexCoord2f( (0+(stolb-1)*sprX)/XSize, 1-(0+(strok-1)*sprY)/YSize);glVertex2f(sprX,sprY);
glTexCoord2f( (SprX+(stolb-1)*sprX)/XSize, 1-(0+(strok-1)*sprY)/YSize);glVertex2f(0,sprY);
glEnd;
end
 else // ������� ��� ����������� ���������
begin
glBegin(GL_QUADS);
glTexCoord2f( (0   +(stolb-1)*sprX)/XSize, 1-(sprY+(strok-1)*sprY)/YSize); glVertex2f(0,0);
glTexCoord2f( (SprX+(stolb-1)*sprX)/XSize, 1-(sprY+(strok-1)*sprY)/YSize); glVertex2f(sprX,0);
glTexCoord2f( (SprX+(stolb-1)*sprX)/XSize, 1-(0+(strok-1)*sprY)/YSize);glVertex2f(sprX,sprY);
glTexCoord2f( (0   +(stolb-1)*sprX)/XSize, 1-(0+(strok-1)*sprY)/YSize);glVertex2f(0,sprY);
glEnd;
end;

end;


// �������� �����
procedure ZagruzRassa(fname,fpath:string);
var f:text;
    s:string;
begin
 assignFile(f,fpath+fname); // ��������� ����
 reset(f);

 SetLength(Rassa,Length(Rassa)+1); // ����������� ����� ������� Rassa �� �������

 // ����������:
 // ��� ����� ������ ���������� ������������ ��������
 // � ������� SetLength
 //
 // �� ����� ����� � ������� Length(Rassa), ����������� �� 1 (+1)
 // � ����������� � SetLength ����� �������� Length(Rassa)+1
 //
 // ��������, ���� ������ ������� ��� 10,
 // �� ��������� SetLength(Rassa, 10+1)
 // � ����� ������ 11.
 //
 // ��� ��������� ������ - ����� �������� �� �������
 // � �.�..


 repeat
  readln(f,s); // ��������� � ���������� S �������� �����
  zagruzOpisan(fpath+s,Rassa[length(rassa)-1]); // ��������� ����
 until eof(f);

 // ����, ����� �� ������ ��������
 // ����� ��� ������ ������� ����� F
 // ������� ��������� �������� ��������
 // �����.
 //
 // ��������, ���� F �������� ���������:
 //
 // krestyanin.txt
 // baza.txt
 // zolotnik.txt
 //
 // ��� ��������, ��� � ����� REPEAT-UNTIL
 // ��� ���� ��������� ��������� zagruzOpisan:
 //
 // 1) zagruzOpisan('krestyanin.txt',0)
 // 2) zagruzOpisan('baza.txt',1)
 // 3) zagruzOpisan('zolotnik.txt',2)
 //
 // �������� ��������, ��� ���� �������� � �����������
 // ���� �����, �� ��� �������
 // �� ����� �� ������ ������� ��������� �����,
 // ��������� �� ����� ������ ��������
 //
 // ���� � ���, ��� � ������ ������� ����
 // ������������� resurs:boolean
 //
 // ������� ������ ����� ��� ����� ����������
 // ��������.
 //
 // ��������� ������������ �� ������ ������ 555
 // (nomDru=555)


 closeFile(f); // ��������� ����
end;

// ���������-������ ������ � ����������
procedure ZagruzOpisan(fname:string;var fRassa:TRassa);
var f         :text;
    razdel    :string; // ���������� ��� �������� ����� �������
    podrazdel :string; // ���������� ��� �������� ����� ����������
    s         :string;
    i         :integer;
    j         :integer;
    k         :integer;
    m         :integer;
    n         :integer;

begin
 assignFile(f,fname);  // ��������� ����
 reset(f);

  repeat // � ����� ��������� ��� ������

   readln(f,s); // �������
   s:=trim(s);  // ������ ������ ������� ��� �����

   if s<>'' then // ���� ��� �� ������ ������
    begin

     if s[1]=')' then razdel:=StringWordGet(s, ')',1) // ������ ������
      else
     if s[1]=']' then podrazdel:=StringWordGet(s, ']',1) // ������ ���������
      else
       begin

       // ����� ������ ������� � ����������
       //
       // ����������: �������� ������� StringWordGet
       // �� ������ ����� � ����� _strman.pas

        if razdel='��������' then
         begin
          SetLength(fRassa.Opisan,
                    length(fRassa.Opisan)+1);
          i:=length(fRassa.Opisan)-1;
          fRassa.Opisan[i].nazv:=StringWordGet(s, ' ',1);
          fRassa.Opisan[i].nazvdisp:=StringWordGet(s, ' ',2);

          fRassa.Opisan[i].resurs:=false;
         end;

        if razdel='�������' then
         begin
          SetLength(fRassa.Opisan[i].SpritesTex,
                    length(fRassa.Opisan[i].SpritesTex)+1);
          j:=length(fRassa.Opisan[i].SpritesTex)-1;

          LoadTexture(s,fRassa.Opisan[i].SpritesTex[j]);
         end;

        if razdel='�������' then
         begin
          SetLength(fRassa.Opisan[i].posledovatelnost,
                    length(fRassa.Opisan[i].posledovatelnost)+1);
          j:=length(fRassa.Opisan[i].posledovatelnost)-1;

          m:=StringWordCount(s,' ')-1;

          setlength(fRassa.Opisan[i].posledovatelnost[j].kadr,m);

          fRassa.Opisan[i].posledovatelnost[j].texturnum:=StrToInt(StringWordGet(s, ' ',1));

          for n:=2 to 2+m-1 do
           fRassa.Opisan[i].posledovatelnost[j].kadr[n-2]:=StrToInt(StringWordGet(s, ' ',n));



         end;


    if razdel='���������' then
         begin
           fRassa.Opisan[i].radius:=StrToInt(StringWordGet(s, ' ',1));
           fRassa.Opisan[i].XSize:=StrToInt(StringWordGet(s, ' ',2));
           fRassa.Opisan[i].YSize:=StrToInt(StringWordGet(s, ' ',3));
           fRassa.Opisan[i].sprX:=StrToInt(StringWordGet(s, ' ',4));
           fRassa.Opisan[i].sprY:=StrToInt(StringWordGet(s, ' ',5));
         end;


        if razdel='�������' then
         begin
          SetLength(fRassa.Opisan[i].energia,
                    length(fRassa.Opisan[i].energia)+1);
          j:=length(fRassa.Opisan[i].energia)-1;

          fRassa.Opisan[i].energia[j].nazv:=StringWordGet(s, ' ',1);
          fRassa.Opisan[i].energia[j].max:=StrToFloat(StringWordGet(s, ' ',2));
          fRassa.Opisan[i].energia[j].max:=StrToFloat(StringWordGet(s, ' ',3));
         end;

       if razdel='��������' then
        begin
         SetLength(fRassa.Opisan[i].skorost,
                   length(fRassa.Opisan[i].skorost)+1);
         j:=length(fRassa.Opisan[i].skorost)-1;

         fRassa.Opisan[i].skorost[j]:=StrToFloat(StringWordGet(s, ' ',2));
        end;

      if razdel='����' then
       begin
         SetLength(fRassa.Opisan[i].udar,
                   length(fRassa.Opisan[i].udar)+1);
         j:=length(fRassa.Opisan[i].udar)-1;

         fRassa.Opisan[i].udar[j].nazv:=StringWordGet(s, ' ',1);
         fRassa.Opisan[i].udar[j].chto:=StringWordGet(s, ' ',2);
         fRassa.Opisan[i].udar[j].sila:=StrToFloat(StringWordGet(s, ' ',3));
         fRassa.Opisan[i].udar[j].treb_energ:=StringWordGet(s, ' ',4);
         fRassa.Opisan[i].udar[j].rash_energ:=StrToFloat(StringWordGet(s, ' ',5));

       end;

      if razdel='�������' then
       begin
         SetLength(fRassa.Opisan[i].stroyka,
                   length(fRassa.Opisan[i].stroyka)+1);
         j:=length(fRassa.Opisan[i].stroyka)-1;

         fRassa.Opisan[i].stroyka[j]:=s;
       end;

      if razdel='������' then
       begin
         SetLength(fRassa.Opisan[i].remont,
                   length(fRassa.Opisan[i].remont)+1);
         j:=length(fRassa.Opisan[i].remont)-1;

         fRassa.Opisan[i].remont[j]:=s;
       end;

      if razdel='������' then
       begin
         SetLength(fRassa.Opisan[i].dobicha,
                   length(fRassa.Opisan[i].dobicha)+1);
         j:=length(fRassa.Opisan[i].dobicha)-1;

         fRassa.Opisan[i].dobicha[j].nazv:=StringWordGet(s, ' ',1);
         fRassa.Opisan[i].dobicha[j].kolvo:=StrToFloat(StringWordGet(s, ' ',2));
         fRassa.Opisan[i].dobicha[j].vrem:=StrToFloat(StringWordGet(s, ' ',3));

       end;

      if (razdel='�������') and (podrazdel='��������') then
       begin
         SetLength(fRassa.Opisan[i].upgrade,
                   length(fRassa.Opisan[i].upgrade)+1);
         j:=length(fRassa.Opisan[i].upgrade)-1;

         fRassa.Opisan[i].upgrade[j].nazv:=s
       end;

      if (razdel='�������') and (podrazdel='�������') then
       begin
         SetLength(fRassa.Opisan[i].upgrade[j].cena,
                   length(fRassa.Opisan[i].upgrade[j].cena)+1);
         k:=length(fRassa.Opisan[i].upgrade[j].cena)-1;

         fRassa.Opisan[i].upgrade[j].cena[k].nazv:=StringWordGet(s, ' ',1);
         fRassa.Opisan[i].upgrade[j].cena[k].kolvo:=StrToFloat(StringWordGet(s, ' ',2));
         fRassa.Opisan[i].upgrade[j].cena[k].vrem:=StrToFloat(StringWordGet(s, ' ',3));

       end;

      if (razdel='�������') and (podrazdel='�������') then
       begin
         SetLength(fRassa.Opisan[i].upgrade[j].kolvo,
                   length(fRassa.Opisan[i].upgrade[j].kolvo)+1);
         k:=length(fRassa.Opisan[i].upgrade[j].kolvo)-1;

         fRassa.Opisan[i].upgrade[j].kolvo[k].nazv:=StringWordGet(s, ' ',1);
         fRassa.Opisan[i].upgrade[j].kolvo[k].kolvo:=StrToFloat(StringWordGet(s, ' ',2));
       end;



 if (razdel='����') and (podrazdel='�������') then
       begin
         SetLength(fRassa.Opisan[i].cena,
                   length(fRassa.Opisan[i].cena)+1);
         j:=length(fRassa.Opisan[i].cena)-1;

         fRassa.Opisan[i].cena[j].nazv:=StringWordGet(s, ' ',1);
         fRassa.Opisan[i].cena[j].kolvo:=StrToFloat(StringWordGet(s, ' ',2));
         fRassa.Opisan[i].cena[j].vrem:=StrToFloat(StringWordGet(s, ' ',3));
       end;

 if (razdel='����') and (podrazdel='�������') then
        begin
         SetLength(fRassa.Opisan[i].neobh,
                   length(fRassa.Opisan[i].neobh)+1);
         j:=length(fRassa.Opisan[i].neobh)-1;

         fRassa.Opisan[i].neobh[j].nazv:=StringWordGet(s, ' ',1);
         fRassa.Opisan[i].neobh[j].kolvo:=StrToFloat(StringWordGet(s, ' ',2));
        end;

      if razdel='������' then
         begin
          i:=length(fRassa.Opisan)-1;
          fRassa.Opisan[i].resurs:=true;
          fRassa.Opisan[i].resursmax:=StrToFloat(s);
         end;



       end;
    end;



  until eof(f); // �� ���������� ����� ����� ���������� �������

 closeFile(f); // ��������� ����
end;


// ��������� �������� ������ �������
procedure NewObyekt(nomRas, nomTip, nomDru:integer;x,y,phi:single);
var i:integer;
    j:integer;
    k:integer;
begin

   SetLength(Obyekti,
             length(Obyekti)+1); // ����������� ����� ������� �� 1

   i:=length(Obyekti)-1; // ���������� ��������� ������� � �������

   // ����������:
   //
   // ������� �� � ������� ��������� SetLength
   // ��������� ����� ������� Obyekti �� �������,
   // ��� ���� ������ ������ ����� � ��������� � ���
   // �������: length(Obyekti)+1
   //
   // � ��� ��� �������� � ������� ������������ �� ����,
   // �� ��������� ������� ����� �� 1 ������ �����:
   // i:=length(Obyekti)-1;
   //
   // ��������, � ������� ������ 5
   // ������� ��������� 0,1,2,3,4
   // ������� ������ ���������� � ����� i:=5-1


   // ������������� ��������� ������� � ���� �������� �����
   Obyekti[i].pos.x:=x;
   Obyekti[i].pos.y:=y;
   Obyekti[i].phi:=phi;

   // ������������� ����� �����, ����� ���� ����� � ����� ������
   Obyekti[i].nomRas:=nomRas;
   Obyekti[i].nomTip:=nomTip;
   Obyekti[i].nomDru:=nomDru;

   // ���������� ����� ������� � ������ ������� � �����
   k:=length(Rassa[nomRas].Opisan[nomTip].energia);

   // ����������: ����� �� � ����� ������������:
   // ��� ��� �������� ������� ����� �������� (�����������
   // �� ��������� ������), �� �� ������ � ����� ������
   // ��� �������� ������������ �������� � ��� �� ������ K:
   setlength(Obyekti[i].energia,k);

   // ��� ��� ���� ����������, ��� �� ������ ��� �� �� ��������:
   for j:=0 to k-1 do Obyekti[i].energia[j]:=Rassa[nomRas].Opisan[nomTip].energia[j].max;

   // ������������ �������� ���� ��� ��� �� ����, �� ������� ��������, ������� � �����
   // ���� �� ������.

   // �������� �� �� ����� ������ � � ������������� �� ������ ��������:
   k:=length(Rassa[nomRas].Opisan[nomTip].dobicha); // ���������� ����� � �������� ��������
   setlength(Obyekti[i].resurs,k); // ������� ����� �� ����� �����

   // �� ���� ���������� K � ��� �� ������� ������ � ������ K.

   // �� ������ ������ �������� �������� ������� �������� (�.�. ���� �����, �� ��� ������ �� �������)
   for j:=0 to k-1 do Obyekti[i].resurs[j]:=0;

   // ���� �� ���� ���� �������� �������� (��������, ������, ...)
   if Rassa[nomRas].Opisan[nomTip].resurs = true
    then
     begin // �� �� ��������� ��� ��� ������������ ������
      setlength(Obyekti[i].resurs,1);
      Obyekti[i].resurs[0]:=Rassa[nomRas].Opisan[nomTip].ResursMax;
     end;

   // �� ���� ���� ����������� ���� ZOLOTNIK.TXT,
   // � ����� ������ ������, �� �� ������:
   //
   // )������
   // 100000
   //
   // ��� �������� � ��������� ����� ���������� �
   // ���������� Rassa[nomRas].Opisan[nomTip].ResursMax;


end;

// ��������� ������ �������������� ������� �� ������� �������� �� ���������
procedure SuperKvadrat(nomerObj,nomerPosl:integer);
var m,n:integer;
var kolonka:integer;
var zerkalno:boolean;
var XSize,YSize,sprX,sprY:integer;
var kadr:integer;
var nomerPosledovatelnosti:integer;
var tempAngle:single;
begin

// ���� ����� ������������������ 555 - ������ ����������
// ��������� ������ ���������. ������� �� ���������
// �������� ���� BEGIN-END ������ ��� ���, ��� ���������
// ��� ��������� (<>555). ���������� ������ �� WarCraft:
// ����� ���������� �������� ������, �� ��� �� �����.

if nomerPosl<>555 then
 begin

 // �� ��������� ���������� m � n ���������� ����� ����� � ����� ���� �����
 m:=Obyekti[nomerObj].nomRas;
 n:=Obyekti[nomerObj].nomTip;

 // ���� ����� ������������������ ������������� - ������ ���� ����� �� �����
 // ��� ���� �� ���� ������ ���� � ���������� ��� ��� ��������� ������
 if nomerPosl<0 then
  begin
    Obyekti[nomerObj].TekushKadr:=0; // ��Ш� ������ ���� (����� ��������� �� ����, ������� 0)
    nomerPosledovatelnosti:=abs(nomerPosl)-1; // ��������� ����� ������������������
    // ����� ����� �����:
    // 1) � ��� ������ ��������� � ������������������ 0
    // 2) ��� ����� ������ ���� ������ (��������, ��� ����� ���� �����)
    // 3) ������� �� ���� ���������� �������� �� -1
    //    � �������� 1. � 1-1=0, ��� � ���� �������� ������
    //    �� �.�. ��� �� ����� ��������, �� �������� ����
    //    �� ��������� ������ ������� ���� ������� (���� ������ ����)

    // ����������:
    // ����� ����� ������ ���� � �� ������ ��������.
    // ��������, ��� nomerPosl=-2:
    // abs(-2)=2
    // 2-1=1
    // ������ �� ������ ������������������ (�����)
    // �� ����� ����� ������������ ������ (�������) ����
    
  end
   else

  nomerPosledovatelnosti:=nomerPosl; // ����� ������������������


 // ���� ����� ����� ��������� �� ���������� �������
 if Obyekti[nomerObj].TekushKadr>length(Rassa[m].Opisan[n].posledovatelnost[nomerPosledovatelnosti].kadr)-1
  then
   if nomerPosl<>2 then Obyekti[nomerObj].TekushKadr:=0 // ��� ����� ������� �� ����� ���������� ��������
    else Obyekti[nomerObj].TekushKadr:=length(Rassa[m].Opisan[n].posledovatelnost[nomerPosledovatelnosti].kadr)-1; // ������� ��� ������� ������ ��������� ����

 zerkalno:=false; // ���� ��� ����� �������, ��� �� ���������

 tempAngle:=Obyekti[nomerObj].phi-90; // ��� ��� ������� �������� ������������ ����� ������� �������, �������� ������ ������������� �� 90 ��������

 if tempAngle<0 then tempAngle:=360+tempAngle; // ������� ��������

 kolonka:=round( tempAngle ) div 45 + 1; // ���������� ����� ������� (45 ������� ������, ��� ������� � ��� ���������� ��������� - � ����� �������� � 45 ��������)

 // ���� ������� ������ ���� (� ����� � ��� ���), �� ���-�� ��� ��� � ������ ���������� �����������
 if kolonka>5 then kolonka:=5-(kolonka-5) else zerkalno:=true;


 // ������������� �������:
 XSize:=Rassa[m].Opisan[n].XSize;
 YSize:=Rassa[m].Opisan[n].YSize;
 sprX:=Rassa[m].Opisan[n].sprX;
 sprY:=Rassa[m].Opisan[n].sprY;

 // �������� � OpenGL ������ ��������
 glBindTexture(GL_TEXTURE_2D,Rassa[m].Opisan[n].spritesTex[Rassa[m].Opisan[n].posledovatelnost[nomerPosledovatelnosti].texturnum]);

 // ��������� �������� ����� (�������� ���������� ��������)
 kadr:=round(Obyekti[nomerObj].TekushKadr);

 glpushMatrix; // ��������� �������

 // ���������� ������ ����� �������, ����� ���������� X,Y ��������� � ������ �������
 glTranslatef(Obyekti[nomerObj].pos.x-sprX/2, Obyekti[nomerObj].pos.y-sprY/2,-5);

 // ������ ������� �� ��������
 Kvadrat(XSize,YSize,
         sprX,sprY,
         Rassa[m].Opisan[n].posledovatelnost[nomerPosledovatelnosti].kadr[kadr],
         kolonka,
         zerkalno);

 // ���������� � Z- ����������� (� ������������� �������� ��� �� �����)
 glTranslatef(0,0,0.5);
 // ��� ������ ��� ����������� ����, ��� �������� �� ������ �����

 // ����������:
 //
 // �� ������ 2D ������� � ��� �������� �� ������ �����
 // ������� ��� Z - ���������� � 2-D ������������ X,Y,
 // � ��� ��� �������� � OpenGL.

 glDisable(GL_TEXTURE_2D); // ��������� ��������, ��� ����� ������ �����
 glLineWidth(3); // ������ ����� �������

 // ���� ���������� ������ ������ � ������� �������, ��
 if ShowEnerg then begin
  glBegin(GL_LINES);
  glColor3f(1,0,0);glVertex2f(0,0+sprY);
  glColor3f(1,1,0);glVertex2f(0+Obyekti[nomerObj].energia[0]/20,0+sprY);
  glColor3f(1,1,0);glVertex2f(0+Obyekti[nomerObj].energia[0]/20,0+sprY);
  glColor3f(0,1,0);glVertex2f(0+Obyekti[nomerObj].energia[0]/10,0+sprY);
  // ���� ���������� ��� ����� - ������� ��� �������� ����� � OpenGL
  // ������� 1 0 0
  // ƨ����  1 1 0
  // ��˨��� 0 1 0
  glEnd;
 end;

 glLineWidth(1);
 glBegin(GL_LINE_LOOP);
 glColor3f(0,0,1);
 if Obyekti[nomerObj].vibran then // ������ ������� ������ ��������� ������
  begin
   glVertex2f(0,0);
   glVertex2f(0,0+sprY);
   glVertex2f(0+sprX,0+sprY);
   glVertex2f(0+sprX,0);
  end;
 glEnd;

 glEnable(GL_TEXTURE_2D); // ������� �������� ��������
 glColor3f(1,1,1);


 glpopMatrix; // ���������� �������, ������� �� ���� ��������� � ������� glPushMatrix


 // ����������:
 //
 // ����� glPushMatrix � glPopMatrix ���������:
 //
 // ���� �������
 //
 // glPushMatrix; // � � � � � � � � �
 // glTranslatef(1234,4563,123);
 // glPopMatrix; // � � � � � � � � � � � � � � �
 //
 // �� ��� ����� �� �������� �� ���������
 // � ����� ����������� ��������� ����������� �� ������
 //
 // ������� ��� ������ ������������ ��� ����, ����
 // �� ������ �����-������ ������ ��������������
 // glTranslatef/glRotatef, � ����� ��� �����
 // ����� ��� ������� �����-������ �����������/��������
 // ������������ ���������� �������
 //
 // ...PUSH... - ��������� ���������
 // ...POP... - ��������������� ���������


// ���������� ����� ����� (����� ����� ������������ �����,
// ���������� �� ������� FPS, ��� ��������� 0.1)
 Obyekti[nomerObj].TekushKadr:=Obyekti[nomerObj].TekushKadr+0.1;

end; 

end;

// �������� - ����� ������
procedure LoadMapTexture;
begin
 LoadTexture('.\maps\summer2.bmp',MapTexture);
end;


// ��������� ����� - �� ������
procedure RenderKarta;
var i,j:integer;
begin

 glBindTexture(GL_TEXTURE_2D,mapTexture);
for i:=-10 to 10 do
 for j:=-10 to 10 do
  begin
   glPushMatrix;
   glTranslatef(i*32,j*32,0);
   Kvadrat(512, 256, 32, 32, 5,1,false);
   glPopMatrix;
  end;

end;


// ��������� ���� �������� - ����� ������
procedure RenderObjects;
var i:integer;
    m,n:integer;
begin

 for i:=0 to length(Obyekti)-1 do
  begin
   m:=Obyekti[i].nomRas;
   n:=Obyekti[i].nomTip;

   if Obyekti[i].energia[0]>0 then
    begin
     SuperKvadrat(i,Obyekti[i].TekushPosl);
    end
     else
     SuperKvadrat(i,2);

  end;



end;

// ��� � ���� �������� ����� ����� 3d ������.
// ������� CENTURUS - ��� ������������� ����
// � ������� �� ����� ������� "�����������", "����������" �������
// ������� ���������� BOOLEAN: ���� �� ������� ���� �����������
// center1,2 - ����� ���� �����������
// radius1,2 - �� �������
// tip1,2 - ���� ��������
//       Centurus( ������ �����������         ; �������              ;  ���� �������� )
function Centurus(var center1,center2:TVector2;radius1,radius2:single;tip1,tip2:integer):boolean;
var c1,c2,e,napr:TVector2; // ��������������� ����������
    dlina,movi:single;     //
begin

c1.x:=center1.x; // ���������� �� ��������� ����������
c1.y:=center1.y;

c2.x:=center2.x; // ���� � ��� ������ �����
c2.y:=center2.y;

e.x:=(c1.x-c2.x); // ���������� ������, ����������� ����� C1 � C2
e.y:=(c1.y-c2.y);

dlina:=sqrt(e.x*e.x+e.y*e.y); // ���������� ����� ������� (������� ����� C1 � �2)

napr:=normaliz2(e); // ���������� ��������� ������ �����������

if dlina<radius1+radius2 then // ���� ���������� �������� ���� �� �����, ��
 begin

  movi:=radius1+radius2-dlina; // ���������� ��������� ���������� ������� ���� �� �����

  c1.x:=c1.x+napr.x*movi/2; // ���������� ����� ����� ���������� �� �������� MOVI
  c1.y:=c1.y+napr.y*movi/2;

  c2.x:=c2.x-napr.x*movi/2; // � ����� ������ - � ��������������� ������� (���� �����)
  c2.y:=c2.y-napr.y*movi/2;

  result:=true; // ���� ������������ (true)

 end else result:=false; // ��� ������������ (false)


 // ��� ������ ����������
 if tip1>0 then begin
  center1.x:=c1.x;
  center1.y:=c1.y;
  end;

 // ��� ������
 if tip2>0 then begin
  center2.x:=c2.x;
  center2.y:=c2.y;
  end;

end;


// ��������� ����������� � ��������� ����� ������������
// i - ����� �����
// x,y - ���� ���� ���� ������ ����
procedure IdtiVpoziciu(i:integer;x,y:single);
var fff,x1,y1:single;
m,n:integer;
begin

    m:=Obyekti[i].nomRas;
    n:=Obyekti[i].nomTip;

     // ������� ������ ����� ��������� � �������� ������
    x:=x-Obyekti[i].pos.x;
    y:=y-Obyekti[i].pos.y;

    // ������� ����� �������
    fff:=sqrt(x*x+y*y);

    // ���� ��� ������, �� �������� �����
    if fff<rassa[m].Opisan[n].radius then Obyekti[i].misl1:='';

    if fff>0 then
     begin
      x:=x/fff;
      y:=y/fff;
     end;

    // ������������ ��������� ������ �� ���� PHI
    x1:=1*cos(DegToRad(Obyekti[i].phi));
    y1:=1*sin(DegToRad(Obyekti[i].phi));

    // ������� ���� ����� �������� �������� ����������� (x1,y1)
    // � �������� ������� ����������� (x,y)
    fff:=x*x1+y*y1;

    fff:=arccos(fff);

    fff:=RadToDeg(fff); // ��������� ���� ��������� � �������

    // ���� ���� ������������ - ����� 5, ��
    if fff>5 then
      Obyekti[i].phi:=Obyekti[i].phi+5; // �������� ������������ ����


    // ����������:
    // ���� ��� ������ ���� ���� ��-��
    // �������� �� 5 �������� ����� ����������
    // ����������� (����� "������");


    fff:=DegToRad(Obyekti[i].phi); // ��������� ���� � �������

    // ���������� ���� � ����������� ���� FFF

    Obyekti[i].pos.x:=Obyekti[i].pos.x+1*cos(fff);
    Obyekti[i].pos.y:=Obyekti[i].pos.y+1*sin(fff);



end;

// ��������� ������������� ����������
// �� ����� - playerNum
// ����� ������, ������� ��������� AI (������������ ���������)
procedure Intellekt(playerNum:integer);
var i,j,k:integer;

    FoundBaza:integer;     // ���� ����?
    FoundKrest:integer;    // ���������� ����?
    FoundDobicha:integer;  // ���-������ �������� ������?
    FoundFree:integer;     // ���� ��������� ���������?

    FoundZolotnik:integer; // �������� ���������� ����?

    misl,params:string;    // ����� � Ũ ���������

    FreeArray:array of integer; // ������ � ��������� ��������� ��������

    FoundAll:integer; // ������� ����� ��������?

    FoundVrag:integer; // ����� �����? ����� � ���� ������?


begin

 SetLength(FreeArray,length(Obyekti)); // ��� ��������� ���� �� ���������

 // ������� �� ������ �� �����, ������� ���� � ����� �������:
    FoundBaza:=-1;
    FoundKrest:=-1;
    FoundDobicha:=0;

    FoundFree:=0;
    FoundAll:=0;

    FoundVrag:=-1;

  // ������������� ��� �����:
 for i:=0 to length(Obyekti)-1 do
  begin

   misl:=   StringWordGet(Obyekti[i].misl1,' ',1);
   params:= StringWordGet(Obyekti[i].misl1,' ',2);

  if Obyekti[i].nomDru<>555 then // ��������� 555 �� �������
  if Obyekti[i].energia[0]>0 then 
  begin
   if (Obyekti[i].nomDru=playerNum) then // ������� ������ ����� (����� ������ ���������)
    begin
     if (Obyekti[i].nomTip=1) then FoundBaza:=i; // ����� ���� ����
     if (Obyekti[i].nomTip=0) then FoundKrest:=i; // ����� ������ �����������
     if (Obyekti[i].nomTip=0) then inc(FoundAll);  // ����������� ������� ��������� ��������
     if (Obyekti[i].nomTip=0) and (misl='dobicha') then inc(FoundDobicha); // ����������� ������� ��������, ��������� � ���������
     if (Obyekti[i].nomTip=0) and (misl='') then
      begin
       FreeArray[FoundFree]:=i; // ��� ��������� ����� �� ������
       inc(FoundFree);
      end;
    end else FoundVrag:=i; // ����� �����! � �������� ��� �����
  end;


  end;


// ������������� ����� ����:
 if FoundBaza<0 then // ���� �� ����� ����
  if FoundKrest>=0 then  // � ���� ���� �� ���� ����������, ��
   begin
    // ����� ����� ����������� ����� � ������������� ����
                        Obyekti[FoundKrest].MISL1:='stroyka 1'
                                        +','+intToStr(round(Obyekti[FoundKrest].pos.x+random(25)-random(50)))
                                        +','+intToStr(round(Obyekti[FoundKrest].pos.y+random(25)-random(50)));
                        Obyekti[FoundKrest].MISL2:='';
   end;


// ������ ������
 if Igroki[playerNum].Resurs[0]<100 then // ���� ������ ��������
 if FoundAll<=3 then // � �������� ���� ���� (������ ����� ��-�� �������� ������)
 if (FoundDobicha<1) and (FoundFree>0) then // ������� �� ������ ������ ��������� ��������
  begin
         FoundZolotnik:=blizhZolotnik(FreeArray[0]); // ���� ��������� �������� � ������� ���������� �����������
         if FoundZolotnik>-1 then // ���� ����� ��������
          begin
           // ������ ����������� ����� ���� �� ������� (���� �������� � ������� ���������), � ������ �� ������������� ���������
           Obyekti[FreeArray[0]].MISL1:='idtiza '+IntToStr(FoundZolotnik);
           Obyekti[FoundKrest].MISL2:='';
          end;
  end;

// �������� ����� ��������
 if (FoundAll<10) and (FoundBaza>-1) then // ���� �������� ��������, �� � ��� ���� ����
 begin
// ������ ���� ����� � �������� (�������������) ������ �����������
  Obyekti[FoundBaza].MISL1:='stroyka 0'
         +','+intToStr(round(Obyekti[FoundBaza].pos.x+random(25)-random(50)))
         +','+intToStr(round(Obyekti[FoundBaza].pos.y+random(25)-random(50)));

 end;

// ��������� �� ����������
if Igroki[playerNum].Resurs[0]>100 then // ���� ������ ����
 if (FoundVrag>-1) and (FoundFree>0) then // ���� ����� ����� � ���� ��������� ���������
  for j:=0 to FoundFree-1 do // ���� ��������� �����
   begin
    // ���� ��������� ������ ����� ���� �� ������ (��� ������ ������ - ��� ����� �� � �������)
    Obyekti[FreeArray[0]].MISL1:='idtiza '+IntToStr(FoundVrag);
    Obyekti[FoundKrest].MISL2:='';
   end;




end;


// ������������� ������
procedure InterpretirovatMisli;
var misl   : string;
    params : string;
    i,j:integer;

    a,b,c:string;
    x,y:single;
    x1,y1:single;
    fff:single;

    m,n:integer;
    o,p:integer;

begin

// ������� ��� �����
for i:=0 to length(Obyekti)-1 do
 if obyekti[i].energia[0]>0 then // ���� ������� ������ ����
 begin

  // ����� ����� ����� � ����� ���� �����
  m:=Obyekti[i].nomRas;
  n:=Obyekti[i].nomTip;

  // ���������� ����� � � ���������
  misl:=   StringWordGet(Obyekti[i].misl1,' ',1);
  params:= StringWordGet(Obyekti[i].misl1,' ',2);

  // ������������ ����
  if Obyekti[i].phi>360 then Obyekti[i].phi:=1;
  if Obyekti[i].phi<0 then Obyekti[i].phi:=359;

  // ���� ������ ��� - ������ ���� ����� �� �����
  if misl='' then Obyekti[i].TekushPosl:=-1;
  // ��� ������, ������� ����� �� �����,
  // ������������� ����� ������������������ -1
  //


  // ���� ������� ����� �����������, �� ���� ��������������, ��
  if (Obyekti[i].MISL1='') and (Obyekti[i].MISL2<>'') then
   begin
    Obyekti[i].MISL1:=Obyekti[i].MISL2; // ������ �������������� �������
    Obyekti[i].MISL2:=''; // �������� ��������������
   end;


  // ���� ����� ����, � ������������ ���, �� �������� ����� �����: 
  if (misl='idti') and (length(rassa[m].Opisan[n].skorost)=0) then misl:='';
  if (misl='idtiza') and (length(rassa[m].Opisan[n].skorost)=0) then misl:='';
  if (misl='atakovat') and (length(rassa[m].Opisan[n].udar)=0) then misl:='';
  if (misl='stroyka') and (length(rassa[m].Opisan[n].stroyka)=0) then misl:='';
  if (misl='dobicha') and (length(rassa[m].Opisan[n].dobicha)=0) then misl:='';

  // ����� ����
  if misl='idti' then
   begin
    Obyekti[i].TekushPosl:=0; // ������ ���
    if Obyekti[i].resurs[0]>0 then // ������ � ������� ���
     Obyekti[i].TekushPosl:=3;

    a:=StringWordGet(params,',',1);
    b:=StringWordGet(params,',',2);

    x:=StrToInt(a); // ���� ����?
    y:=StrToInt(b);

    IdtiVpoziciu(i,x,y); // �������� ��������� ������������
   end;

  // ����� ���� ��
  if misl='idtiza' then
   begin
    Obyekti[i].TekushPosl:=0;
    if Obyekti[i].resurs[0]>0 then
     Obyekti[i].TekushPosl:=3;    

    j:=StrToInt(params); // �� ��� ����?

    o:=Obyekti[i].nomRas;
    p:=Obyekti[i].nomTip;

    IdtiVpoziciu(i,Obyekti[j].pos.x,Obyekti[j].pos.y); // �������� ��������� ������������
   end;

  // ����� ���������
  if misl='atakovat' then
   begin
    j:=StrToInt(params); // ���� ���������?

    Obyekti[i].TekushPosl:=1; // �������� ��������  ����� (=1)

    // �������� ��������� ������� � ���� (���� ����� ����� j - ���� ���������)
    Obyekti[j].energia[0]:=Obyekti[j].energia[0]-
                           Rassa[m].Opisan[n].udar[Obyekti[i].TipAtaki].sila;

    // ������ � ���� �������� ����� ��������� ���
    Obyekti[j].MISL2:=Obyekti[j].MISL1;
    Obyekti[j].MISL1:='atakovat '+intToStr(i);


    // ��� ������� - ���� ������:
    if Obyekti[j].energia[0]<=0 then Obyekti[i].MISL1:='';

   end;

  // ����� �������
  if misl='stroyka' then
   begin
    Obyekti[i].TekushPosl:=1;
    
    a:=StringWordGet(params,',',1); // ��� ������
    b:=StringWordGet(params,',',2); // ��� ������ (x)
    c:=StringWordGet(params,',',3); // ��� ������ (y)

    // ��������� �� ������ � �����:
    x:=StrToInt(b);
    y:=StrToInt(c);

    // ���� �� � ��� ������?
    if Igroki[Obyekti[i].nomDru].Resurs[0]>0 then // ���� ����, ��
     begin
      // ����������� �������� ����� � �������������
      Obyekti[i].MislPROGRESS:=Obyekti[i].MislPROGRESS+1;

      // ��������� ������ ������, � �������� ���� ���-�� ������
      Igroki[Obyekti[i].nomDru].Resurs[0]:=Igroki[Obyekti[i].nomDru].Resurs[0]-1;
     end;

    //������������� ���������?
    if (Obyekti[i].MISLPROGRESS>=Rassa[m].Opisan[StrToInt(a)].cena[0].kolvo) then
     begin
      Obyekti[i].MISLPROGRESS:=0;
      Obyekti[i].MISL1:=''; // ��� ������������� ���������, ������� ����� � �������������


     // �������� - NewObyekt(nomRas, nomTip, nomDru:integer;x,y,phi:single);

      NewObyekt(m,
                StrToInt(a),
                Obyekti[i].nomDru,
                x,
                y,
                0);
     end;


   end;

  // ����� ������ ��������
  if misl='dobicha' then
   begin
    Obyekti[i].TekushPosl:=555; // ������ ������

    j:=StrToInt(params); // ���������� ����� ����� ��������

   // ���� � ��������� ���-�� ����, �� ��� ������� ������ 
   if Obyekti[j].resurs[0]>0 then
    begin
     Obyekti[j].resurs[0]:=Obyekti[j].resurs[0]-0.1;
     Obyekti[i].resurs[0]:=Obyekti[i].resurs[0]+0.1;
    end;
    
   // ���� ����� ��� �������� �� �������, ��
    if Obyekti[i].resurs[0]>=rassa[m].Opisan[n].dobicha[0].kolvo then
     begin
      // ����� � ������ ������ ��������������
      Obyekti[i].MISL1:=Obyekti[i].MISL2;
      // � ������� ����� ������ - ���� �� ���� ������ � �������
      Obyekti[i].MISL2:='idtiza '+params;
     end;

   end;

  end;

end;

// ��������� ��� ������ �������������� �������
// (������� ������� ���� ����� - tip=0 � tip=1)
procedure Kursor(tip:integer;dx:single);
var i:integer;
begin
glDisable(GL_TEXTURE_2D);
case tip of
1:
begin
       glRotatef(gettickcount/10,0,0,1);
       glColor3f(1,0,0);
       glBegin(GL_LINES);
       glVertex3f(-dx/6,-dx/6,0);
       glVertex3f(-dx/2,-dx/2,0);
       glVertex3f(+dx/6,dx/6,0);
       glVertex3f(+dx/2,+dx/2,0);

       glVertex3f(+dx/6,-dx/6,0);
       glVertex3f(+dx/2,-dx/2,0);

       glVertex3f(-dx/6,+dx/6,0);
       glVertex3f(-dx/2,+dx/2,0);
       glEnd;
   end;
0: begin

       glRotatef(gettickcount/10,0,0,1);
       glColor3f(0,1,0);
       glBegin(GL_LINES);
       for i:=0 to 20 do
       glVertex3f((dx/2+0.1*dx*sin(gettickcount/500))*sin((360/20)*i*3.14/180),
                  (dx/2+0.1*dx*sin(gettickcount/500))*cos((360/20)*i*3.14/180),0);
       glEnd;

   end;
end;

glEnable(GL_TEXTURE_2D);

end;

// ��������, ���� �� ��� �������� ���� (���� ���� - ���������� TRUE)
function podkursorom(i:integer;kursx,kursy:single):boolean;
var a,b,fff,ppp:single;
begin
    a:=KursX-Obyekti[i].pos.x;
    b:=KursY-Obyekti[i].pos.y;
    fff:=sqrt(a*a+b*b);
    ppp:=Rassa[Obyekti[i].nomRas].Opisan[Obyekti[i].nomTip].radius;

    if fff<ppp then result:=true else result:=false;

end;

// ����� �� ��������?
procedure NujnoDogonyat(i,j:integer);
var misl,params:string;
begin

  misl:=   StringWordGet(Obyekti[i].misl1,' ',1);
  params:= StringWordGet(Obyekti[i].misl1,' ',2);

if misl='atakovat' then  // ���� ����� ���������, �� ����� �������� (idtiza)
 if StrToInt(params)=j then
 begin
  Obyekti[i].misl2:=Obyekti[i].misl1;
  Obyekti[i].MISL1:='idtiza '+params;
 end;


end;


// ��������� ����� ����� ��������� � ������� OBJNUM ����
function BlizhBaza(objnum:integer):integer;
var x,y,sss,rasst:single;
var i,j,m,n:integer;
begin

j:=-1;
rasst:=1000000;

for i:=0 to length(Obyekti)-1 do
  if (Obyekti[i].nomTip=1) and (Obyekti[i].nomDru=Obyekti[objNum].nomDru)
   then
    begin
     x:=Obyekti[i].pos.x-Obyekti[objNum].pos.x;
     y:=Obyekti[i].pos.y-Obyekti[objNum].pos.y;
     sss:=x*x+y*y;
     if sss<rasst then
      begin
       j:=i;
       rasst:=sss;
      end;
    end;

result:=j;

end;


// ��������� ����� ����� ���������� � ����� OBJNUM ���������
function BlizhZolotnik(objnum:integer):integer;
var x,y,sss,rasst:single;
var i,j,m,n:integer;
begin

j:=-1;
rasst:=1000000;

for i:=0 to length(Obyekti)-1 do
  if (Obyekti[i].nomDru=555)
   then
    begin
     x:=Obyekti[i].pos.x-Obyekti[objNum].pos.x;
     y:=Obyekti[i].pos.y-Obyekti[objNum].pos.y;
     sss:=x*x+y*y;
     if sss<rasst then
      begin
       j:=i;
       rasst:=sss;
      end;
    end;

result:=j;

end;


// ������������ ����� ������� I - J
procedure Stolknulsa(i,j:integer);
var misl,params:string;
var BlizhBazaNum:integer;
begin

  misl:=   StringWordGet(Obyekti[i].misl1,' ',1);
  params:= StringWordGet(Obyekti[i].misl1,' ',2);

if misl='idtiza' then  // ���� ��� �� ���-������/���-������, ��
 if StrToInt(params)=j then
  begin
   Obyekti[i].misl1:=Obyekti[i].misl2; // ���� ��� �� �����, ������� �������������� ����� �������
   Obyekti[i].misl2:='';

   // ����� ������ �� ����
   if (Obyekti[j].nomTip=1) and (Obyekti[i].nomDru=Obyekti[j].nomDru) then
    begin
     Igroki[Obyekti[j].nomDru].Resurs[0]:=Igroki[Obyekti[j].nomDru].Resurs[0]+Obyekti[i].resurs[0];
     Obyekti[i].resurs[0]:=0; // � ������ ����� ������ �� �������� (����� ����� �� ����)
    end;

  end;


  // new
  misl:=   StringWordGet(Obyekti[i].misl1,' ',1);
  params:= StringWordGet(Obyekti[i].misl1,' ',2);

  // ���� ����� ������ (�������)
if misl='' then
 if Obyekti[i].nomDru<>Obyekti[j].nomDru then
  if not Rassa[Obyekti[j].nomRas].Opisan[Obyekti[j].nomTip].resurs then
  begin
   Obyekti[i].misl1:='atakovat '+IntToStr(j); // ���� ��� �� ������, �� �������
   Obyekti[i].TipAtaki:=0;
  end
   else
  if Obyekti[i].resurs[0]=0 then
  begin
   Obyekti[i].misl1:='dobicha '+IntToStr(j); // ���� ��� ��������, �� ��������
   BlizhBazaNum:=BlizhBaza(i);
   if BlizhBazaNum>-1 then
    Obyekti[i].misl2:='idtiza '+IntToStr(BlizhBazaNum); // ������ �������������� ����� ������ - ����������� �� ����
  end;

// ����������:
//
// �������������� ������ ������ �������� ��
// ������� � �������������� ������
//
// � �� �����, ��� ���� ����� DOBICHA �����_���������,
// � ���� ���� �������������� ����� IDTIZA �����_����.
//
// ����� ��� ������ - ��� ������ ������ (� ��������, � ���� - �� ��� �����)
//
// ��� ������ ����� ����������, ������� ����� ��������� ���� �������
// � �� � ����� �������� ��������������.

end;



end.

