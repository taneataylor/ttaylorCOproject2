# N = 
.data
  # string: .asciiz "Hello" 
  emptyMsg: .asciiz "Input is empty."
  errorMsg: .asciiz "Input is too long."
  userMsg: .space 500
  invalidMsg: .asciiz "Invalid base-N number."

.text
exit:  # exit function
  li $v0, 10 # loads exit/10
  syscall
  
error_empty_input:  #
  la $a0, emptyMsg  # load emptyMsg string into register $a0  
  li $v0, 4  # print string
  syscall
  j exit  # jumps to exit function
  
  