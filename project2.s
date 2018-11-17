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
  
