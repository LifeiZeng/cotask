.align 4
.globl  coctxt_switch
 coctxt_switch:
    leaq   8(%rsp), %rax
    movq  %rax,  0(%rdx)
    movq  %rbp,  8(%rdx)
    movq  %rbx, 16(%rdx)    
    movq  %r12, 24(%rdx)
    movq  %r13, 32(%rdx)
    movq  %r14, 40(%rdx)
    movq  %r15, 48(%rdx)
    movq  %rsi, 56(%rdx)
    movq  %rdi, 64(%rdx)
    movq  %gs:(48), %r10
    movq   8(%r10), %rax
    movq  %rax, 72(%rdx)
    movq  16(%r10), %rax
    movq  %rax, 80(%rdx)

.globl  coctxt_return
 coctxt_return:
    movq   0(%rcx), %rsp
    movq   8(%rcx), %rbp
    movq  16(%rcx), %rbx
    movq  24(%rcx), %r12
    movq  32(%rcx), %r13
    movq  40(%rcx), %r14
    movq  48(%rcx), %r15
    movq  56(%rcx), %rsi
    movq  64(%rcx), %rdi
    movq  %gs:(48), %r10
    movq  72(%rcx), %rax
    movq  %rax,  8(%r10)
    movq  80(%rcx), %rax
    movq  %rax, 16(%r10)
    
    jmpq *-8(%rsp)
