.global _start
.text
.data
tab: .long 1,7,9,5,2
e:
.equ s, (e-tab)/4
fun:
mov $0, %EDX
mov $0, %ESI
w:
cmp %ECX, %ESI
je end
cmp (%EBX,%ESI,4), %EDX
jl x
inc %ESI
jmp w
x:
mov (%EBX, %ESI, 4), %EDX
mov %ESI, %EDI
inc %ESI
jmp w
end:
add $1, %EDI
ret
_start:
push %ECX
push %EBX
mov $tab, %EBX
mov $s, %ECX
call fun
nop
