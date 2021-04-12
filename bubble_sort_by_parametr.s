.global _start
.text
.data
tab: .long 9,1,8,2,7,3,6,4,5
e:
.equ s, (e-tab)/4
f:
mov $0, %ESI
mov $0, %EDX
p:
cmp %ECX, %ESI
jge r
mov (%EBX,%ESI,4), %EAX
inc %ESI
cmp %EAX, (%EBX,%ESI,4)
jl x
jmp p
x:
xchg %EAX, (%EBX,%ESI,4)
dec %ESI
mov %EAX, (%EBX, %ESI, 4)
inc %ESI
mov $1, %EDX
jmp p
r:
cmp $1, %EDX
je f
ret
_start:
push %ECX
push %EBX
mov $tab, %EBX
mov $s, %ECX
call f
nop
