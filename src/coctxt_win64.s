.align 4
.globl  coctxt_switch
 coctxt_switch:
    movq  %gs:(48), %r10
    leaq   8(%rsp), %rax
    movq  %rbp,  0(%rdx)
    movq  %rbx,  8(%rdx)
    movq  %r12, 16(%rdx)
    movq  %r13, 24(%rdx)

    movq   8(%r10), %r8
    movq  16(%r10), %r9

    movq  %r14, 32(%rdx)
    movq  %r15, 40(%rdx)
    movq  %rsi, 48(%rdx)
    movq  %rdi, 56(%rdx)
    movq  %rax, 64(%rdx)

    movq  %r8 , 72(%rdx)
    movq  %r9 , 80(%rdx)

    movq   0(%rcx), %rbp
    movq   8(%rcx), %rbx
    movq  16(%rcx), %r12
    movq  24(%rcx), %r13

    movq  72(%rcx), %r8
    movq  80(%rcx), %r9

    movq  32(%rcx), %r14
    movq  40(%rcx), %r15
    movq  48(%rcx), %rsi
    movq  56(%rcx), %rdi
    movq  64(%rcx), %rsp

    movq  %r8 ,  8(%r10)
    movq  %r9 , 16(%r10)
    
    jmpq *-8(%rsp)

.globl  coctxt_return
 coctxt_return:
    movq  %gs:(48), %r10
    movq   0(%rcx), %rbp
    movq   8(%rcx), %rbx
    movq  16(%rcx), %r12
    movq  24(%rcx), %r13

    movq  72(%rcx), %r8
    movq  80(%rcx), %r9

    movq  32(%rcx), %r14
    movq  40(%rcx), %r15
    movq  48(%rcx), %rsi
    movq  56(%rcx), %rdi
    movq  64(%rcx), %rsp

    movq  %r8 ,  8(%r10)
    movq  %r9 , 16(%r10)
    
    jmpq *-8(%rsp)
