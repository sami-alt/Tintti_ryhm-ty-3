.data
	lst: .byte 1,2,3,4,5,6,7,8,9,10,0
    .text
	.globl main

main:
	la x9, lst
    li x20, 0
    lb a0, 0(x9)

loop:
	lb x10, 0(x9)
    beq x10, x0, done
    addi x20, x20, 1
    addi x9, x9, 1
    j loop

done:
	mv a0, x20 
	li a7, 1
    ecall

    li a7, 10

#tulos 10

