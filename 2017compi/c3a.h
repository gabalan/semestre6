#ifndef _C3A_
#define _C3A_
#include <stdint.h>
#include <stdio.h>

/* **************************************************
 * Liste des opérandes possibles d'un code à 3 adresses
 ************************************************** */
enum Type {C3A_STATIC=0, C3A_STACK=1, C3A_HEAP=2, C3A_REGISTER, C3A_INT32, C3A_INT, C3A_NAME};

/* **************************************************
 * Liste des opérations possibles d'un code à 3 adresses
 ************************************************** */
enum Op {C3A_PLUS, C3A_MINUS, C3A_TIMES, C3A_DIV, C3A_UMINUS, C3A_AND, C3A_OR, C3A_NOT, C3A_LT, C3A_LE, C3A_GT, C3A_GE, C3A_NE, C3A_EQ};

/* **************************************************
 * Opérande d'un code à 3 adresses
 ************************************************** */
struct Address {
  enum Type type;
  uint32_t value;
  char *name;
};
  
struct Address *new_Address(uint32_t, enum Type);
void fprint_Address(struct Address *, FILE *);

/* **************************************************
 * Liste des types de code à 3 adresses
 ************************************************** */
enum Tag {SKIP, STOP, BINOP, UNOP, COPY_TO_REGISTER, GOTO, IF, PUSH, PARAM, CALL, RETURN, MEMORY_TO_REGISTER, REGISTER_TO_MEMORY, MALLOC, FREE, PRINT, READ};

/* **************************************************
 * Code à 3 adresses
 * pointe vers un suivant pour organiser des listes de codes à 3 adresses
 ************************************************** */
struct C3a {
  intptr_t line;
  enum Tag tag;
  enum Op op;
  struct Address *addr1;
  struct Address *addr2;
  struct Address *addr3;
  char *comment;
  struct C3a *next;
};

struct C3a *new_C3a(int, enum Tag, enum Op, struct Address *, struct Address *, struct Address *);
void concat_C3a(struct C3a *, struct C3a *);
void fprint_ListC3a(struct C3a *, FILE *);
void fprint_C3a(struct C3a *, FILE *);
void fillCode_C3a(struct C3a **, struct C3a *);

#endif //_C3A_
