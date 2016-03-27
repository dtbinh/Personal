#RONALD BALCHAND
#109806273 

.data
toUpper_CSisFun: .asciiz "Computer Science is fun"
strcmp_str2: .asciiz "MIPS - Millions.of.Instruction.Per...Second"
length2Char_char: .asciiz "S"
strcmp_str1: .asciiz "MIPS!!"
toMorse_mcmsg: .space 30
#zero: .asciiz "\0"
null1: .asciiz ""
#strcmp_str2: .asciiz "MIPS - Millions.of.Instruction.Per...Second"
#


#.macro print_newline
#	li $v0, 11
#	li $a0, '\n'
#	syscall 
#*#.end_macro

#.macro print_string(%address)
#	li $v0, 4
#	la $a0, %address
#	syscall 
#.end_macro
.text
.globl main


main:

	#la $a0 toUpper_CSisFun
	#la $a1 length2Char_char
	la $a0, toMorse_mcmsg
	la $a1, null1
	#li $a2, 8
	jal length2Char
	#jal length2Char
#move $t0, $v0
#	move $t1, $v1
	#li $v0, 1
	#syscall

#la $a0 

li $v0, 10
syscall

.include "hw2.asm"
