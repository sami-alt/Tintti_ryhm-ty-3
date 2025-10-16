.data
    tavut: .byte 1,2,3,4,5,6,7,8,9,10,0
    sanat: .word 1,2,3,4,5,6,7,8,9,10,0
    .text
    .globl main

main:
    la x9, tavut
    li x20, 0
    jal ra, tavupituus

    jal ra, sanapituus

    li a7, 10


tavupituus:


sanapituus:

.loop_byte:
    lb x10, 0(x9)
    beq x10, x0, done

    j loop_byte