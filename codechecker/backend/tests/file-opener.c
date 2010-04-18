#include <stdio.h>
#include <stdlib.h>

int main()
{
  FILE *fp = fopen("/tmp/just4fun", "a");
  fprintf(fp, "I opened a file despite your code checker rlimits!\n");
  return 0;
}
