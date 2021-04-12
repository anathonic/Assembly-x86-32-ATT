SYSWRITE = 4
SYSCALL = 0x80
EXIT_SUCESS = 0
SYSEXIT = 1
STDIN = 0
STDOUT = 1
.global _start
.text
.data
s: .asciz "ANITA TABACZKA\n"
len = . - s
con:
sub $2, %EDX
w:
cmp %EDX, %ESI
jge k
mov (%ECX, %ESI, 1), %AL
or $0b100000, %AL #for lower to upper and $0b1011111, %AL
mov %AL, (%ECX, %ESI, 1)
inc %ESI
jmp w
k:
add $2, %EDX
mov $SYSWRITE, %EAX
mov $STDOUT, %EBX
int $SYSCALL
ret
_start:
push %EDX
push %ECX
mov $s, %ECX
mov $len, %EDX
call con
mov $SYSEXIT, %EAX
mov $EXIT_SUCESS, %EBX
int $SYSCALL
