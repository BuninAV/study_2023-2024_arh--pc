%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите a: ',0h
msgres db 'Результат: ',0h
section .bss
res resb 10
X resb 10
A resb 10
section .text
global _start
_start:
; ---------- Вывод сообщения 'Введите X: '
mov eax,msg1
call sprint
; ---------- Ввод 'A'
mov ecx,X
mov edx,10
call sread
mov eax,X
call atoi
mov [X],eax ; запись  числа в 'X'
; ---------- Ввод 'A'
mov eax,msg2
call sprint
mov ecx,A
mov edx,10
call sread
mov eax,A
call atoi
mov [A],eax ; запись  числа в 'A'
; ---------- Записываем 'A' в переменную 'edi'
mov edi,[X] ; 'ecx = X'
; ---------- Сравниваем 'A' и 'X' 
cmp edi,[A]; Сравниваем 'A' и 'С'
jbe fin ; если 'X<=A', то переход на метку 'fin',
; положить в res значение x и а
add edi,[A]
; ---------- Вывод результата
fin:
mov eax, msgres
call sprint ; Вывод сообщения
mov eax,edi
call iprintLF 
call quit ; Выход
