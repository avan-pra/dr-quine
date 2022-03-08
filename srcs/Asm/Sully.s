global main
extern sprintf
extern printf
extern exit

SECTION .data
BUFFER times 100 db 0
FILE db "test.c",0

SECTION .text
main:
	push rbp		; save a copy of rbp
	mov rbp, rsp	; 

	mov rdi, BUFFER
	mov rsi, FILE
	mov al, 0
	call sprintf

	mov rdi, BUFFER
	mov al, 0
	call printf

	mov rsp, rbp
	pop rbp
	ret
