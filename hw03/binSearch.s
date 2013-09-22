	.data
# do not modify
LIST:	
	.word -44 -4 0 1 2 4 7 9 23 126
line:   
	.asciiz " was found at index "
newline: 
	.asciiz "\n"
expect:
	.asciiz ", expected "
	
	.text 
	
	li $s0 10 # length of the LIST
	li $s1 0
	
	la $a1 LIST # get address of the array
printLoop:
	li $a2 0 # search from index = 0
	li $a3 10 # to index = 10
	
	sll $t0 $s1 2
	addu $t0 $t0 $a1
	lw $s2 0($t0)
		
	move $a0 $s2
	li $v0 1
	syscall # PRINT value
	
	la $a0 line
	li $v0 4
	syscall # PRINT " was found at index "
	
	move $a0 $s2
	jal binSearch
	move $s2 $v0
	move $a0 $v0
	li $v0 1
	syscall # PRINT index
	
	beq $s2 $s1 skipError
	la $a0 expect
	li $v0 4
	syscall # PRINT ", expected "
	
	move $a0 $s1
	li $v0 1
	syscall # PRINT expected index
		
skipError:
	la $a0 newline
	li $v0 4
	syscall # PRINT "\n"
	
	addiu $s1 $s1 1 # s1++
	blt $s1 $s0 printLoop # repeat
	
	li $v0 10
	syscall # EXIT
	
binSearch: # binSearch($a0,$a1,$a2,$a3)
	# ****** YOUR CODE STARTS HERE ******
	# $a0 = value
	# $a1 = list
	# $a2 = nmin
	# $a3 = nmax
	# $v0 = nmid, value
	# $t0 temp for nmid
	# $t1 list[nmid]
	# $t2 temp for 2
	# $t3 array counter/equality check
	addi $t2, $zero, 2
	add $v0, $a2, $a3 #nmid = nmin + nmax
	div $v0, $t2
	mflo $v0
	la $t3, ($a1)
	add $t0, $v0, $zero
	mul $t0, $t0, 4
	add $t3, $t3, $t0
	lw $t1, ($t3)
	sub $t3, $t1, $a0
	blez $t3, less
greater:
	subi $a3, $v0, 1
	j loop
less:
	beq $t1, $a0, end
	addi $a2, $v0, 1
	j loop
loop:
	beq $a3, $a2, binSearch
	sub $t1, $a3, $a2
	bgtz $t1, binSearch
end:
	j return
        #
	# Try not to deviate too greatly (if at all) from the C version.
        #
	# Ex: DO NOT look up the values of the $s registers, LIST, 
        # etc from above. You will receive no credit if you do.
        #
        # This problem can be solved using only the $a0-$a3,$t0-$t?,
        # $v0,$ra registers.
	
	
notFound: # you can delete / alter this label and line as needed
	li $v0 -1 # return value = -1
	
return:
	jr $ra # return
