SECTION .text
global main
extern exit

main:
	mov rdi, 32
	call exit
