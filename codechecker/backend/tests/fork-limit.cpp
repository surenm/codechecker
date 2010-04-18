#include <iostream>
#include <unistd.h>
#include <cstdio>
#include <cstdlib>

using namespace std;

int main () 
{
  FILE *fp = fopen("/tmp/fork-test.out", "a");
  pid_t p = fork();
  if(!p) {
    fprintf(fp, "In Child\n");
    return 0;
  }
  fprintf(fp, "In Parent\n");
  return 0;
}
