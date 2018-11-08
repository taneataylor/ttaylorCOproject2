.data
  .data
string: .asciiz "Hello"
errorMsg: .asciiz "Input is too long."

    .text 
  .globl main
main:
  li $a0, 0  # first argument
  syscall
  
  la $a0, string # loads strings address