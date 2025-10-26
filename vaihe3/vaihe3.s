.data
    tavut: .byte 1,2,3,4,5,6,7,8,9,0
    .align 2
    sanat: .word 1,2,3,4,5,6,7,8,9,10,0


.text
.globl main

main:
    jal ra, tavupituus
	
    #rivin vaihto
	li a0, 10
	li a7, 11
	ecall
    
    jal ra, sanapituus 
    
    li a7, 10
    ecall



tavupituus:
    la x9, tavut
    li x20, 0
    j loop_byte

sanapituus:
    la x9, sanat
    li x20, 0
    j loop_word

loop_byte:
    lb x10, 0(x9)
    beq x10, x0, done_tavu
    addi x20, x20, 1
    addi x9, x9, 1
    j loop_byte

loop_word:
    lw x10, 0(x9)
    beq x10, x0, done_sana
    addi x20, x20, 1
    addi x9, x9, 4
    j loop_word

done_tavu:
    mv a0, x20
    li a7, 1
    ecall
    ret

done_sana:
	mv a0, x20
    li a7, 1
    ecall
	ret




