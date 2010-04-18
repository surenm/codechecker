/* This program is supposed to break the CPU time limit */
#include <sys/resource.h>
#include <stdio.h>
#include <stdlib.h>

int main()
{
    while(1) sleep(10);
}
