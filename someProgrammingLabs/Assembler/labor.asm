MODEL SMALL
STACK 256 
DATASEG

CODESEG
start:
mov ax,0013h ;rozshurenia
int 10h

mov dx,20 ; ������ ������

fest3: 
mov cx,150 ; ������ ����
mov al,4 ;������� ���� 
mov ah,0Ch
int 10h
inc dx
cmp dx,180 ; �������
je peres3
jmp fest3
peres3:





mov cx,30 ;������ ����
fest7: 
mov dx,100 ;x
mov al, 4 ;���� ��� 
mov ah,0Ch
int 10h
inc cx
cmp cx,280
je peres7
jmp fest7
peres7:



mov cx,110 ;��� ����
fest9: 
mov dx,60 ;������ ������ 
mov al,14 ;�����1 ��� 
mov ah,0Ch
int 10h
inc cx
cmp cx,190 ;�� ����
je peres9
jmp fest9
peres9:


	mov cx,190   ;x    1-a
        mov dx,100   ;y    1-a
fest2:        
        mov al,10    ;color	
        mov ah,0Ch
	int 10h
        inc dx
        cmp dx,260
        inc cx
        cmp cx,230
  je peres2
  jmp fest2
peres2:


	mov cx,230   ;x    2-a
        mov dx,260   ;y    2-a
fest1:        
        mov al,10    ;color	
        mov ah,0Ch
	int 10h
        inc dx
        cmp dx,100
        inc cx
        cmp cx,290
  je peres1
  jmp fest1
peres1:


ex:
mov ah,1
int 16h
jz ex

mov ax,0003h
int 10h
mov ah,04Ch
int 021h
end start
