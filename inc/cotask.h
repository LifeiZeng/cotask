#ifndef __MTX_COTASK_H__
#define __MTX_COTASK_H__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct TASK_T* COTASK;
typedef const  void  * COCPTR;
typedef void           COVOID;
#ifdef _WIN64
    typedef long long  COLONG;
#else
    typedef long       COLONG;
#endif
typedef COVOID (*COFUNC)(COTASK, COCPTR);

COTASK cotask_createroot(COLONG size);
COVOID cotask_deleteroot(COTASK root);

COTASK cotask_createtask(COFUNC func, COCPTR ctxt, COTASK root);
COVOID cotask_deletetask(COTASK task);
COTASK cotask_obtainroot(COTASK task);

COVOID cotask_resume(COTASK dest, COTASK from);
COVOID cotask_yields(COTASK from);

#ifdef __cplusplus
}
#endif

#endif
