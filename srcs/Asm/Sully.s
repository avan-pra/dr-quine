CODE db "CODE db %4$c%1$s%4$c,0%3$c%3$cSULLYEXE db %4$c./Sully_%5$cd%4$c,0%3$cSULLY db %4$cSully_%5$cd.s%4$c,0%3$cCFILE db __FILE__,0%3$cFOPENOPTIONS db %4$cw%4$c,0%3$cCOMPILE_LINE db %4$cnasm -f elf64 -o Sully_%5$c1$d.o Sully_%5$c1$d.s; clang Sully_%5$c1$d.o -o Sully_%5$c1$d; rm Sully_%5$c1$d.o%4$c,0%3$c%3$cSECTION .data%3$cI dd %6$d%3$cFILENAME times 50 db 0%3$cFD dq 0%3$cCMD times 100 db 0%3$c%3$cSECTION .text%3$cglobal main%3$cextern sprintf%3$cextern fprintf%3$cextern strcmp%3$cextern printf%3$cextern fopen%3$cextern fclose%3$cextern system%3$c%3$cbadret:%3$c%2$cmov rsp, rbp ; restore stack%3$c%2$cpop rbp%3$c%3$c%2$cmov rax, 1%3$c%2$cret%3$c%3$cgoodret:%3$c%2$cmov rsp, rbp ; restore stack%3$c%2$cpop rbp%3$c%3$c%2$cmov rax, 0%3$c%2$cret%3$c%3$cmain:%3$c%2$cpush rbp%3$c%2$cmov rbp, rsp ; init stack%3$c%3$c%2$cmov rdi, FILENAME%3$c%2$cmov rsi, SULLY%3$c%2$cmov rdx, [I]%3$c%2$cmov al, 0%3$c%2$ccall sprintf ; sprintf call%3$c%3$c%2$cmov rdi, FILENAME%3$c%2$cmov rsi, CFILE%3$c%2$ccall strcmp ; strcmp call%3$c%2$ccmp rax, 0%3$c%2$cjnz norectify%3$crectify_filename:%3$c%2$cdec dword [I]%3$c%2$cmov rdi, FILENAME%3$c%2$cmov rsi, SULLY%3$c%2$cmov rdx, [I]%3$c%2$cmov al, 0%3$c%2$ccall sprintf%3$c%3$cnorectify:%3$c%3$c%2$cmov rdi, FILENAME%3$c%2$cmov rsi, FOPENOPTIONS%3$c%2$ccall fopen%3$c%2$ccmp rax, 0%3$c%2$cjz badret%2$c%2$c%2$c%2$c; open file and exit if fopen return == null%3$c%2$cmov [FD], rax%3$c%3$c%2$cmov rdi, [FD]%3$c%2$cmov rsi, CODE%3$c%2$cmov rdx, CODE%3$c%2$cmov rcx, 9%3$c%2$cmov r8, 10%3$c%2$cmov r9, 34%3$c%2$cpush qword [I]%3$c%2$cpush 37%3$c%2$cmov al, 0%3$c%2$ccall fprintf%2$c%2$c%2$c; putting source code in the file%3$c%3$c%2$cmov rdi, [FD]%3$c%2$ccall fclose%2$c%2$c%2$c%2$c; closing it%3$c%3$c%2$cmov rdi, CMD%3$c%2$cmov rsi, COMPILE_LINE%3$c%2$cmov rdx, [I]%3$c%2$cmov al, 0%3$c%2$ccall sprintf%3$c%3$c%2$cmov rdi, CMD%3$c%2$ccall system%3$c%3$c%2$ccmp dword [I], 1%3$c%2$cjl end%3$c%3$c; run the program%3$c%3$c%2$cmov rdi, CMD%3$c%2$cmov rsi, SULLYEXE%3$c%2$cmov rdx, [I]%3$c%2$cmov al, 0%3$c%2$ccall sprintf%3$c%3$c%2$cmov rdi, CMD%3$c%2$ccall system%3$c%3$cend:%3$c%2$cjmp goodret%3$c",0

SULLYEXE db "./Sully_%d",0
SULLY db "Sully_%d.s",0
CFILE db __FILE__,0
FOPENOPTIONS db "w",0
COMPILE_LINE db "nasm -f elf64 -o Sully_%1$d.o Sully_%1$d.s; clang Sully_%1$d.o -o Sully_%1$d; rm Sully_%1$d.o",0

SECTION .data
I dd 5
FILENAME times 50 db 0
FD dq 0
CMD times 100 db 0

SECTION .text
global main
extern sprintf
extern fprintf
extern strcmp
extern printf
extern fopen
extern fclose
extern system

badret:
	mov rsp, rbp ; restore stack
	pop rbp

	mov rax, 1
	ret

goodret:
	mov rsp, rbp ; restore stack
	pop rbp

	mov rax, 0
	ret

main:
	push rbp
	mov rbp, rsp ; init stack

	mov rdi, FILENAME
	mov rsi, SULLY
	mov rdx, [I]
	mov al, 0
	call sprintf ; sprintf call

	mov rdi, FILENAME
	mov rsi, CFILE
	call strcmp ; strcmp call
	cmp rax, 0
	jnz norectify
rectify_filename:
	dec dword [I]
	mov rdi, FILENAME
	mov rsi, SULLY
	mov rdx, [I]
	mov al, 0
	call sprintf

norectify:

	mov rdi, FILENAME
	mov rsi, FOPENOPTIONS
	call fopen
	cmp rax, 0
	jz badret				; open file and exit if fopen return == null
	mov [FD], rax

	mov rdi, [FD]
	mov rsi, CODE
	mov rdx, CODE
	mov rcx, 9
	mov r8, 10
	mov r9, 34
	push qword [I]
	push 37
	mov al, 0
	call fprintf			; putting source code in the file

	mov rdi, [FD]
	call fclose				; closing it

	mov rdi, CMD
	mov rsi, COMPILE_LINE
	mov rdx, [I]
	mov al, 0
	call sprintf

	mov rdi, CMD
	call system

	cmp dword [I], 1
	jl end

; run the program

	mov rdi, CMD
	mov rsi, SULLYEXE
	mov rdx, [I]
	mov al, 0
	call sprintf

	mov rdi, CMD
	call system

end:
	jmp goodret
