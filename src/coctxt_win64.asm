.code
coctxt_switch proc
    mov  r10, gs:[48] 
    lea  rax, [rsp +  8]
    mov  [rdx +  0], rbp
    mov  [rdx +  8], rbx
    mov  [rdx + 16], r12
    mov  [rdx + 24], r13

    mov  r8 , [r10 +  8]
    mov  r9 , [r10 + 16]

    mov  [rdx + 32], r14
    mov  [rdx + 40], r15
    mov  [rdx + 48], rsi
    mov  [rdx + 56], rdi
    mov  [rdx + 64], rax

    mov  [rdx + 72], r8
    mov  [rdx + 80], r9

    mov  rbp, [rcx +  0]
    mov  rbx, [rcx +  8]
    mov  r12, [rcx + 16]
    mov  r13, [rcx + 24]

    mov  r8 , [rcx + 72]
    mov  r9 , [rcx + 80]

    mov  r14, [rcx + 32]
    mov  r15, [rcx + 40]
    mov  rsi, [rcx + 48]
    mov  rdi, [rcx + 56]
    mov  rsp, [rcx + 64]

    mov  [r10 +  8], r8
    mov  [r10 + 16], r9

    jmp  qword ptr [rsp - 8]

coctxt_switch endp

coctxt_return proc
    mov  r10, gs:[48]
    mov  rbp, [rcx +  0]
    mov  rbx, [rcx +  8]
    mov  r12, [rcx + 16]
    mov  r13, [rcx + 24]

    mov  r8 , [rcx + 72]
    mov  r9 , [rcx + 80]

    mov  r14, [rcx + 32]
    mov  r15, [rcx + 40]
    mov  rsi, [rcx + 48]
    mov  rdi, [rcx + 56]
    mov  rsp, [rcx + 64]

    mov  [r10 +  8], r8
    mov  [r10 + 16], r9

    jmp  qword ptr [rsp - 8]

coctxt_return endp

end
