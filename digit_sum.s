.global _start
.text
_start:
mov $1998, %EAX
mov $10, %EBX
w:
div %EBX
add %EDX, %ECX
mov $0, %EDX
cmp $0, %EAX
je end
jmp w
end:
nop
#ECX - sum
