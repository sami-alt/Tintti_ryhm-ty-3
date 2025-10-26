.data
    tavut: .byte 5,5,-5,5,0 #summa 10

.text
.globl main

main:
    jal ra, tavupituus
    jal ra, tavusumma

    li a7, 10
    ecall

tavupituus:
    addi sp, sp, -8
    sw x9, 0(sp)
    la x9, tavut
    li x20, 0


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

tavusumma:
    la x9, tavut
    li x20, 0
    li x12, 0
    j loop

loop:
    beq x12, x21, done
    lb x10, 0(x9) 
    add x20, x20, x10
    addi x9, x9, 1
    addi x12, x12, 1
    j loop

done:
    mv a0, x20
    li a7, 1
    ecall
    ret
