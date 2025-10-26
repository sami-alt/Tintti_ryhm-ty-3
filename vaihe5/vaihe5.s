.data
    sanat: .word 5,5,-5,5,0 #summa 10

.text
.globl main

main:
    jal ra, sanapituus
    jal ra, sanasumma

    li a7, 10
    ecall

sanapituus:
    addi sp, sp, -8
    sw x9, 0(sp)
    la x9, sanat
    li x20, 0


loop_pituus:
    lw x10, 0(x9)
    beq x10, x0, pituus_laskettu
    addi x20, x20, 1
    addi x9, x9, 4
    j loop_pituus

pituus_laskettu:
    mv x21, x20
    lw x9, 0(sp)
    addi sp, sp, 8
    ret

sanasumma:
    la x9, sanat
    li x20, 0
    li x12, 0
    j loop

loop:
    beq x12, x21, done
    lw x10, 0(x9) 
    add x20, x20, x10
    addi x9, x9, 4
    addi x12, x12, 1
    j loop

done:
    mv a0, x20
    li a7, 1
    ecall
    ret
