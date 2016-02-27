##############################################################
# Do NOT modify this file.
# This file is NOT part of your homework 2 submission.
##############################################################

.data
str_input: .asciiz "Input: "
str_result: .asciiz "Result: "
str_return: .asciiz "Return: "

# toUpper
toUpper_header: .asciiz "\n\n********* toUpper *********\n"
toUpper_CSisFun: .asciiz "Computer Science is fun."

# length2Char
length2Char_header: .asciiz "\n\n********* length2Char *********\n"
length2Char_char: .asciiz "S"
length2Char_CSisFun: .asciiz "Computer Science is fun."

# strcmp
strcmp_header: .asciiz "\n\n********* strcmp *********\n"
strcmp_str1: .asciiz "MIPS!!"
strcmp_str2: .asciiz "MIPS - Millions.of.Instruction.Per...Second"

# toMorse
toMorse_header: .asciiz "\n\n********* toMorse *********\n"
toMorse_plaintext: .asciiz "MIPS!!"
toMorse_mcmsg: .space 30
.align 2
toMorse_size: .word 30

# createKey
createKey_header: .asciiz "\n\n********* createKey *********\n"
createKey_phrase: .asciiz "Computer Science is fun."
createKey_key: .space 26
			   .byte 0

# keyIndex
keyIndex_header: .asciiz "\n\n********* keyIndex *********\n"
keyIndex_mcmsg: .asciiz "--x..x.--.x...xx..xx..-.x-.-.--xx"

# FMCEncrypt
FMCEncrypt_header: .asciiz "\n\n********* FMCEncrypt *********\n"
FMCEncrypt_plaintext: .asciiz "GO SEAWOLVES!"
FMCEncrypt_phrase: .asciiz "Computer Science is cool!"
FMCEncrypt_encryptBuffer: .space 100
.align 2
FMCEncrypt_size: .word 100

# FMCDecrypt
FMCDecrypt_header: .asciiz "\n\n********* FMCDecrypt *********\n"
FMCDecrypt_ciphertext: .asciiz "AWHCQTUWFIJTEMNU"
FMCDecrypt_phrase: .asciiz "Computer Science is cool!"
FMCDecrypt_decryptBuffer: .space 100
.align 2
FMCDecrypt_size: .word 100

# fromMorse
fromMorse_header: .asciiz "\n\n********* fromMorse *********\n"
fromMorse_morsecode: .asciiz " --x..x.--.x...x-.-.--x-.-.--"
fromMorse_plaintextBuffer: .space 30
.align 2
fromMorse_size: .word 30


# Constants
.eqv QUIT 10
.eqv PRINT_STRING 4
.eqv PRINT_INT 1
.eqv NULL 0x0

.macro print_string(%address)
	li $v0, PRINT_STRING
	la $a0, %address
	syscall 
.end_macro

.macro print_string_reg(%reg)
	li $v0, PRINT_STRING
	la $a0, 0(%reg)
	syscall 
.end_macro

.macro print_newline
	li $v0, 11
	li $a0, '\n'
	syscall 
.end_macro

.macro print_space
	li $v0, 11
	li $a0, ' '
	syscall 
.end_macro

.macro print_int(%register)
	li $v0, 1
	add $a0, $zero, %register
	syscall
.end_macro

.macro print_char_addr(%address)
	li $v0, 11
	lb $a0, %address
	syscall
.end_macro

.macro print_char_reg(%reg)
	li $v0, 11
	move $a0, %reg
	syscall
.end_macro

.text
.globl main

main:
	############################################
	# TEST CASE for toUpper	
	############################################
	print_string(toUpper_header)
	print_string(str_input)
	print_string(toUpper_CSisFun) 
	print_newline

	la $a0, toUpper_CSisFun
	jal toUpper

	move $t0, $v0
	print_string(str_result)	
	print_string_reg($t0) 
	print_newline

	############################################
	# TEST CASE for length2Char
	############################################
	print_string(length2Char_header)
	print_string(str_input)
	print_string(length2Char_CSisFun)
	print_newline

	la $a0, length2Char_CSisFun
	la $a1, length2Char_char 
	jal length2Char

	move $t0, $v0
	print_string(str_return)
	print_int($t0)
	print_newline

	############################################
	# TEST CASE for strcmp
	############################################
	print_string(strcmp_header)
	print_string(str_input)
	print_string(strcmp_str1)
	print_newline
	print_string(str_input)
	print_string(strcmp_str2)
	print_newline
	print_string(str_input)
	li $t1, 4
	print_int($t1)
	print_newline

	la $a0, strcmp_str1
	la $a1, strcmp_str2
	li $a2, 4
	jal strcmp

	move $t0, $v0
	move $t1, $v1
	print_string(str_return)
	print_int($t0)
	print_newline

	print_string(str_return)
	print_int($t1)
	print_newline


	############################################
	# TEST CASE for toMorse
	############################################
	print_string(toMorse_header)
	print_string(str_input)
	print_string(toMorse_plaintext)
	print_newline
	print_string(str_input)
	print_string(toMorse_mcmsg)
	print_newline
	print_string(str_input)
	lw $t9, toMorse_size
	print_int($t9)
	print_newline

	la $a0, toMorse_plaintext
	la $a1, toMorse_mcmsg
	lw $a2, toMorse_size
	jal toMorse

	move $t0, $v0
	move $t1, $v1

	print_string(str_result)
	print_string(toMorse_mcmsg)
	print_newline

	print_string(str_return)
	print_int($t0)
	print_newline

	print_string(str_return)
	print_int($t1)
	print_newline

	############################################
	# TEST CASE for createKey
	############################################
	print_string(createKey_header) 
	print_string(str_input)
	print_string(createKey_phrase)
	print_newline
	print_string(str_input)
	print_string(createKey_key)
	print_newline

	la $a0, createKey_phrase
	la $a1, createKey_key
	jal createKey

	print_string(str_result)
	print_string(createKey_key)
	print_newline

	############################################
	# TEST CASE for keyIndex
	############################################
	print_string(keyIndex_header) 
	print_string(str_input)
	print_string(keyIndex_mcmsg)
	print_newline

	la $a0, keyIndex_mcmsg
	jal keyIndex

	move $t0, $v0
	print_string(str_return)
	print_int($t0)
	print_newline

	############################################
	# TEST CASE for FMCEncrypt
	############################################
	print_string(FMCEncrypt_header)
	print_string(str_input)
	print_string(FMCEncrypt_plaintext)
	print_newline
	print_string(str_input)
	print_string(FMCEncrypt_phrase)
	print_newline
	print_string(str_input)
	print_string(FMCEncrypt_encryptBuffer)
	print_newline
	print_string(str_input)
	lw $t9, FMCEncrypt_size
	print_int($t9)
	print_newline

	la $a0, FMCEncrypt_plaintext
	la $a1, FMCEncrypt_phrase
	la $a2, FMCEncrypt_encryptBuffer
	lw $a3, FMCEncrypt_size
	jal FMCEncrypt

	move $t0, $v0
	move $t1, $v1

	print_string(str_return)
	print_string_reg($t0)
	print_newline

	print_string(str_return)
	print_int($t1)
	print_newline

	############################################
	# TEST CASE for FMCDecrypt
	############################################
	print_string(FMCDecrypt_header)
	print_string(str_input)
	print_string(FMCDecrypt_ciphertext)
	print_newline
	print_string(str_input)
	print_string(FMCDecrypt_phrase)
	print_newline
	print_string(str_input)
	print_string(FMCDecrypt_decryptBuffer)
	print_newline
	print_string(str_input)
	lw $t9, FMCDecrypt_size
	print_int($t9)
	print_newline

	la $a0, FMCDecrypt_ciphertext
	la $a1, FMCDecrypt_phrase
	la $a2, FMCDecrypt_decryptBuffer
	lw $a3, FMCDecrypt_size
	jal FMCDecrypt

	move $t0, $v0
	move $t1, $v1
	print_string(str_return)
	print_string_reg($t0)
	print_newline

	print_string(str_return)
	print_int($t1)
	print_newline


	############################################
	# TEST CASE for fromMorse
	############################################
	print_string(fromMorse_header)
	print_string(str_input)
	print_string(fromMorse_morsecode)
	print_newline
	print_string(str_input)
	print_string(fromMorse_plaintextBuffer)
	print_newline
	print_string(str_input)
	lw $t9, fromMorse_size
	print_int($t9)
	print_newline

	la $a0, fromMorse_morsecode
	la $a1, fromMorse_plaintextBuffer
	lw $a2, fromMorse_size
	jal fromMorse

	move $t0, $v0
	move $t1, $v1

	print_string(str_result)
	print_string(fromMorse_plaintextBuffer)
	print_newline

	print_string(str_return)
	print_int($t0)
	print_newline

	print_string(str_return)
	print_int($t1)
	print_newline


	# QUIT Program
quit_main:
	li $v0, QUIT
	syscall



#################################################################
# Student defined functions will be included starting here
#################################################################

.include "hw2.asm"
