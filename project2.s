.data
  # string: .asciiz "Hello" 
  emptyMsg: .asciiz "Input is empty."
  errorMsg: .asciiz "Input is too long."
  userMsg: .space 500
  invalidMsg: .asciiz "Invalid base-N number."

.text
exit:
  li $v0, 10
  syscall
  
  