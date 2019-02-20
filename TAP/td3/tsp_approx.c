//
//  TSP - APPROXIMATION / HEURISTIQUES
//

void reverse(int *T, int p, int q) {
  // renverse la partie T[p]...T[q] du tableau T avec p<q
  // si T={0,1,2,3,4,5,6} et p=2 et q=5, alors le nouveau
  // tableau sera {0,1, 5,4,3,2, 6}
  int temp[q-p+1];
  int k=q-p;
  for(int i=p;i<=q;i++){
    temp[k]=T[i];
    k--;
  }
  int k1=0;
  for( int i=p;i<=q;i++){
    T[i]=temp[k1];
    k1++;
  }
  return;
}

double first_flip(point *V, int n, int *P) {
  // renvoie le gain>0 du premier flip réalisable, tout en réalisant
  // le flip, et 0 s'il n'y en a pas

  for (int i=0;i<n-1;i++){
    for (int j=i+2;j<n;j++){
      double gain=-(dist(V[P[i]],V[P[i]])+dist(V[P[i+1]],V[P[(j+1)%n]]))+dist(V[P[i]],V[P[i+1]])+dist(V[P[j]],V[P[(j+1)%n]]);
      if (gain >0){
        reverse(P,i+1,j);
        return gain;
      }
    }
  }
  return 0;
}

double tsp_flip(point *V, int n, int *P) {
  // la fonction doit renvoyer la valeur de la tournée obtenue. Pensez
  // à initialiser P, par exemple à P[i]=i. Pensez aussi faire
  // drawTour() pour visualiser chaque flip
  for(int i=0;i<n;i++){
    P[i]=i;
  }
  while (first_flip(V,n,P)>0);
  return value(V,n,P);
}

double tsp_greedy(point *V, int n, int *P) {

  return 0.0;
}
