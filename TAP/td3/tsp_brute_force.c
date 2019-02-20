//
//  TSP - BRUTE-FORCE
//
// -> la structure "point" est définie dans tools.h

double dist(point A, point B) {
    int distx=B.x-A.x;
    int disty=B.y-A.y;
    return sqrt(distx*distx+disty*disty);
}

double value(point *V, int n, int *P) {

  int value=0;
  for (int i=0;i<n-1;i++){
    value+=dist(V[P[i]],V[P[i+1]]);
  }
  value+=dist(V[P[0]],V[P[n-1]]);
  return value;
}

double tsp_brute_force(point *V, int n, int *Q) {
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
      min =min_ret;
      for (int i=0;i<n;i++){
        Q[i]=P[i];
      }
    }else{
      MaxPermutation(P,n,-min_ret);
      }
    }
    return min;
  }
