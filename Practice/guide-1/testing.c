#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int presentation () {
  char text[] = "Hello";
  printf("text= %s\n", text);
  printf("Length= %lu, number of bytes= %lu\n", strlen(text), sizeof text);
  printf("First element= as int = %d, as char = '%c'\n", text[0], text[0]);
  for (int i = 0; i < 5; i++)
      text[i] += 2;
  printf("text= %s\n", text);
  for (int i = 0; i < 5; i++){
    text[i] -= 2;
  }
  printf("text= %s\n", text);
  return 0;
}

int pointers() {
  int a = 5;
  int *pointer;
  pointer = &a; // asigno puntero a la direccion de memoria donde guardo a 
  printf("%d, %p, %d\n", a, pointer, *pointer);
  return 0;
}

int complexPointer() {
  int a, b, *p, **q;
  a = 10;	b = 15;
  p = &a; // apunto el puntero al la direccion en memoria de a
  printf("a = %d b = %d\n", a, b);
  printf("*p = %d **q = %d\n",*p, **q);
  printf("p = %p q = %p\n",p, q);
  
  *p = 11;
  q = &p;
  p = &b;
  **q = 20;
  printf("a = %d b = %d\n", a, b);
  printf("*p = %d **q = %d\n",*p, **q);
  printf("p = %p q = %p\n",p, q);
  
  *q = p + 1;
  **q = 40;
  printf("a = %d b = %d\n", a, b);
  return 0;
}

int* createArray(int n, int value) {
  // Allocate espacio para n enteros
  int* array = (int*) malloc(n * sizeof(int));
  for (int i = 0; i < n; i++) 
    array[i] = value;
  return array;
}

int freeMalloc() {
  int n = 4;
  int* a = createArray(n, 200);
  for (int i = 0; i < n; i++) {
    printf("a[%d] = %d\n", i, a[i]);
  } ;
  free(a);// Liberar la memoria asignada
  return 0;
}

typedef struct Node {
  int value; 
  struct Node* next; // puntero al proximo
} Node; // defino el struct para no usar struct cada vez

typedef struct Node** Stack;

Stack createStack () {
  Stack stack = (Node**) malloc(sizeof(Node*));
  *stack = NULL; // inicializo el stack vacio
  return stack;
}

void deleteStack(Stack stack) {
  // guardo el primer puntero
  Node* first = *stack;
  while(first != NULL) {
    Node* current = first;
    first = first->next; // apunto a donde apuntaba next
    free(current); // libero el anterior
  }
  free(stack);
}

void push(Stack stack, int value) {
  Node* node = (Node*) malloc(sizeof(Node*)); // libero el espacio para un nuevo nodo 
  node->value = value; // asigno el valor
  node->next = *stack; // apunto al primer nodo
  *stack = node; // actualizo el stack para que apunte al nuevo nodo
}

int pop(Stack stack) {
  Node* first = *stack; // guardo el primer nodo
  int value = first->value; // guardo el valor
  *stack = first->next; // actualizo el stack para que apunte al siguiente
  free(first);
  return value;
}

void stackExample() {
  Stack stack = createStack();
  push(stack, 5);
  push(stack, 10);
  printf("Stack: %d\n", pop(stack));
  printf("Stack: %d\n", pop(stack));
  deleteStack(stack);
}

// Persona mas alta:
#define PERSONS 5
typedef struct Person {
  char name[50];
  int age;
  float height;
} Person;

Person findTallerPerson(Person persons[]) {
  Person taller = persons[0];
  for (int i = 0; i < 5; i++){
    if (persons[i].height > taller.height){
      taller = persons[i];
    }
  }
  return taller;
}

int tallestPersonMain () {
  Person persons[PERSONS];
  for (int i = 0; i < PERSONS; i++){
    printf("Nombre: ");// Lee línea completa (hasta 49 chars) permitiendo espacios
    scanf(" %[^\n]", persons[i].name);
    
    printf("Edad: ");
    scanf("%d", &persons[i].age);

    printf("Altura: ");
    scanf("%f", &persons[i].height);
  }
  Person taller = findTallerPerson(persons);
  printf("La persona mas alta es:\n");
  printf("Name: %s\n", taller.name);
  printf("Age: %d\n", taller.age);
  printf("Height: %.2fcm\n", taller.height);
  return 0;
}

// Busqueda binaria
int binarySearch(int arr[], int target, int low, int high) {
  if (low > high) return -1; // No encontrado
  int mid = low + (high - low) / 2;
  if (arr[mid] == target) return mid;
  if (arr[mid] > target) {
    return binarySearch(arr, target, low, mid - 1);
  } else {
    return binarySearch(arr, target, mid + 1, high);
  }
}

int main () {
  int arr[] =  {1, 3, 5, 7, 9, 11, 13, 15, 17, 19};
  int high = sizeof(arr) / sizeof(arr[0]) - 1;
  printf("high: %d\n", high);
  printf("value: %d\n", binarySearch(arr, 80, 0, high));
}
