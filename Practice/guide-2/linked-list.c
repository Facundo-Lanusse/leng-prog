#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
  int value;
  struct Node* next;
} Node;

typedef Node** LinkedList;

LinkedList creeatLinkedList() {
  LinkedList list = (LinkedList) malloc(sizeof(Node)); // liber el espacio para el primer nodo
  *list = NULL;
  return list;
}

void append(LinkedList list, int value) {
  Node* new = malloc(sizeof(Node));
  if (*list == NULL) {
    new->value = value;
    *list = new;
    return;
  }
  new->value = value;
  Node* current = *list;
  while ( current->next != NULL) {
    current = current->next;
  }
  current->next = new;
}

void prepend(LinkedList list, int value) {
  Node* new = (Node*) malloc(sizeof(Node));
  new->value = value;
  new->next = *list;
  *list = new;
}

void printList(LinkedList list) {
  Node* current = *list;
  while (current != NULL) {
    printf("%d -> ", current->value);
    current = current->next;
  }
  if (*list == NULL) {
    printf("Lista vacia\n");
  } else {
    printf("NULL\n");
  }
}

int find(LinkedList list, int value) {
  Node* current = *list;
  for (int i = 0; current != NULL; i++) {
    if(current->value == value){
      return i;
    }
    current = current->next;
  };
  return -1; // no encontrado
}

int delete(LinkedList list, int value) {
  int index = find(list, value);
  if (index == -1) return 0;
  if (index == 0) {
    Node* toDelete = *list;
    *list = toDelete->next;
    free(toDelete);
    return 1;
  }
  Node* current = *list;
  for (int i = 0; i < index - 1; i++) {
    current = current->next;
  };
  Node* toDelete = current->next;
  current->next = toDelete->next;
  free(toDelete);
  return 1;
}

int len(LinkedList list) {
  int length = 0;
  Node* current = *list;
  while(current != NULL) {
    length++;
    current = current->next;
  }
  return length;
}

int main () {
  LinkedList list = creeatLinkedList();
  append(list, 5);
  append(list, 10);
  prepend(list, 1);
  prepend(list, 0);
  append(list, 15);
  printList(list);
  delete(list, 5);
  printList(list);
  delete(list, 15);
  printList(list);
  delete(list, 0);
  printList(list);
  len(list);
  printf("Len: %d\n", len(list));
  return 0;
}