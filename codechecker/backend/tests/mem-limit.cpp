/* This program is intended to allocate large amounts of memory in the heap and bring down the system. */
#include <iostream>
#include <cstdlib>

using namespace std;

const int M = 64, N = 1 << 20;

int main() 
{
  int *heap_alloc =  (int*) malloc(sizeof(int)*(M*N+1));
  for (int i = 0;i < M*N + 1; i++) heap_alloc[i] = i;

  return 0;
}
           

