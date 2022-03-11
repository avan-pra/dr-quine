global main
extern printf
extern exit

; This program will print its own source when run.

SECTION .data
CODE db "global main%3$cextern printf%3$cextern exit%3$c%3$c; This program will print its own source when run.%3$c%3$cSECTION .data%3$cCODE db %4$c%1$s%4$c,0%3$c%3$cSECTION .text%3$cprint:%3$c%2$cmov rsi, CODE%3$c%2$cmov rdx, 9 %3$c%2$cmov rcx, 10%3$c%2$cmov r8, 34%3$c%2$cmov al, 0%3$c%2$ccall printf%3$c%2$cret%3$c%3$cmain:%3$c%2$cpush rbp%3$c%2$cmov rbp, rsp%3$c%3$c%2$c; Hello, World!%3$c%3$c%2$cmov rdi, CODE%3$c%2$ccall print%3$c%3$c%2$cmov rsp, rbp%3$c%2$cpop rbp%3$c%3$c%2$cmov rax, 0%3$c%2$cret%3$c",0

SECTION .text
print:
	mov rsi, CODE
	mov rdx, 9 
	mov rcx, 10
	mov r8, 34
	mov al, 0
	call printf
	ret

main:
	push rbp
	mov rbp, rsp

	; Hello, World!

	mov rdi, CODE
	call print

	mov rsp, rbp
	pop rbp

	mov rax, 0
	ret
