SECTION .data
CODE db "HELLLLO"

SECTION .text
global main
extern exit
extern printf

%macro FT 0
	main:
		mov rdi, CODE
		mov al, 0
		call printf

		mov rdi, 0
		call exit
%endmacro

FT
