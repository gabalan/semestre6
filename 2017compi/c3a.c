#include <stdlib.h>
#include <string.h>
#include "c3a.h"
#include "environment.h"

/* **************************************************
 * Construit un nouvel opérande d'un code à 3 adresses
 ************************************************** */
struct Address *new_Address(uint32_t value, enum Type type)
{
  struct Address *self = malloc(sizeof(struct Address));
  self->value = value;
  self->type = type;
  return self;
}

/* **************************************************
 * Affiche un opérande d'un code à 3 adresses
 ************************************************** */
void fprint_Address(struct Address *self, FILE *out)
{
  switch(self->type){
  case C3A_REGISTER: fprintf(out, "R%d", self->value); break;
  case C3A_INT32:  fprintf(out, "0x%08X", self->value); break;
  case C3A_INT:  fprintf(out, "%d", self->value); break;
  case C3A_NAME:  fprintf(out, "%s", self->name); break;
  case C3A_STATIC:  fprintf(out, "STATIC"); break;
  case C3A_STACK:  fprintf(out, "STACK"); break;
  case C3A_HEAP:  fprintf(out, "HEAP"); break;
  }
}


/* **************************************************
 * Nouveau code à 3 adresses
 ************************************************** */
struct C3a *new_C3a(int line, enum Tag tag, enum Op op, struct Address *addr1, struct Address *addr2, struct Address *addr3)
{
  struct C3a *self = malloc(sizeof(struct C3a));
  self->line = line;
  self->tag = tag;
  self->comment=NULL;
  self->op = op;
  self->addr1 = addr1;
  self->addr2 = addr2;
  self->addr3 = addr3;
  self->next = NULL;
  return self;
}

/* **************************************************
 * Concatène deux listes de codes à 3 adresses
 ************************************************** */
void concat_C3a(struct C3a *l1, struct C3a *l2)
{
  struct C3a *actual = l1;
  while (l1->next != NULL)
    l1 = l1->next;
  l1->next=l2;
}

/* **************************************************
 * Affiche un code à 3 adresses
 ************************************************** */
void fprint_C3a(struct C3a *self, FILE *out)
{
  if (self->comment)
    fprintf(out, "// %s\n", self->comment);
  fprintf(out, "%d\t", (int)self->line);
  switch (self->tag){
  case BINOP:
    fprint_Address(self->addr1, out);
    fprintf(out, " :=  ");
    fprint_Address(self->addr2, out);
    switch (self->op){
    case C3A_PLUS: fprintf(out, " + "); break;
    case C3A_MINUS: fprintf(out, " - "); break;
    case C3A_TIMES: fprintf(out, " * "); break;
    case C3A_DIV: fprintf(out, " / "); break;
    case C3A_AND: fprintf(out, " && "); break;
    case C3A_OR: fprintf(out, " || "); break;
    case C3A_LT: fprintf(out, " < "); break;
    case C3A_LE: fprintf(out, " <= "); break;
    case C3A_GT: fprintf(out, " > "); break;
    case C3A_GE: fprintf(out, " >= "); break;
    case C3A_NE: fprintf(out, " != "); break;
    case C3A_EQ: fprintf(out, " = "); break;
    default: break;
    }
    fprint_Address(self->addr3, out);
    break;
  case UNOP:
    fprint_Address(self->addr1, out);
    fprintf(out, " := ");
    switch (self->op){
    case C3A_UMINUS: fprintf(out, "- "); break;
    case C3A_NOT: fprintf(out, "! "); break;
    default: break;
    }
    fprint_Address(self->addr2, out);
    break;
  case SKIP:
    fprintf(out, "skip");
    break;
  case STOP:
    fprintf(out, "stop");
    break;
  case COPY_TO_REGISTER:
      fprint_Address(self->addr1, out);
      fprintf(out, " := ");
      fprint_Address(self->addr2, out);
      break;
  case GOTO:
    fprintf(out, "goto ");
    fprint_Address(self->addr1, out);
    break;
  case IF:
    fprintf(out, "if ");
    fprint_Address(self->addr1, out);
    fprintf(out, " goto ");
    fprint_Address(self->addr2, out);
    break;
  case PUSH:
    fprintf(out, "push ");
    fprint_Address(self->addr1, out);
    break;
  case PARAM:
    fprintf(out, "param ");
    fprint_Address(self->addr1, out);
    break;
  case CALL:
    fprint_Address(self->addr1, out);
    fprintf(out, " :=  call ");
    fprint_Address(self->addr2, out);
      break;
  case RETURN:
    fprintf(out, "return ");
    fprint_Address(self->addr1, out);
    break;
  case MEMORY_TO_REGISTER:
    fprint_Address(self->addr1, out);
    fprintf(out, " := ");
    fprint_Address(self->addr2, out);
    fputc('[', out);
    fprint_Address(self->addr3, out);
    fputc(']', out);
    break;
  case REGISTER_TO_MEMORY:
    fprint_Address(self->addr1, out);
    fputc('[', out);
    fprint_Address(self->addr2, out);
    fputc(']', out);
    fprintf(out, " := ");
    fprint_Address(self->addr3, out);
    break;
  case MALLOC:
    fprint_Address(self->addr1, out);
    fprintf(out, " := malloc ");
    fprint_Address(self->addr2, out);
    break;
  case FREE:
    fprintf(out, "free ");
    fprint_Address(self->addr1, out);
    break;
  case PRINT:
    fprintf(out, "print ");
    fprint_Address(self->addr1, out);
    fputc(' ', out);
    fprint_Address(self->addr2, out);
    break;
  case READ:
    fprint_Address(self->addr1, out);
    fprintf(out, " := read");
    break;
  }
  fputc('\n', out);
}

/* **************************************************
 * 
 ************************************************** */
void 
fprint_ListC3a(struct C3a *self, FILE *out){
  struct C3a *it=self;
  while(it){
    fprint_C3a(it, out);
    it = it->next;
  }
}

/* **************************************************
 * Remplit un tableau de codes à 3 adresses en fonction
 * de son indice 
 ************************************************** */
void fillCode_C3a(struct C3a **code, struct C3a *initCode){
  struct C3a *iterator = initCode;
  int line;
  while(iterator){
    line = iterator->line;
    code[line] = iterator;
    iterator = iterator->next;
  }
}

