#include "../inc/cotask.h"
#include <stdlib.h>

#define MINSTACK (1024 * 2)

extern void coctxt_switch(COTASK dest, COTASK from);
extern void coctxt_return(COTASK dest);

struct TASK_T
{
#ifdef __amd64
    COCPTR _rsp;
    COCPTR _rbp;
    COCPTR _rbx;
    COCPTR _r12;
    COCPTR _r13;
    COCPTR _r14;
    COCPTR _r15;
#ifdef _WIN64
    COCPTR _rsi;
    COCPTR _rdi;
    COCPTR tib0;
    COCPTR tib1;
#endif
#endif
#ifdef __arm64
    COCPTR _x19;
    COCPTR _x20;
    COCPTR _x21;
    COCPTR _x22;
    COCPTR _x23;
    COCPTR _x24;
    COCPTR _x25;
    COCPTR _x26;
    COCPTR _x27;
    COCPTR _x28;
    COCPTR _x29;
    COCPTR _x30;
    COCPTR _rsp;
#endif
    COTASK prev;
    union {
    COTASK root;
    COTASK free;
    };
    COLONG size;
    COFUNC func;
    COCPTR ctxt;
};

COVOID cotask_mainex(COTASK task)
{
//  if (task->prev == 0)
//      return;
    task->func(task, task->ctxt);
    cotask_deletetask(task);
    coctxt_return(task->prev);
}

COTASK cotask_createroot(COLONG size)
{
    COTASK root = (COTASK)malloc(sizeof(struct TASK_T));
    if (root == NULL)
        return root;
    root->free = NULL;
    root->size = size < MINSTACK ? MINSTACK : size;
    return root;
}

COVOID cotask_deleteroot(COTASK root)
{
    for(COTASK task = root->free; task != NULL;)
    {
        COTASK next = task->free;
        free(task);
        task = next;
    }
    free(root);
}

COTASK cotask_createtask(COFUNC func, COCPTR ctxt, COTASK root)
{
    COLONG size = root->size;
    COTASK task = root->free;
    if (task == NULL)
    {
        task = (COTASK)malloc(size);
        if (task == NULL)
            return task;
    }
    else
    {
        root->free = task->free;
    }

    COLONG _rsp = ((COLONG)task + size) & (~0xF);
#ifdef __amd64
    ((COCPTR *)_rsp)[-2] = (COCPTR)cotask_mainex;
    task->_rsp = (COCPTR)(_rsp - sizeof(COCPTR));
#ifdef _WIN64
    task->tib0 = (COCPTR)(_rsp);
    task->tib1 = (COCPTR)(task);
#endif
#endif
#ifdef __arm64
    task->_x30 = (COCPTR)cotask_mainex;
    task->_rsp = (COCPTR)(_rsp);
#endif
    task->prev = NULL;
    task->root = root;
    task->func = func;
    task->ctxt = ctxt;
    return task;
}

COVOID cotask_deletetask(COTASK task)
{
    COTASK root = task->root;
    task->free  = root->free;
    root->free  = task;
}

COTASK cotask_obtainroot(COTASK task)
{
//  return task == NULL ? NULL : task->root;
    return task->root;
}

COVOID cotask_resume(COTASK dest, COTASK from)
{
    if (dest->prev != NULL)
        return;
    dest->prev = from;
    coctxt_switch(dest, from);
}

COVOID cotask_yields(COTASK from)
{
    COTASK prev = from->prev;
//  if (prev == NULL)
//      return;
    from->prev = NULL;
    coctxt_switch(prev, from);
}
