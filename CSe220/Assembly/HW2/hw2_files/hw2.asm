##############################################################
# Homework #2
# name: RONALD BALCHAND
# sbuid: #109806273
##############################################################
.data
zero: .asciiz "\0"
.text

##############################
# PART 1 FUNCTIONS 
##############################

toUpper:
	#Avoid copying, edit just the argument itself
	#the original string is in the $a0 register
	#returns the address(which should be the same) of the string in the $v0
	la $s0 ($a0)#load the original address to save it inside a saved register for later
	addi $sp, $sp, -8 #two things to save
	sw $s0 0($sp)#save the original address to the stack
	sw $ra 4($sp)#save the return address to the stack
	addi $a0 $a0 -1 #initialize before teh start to move forward when the loop starts 
	jal toUpper_Loop
	
toUpper_Loop:
	#Looper method to go through the character array
	#$s0 currently contains the address of the original value
	#edit $a0 to iterate through
	addi $a0 $a0 1#move up tghrough the string
	lb $t0 0($a0)#load the first byte at the current 0 address
	beqz $t0 toUpper_Loop_Done#if the null character(== to 0)
	bgt $t0 122 toUpper_Loop#if th character is out of range just return to the top of the function
	blt $t0 97 toUpper_Loop#lower bounds of the character array
	#now all cases have been handled, will only reach this point if it is lower case
	li $t1 32
	sub $t0 $t0 $t1#subtracting 32 capitalizes the character
	#move $a0 $t0
	#li $v0, 11
	#syscall
	sb $t0 ($a0)
	j toUpper_Loop
	
	
 toUpper_Loop_Done:
 
 lw $s0 0($sp)#reretrieve the original address of the $a0 original String
 lw $ra 4($sp)#reretrive the return address 
 
 move $v0, $s0 #load the address into the return register
 addi $sp, $sp, 8 #re-capp the stack
 jr $ra #jump register to the return address

#ENDING OF THE CAPITALIZATIOPN CODE

length2Char:
	#String is located in the $a0 register
	la $s0 ($a0)#places the address of the original  String in a safer $s0 register
	li $s1 0#beginning index and counter for the length of the String
	la $s2 ($a1)#Places the address of the original Char to be stopped at in the $s2 register
	addi $sp $sp -20 #four things to save on the stack
	
	sw $s0, 0($sp)#Save the address of the String on the stack 
	sw $s1, 4($sp)#Save the value of the Counter on the stack
	sw $ra, 8($sp)#Save the return address 
	sw $a0, 12($sp)#Save the original address of the String on the arguments
	sw $s2, 16($sp)#Save the addess of the stop character in the stack
	jal length_Looper
	
length_Looper:

	lb $t0 0($s0)#Read that first byte at the zero address
	lb $t1 0($s2)#Read the "First Byte" of character string 
	beqz $t0 length_Looper_done#if null character then break out
	beq $t0 $t1 length_Looper_done #if the 2char value is reached 
	#other wise
	addi $s0 $s0 1#increment the address
	addi $s1 $s1 1#increment the counter
	j length_Looper#keep looping cuz no ull character has been reached
	
length_Looper_done:
	move $v0, $s1#load the couinter value to the returning registers

	lw $s0, 0($sp)#return the original address to the s register
	lw $s1, 4($sp)#return the original value of the counter 
	lw $ra, 8($sp)#retrieve the return address
	lw $a0, 12($sp)#makes sure argument register stays the same
	lw $s2, 16($sp)
	addi $sp, $sp, 20#recapp the stack

	jr $ra#jump to the return address back to the caller
#END OF THE STRING LENGTH CODE
	
	

strcmp:
	#three arguments here for this function saved in the a0, a1, and a2 registers
	#a0 and 1 are addresses of the two strings and a2 is the value of the length value
	#many checks and calculations to do with the length value
	#length value determines where to stop comparing the strings, and bounds must be checked
	#two terms returned to the v0 and v1 registers, v0 being how many terms matched and v1 being whether it matched or not
	addi $sp, $sp, -16 #four things to keep in stack
	sw $a0 0($sp)#first string at 0
	sw $a1 4($sp)#second string at 4
	sw $a2 8($sp)#length value at 8
	sw $ra 12($sp)#return address
	
	la $a1 zero
	jal length2Char#accesses a0 and places the return value in v0
	move $s3 $v0#length of first string sent to s3
	#function called - restore the stack
	lw $a0 0($sp)
	lw $a1 4($sp)
	lw $a2 8($sp)
	lw $ra 12($sp)
	addi $sp $sp 16
	
	#Time to do the second one
	addi $sp, $sp, -16 #four things to keep in stack
	sw $a0 0($sp)#first string at 0
	sw $a1 4($sp)#second string at 4
	sw $a2 8($sp)#length value at 8
	sw $ra 12($sp)#return address
	
	
	la $a0 ($a1)#transfer the address to the first one
	la $a1 zero
	jal length2Char##access a0 and places the return value in v0
	move $s4 $v0#length of the second string sent to the $s4
	
	lw $a0 0($sp)#to get back the value of the original address  of String one reload from the stack
	lw $a1 4($sp)#unpacking of the stack
	lw $a2 8($sp)#all original arguments have been resored
	lw $ra 12($sp)#return address is restoreed from before the lengths of the two strings were calculated
	addi $sp, $sp, 16
	#2 lengths now stored in s3 and s4, now to check the length parameter
	#first important values must be saved from the argument registers
	li $s5 0#these will be the values incremented
	li $s6 1#andreturned from the function, but are initialized now to check and return based on the length argument
	move $s2 $a2 #the length argument s in its s register now
	la $s0 ($a0) #first string address loaded into s0 register
	la $s1 ($a1) #second string loaded into s1 register
	li $s7 0 #this register will be the counter for the current position in each string
	
	
	#in case a branch is reached, the stack will be needed to be packed and unpacked
	#So first load the stack with the values necessary to be saved
	#many things need to be saved because of the various function calls that could take place
	addi $sp $sp -36#allocate space on the stack
	sw $s0 0($sp)#Save the first string address
	sw $s1 4($sp)#Save the Second String adress
	sw $s2 8($sp)#Save the length argument
	sw $s3 12($sp)#Save the length of the first String
	sw $s4 16($sp)#Save the length of the second String
	sw $s5 20($sp)#Save the original value of the return value  
	sw $s6 24($sp)#Save the original value of the second return value
	sw $s7 28($sp)#Save the counter original value
	sw $ra 32($sp)#Save the return address for unpacking
	
	#now test cases for the length argument
	li $s6 0 #incase of early breakup in the next segment, temporarily keep the second value at 0
	
	blt $s2 $0 strcmp_done#if the length argument is less than the initial value zero, argument invalid
	bgt $s2 $s3 strcmp_done#if the length argument is greater than the length of the first string, argument is invalid 
	bgt $s2 $s4 strcmp_done #if the length argument is greater than the length of the second string, argument is invalid
	#by now the length variable is atleast zero and smaller than the size of both strings
	
	li $s6 1 #now restore the "initial" value
	bne $s2 $0 strcmp_Looper#if the length argument is not equal to 0, use the value at the $s2 for the ending of your comparison search
	#if this point is reached then the value of the length variable is definitely 0
	beq $s2 $0 strcmp_Zero_Looper#separate dfferent looping function to go through both strings because the clause for exiting and bounds are different
	

	
	

strcmp_Looper:
	#branched to because the length argument is not equal to 0 nut within the bounds of the two lengths
	#s7 register will be used here to keep track of how far through the Strings it has traversed
	#s5 keeps track of how many equal numbers were found
	#s6 is initialized to 1, equal
	
	bge $s7 $s2 strcmp_done #if the counter has reached the length then quit
	
	
	lb $t0 ($s0) #load first byte from the s0 register
	lb $t1 ($s1) #load first byte from the s1 register
	
	
	addi $s0 $s0 1#move up in the 1st string
	addi $s1 $s1 1#move up in the 2nd string
	addi $s7 $s7 1#move the iterator along
	
	bne $t0 $t1 notEqual#branch to this if these two characters are not equal
	#if this point is reached, the two characters are deemed equal to each other
	addi $s5 $s5 1#increment the amount of equal characters there are
	j strcmp_Looper
	

notEqual:#two characters are not deemed equal
	addi $s6 $0 0#set the value at s register 6 to zero because somehing is not equal
	j strcmp_Looper#return to the looper


strcmp_Zero_Looper:
	#branched to because the length argument is equal to zero
	#strings must be parsed till one hits null character
	#4s5 keeps track of the number of equal characters, s7 will not be used here, and s6 was initialized to 1
	lb $t0 ($s0)#load the first byte from the first string
	lb $t1 ($s1)#load the first byte from the second string
	beq $t0, 0, strcmp_done#exit if either of them is the null character
	beq $t1, 0, strcmp_done
	
	addi $s0 $s0 1#move up in the 1st string
	addi $s1 $s1 1#move up in the 2nd string
	
	bne $t0, $t1, zNotEqual #if the two characters are not equal branch to this function to jump back
	#if reached past here,the characters are equal
	addi $s5 $s5 1#the values are equal, so increment the amount of equal characters
	j strcmp_Zero_Looper

zNotEqual:#the two characters entered are not equal
	addi $s6 $0 0
	j strcmp_Zero_Looper	
	
	
strcmp_done:
	#Final stage function
	move $v0 $s5 #returns the number of characters matched
	move $v1 $s6 #whether or not the two strings matched, returning either a 0(not matched)

# must unpack the stack
	lw $s0 0($sp)#Reload the first string address
	lw $s1 4($sp)#Reload the Second String adress
	lw $s2 8($sp)#Reload the length argument
	lw $s3 12($sp)#Reload the length of the first String
	lw $s4 16($sp)#Reload the length of the second String
	lw $s5 20($sp)#Reload the original value of the return value  
	lw $s6 24($sp)#Reload the original value of the second return value
	lw $s7 28($sp) #Reload the counter register
	lw $ra 32($sp)#Reload the return address for unpacking
	addi $sp $sp 36#reallocate the stack space
	jr $ra 
	
	#ENDING OF THE STRCMP CODE
	
##############################
# PART 2 FUNCTIONS
##############################

toMorse:
	#basically turns a string into morse code representation
	#a0 contains the original String address
	#a1 contains the address of the mcmsg space
	#a2 contains the total number of bytes allocated to store morse code sequence and the null terminator
	#each word in the array of Morse code constants is separated by four bytes when accessing the address
	

	
	la $s0 ($a0)#load the address of the original String to the first s register
	la $s1 ($a1)#load address of the space allocated to the second s register
	move $s2 $a2#load the size argument into the third s register
	li $s3 0 # this variable will be the current length of the mcmsg, and will need to be preserved accross function calls
	li $s4 -1 #this register will be used for the upper bound for the s3 registers value, 
	#initialized to -1 because the (size - 1) values must be able to be stored
	add $s4 $s4 $s2#finalized the value of $s4 to be the upper bound of how much could be added
	#s4 now equals (size - 1), s3 should always be less than
	li $s5 1 #register initialized to hold the second return value, initialized to 1 till further notice
	#s6 contains the total value for the amount of space
	li $s6 0#register will be used to read each word from the Morsecode  array
	
	#7 values, one return address to place on the stack, 8 items in total
	addi $sp $sp -32
	sw $s0 0($sp)#save the address of the original string on the stack
	sw $s1 4($sp)#save the address of the space allocated on the stack
	sw $s2 8($sp)#save the original  size argument to the stack
	sw $s3 12($sp)#save the variable to keep track of the current length of the mcmsg to the stack
	sw $s4 16($sp)#save the upper bound to the stack
	sw $s5 20($sp)#save the original value of the second return value 
	sw $s6 24($sp)#save the value for the temporary word 
	sw $ra 28($sp)#save the return address
	
	j morseLooper
	
	
	
morseLooper:
	#s0 is the address of the regular string
	bge $s3 $s4 morseIncompleteDone#if the current number is equal to(or greater than) the upperbound, whether or not the last character is null, limit has been reached 
	#bge $s6 $s4 morseIncompleteDone#if the current number of bytes being used exceeds the upper bounds of the size(same as the upper bounds of size for space), limit has been reached 
	lb $t0 ($s0)#loads the first byte at the zero address
	beq $t0 0 morseCompleteDone #The null character has been reached while the length(s3) has remained less than the upper bounds (s4)
	#BOTH FUNCTIONS ABOVE NEED TO ADD THE NULL CHARACTER TO THE END 
	beq $t0 32 morseSpace#current byte reached is a space
	bgt $t0 90 invalidCurrent #the byte loaded is greater than the bounds of the MorseCode characters
	blt $t0 33 invalidCurrent #the byte loaded is less than the bounds of the MorseCode characters
	#if this point is reached the current loaded byte is within the bounds, and can be found in the morseCode array
	
	li $t2 33
	sub $t0 $t0 $t2#get the actual numerical place of the character within the bounds of the MCArray
	#t0 now contains the index
	add $t0, $t0, $t0    # double the index
     	add $t0, $t0, $t0    # double the index again (now 4x)
     
	la $t1 MorseCode#load the zero address of the array into the second temporary register
	add $s7 $t0 $t1#now s7 will have the full address of what word you want
	lw $s6 ($s7) #$s6 will now have the address of the word 
	sb $t4 ($s6)#load the first byte into the t register
	
	loop5:
	bge $s3 $s4 morseIncompleteDone#if the current number is equal to or grreater than the upperbound, limit reached
	beqz $t4, getout#null character has been found
	#byte loaded in $t3 is normal
	sb $s1 ($t4) #change the byte at said location 
	addi $s1 $s1 1#increment the address you are writing to by one
	addi $s3 $s3 1 #increment the size by one
	addi $s6 $s6 1 #increment the address you are loading fropm by one
	sb $t4 ($s6)#load the next byte into the t variable
	j loop5  
	getout:
	#from here the null character has been reached and the loop is exited, meaning the word was printed
	#this is in between characters, so x must be entered
	lb $t3 120 #the value of 'x' to be placed twice here
	sb $t3 ($s1)#store the first x byte
	addi $s1 $s1 1#move to the next byte
	addi $s3 $s3 1#increase the size counter
	      
	        
	            
	j morseLooper
	
	
	
	
	
	

morseSpace:
	lb $t3 120 #the value of 'x' to be placed twice here
	sb $t3 ($s1)#store the first x byte
	addi $s1 $s1 1#move to the next byte
	addi $s3 $s3 1#increase the size counter
	sb $t3 ($s1)#store the second x byte 
	addi $s1 $s1 1 #move to the next byte
	addi $s3 $s3 1#increase the size counter
	addi $s0 $s0 1 #The space character ntakes up only one 
	j morseLooper
	

	
	
invalidCurrent:
	addi $s0 $s0 1#increment the address of the string to move to the next one
	j morseLooper 
	
morseCompleteDone:
	#null character must round off the end of the string
	#double x about to be added to the mcmsg end, s1 will be currently on where the null character would've gone
	lb $t3 120 #the value of 'x' to be placed twice here
	sb $t3 ($s1)#store the first x byte
	addi $s1 $s1 1#move to the next byte
	sb $t3 ($s1)#store the second x byte 
	addi $s1 $s1 1 #move to the next byte 
	lb $t4 0
	sb $t4 ($s1)
	addi $s3 $s3 1
	#message taken care of, now to load the return values
	move $v1 $s5 #Plaqce the return value in here
	move $v0 $s3 #Place the first sie return value in here
	
	
	#time to unpack the stack
	
	
	lw $s0 0($sp)#reload the address of the original string on the stack
	lw $s1 4($sp)#reload the address of the space allocated on the stack
	lw $s2 8($sp)#reload the original  size argument to the stack
	lw $s3 12($sp)#reload the variable to keep track of the current length of the mcmsg to the stack
	lw $s4 16($sp)#reload the upper bound to the stack
	lw $s5 20($sp)#reload the original value of the second return value 
	lw $s6 24($sp)#reload the current amount of bytes being used
	lw $ra 28($sp) 
	addi $sp $sp 32
	
	jr $ra
	
	



morseIncompleteDone:
	#Null character must round off the end of the string
	lb $t2 0#value of null into a byte
	sb $t2 1($s1)#save the value of the null to byte at the current s1(which will be at the end of the space)
	addi $s5 $0 0#make the second return value 0(false)
	move $v1 $s5#place the return value in 
	addi $s3 $s3 1#move the s3 counter up one more now that the null character was added
	move $v0 $s3 #place the return value in
	
	#time to unpack the stack
	
	
	lw $s0 0($sp)#reload the address of the original string on the stack
	lw $s1 4($sp)#reload the address of the space allocated on the stack
	lw $s2 8($sp)#reload the original  size argument to the stack
	lw $s3 12($sp)#reload the variable to keep track of the current length of the mcmsg to the stack
	lw $s4 16($sp)#reload the upper bound to the stack
	lw $s5 20($sp)#reload the original value of the second return value 
	lw $s6 24($sp)#reload the current amount of bytes being used
	lw $ra 28($sp) 
	addi $sp $sp 32
	
	jr $ra
	 
	        
	          
	            
	              
	                  
createKey:
	#Define your code here
	jr $ra

keyIndex:
	#Define your code here
	jr $ra

FMCEncrypt:
	#Define your code here
	############################################
	# DELETE THIS CODE. Only here to allow main program to run without fully implementing the function
	la $v0, FMorseCipherArray
	############################################
	jr $ra

##############################
# EXTRA CREDIT FUNCTIONS
##############################

FMCDecrypt:
	#Define your code here
	############################################
	# DELETE THIS CODE. Only here to allow main program to run without fully implementing the function
	la $v0, FMorseCipherArray
	############################################
	jr $ra

fromMorse:
	#Define your code here
	jr $ra



.data

MorseCode: .word MorseExclamation, MorseDblQoute, MorseHashtag, Morse$, MorsePercent, MorseAmp, MorseSglQoute, MorseOParen, MorseCParen, MorseStar, MorsePlus, MorseComma, MorseDash, MorsePeriod, MorseFSlash, Morse0, Morse1,  Morse2, Morse3, Morse4, Morse5, Morse6, Morse7, Morse8, Morse9, MorseColon, MorseSemiColon, MorseLT, MorseEQ, MorseGT, MorseQuestion, MorseAt, MorseA, MorseB, MorseC, MorseD, MorseE, MorseF, MorseG, MorseH, MorseI, MorseJ, MorseK, MorseL, MorseM, MorseN, MorseO, MorseP, MorseQ, MorseR, MorseS, MorseT, MorseU, MorseV, MorseW, MorseX, MorseY, MorseZ 

MorseExclamation: .asciiz "-.-.--"
MorseDblQoute: .asciiz ".-..-."
MorseHashtag: .ascii ""
Morse$: .ascii ""
MorsePercent: .ascii ""
MorseAmp: .ascii ""
MorseSglQoute: .asciiz ".----."
MorseOParen: .asciiz "-.--."
MorseCParen: .asciiz "-.--.-"
MorseStar: .ascii ""
MorsePlus: .ascii ""
MorseComma: .asciiz "--..--"
MorseDash: .asciiz "-....-"
MorsePeriod: .asciiz ".-.-.-"
MorseFSlash: .ascii ""
Morse0: .asciiz "-----"
Morse1: .asciiz ".----"
Morse2: .asciiz "..---"
Morse3: .asciiz "...--"
Morse4: .asciiz "....-"
Morse5: .asciiz "....."
Morse6: .asciiz "-...."
Morse7: .asciiz "--..."
Morse8: .asciiz "---.."
Morse9: .asciiz "----."
MorseColon: .asciiz "---..."
MorseSemiColon: .asciiz "-.-.-."
MorseLT: .ascii ""
MorseEQ: .asciiz "-...-"
MorseGT: .ascii ""
MorseQuestion: .asciiz "..--.."
MorseAt: .asciiz ".--.-."
MorseA: .asciiz ".-"
MorseB:	.asciiz "-..."
MorseC:	.asciiz "-.-."
MorseD:	.asciiz "-.."
MorseE:	.asciiz "."
MorseF:	.asciiz "..-."
MorseG:	.asciiz "--."
MorseH:	.asciiz "...."
MorseI:	.asciiz ".."
MorseJ:	.asciiz ".---"
MorseK:	.asciiz "-.-"
MorseL:	.asciiz ".-.."
MorseM:	.asciiz "--"
MorseN: .asciiz "-."
MorseO: .asciiz "---"
MorseP: .asciiz ".--."
MorseQ: .asciiz "--.-"
MorseR: .asciiz ".-."
MorseS: .asciiz "..."
MorseT: .asciiz "-"
MorseU: .asciiz "..-"
MorseV: .asciiz "...-"
MorseW: .asciiz ".--"
MorseX: .asciiz "-..-"
MorseY: .asciiz " -.--"
MorseZ: .asciiz "--.."


FMorseCipherArray: .asciiz ".....-..x.-..--.-x.x..x-.xx-..-.--.x--.-----x-x.-x--xxx..x.-x.xx-.x--x-xxx.xx-"

