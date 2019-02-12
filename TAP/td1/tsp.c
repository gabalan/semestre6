#include <float.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include "sdltools.h"

static point *generatePoints(int n, int X, int Y) {
  // Génère n points aléatoires du rectangle entier [0,X] × [0,Y] et
  // renvoie le tableau des n points ainsi générés et met à jour la
  // variable globale vertices[].

  vertices = malloc(n * sizeof(point));
  const double rx = (double)X / RAND_MAX;
  const double ry = (double)Y / RAND_MAX;
  for (int i = 0; i < n; i++) {
    vertices[i].x = random() * rx;
    vertices[i].y = random() * ry;
  }
  return vertices;
}

static double dist(point A, point B) {
  int distx=B.x-A.x;
  int disty=B.y-A.y;
  return sqrt(distx*distx+disty*disty);
}

static double value(point *V, int n, int *P) {
  int value=0;
  for (int i=0;i<n-1;i++){
    value+=dist(V[P[i]],V[P[i+1]]);
  }
  value+=dist(V[P[0]],V[P[n-1]]);
  return value;
}

static double tsp_brute_force(point *V, int n, int *Q) {
  int P[n];
  for( int i=0;i<n;i++){
    P[i]=i;
  }
  double min=value(V,n,P);
  while (NextPermutation(P,n)){
    if (min >value(V,n,P)){
      min =value(V,n,P);
      for (int i=0;i<n;i++){
        Q[i]=P[i];
      }
    }
  }

    return min;
}
int compare_ints(const void* a, const void* b)
{
    int arg1 = *(const int*)a;
    int arg2 = *(const int*)b;

    if (arg1 < arg2) return 1;
    if (arg1 > arg2) return -1;
    return 0;
  }
static void MaxPermutation(int *P, int n, int k) {
   qsort(P+k, n-k,sizeof(int), compare_ints);
   for (int i = 0; i < n; i++) {
        printf("%d ", P[i]);
    }
  return;
}

static double value_opt(point *V, int n, int *P, double w) {
  double value=0;
  int i=0;
  while (value +dist(V[P[i]],V[P[0]]) && i<n-1 ){
    value+=dist(V[P[i]],V[P[i+1]]);
    i++;

  }
  if( value<w)
    return value;
  return -(i+1);
}

static double tsp_brute_force_opt(point *V, int n, int *Q) {
  int P[n];
  for( int i=0;i<n;i++){
    P[i]=i;
  }
  double min_ret=0;
  double min=value(V,n,P);
  while (NextPermutation(P,n)){
    min_ret=value_opt(V,n,P,min);
    if ( min_ret>0){
      min =value_opt(V,n,P,min);
      for (int i=0;i<n;i++){
        Q[i]=P[i];
      }
    }else{
      MaxPermutation(P,n,-value_opt(V,n,P,min_ret));
      }
    }
    return min;
  }


int main(int argc, char *argv[]) {
  int tab[7]={1,4,0,3,6,7,2};
  MaxPermutation(tab,7,3);

  // taille initiale de la fenêtre
  width = 640;
  height = 480;

  // pour la fenêtre graphique
  running = true;
  scale = 1;
  update = false; // force le dessin de la tournée

  initSDLOpenGL();
  srandom(time(NULL));
  TopChrono(0); // initialise tous les chronos

  int n = (argv[1] && atoi(argv[1])) ? atoi(argv[1]) : 10;
  point *V = generatePoints(n, width, height);
  int *P = malloc(n * sizeof(int));
  for (int i = 0; i < n; i++)
    P[i] = i;           // utile pour drawTour()
  drawTour(V, n, NULL); // dessine seulement les points

/*  {

    TopChrono(1); // départ du chrono 1
    double w = tsp_brute_force(V, n, P);
    char *s = TopChrono(1); // s=durée
    printf("value: %g\n", w);
    printf("running time: %s\n", s);
    if (w > 0)
      drawTour(V, n, P); // force le dessin de la tournée
    else
      drawTour(V, n, NULL); // si pas de tournée
  }*/


    {

      TopChrono(1); // départ du chrono 1
      double w = tsp_brute_force_opt(V, n, P);
      char *s = TopChrono(1); // s=durée
      printf("value_opt: %g\n", w);
      printf("running time: %s\n", s);
      if (w > 0)
        drawTour(V, n, P); // force le dessin de la tournée
      else
        drawTour(V, n, NULL); // si pas de tournée
    }

  /*
    {

      TopChrono(1); // départ du chrono 1
      double w = tsp_prog_dyn(V, n, P);
      char *s = TopChrono(1); // s=durée
      printf("value: %g\n", w);
      printf("running time: %s\n", s);
      if (w > 0)
        drawTour(V, n, P); // force le dessin de la tournée
      else
        drawTour(V, n, NULL); // si pas de tournée
    }
  */

  // Affiche le résultat et attend (q pour sortir)
  update = true;

  while (running) {
    drawTour(V, n, P);
    handleEvent(true);
  }

  // Libération de la mémoire
  TopChrono(-1);
  free(V);
  free(P);

  cleaning();
  return 0;
}
