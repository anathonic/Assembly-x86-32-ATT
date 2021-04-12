.global _start
.text
_start:

mov $8, %EAX #index
mov $1, %EBX
mov $2, %ECX
cmp $0, %EAX
je a
cmp $1, %EAX
je b
cmp $2, %EAX
je b
while:
cmp $3, %EAX
je end
dec %EAX
add %ECX, %EBX
xchg %EBX, %ECX
jmp while
a:
jmp end
b:
mov $1, %ECX
end:
nop
#ECX - value for index
