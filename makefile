build:
	nasm -f elf cruzeiro.asm -o cruzeiro.o
	ld -m elf_i386 -o cruzeiro cruzeiro.o

build_a:
	nasm -f elf append.asm -o append.o
	ld -m elf_i386 -o append append.o

