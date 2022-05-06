global _start

section .text
; Made by Abid Lohan
_start:
    xor rbx, rbx
    call _printp1
    call _getInput

    call _printp2
    call _getInput

    call _printp3
    call _getInput

    call _printp4
    call _getInput
	
_compare:
    mov rax, 1
	mov rdi, 1
    mov rdx, 5
    mov rsi, separator
    syscall

    mov rax, qword[correct]
    mov rbx, qword[r1]
    cmp rax, rbx
    je _true

_false:
    mov rax, 1
	mov rdi, 1
    mov rdx, failLen
    mov rsi, fail
    syscall
    jmp _end

_true:
    mov rax, 1
	mov rdi, 1
    mov rdx, gzLen
    mov rsi, gz
    syscall

_end:
	mov rax, 60
	and rdi, rdi
	syscall

_getInput:
    mov rax, 1
	mov rdi, 1
    mov rdx, 10
    mov rsi, response
    syscall

    xor rax, rax
    xor rdi, rdi
    lea rsi, [r1+rbx*2]
    mov rdx, 2
    syscall
    inc rbx
    ret

_printp1:
    mov rax, 1
	mov rdi, 1
    mov rsi, q1
	mov rdx, q1Len
	syscall
    ret

_printp2:
    mov rax, 1
	mov rdi, 1
    mov rsi, q2
	mov rdx, q2Len
	syscall
    ret

_printp3:
    mov rax, 1
	mov rdi, 1
    mov rsi, q3
	mov rdx, q3Len
	syscall
    ret

_printp4:
    mov rax, 1
	mov rdi, 1
    mov rsi, q4
	mov rdx, q4Len
	syscall
    ret

section .data

q1: db '1) Qual desses pokemon e do tipo eletrico? (A, B, C ou D)',0xa,'A. Charizard',0xa,'B. Klinklang',0xa,'C. Roserade',0xa,'D. Plusle',0xa
q1Len: equ $-q1

q2: db 0xa,'2) Qual desses movimentos pode causar paralizia? (A, B, C ou D)',0xa,'A. Shock Wave',0xa,'B. Thunder Wave',0xa,'C. Flamethrower',0xa,'D. Haze',0xa
q2Len: equ $-q2

q3: db 0xa,'3) Qual desses pokemon e lendario? (A, B, C ou D)',0xa,'A. Durant',0xa,'B. Dialga',0xa,'C. Hydreigon',0xa,'D. Ludicolo',0xa
q3Len: equ $-q3

q4: db 0xa,'4) Em que nivel o Charmander evolui para Charmeleon? (A, B, C ou D)',0xa,'A. 16',0xa,'B. 14',0xa,'C. 20',0xa,'D. 18',0xa
q4Len: equ $-q4

response: db 'Resposta: '

gz: db 'Parabens, voce acertou todas!',0xa
gzLen: equ $-gz

fail: db 'Infelizmente voce errou pelo menos uma resposta...',0xa
failLen: equ $-fail

separator: db 0xa, '--', 0xa, 0xa

correct: db 'D',0xa,'B',0xa,'B',0xa,'A',0xa

section .bss
r1: resb 8