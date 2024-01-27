%include 'in_out.asm'
SECTION .data
msg: DB 'Введите число: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`
xor edx,edx
mov ebx,3
div ebx
add eax,5 ; EAX=EAX+5
mov ebx,7 ; EBX=7
mul ebx ; EAX=EAX*7
mov edi,eax ; запись результата вычисления в 'edi'
mov eax,rem
call sprint
mov eax,edi
call iprintLF
call quit
