.global _start
.text
.data
tab: .long 9,1,8,2,7,3,6,4,5
e:
.equ b, e-tab
_start:
s:
mov $0, %EAX
mov $0, %EBX
mov $0, %ESI
w:
cmp $b, %EBX
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
je s
jmp end
end:
nop
