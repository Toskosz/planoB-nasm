section .data
	filename db "./output.txt", 0
	text db "Cruzeiro!", 0xA, 0xD
	textlen equ $ - text

section .text
	global _start

_start:
	; sys open
	mov EAX, 5
	mov EBX, filename
	; permissions 
    mov ECX, 02001Q
	int 0x80

	; file descriptor
	mov EBX, EAX

	; sys write
	mov EAX, 4
    mov ECX, text
	mov EDX, textlen
	int 0x80

	; sys close
    mov EAX, 6
    int 0x80

	; exit
    mov EAX, 1
    int 0x80

