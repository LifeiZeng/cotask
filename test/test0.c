#include "../inc/cotask.h"
#include <stdio.h>

COTASK root0 = 0;
COTASK task1 = 0;
COTASK task2 = 0;

void func1(COTASK task, COCPTR data)
{
    printf(" 1.1\n");
    cotask_resume(task2, task);
    printf(" 1.2\n");
    cotask_resume(task2, task);
    printf(" 1.3\n");
}

void func2(COTASK task, COCPTR data)
{
    printf("  2.1\n");
    cotask_yields(task);
    printf("  2.2\n");
}

int main()
{
    root0 = cotask_createroot(1024 * 2);
    task1 = cotask_createtask(func1, 0, root0);
    task2 = cotask_createtask(func2, 0, root0);

    printf("0.1\n");
    cotask_resume(task1, root0);
    printf("0.2\n");
    cotask_deleteroot(root0);
    return 0;
}
