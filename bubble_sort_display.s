SYSEXIT = 1
EXIT_SUCCESS = 0
SYSWRITE = 4
STDIN = 0
STDOUT = 1
SYSCALL = 0x80

.global _start
.text
.data
s1: .asciz "\nTablica przed:\n"
s2: .asciz "\nTablica po:\n"
s3: .asciz "\n"
tab: .long 9,1,8,2,7,3,6,4,5

f:
mov $SYSWRITE, %EAX
mov $STDOUT, %EBX
mov $s1, %ECX
mov $16, %EDX
int $SYSCALL
ret

sec:
mov $SYSWRITE, %EAX
mov $STDOUT, %EBX
mov $s2, %ECX
mov $13, %EDX
int $SYSCALL
ret

nl:
mov $SYSWRITE, %EAX
mov $STDOUT, %EBX
mov $s3, %ECX
mov $2, %EDX
int $SYSCALL
ret

l:
mov $0, %EDX
mov $10, %EBX
div %EBX
add $48, %EDX
push %EDX
inc %ESI
cmp $0, %EAX
jz next
jmp l
next:
cmp $0, %ESI
jz exit
dec %ESI
mov $SYSWRITE, %EAX
mov %ESP, %ECX
mov $STDOUT, %EBX
mov $1, %EDX
int $SYSCALL
add $4, %ESP
jmp next
exit:
ret

sort:
mov $0, %EAX
mov $0, %EBX
mov $0, %ESI
w:
cmp $36, %EBX
jge r
mov tab(%EBX), %EAX
add $4, %EBX
cmp %EAX, tab(%EBX)
jl x
jmp w
x:
xchg %EAX, tab(%EBX)
sub $4, %EBX
mov %EAX, tab(%EBX)
add $4, %EBX
mov $1, %ESI
jmp w
r:
cmp $1, %ESI
je sort
jmp k
k:
ret

ox:
xor %EDX, %EDX
xor %EAX, %EAX
xor %EBX, %EBX
xor %EDI, %EDI
xor %ECX, %ECX
ret

pp:
cmp $36, %EDI
jge en
mov tab(%EDI), %EAX
call l
add $4, %EDI
jmp pp
en:
ret

_start:
call f
call ox
call pp
call ox
call sec
call ox
call sort
call ox
call pp
call nl
call nl
mov $SYSEXIT, %EAX
mov $EXIT_SUCCESS, %EBX
int $SYSCALL
