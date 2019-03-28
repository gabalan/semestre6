#include "heap.h"
#include <stdlib.h>
#include <stdio.h>


heap heap_create(int n, int (*f)(const void *, const void *)) {
  heap h =malloc(sizeof(*h));
  if (h==NULL){
    exit(1);
  }

  h->size=0;
  h->nmax=n;
  h->array=(void*)malloc((h->nmax+1)*sizeof(void*));
  if (h->array==NULL){
    exit(1);
  }
  h->f=f;
  return h;
}

void heap_destroy(heap h) {
  if(h->array!=NULL){
    free(h->array);
  }
  free(h);
}

bool heap_empty(heap h) {
  if(h->size==0){
    return true;
  }
  return false;
}

bool heap_add(heap h, void *object) {
  if (h->size==h->nmax){
    return true;
  }
  else{
    h->array[h->size+1]=object;
    h->size=h->size+1;
    if (h->size==1){
      return false;
    }else{
      int pos_fils=h->size;
      int pos_pere=h->size/2;
      while(pos_pere >0  && h->f(h->array[pos_fils],h->array[pos_pere])<0){
        void *pere=h->array[pos_pere];
        h->array[pos_pere]=h->array[pos_fils];
        h->array[pos_fils]=pere;
        pos_fils=pos_pere;
        pos_pere=pos_fils/2;
      }
    }
  }
  return false;
}

void *heap_top(heap h) {
  if(h->array==NULL  || heap_empty(h)){
    return NULL;
  }
  return h->array[1];
}

void *heap_pop(heap h) {
  void * top=heap_top(h);
  if (top==NULL){
    return NULL;
  }else{
    h->array[h->size]=NULL;
    h->size-=1;
    return top;
  }
}
