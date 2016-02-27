# Hello World

.text
#print a greeting on the screen

	li $v0, 4 
	la $a0, greeting
	syscall
	
	#Display prompt
	li $v0, 4
	la $a0, prompt
	syscall
	#Read the age
	li $v0, 5
	syscall
	#Compute the new age
	move $t1,$v0
	addi $t1, $t1, 5
	#Prints new Page
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0,1
	move $a0, $t1
	syscall	
	
#terminate
	li,$v0,10
	syscall 
.data

greeting: .asciiz "Hello World!\n"
prompt: .asciiz "Enter your age"
output: .asciiz "Your age is"