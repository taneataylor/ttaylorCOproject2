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
  
error_invalid_input:
  la $a0, invalidMsg  # loads invalidMsg string to register
  li $v0, 4
  syscall
  j exit
