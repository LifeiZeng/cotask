.align 4
#ifdef __APPLE__
.globl _coctxt_switch
_coctxt_switch:
#else
.globl  coctxt_switch
 coctxt_switch:
#endif
    leaq   8(%rsp), %rax
    movq  %rbp,  0(%rsi)
    movq  %rbx,  8(%rsi)
    movq  %r12, 16(%rsi)
    movq  %r13, 24(%rsi)
    movq  %r14, 32(%rsi)
    movq  %r15, 40(%rsi)
    movq  %rax, 48(%rsi)

#ifdef __APPLE__
.globl _coctxt_return
_coctxt_return:
#else
.globl  coctxt_return
 coctxt_return:
#endif
    movq   0(%rdi), %rbp
    movq   8(%rdi), %rbx
    movq  16(%rdi), %r12
    movq  24(%rdi), %r13
    movq  32(%rdi), %r14
    movq  40(%rdi), %r15
    movq  48(%rdi), %rsp
    jmpq *-8(%rsp)
