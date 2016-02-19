 # Homework #1 
 # name: RONALD BALCHAND 
 # sbuid: 109806273
 

.data 

.align 2 
isNegative: .word 0 #boolean isNegative, 0 when false, 1 when true
sum: .word 0 #sum == 0
arg1: .word 0
arg2: .word 0 
negativeSign: .asciiz "-"
error: .asciiz "Incorrect argument provided.\n" 
sm: .asciiz "Signed Magnitude: " 
one: .asciiz "One's Complement: " 
gray: .asciiz "Gray Code: " 
dbl: .asciiz "Double Dabble: " 
msg1: .asciiz "You entered " 
msg2: .asciiz " which parsed to " 
msg3: .asciiz "In hex it looks like "
# Helper macro for grabbing command line arguments 

.macro load_args    
lw $t0, 0($a1)    
sw $t0, arg1    
lw $t0, 4($a1)    
sw $t0, arg2 
.end_macro 

 
  
.text
 .globl main
 
 main:
 
 load_args()#loading arguments
 #Variables first bruh
 #lw $s0, sum #Sum initialized at 0
 #lw $s1, isNegative #boolean, 0 is false, 1 is true
 
 lw $a0, arg1 
 li $v0, 4
 syscall
 #move $s3, $v0
 li $t6, 1#Starts at 1
 li $t7, 4#starts at 4
 sw $t6, arg1($0)
 sw $t6, arg1($t7)
 li $t0, 8
 
 syscall
 
 #move $s3 $a0
 #move $a0 $0
 #add $a0 $s3 $zero
 #li $v0, 4
 #syscall
 
 
 
 
 
 
 
 
 
 
 
 

 
