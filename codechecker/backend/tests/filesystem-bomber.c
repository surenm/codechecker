#include <stdio.h>
#include <stdlib.h>

int main()
{
  FILE *fp = fopen("ikillu", "a");
  while(1)
  {
    fprintf(fp, "I kill U");
  }
  return 0;
}

