#include <stdio.h>
#include <stdlib.h>

#define N 5
#define M 10


int main () {
  int* array = malloc(N * sizeof(int));
  for(int i = 0; i < N; i++) {
    array[i] = i + 1;
  }

  int* temp = realloc(array, M * sizeof(int));

  for (int i = N; i < M; i++) {
    temp[i] = i *100;
  }

  array = temp;

  for (int i = 0; i < M; i++) {
    printf("%d, ", array[i]);
  }
  printf("\n");
  free(array);
  return 0;
}