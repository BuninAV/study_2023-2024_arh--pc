%include 'in_out.asm'
section .data
msg1 db 'Введите A: ',0h
msg2 db 'Введите B: ',0h
msg3 db 'Введите C: ',0h
msgres db 'Наименьшее число: ',0h
section .bss
min resb 10
A resb 10
B resb 10
C resb 10
section .text
global _start
_start:
; ---------- Вывод сообщения 'Введите A: '
mov eax,msg1
call sprint
; ---------- Ввод 'A'
mov ecx,A
mov edx,10
call sread
mov eax,A
call atoi
mov [A],eax ; запись  числа в 'A'
; ---------- Ввод 'B'
mov eax,msg2
call sprint
mov ecx,B
mov edx,10
call sread
mov eax,B
call atoi
mov [B],eax ; запись  числа в 'B'
; ---------- Ввод 'C'
mov eax,msg3
call sprint
mov ecx,C
mov edx,10
call sread
mov eax,C
call atoi
mov [C],eax ; запись  числа в 'C'
; ---------- Записываем 'A' в переменную 'min'
mov ecx,[A] ; 'ecx = A'
mov [min],ecx ; 'min = A'
; ---------- Сравниваем 'A' и 'С' 
cmp ecx,[C] ; Сравниваем 'A' и 'С'
jl check_B ; если 'A<C', то переход на метку 'check_B',
mov ecx,[C] ; иначе 'ecx = C'
mov [min],ecx ; 'min = C'
check_B:
mov ecx,[min]
cmp ecx,[B] ; Сравниваем 'min(A,C)' и 'B'
jl fin ; если 'min(A,C)<B', то переход на 'fin',
mov ecx,[B] ; иначе 'ecx = B'
mov [min],ecx
; ---------- Вывод результата
fin:
mov eax, msgres
call sprint ; Вывод сообщения 'Наименьшее число: '
mov eax,[min]
call iprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход
