.align 4
#ifdef __APPLE__
.globl _coctxt_switch
_coctxt_switch:
#else
.globl  coctxt_switch
 coctxt_switch:
#endif
    leaq   8(%rsp), %rax
    movq  %rax,  0(%rsi)
    movq  %rbp,  8(%rsi)
    movq  %rbx, 16(%rsi)    
    movq  %r12, 24(%rsi)
    movq  %r13, 32(%rsi)
    movq  %r14, 40(%rsi)
    movq  %r15, 48(%rsi)

#ifdef __APPLE__
.globl _coctxt_return
_coctxt_return:
#else
.globl  coctxt_return
 coctxt_return:
#endif
    movq   0(%rdi), %rsp
    movq   8(%rdi), %rbp
    movq  16(%rdi), %rbx
    movq  24(%rdi), %r12
    movq  32(%rdi), %r13
    movq  40(%rdi), %r14
    movq  48(%rdi), %r15
    jmpq *-8(%rsp)
