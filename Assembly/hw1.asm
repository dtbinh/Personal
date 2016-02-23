 # Homework #1 
 # name: RONALD BALCHAND 
 # sbuid: 109806273
 

.data 

.align 2 
isNegative: .word 0 #boolean isNegative, 0 when false, 1 when true
sum: .word 0 #sum == 0
arg1: .word 0
arg2: .word 0 
negativeSign: .byte '-'
ten: .word 10

minAscii: .word 48
maxAscii: .word 57
error: .asciiz "Incorrect argument provided.\n"
 
sm: .asciiz "Signed Magnitude: " 
one: .asciiz "One's Complement: " 
gray: .asciiz "Gray Code: " 
dbl: .asciiz "Double Dabble: " 
msg1: .asciiz "You entered " 
msg2: .asciiz " which parsed to " 
msg3: .asciiz "In hex it looks like "
newline:.asciiz "\n"
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
 lw $s0, sum #Sum initialized at 0
 lw $s1, isNegative #boolean, 0 is false, 1 is true, initialized at 0
 lw $s2, arg1 #loads the string from arg1 onto $s2
 li $s3, 48 #value of ascii character 0   
 li $s4, -1 #negative 
 li $s5, 0 #absolute value of zero needed
 li $s6 1 #absolute value of 1 needed
 li $s7 0#iterator bruh
 lw $t9, arg1
 
 
 
 
 lb $t1, 0($s2) # loads the first byte first to see if it is a negative
 beq $t1, '-', negative
 add $s1, $s1, $s5 #isNegative is false, being a 0
 #letter check rn
 lw $t2 minAscii #lower bound
 lw $t3 maxAscii #upper bound
 
 bgt $t1, $t3, notAnumber#dismissed
 blt $t1, $t2, notAnumber#dismissed
  
 j looping
 
 #47-58
 negative:
 add $s1, $s1, $s6 #make isNegative value is 1 
 add $s7, $s7, $s6 #move the iterator along
 add $s2, $s2, $s6#update address load the next byte
 lb $t1, 0($s2)#loads the next byte 
 #la $a0, ($s6)
 #li $v0 1
 #syscall
 
 j looping
 
 
 looping:
 
 j while
 
 while:
 
 beq $t1, 0 , done#checks to see if it is the null character
  #letter check rn
 lw $t2 minAscii #lower bound
 lw $t3 maxAscii #upper bound
 
 bgt $t1, $t3, notAnumber#dismissed
 blt $t1, $t2, notAnumber#dismissed
 
 #letter check done
 #time to process the value
 sub $t4, $t1, $t2#get the character subtraction value
 lw $t5 ten#get ten
 mul $s0 $s0, $t5#multiply sum by 10 
 #mfhi $s0#get it from the hi register 
 add $s0 $s0 $t4#add the new value
 #processing value done
 
 
 add $s7, $s7, $s6 #move the iterator along
 add $s2, $s2, $s6#update address load the next byte
 lb $t1, 0($s2)#loads the next byte
 
 
 j while
 
 
 
  
 notAnumber:
 
 add $s0, $s0, $s5 #adds 0 so the sum
 j done
 
 
 
 done:
 beq $s1, $s6 negate
 
 j reallyDone
 
 negate:
 
 mul $s0 $s0 $s4
 j reallyDone

 reallyDone:
 li $v0, 4
 la $a0, msg1# you entered
 syscall
 
 la $a0, ($t9)#original thing
 li $v0, 4
 syscall
 
 la $a0, msg2#which parsed to 
 li $v0, 4
 syscall
 
 la $a0 0($s0)#resultant number
 li $v0 1
 syscall
 
 la $a0, newline
 li $v0 4
 syscall 
 
 la $a0, msg3
 li $v0 4
 syscall
 
 la $a0, 0($s0)
 li $v0 34
 syscall
 
 
 j part2
 
 
 part2:
 
 la $a0, newline
 li $v0 4
 syscall 
 
 lw $s7 arg2#gets the character from the second argument
 lb $t0, 0($s7)#loads the next byte
 li $t1, 49#value of "1"
 li $t2, 115#value of "s"
 li $t3, 103#value of "g"
 
 
 beq $t0, $t1, onesComplement
 beq $t0, $t2, signedMagnitude
 beq $t0, $t3, grayCode
 
 la $a0, error
 li $v0 4
 syscall
 j trulyDone
 
 
 onesComplement:
 beq $s1, $s6, flipEm
 
 la $a0, newline
 li $v0 4
 syscall 
 la $a0, one
 li $v0 4
 syscall
 la $a0, ($s0)
 li $v0 34
 
 
 flipEm:
 
 li $at -1
 xor $s0 $at $s0
 la $a0, newline
 li $v0 4
 syscall 
 la $a0, one
 li $v0 4
 syscall
 la $a0, ($s0)
 li $v0 34
 syscall
 j trulyDone
 
 signedMagnitude:
 beq $s1, $s6, flipFirst
 la $a0, newline
li $v0 4
syscall 
la $a0, sm
li $v0 4
syscall
add $s0 $s0 $t8
la $a0, ($s0)
li $v0 34
syscall
j trulyDone
 

 
 
 flipFirst:
la $a0, newline
li $v0 4
syscall 
la $a0, sm
li $v0 4
syscall
li $t8 2147483648 
add $s0 $s0 $t8
la $a0, ($s0)
li $v0 34
syscall
j trulyDone


j trulyDone 
 
 grayCode:
 
 
 trulyDone:

 li,$v0,10
 syscall
 
 
 
 
 
 
 
 
 
 
 
 

 
