#ifndef _MISC_H
#define _MISC_H

#include "variables.h"

#define SWAP(x, y, z)                                                          \
  (z) = (x), (x) = (y), (y) = (z) /* échange x et y, via z */

/* renvoie l'ensemble S\{i} */
int DeleteSet(int S, int i);
int ExtractPath(cell **D, int t, int S, int n, int *Q);
void makeImage(grid *G);
int NextPermutation(int *P, const int n);
int NextSet(int S, int n);
void Permute(point *T, const int n);
char *TopChrono(const int i);
void freeGrid(grid G);
grid initGridFile(char *file);

#endif
