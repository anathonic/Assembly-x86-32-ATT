**Assembler-x86-32-AT-T**
<br />
Small programs written in Assembler x86 IA-32 in AT&amp;T syntax
<br />
To assemble:
<br />
as --32 filename.s -o filename.o
<br />
Linker:
<br />
ld -m elf_i386 filename.o
<br />
To execute:
<br />
./a.out or gdb a.out
<br />
to get gdb on Linux:
<br />
sudo apt install gdb

