.code
coctxt_switch proc
    lea  rax, [rsp +  8]
    mov  [rdx +  0], rax
    mov  [rdx +  8], rbp
    mov  [rdx + 16], rbx  
    mov  [rdx + 24], r12
    mov  [rdx + 32], r13
    mov  [rdx + 40], r14
    mov  [rdx + 48], r15
    mov  [rdx + 56], rsi
    mov  [rdx + 64], rdi
    mov  r10, gs:[48] 
    mov  rax, [r10 +  8]
    mov  [rdx + 72], rax
    mov  rax, [r10 + 16]
    mov  [rdx + 80], rax

coctxt_return proc
    mov  rsp, [rcx +  0]
    mov  rbp, [rcx +  8]
    mov  rbx, [rcx + 16]
    mov  r12, [rcx + 24]
    mov  r13, [rcx + 32]
    mov  r14, [rcx + 40]
    mov  r15, [rcx + 48]
    mov  rsi, [rcx + 56]
    mov  rdi, [rcx + 64]
    mov  r10, gs:[48] 
    mov  rax, [rcx + 72]
    mov  [r10 +  8], rax
    mov  rax, [rcx + 80]
    mov  [r10 + 16], rax

    jmp  qword ptr [rsp - 8]

coctxt_return endp
coctxt_switch endp

end
