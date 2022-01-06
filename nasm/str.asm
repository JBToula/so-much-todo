  strlen:
            push      rcx                     ; store initial address since this will be incremented in the loop
            xor       rax, rax                ; zero out rax, will be the counter
            dec       rcx                     ; decrememnt rcx so first inc will set it back to the right place
      .loop:
            inc       rcx                     ; move to next byte
            inc       rax                     ; increment the counter
            cmp       byte[rcx], 0            ; compare the current byte to 0 to see if string is at the end
            jnz       .loop                   ; if it wasn't zero, loop

            dec       rax                     ; if the comparison was 0, the rax is one value too high, so subtract 1
            pop       rcx                     ; bring back original value, pointer to the start of the string
            ret

  print:    
            call      strlen                  ; get the length of the string
            mov       rdx, rax                ; store result in rdx

            mov       rax, 1                  ; set the syscall to write
            mov       rdi, 1                  ; set the target to stdout
            mov       rsi, rcx                ; move the string pointer into rsi for use by the syscall
            syscall                           ; print to stdout
            ret