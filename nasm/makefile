debug:
	nasm -felf64 -g -F dwarf main.asm 
	ld -o todo main.o

start:
	nasm -felf64 main.asm 
	ld -o todo main.o
	./todo

gdb:
	echo "Run start then si"
	gdb test -tui