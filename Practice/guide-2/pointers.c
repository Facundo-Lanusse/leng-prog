#include <stdio.h>
#include <stdlib.h>

void printArray(int arr[], int size){
  int* p = arr;
  for (int i = 0; i < size; i++){
    printf("%d - ", *(p + i));
  }
} 

void printSting(char str[], int size){
  char* pointer = str;
  for (int i = 0; i < size; i++){
    printf("%c", *(pointer + i));
  }
}

void printString2(char str[]) {
  char* p = str;
  while (*p != '\0') {
    printf("%c", *p);
    p++;
  }
}

int main () {
  int arr[] = {1, 9, 3, 4, 5, 6, 7, 8, 9, 10};
  int size = sizeof(arr) / sizeof(arr[0]);
  char str[] = "Hello";
  int strSize = sizeof(str) / sizeof(str[0]);
  printArray(arr, size);
  printf("\n");
  printSting(str, strSize);
  printf("\n");
  printString2(str);
  printf("\n");
  return 0;
}