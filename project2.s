# N = 31
.data
  # string: .asciiz "Hello" 
  emptyMsg: .asciiz "Input is empty."
  errorMsg: .asciiz "Input is too long."
  userMsg: .space 500
  invalidMsg: .asciiz "Invalid base-31 number."

.text
exit:  # exit function
  li $v0, 10 # loads exit/10
  syscall
  
error_empty_input:  # empty case
  la $a0, emptyMsg  # load emptyMsg string into register $a0  
  li $v0, 4  # print string
  syscall
  j exit  # jumps to exit function
  
error_long_input:  # long input case
  la $a0, errorMsg  # load errorMsg string into register
  li $v0, 4
  syscall
  j exit
  
error_invalid_input:  # invalid input case
  la $a0, invalidMsg  # loads invalidMsg string to register
  li $v0, 4
  syscall
  j exit

main:
  li $v0, 8  # reads the string in
  la $a0, userMsg
  li $a1, 250 # loads 250 into a1 register
  syscall
  
delete_left_spaces:
  li $t3, 32  # $t3 = 32(space)
  lb $t4, 0($a0)
  beq $t3, $t4, delete_first_char  # branch to delete_first_char if $t3 == $t4
  move $t4, $a0  # copies value from $t4 register to $a0
  j input_length  # jumps to input_length function
  
delete_first_char:  
  addi $a0, $a0, 1    # $a0 = $a0 + 1
  j delete_left_spaces
 
input_length:
  addi $t0, $t0, 0  # $t0 = $t0 + 0
  addi $t1, $t1, 10    # $t1 = $t1 + 10
  add $t2, $t2, $a0    # $t2 = $t2 + $a0(1)

len_iter:
  lb $t8, 0($a0)  # loads byte into temp
  beqz $t8, len_found  
  beq $t8, $t1, len_found  # branches if equal
  addi $a0, $a0, 1 
  addi $t0, $t0, 1
  j len_iter
  
len_found:
  beqz $t0, error_empty_input
  slti $t9, $t0, 5  # if $t0 is less than $t3, sets $t3 to 1
  beqz $t9, error_long_input
  move $a0, $t2  # $a0 == $t4
  j check_strings  # will implement later
  
check_strings:
  lb $t5, 0($a0)
  beqz $t5, conversion_prep
  beq $t5, $t1, conversion_prep
  slti $t6, $t5, 48
  bne $
  