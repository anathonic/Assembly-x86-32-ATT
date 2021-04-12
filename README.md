# Assembler-x86-32-AT-T
Small programs written in Assembler x86 IA-32 in AT&amp;T syntax
# To assemble:
as --32 filename.s -o filename.o
# Linker:
ld -m elf_i386 filename.o
# To execute:
./a.out or gdb a.out
# to get gdb on Linux:
sudo apt install gdb

