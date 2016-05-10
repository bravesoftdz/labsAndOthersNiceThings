;����� ������ 3-� ����������� ����. divK - ������������� �� ������

include pixels.inc ;�������� ������� ������ �����, ���� � �������

.model small
.stack 100h
.data
gx dd 20.0 ;���������� ������������
gy dd 20.0
alpha dd 0.0 ;������������ ���������� 
delta dd 0.001 ;�������� ���������
xdiv2 dd 320.0 ;�������� �� X � Y
ydiv2 dd 240.0
tmp dd 0 ;temp
x3 dd 3.0
x10 dd 10.0
divK dd 20.0
xr dw 0 ;���������� ��������� �����
yr dw 0
AboutMe db 177,176,176,177,178,178,177,176,176,177,178,178,177,176,176,177,178,178,177,176,176,177,178,'[KaspeR Demo Project - LabWork #5]',178,177,176,176,177,178,178,177,176,176,177,178,178,177,176,176,177,178,178,177,176,176,177,'$' ;��� ���!!!
Sine db '3l rose$'

.code
.486
start:
mov ax,@DATA
mov ds,ax
xor ax,ax
mov cx,188bh ;���������� �������� ����� - 2*Pi/0.001
;------------------------------------------------------------------
mov ah,0h ;������������� ������������ ������ 640�480
mov al,12h
int 10h
;------------------------------------------------------------------
pusha ;����� ������ AboutMe - ������ ��. ������, ������ ������� ���
mov cx,80 ;���-�� ���� � ������ AboutMe
mov bx,0
l2:
mov al,AboutMe[bx]
cmp bx,23 ;� 23 �� 56 ������� - ������
jb neI ;NeI - ����� ������� ������� ������
cmp bx,56
jg neI
 OutCharG bl,0,0eh,al
 jmp next
neI:
 OutCharG bl,0,04h,al
next:
 inc bx
loop l2
popa
;-----------------------------------------------------------------
pusha ;����� ������ Sine (���������� AboutMe)
mov cx,7
mov bx,0
l3:
 mov al,Sine[bx]
 inc bx
 OutCharG bl,02h,03h,al
loop l3
popa
;-----------------------------------------------------------------
AxleX ;������ ���
AxleY
finit ;������������� ������������

l1:
 fld alpha         ;�-�� r=10*sin(3*alpha)
 fmul x3
 fsin
 fmul x10
 fld alpha
 fcos
 fmul divK
 fmul             
 frndint           
 fld xdiv2         
 fadd              
 fistp word ptr xr ;������� X � ���������� ��� ������ �� �����

 fld alpha
 fmul x3
 fsin
 fmul x10
 fld alpha
 fsin
 fmul divK
 fmul              
 frndint           
 fstp tmp          
 fld ydiv2         
 fsub tmp          
 fistp word ptr yr ;������� Y � ���������� ��� ������ �� �����

 PutPixel xr,yr,0ah ;������� ����� ������� ������

 fld delta ;��������� ����� �������� alpha
 fld alpha
 fadd
 fstp alpha
loop l1 ;���� �� cx
;--------------------------------------------------------------------
mov ah,1h ;�������� ������� ������� 
int 21h
;--------------------------------------------------------------------
mov ah,0h ;������� ������� � TextMode
mov al,03h
int 10h
;--------------------------------------------------------------------
exit:
mov ax,4C00h ;����������� �����
int 21h
END start
