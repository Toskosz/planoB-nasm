section .data
	filename db "./output.txt", 0
	text db "Cruzeiro!", 0xA, 0xD
	textlen equ $ - text
	len dd 1024

section .bss
	buffer: resb 1024

section .text
	global _start

_start:
	; sys open
	mov EAX, 5
	mov EBX, filename
	mov ECX, 0
	int 0x80
	; sys read
	mov EAX, 3
	mov EBX, EAX
	mov ECX, buffer
	mov EDX, [len]
	int 0x80
	; sys close
	mov EAX, 6
	int 0x80
	;sys open
	mov EAX, 8
	mov EBX, filename
	mov ECX, 0700
	int 0x80
	mov EBX, EAX

	mov EDI, 0
loop:
	cmp byte [buffer+EDI], 0x56
	je cruz
continue:
	mov EAX, 4
	lea ECX, [buffer+EDI]
	mov EDX, 1
	int 0x80
	add EDI, 1
	cmp byte [buffer+EDI], 0x2E
	je done
	jmp loop
	
cruz:
	; sys append cruzeiro
	mov EAX, 4
	mov ECX, text
	mov EDX, textlen
	int 0x80
	jmp continue

done:
	mov EAX, 6
	int 0x80
	mov EAX, 1
	int 0x80









