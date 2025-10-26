.data
    numerot: .byte 2,4,1,3,8,3,2,0 

.text
.globl main

main:
	jal ra, listan_pituus
    jal ra, isoin_alkio

    li a7, 10
    ecall

listan_pituus:
    addi sp, sp, -8
    sw x9, 0(sp)
    la x9, numerot
    li x20, 0
    li x21, 0

loop_pituus:
    lb x10, 0(x9)
    beq x10, x0, pituus_laskettu
    addi x20, x20, 1
    addi x9, x9, 1
    j loop_pituus

pituus_laskettu:
    mv x21, x20
    lw x9, 0(sp)
    addi sp, sp, 8
    ret
	
isoin_alkio:
    li x20, 0
    la x9, numerot
    li x12, 0

loop:
    beq x12, x21, done
    lb x10, 0(x9)
    bgt x10, x20, aseta_alkio

continue:
    addi x9, x9, 1
    addi x12, x12, 1
    j loop
   
aseta_alkio:
    mv x20, x10
    j continue

done:
    mv a0, x20
    li a7, 1
    ecall
    ret
