.align 4
#ifdef __APPLE__
.globl _coctxt_switch
_coctxt_switch:
#else
.globl  coctxt_switch
 coctxt_switch:
#endif
    mov x3 , sp
    stp x19, x20, [x1, #0x00]
    stp x21, x22, [x1, #0x10]
    stp x23, x24, [x1, #0x20]
    stp x25, x26, [x1, #0x30]
    str x3 , [x1, #0x60]
    stp x27, x28, [x1, #0x40]
    stp x29, x30, [x1, #0x50]

#ifdef __APPLE__
.globl _coctxt_return
_coctxt_return:
#else
.globl  coctxt_return
 coctxt_return:
#endif
    ldp x19, x20, [x0, #0x00]
    ldp x21, x22, [x0, #0x10]
    ldr x2 , [x0, #0x60]
    ldp x23, x24, [x0, #0x20]
    ldp x25, x26, [x0, #0x30]
    ldp x27, x28, [x0, #0x40]
    ldp x29, x30, [x0, #0x50]
    mov sp , x2
    br  x30
