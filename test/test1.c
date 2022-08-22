#include "../inc/cotask.h"
#include <stdlib.h>
#include <signal.h>
#include <stdio.h>
#include <time.h>

void func(COTASK task, COCPTR data)
{
    for(;;)
        cotask_yields(task);
}

long stop = 0;
void loopinterrupt(int c)
{
    ++stop;
}

int main()
{
    signal(SIGINT,  loopinterrupt);
    signal(SIGQUIT, loopinterrupt);
    signal(SIGTERM, loopinterrupt);
    signal(SIGSTOP, loopinterrupt);

    COTASK root = cotask_createroot(1024 * 2);
    COTASK fun0 = cotask_createtask(func, 0, root);
    COTASK fun1 = cotask_createtask(func, 0, root);
    COTASK fun2 = cotask_createtask(func, 0, root);
    COTASK fun3 = cotask_createtask(func, 0, root);

    COLONG cnts = 0;

    long s = clock();
    for(; stop == 0;)
    {
        for(long n = 0; n < 50000000; n++)
        {
            cotask_resume(fun0, root);
            cotask_resume(fun1, root);
            cotask_resume(fun2, root);
            cotask_resume(fun3, root);
        }
        cnts += 50000000L * 4;

        long e = clock();
    #ifdef _WIN64
        printf("%I64d,%I64d\n", cnts, cnts * CLOCKS_PER_SEC / (e - s));
    #else
        printf("%ld,%ld\n",     cnts, cnts * CLOCKS_PER_SEC / (e - s));
    #endif
    }

    cotask_deleteroot(root);
    return 0;
}
