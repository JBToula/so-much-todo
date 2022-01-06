%include 'str.asm'

section .data
  message:  db        "This is a new string with a different length", 10      ; note the newline at the end


section   .text
  
  global    _start
  
  _start:   
            mov       rcx, message 
            call      print

            mov       rax, 60                 ; system call for exit
            xor       rdi, rdi                ; exit code 0
            syscall                           ; invoke operating system to exit