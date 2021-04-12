STDIN = 0
EXIT_SUCESS = 0
STDOUT = 1
SYSEXIT = 1
SYSCALL = 0x80
SYSWRITE = 4
.global _start
.text
.data
s: .asciz "ANITA TABACZKA\n"
len = . - s
f:
mov $SYSWRITE, %EAX
mov $STDOUT, %EBX
mov $s, %ECX
mov $len, %EDX
int $SYSCALL
ret
_start:
mov $s, %ESI
mov $2, %ECX
jmp w
w:
cmp $len, %ECX
jge e
mov (%ESI), %AL
or $0b100000, %AL #for lower to upper: and $0b11011111, %AL
mov %AL, (%ESI)
inc %ESI
inc %ECX
jmp w
e:
call f
mov $SYSEXIT, %EAX
mov $EXIT_SUCESS, %EBX
int $SYSCALL
