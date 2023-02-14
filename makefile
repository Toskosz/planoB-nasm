build:
	nasm -f elf test2.asm -o test2.o
	ld -m elf_i386 -o test2 test2.o

