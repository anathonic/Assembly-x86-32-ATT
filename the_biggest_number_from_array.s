.global _start
.text
.data
tab: .long 1,7,9,5,2
e:
.equ s, (e-tab)/4
_start:
mov $0, %EAX
mov $0, %EBX
mov $s, %ECX
w:
cmp %EAX, %ECX
je end
inc %EAX
cmp tab(%EBX), %EDX
jl x
add $4, %EBX
jmp w
x:
mov tab(%EBX), %EDX
mov %EAX, %ESI
add $4, %EBX
jmp w
end:
nop
#EDX = number, ESI = index
