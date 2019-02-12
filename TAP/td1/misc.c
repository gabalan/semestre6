/*
**  Quelques routines
*/

#include "misc.h"
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define CHRONOMAX 10

#define RAND01                                                                 \
  ((double)random() / (double)RAND_MAX) // réel aléatoire dans [0,1[
#define NCOLOR                                                                 \
  ((int)(sizeof(color) / sizeof(*color))) // nombre de couleurs dans color[]

RGB color[] = {
    {0xE0, 0xE0, 0xE0}, // V_FREE
    {0x00, 0x00, 0x00}, // V_WALL
    {0xF0, 0xD8, 0xA8}, // V_SAND
    {0x00, 0x6D, 0xBA}, // V_WATER
    {0x7C, 0x70, 0x56}, // V_MUD
    {0x00, 0xA0, 0x60}, // V_GRASS
    {0x70, 0xE0, 0xD0}, // V_TUNNEL
    {0x80, 0x80, 0x80}, // M_NULL
    {0x12, 0x66, 0x66}, // M_USED
    {0x08, 0xF0, 0xF0}, // M_FRONT
    {0x90, 0x68, 0xF8}, // M_PATH
    {0xFF, 0x00, 0x00}, // C_START
    {0xFF, 0x88, 0x28}, // C_END
    {0x99, 0xAA, 0xCC}, // C_FINAL
    {0xFF, 0xFF, 0x80}, // C_END_WALL
    {0xC0, 0x4F, 0x16}, // M_USED2
    {0x66, 0x12, 0x66}, // C_FINAL2
};

char *TopChrono(const int i) {
  /*
    Met à jour le chronomètre interne numéro i (i=0..CHRNONMAX-1) et
    renvoie sous forme de char* le temps écoulé depuis le dernier appel
    à la fonction pour le même chronomètre. La précision dépend du temps
    mesuré. Il varie entre la seconde et le 1/1000 de seconde. Plus
    précisément le format est le suivant:

    1d00h00'  si le temps est > 24h (précision: 1')
    1h00'00"  si le temps est > 60' (précision: 1s)
    1'00"0    si le temps est > 1'  (précision: 1/10s)
    1"00      si le temps est > 1"  (précision: 1/100s)
    0"000     si le temps est < 1"  (précision: 1/1000s)

    Pour initialiser et mettre à jour tous les chronomètres (dont le
    nombre vaut CHRONOMAX), il suffit d'appeler une fois la fonction,
    par exemple avec TopChrono(0). Si i<0, alors les pointeurs alloués
    par l'initialisation sont désalloués. La durée maximale est limitée
    à 100 jours. Si une erreur se produit (durée supérieure ou erreur
    avec gettimeofday()), alors on renvoie la chaîne "--error--".
  */
  if (i >= CHRONOMAX)
    return "--error--";

  /* variables globales, locale à la fonction */
  static int first =
      1; /* =1 ssi c'est la 1ère fois qu'on exécute la fonction */
  static char *str[CHRONOMAX];
  static struct timeval last[CHRONOMAX], tv;
  int j;

  if (i < 0) {  /* libère les pointeurs */
    if (!first) /* on a déjà alloué les chronomètres */
      for (j = 0; j < CHRONOMAX; j++)
        free(str[j]);
    first = 1;
    return NULL;
  }

  /* tv=temps courant */
  int err = gettimeofday(&tv, NULL);

  if (first) { /* première fois, on alloue puis on renvoie TopChrono(i) */
    first = 0;
    for (j = 0; j < CHRONOMAX; j++) {
      str[j] = malloc(
          10); // assez grand pour "--error--", "99d99h99'" ou "23h59'59""
      last[j] = tv;
    }
  }

  /* t=temps en 1/1000" écoulé depuis le dernier appel à TopChrono(i) */
  long t = (tv.tv_sec - last[i].tv_sec) * 1000L +
           (tv.tv_usec - last[i].tv_usec) / 1000L;
  last[i] = tv; /* met à jour le chrono interne i */
  if ((t < 0L) || (err))
    t = LONG_MAX; /* temps erroné */

  /* écrit le résultat dans str[i] */
  for (;;) { /* pour faire un break */
    /* ici t est en millième de seconde */
    if (t < 1000L) { /* t<1" */
      sprintf(str[i], "0\"%03li", t);
      break;
    }
    t /= 10L;        /* t en centième de seconde */
    if (t < 6000L) { /* t<60" */
      sprintf(str[i], "%li\"%02li", t / 100L, t % 100L);
      break;
    }
    t /= 10L;         /* t en dixième de seconde */
    if (t < 36000L) { /* t<1h */
      sprintf(str[i], "%li'%02li\"%li", t / 360L, (t / 10L) % 60L, t % 10L);
      break;
    }
    t /= 10L;         /* t en seconde */
    if (t < 86400L) { /* t<24h */
      sprintf(str[i], "%lih%02li'%02li\"", t / 3600L, (t / 60L) % 60L, t % 60L);
      break;
    }
    t /= 60L;         /* t en minute */
    if (t < 144000) { /* t<100 jours */
      sprintf(str[i], "%lid%02lih%02li'", t / 1440L, (t / 60L) % 24L, t % 60L);
      break;
    }
    /* error ... */
    sprintf(str[i], "--error--");
  }

  return str[i];
}

extern int NextPerm(int *P, const int n, const int *C) {
  /*
    Génère, à partir d'une permutation P, la prochaine dans l'ordre
    lexicographique suivant les contraintes définies par le tableau C
    (voir ci-après). Mettre C=NULL s'il n'y a pas de contrainte
    particulière. On renvoie 1 si la prochaine permutation à pu être
    déterminée et 0 si la dernière permutation a été atteinte. Dans ce
    cas la permutation la plus petite selon l'ordre lexicographique est
    renvoyée. On permute les éléments de P que si leurs positions sont
    entre C[j] et C[j+1] (exclu) pour un certain indice j.

    Ex: si C={2,3,5}. Les permutations sous la contrainte C sont:
    (on peut permuter les indices {0,1}{2}{3,4})

                   0 1 2 3 4 (positions dans P)
                P={a,b,c,d,e}
                  {b,a,c,d,e}
                  {a,b,c,e,d}
                  {b,a,c,e,d}

    Evidemment, il y a beaucoup moins de permutations dès que le nombre
    de contraintes augmente. Par exemple, si C contient k intervalles de
    même longueur, alors le nombre de permutations sera de (n/k)!^k au
    lieu de n!. Le rapport des deux est d'environ k^n.

    Concrêtement, pour:
    - n=9 et k=3, on a 216 permutations au lieu de 362.880 (k^n=19.683)
    - n=12 et k=3, on a 13.824 permutations au lieu de 479.001.600 (k^n=531.441)

    Le dernier élément de C doit être égale à n-1 (sentinelle), le
    premier étant omis car toujours = 0. Donc C est un tableau à au plus
    n éléments. Si C=NULL, alors il n'y a pas de contrainte
    particulière, ce qui est identique à poser C[0]=n.

    On se base sur l'algorithme classique (lorsque C=NULL, sinon on
    l'applique sur l'intervalle de positions [C[j],C[j+1][):

    1. Trouver le plus grand index i tel que P[i] < P[i+1].
       S'il n'existe pas, la dernière permutation est atteinte.
    2. Trouver le plus grand indice j tel que P[i] < P[j].
    3. Echanger P[i] avec P[j].
    4. Renverser la suite de P[i+1] jusqu'au dernier élément.

  */
  int i, j, a, b, c, T[1];

  if (C == NULL) {
    T[0] = n;
    C = T;
  }

  b = C[i = j = 0]; /* j=indice de la prochaine valeur à lire dans C */
  c = -1;

  /* étape 1: on cherche l'intervalle [a,b[ avec i tq P[i]<P[i+1] */
etape1:
  for (a = i; i < b - 1; i++)
    if (P[i] < P[i + 1])
      c = i;   /* on a trouvé un i tq P[i]<P[i+1] */
  if (c < 0) { /* le plus grand i tq P[i]<[i+1] n'existe pas */
    for (i = a; i < b; i++)
      P[i] = i; /* on réinitialise P[a]...P[b-1] */
    if (b == n)
      return 0; /* alors on a fini d'examiner C */
    b = C[++j]; /* b=nouvelle borne */
    goto etape1;
  }
  i = c; /* i=le plus grand tq P[i]<P[i+1] avec a<=i,i+1<b */

  /* étape 2: cherche j=le plus grand tq P[i]<P[j] */
  for (j = i + 1; j < b; j++)
    if (P[i] < P[j])
      c = j;
  j = c;

  /* étape 3: échange P[i] et P[j] */
  SWAP(P[i], P[j], c);

  /* étape 4: renverse P[i+1]...P[b-1] */
  for (++i, --b; i < b; i++, b--)
    SWAP(P[i], P[b], c);

  return 1;
}

int NextPermutation(int *P, const int n) { return NextPerm(P, n, NULL); };

extern void Permute(point *T, const int n) {
  /*
    Permute aléatoirement les n premiers éléments de T.
  */
  int i, j;
  point k;
  for (i = 0; i < n; i++) {
    j = i + (random() % (n - i));
    SWAP(T[i], T[j], k);
  }
}

int DeleteSet(int S, int i) { return (S & ~(1 << (i))); }

extern int NextSet(int S, int n) {
  /*
    Cette fonction permet de lister les sous-ensembles de {0,...,n-1}
    par taille croissante, les sous-ensembles étant vu comme des mots
    binaires codés par des entiers (int). Ainsi NextSet(S,n) donne le
    prochain sous-ensemble celui codé par S qui lui est supérieur.

    Plus précisément, la fonction renvoie le plus petit entier
    immédiatement supérieur à S>0 et qui a: (1) soit le même poids que
    S, c'est-à-dire le même nombre de 1 dans son écriture binaire que S;
    (2) soit le poids de S plus 1 s'il n'y en a pas de même poids. La
    fonction renvoie 0 si S est le plus grand entier sur n bits, soit
    S=2^n-1.

    Le principe de l'algorithme est le suivant (NB: S>0): dans S on
    décale complètement à droite le premier bloc de 1 (celui contenant
    le bit de poids faible) sauf le bit le plus à gauche de ce bloc qui
    lui est décalé d'une position à gauche de sa position d'origine. Par
    exemple 1001110 devient 1010011. Si on ne peut pas décaler ce bit à
    gauche c'est que ou bien on est arrivé à 2^n-1 (et on renvoie 0) ou
    bien on doit passer à un poids plus élevé. Dans ce cas on renvoie le
    plus petit entier de poids p, soit 2^p-1, où p est le poids de S
    plus 1.

    Résultats obtenus en itérant S -> NextSet(S,4) à partir de S=1:
     (taille 1) S = 0001 -> 0010 -> 0100 -> 1000 ->
     (taille 2)     0011 -> 0101 -> 0110 -> 1001 -> 1010 -> 1100 ->
     (taille 3)     0111 -> 1011 -> 1101 -> 1110
     (taille 4)     1111 ->
     (taille 0)     0000

    Ainsi, les 16 entiers sur n=4 bits sont parcourus dans l'ordre: 1 ->
    2 -> 4 -> 8 -> 3 -> 5 -> 6 -> 9 -> 10 -> 12 -> 7 -> 11 -> 13 -> 14
    -> 15 -> 0

    L'algorithme prend un temps O(1) car les opérations de shifts (<<)
    et la fonction ffs() sur des int correspondent à des instructions
    machines sur des registres.
  */
  int p1 = ffs(S); // position du bit le plus à droit (commence à 1)
  int p2 = ffs(~(S >> p1)) + p1 -
           1; // position du bit le plus gauche du 1er bloc de 1
  if (p2 - p1 + 1 == n)
    return 0; // cas S=2^n-1
  if (p2 == n)
    return (1 << (p2 - p1 + 2)) - 1; // cas: poids(S)+1
  return (S & ((-1) << p2)) | (1 << p2) |
         ((1 << (p2 - p1)) - 1); // cas: poids(S)
}

extern int ExtractPath(cell **D, int t, int S, int n, int *Q) {
  // Construit dans Q le chemin extrait de la table D depuis la case
  // D[t][S] jusqu'au sommet V[n-1]. Il faut que Q[] soit assez grand
  // Renvoie la taille du chemin

  Q[0] = t;                   // écrit le dernier point
  int k = 1;                  // k=taille de Q=nombre de points écrits dans Q
  while (Q[k - 1] != n - 1) { // on s'arrête si le dernier point est V[n-1]
    Q[k] = D[Q[k - 1]][S].pred;
    S = DeleteSet(S, Q[k - 1]);
    k++;
  }
  return k;
}

// Vrai ssi p est une position de la grille Attention ! cela ne veut
// pas dire que p est un sommet du graphe, car la case peut contenir
// V_WALL.
static inline int inGrid(grid *G, position p) {
  return (0 <= p.x) && (p.x < G->X) && (0 <= p.y) && (p.y < G->Y);
}

// Vrai ssi (i,j) est sur le bord de la grille
static inline int onBorder(grid *G, int i, int j) {
  return (i == 0) || (j == 0) || (i == G->X - 1) || (j == G->Y - 1);
}

// distance Lmax entre s et t
static inline double distLmax(position s, position t) {
  return hypot(t.x - s.x, t.y - s.y);
}

//
// Construit l'image de la grille à partir de la grille G. Le point
// (0,0) de G correspond au coin en haut à gauche.
//
// +--x
// |
// y
//
void makeImage(grid *G) {
  static int cpt; // compteur d'étape lorsqu'on reconstruit le chemin

  RGB *I = gridImage, c;
  int k = 0, v, m, f;
  int fin = (G->mark[G->start.x][G->start.y] ==
             M_PATH); // si le chemin a fini d'être construit
  int debut = (G->mark[G->end.x][G->end.y] ==
               M_PATH); // si le chemin commence à être construit

  if (fin)
    update = false;
  if (debut == 0)
    cpt = 0;
  if (debut)
    cpt++;
  if (debut && cpt == 1) {
    update = true;
    delay = 2 * delay + 10; // ralenti l'affichage pour le chemin
    printf("delay: %i\n", delay);
  }

  for (int j = 0; j < G->Y; j++)
    for (int i = 0; i < G->X; i++) {
      m = G->mark[i][j];
      if ((m < 0) || (m >= NCOLOR))
        m = M_NULL;
      v = G->value[i][j];
      if ((v < 0) || (v >= NCOLOR))
        v = V_FREE;
      do {
        if (m == M_PATH) {
          c = color[m];
          break;
        }
        if (fin && erase) {
          c = color[v];
          break;
        } // affiche la grille d'origine à la fin
        if (m == M_NULL) {
          c = color[v];
          break;
        } // si pas de marquage
        if (m == M_USED || m == M_USED2) {
          // interpolation de couleur entre les couleurs M_USED(2) et
          // C_FINAL(2) ou bien M_USED(2) et v si on est en train de
          // reconstruire le chemin
          position p = {.x = i, .y = j};
          double t = distLmax(G->start, G->end);
          if (t == 0)
            t = 1E-10; // pour éviter la division par 0
          if (debut && erase) {
            t = 0.5 * cpt / t;
            f = v;
          } else {
            t = distLmax(G->start, p) / t;
            f = (m == M_USED) ? C_FINAL : C_FINAL2;
          }
          t = fmax(t, 0.0), t = fmin(t, 1.0);
          c = color[m];
          c.R += t * (color[f].R - color[m].R);
          c.G += t * (color[f].G - color[m].G);
          c.B += t * (color[f].B - color[m].B);
          break;
        }
        c = (m == M_NULL) ? color[v] : color[m];
        break;
      } while (0);
      I[k++] = c;
    }

  if (inGrid(G, G->start)) {
    k = G->start.y * G->X + G->start.x;
    I[k] = color[C_START];
  }

  if (inGrid(G, G->end)) {
    v = (G->value[G->end.x][G->end.y] == V_WALL) ? C_END_WALL : C_END;
    k = G->end.y * G->X + G->end.x;
    I[k] = color[v];
  }
}

//
// Alloue une grille aux dimensions x,y ainsi que son image. On force
// x,y>=3 pour avoir au moins un point qui n'est pas sur le bord.
//
grid allocGrid(int x, int y) {
  grid G;
  position p = {-1, -1};
  G.start = G.end = p;
  if (x < 3)
    x = 3;
  if (y < 3)
    y = 3;
  G.X = x;
  G.Y = y;
  G.value = malloc(x * sizeof(*(G.value)));
  G.mark = malloc(x * sizeof(*(G.mark)));

  for (int i = 0; i < x; i++) {
    G.value[i] = malloc(y * sizeof(*(G.value[i])));
    G.mark[i] = malloc(y * sizeof(*(G.mark[i])));
    for (int j = 0; j < y; j++)
      G.mark[i][j] = M_NULL; // initialise
  }

  gridImage = malloc(3 * x * y * sizeof(GLubyte));
  return G;
}

// Libère les pointeurs alloués par allocGrid()
void freeGrid(grid G) {
  for (int i = 0; i < G.X; i++) {
    free(G.value[i]);
    free(G.mark[i]);
  }
  free(G.value);
  free(G.mark);
  free(gridImage);
}

//
// Renvoie une position aléatoire de la grille qui est uniforme parmi
// toutes les valeurs de la grille du type t (hors les bords de la
// grille). Si aucune case de type t n'est pas trouvée, la position
// (-1,-1) est renvoyée.
//
position randomPosition(grid G, int t) {
  int i, j, c;
  int n;                      // n=nombre de cases de type t hors le bord
  int r = -1;                 // r=numéro aléatoire dans [0,n[
  position p = {-1, -1};      // position par défaut
  const int stop = G.X * G.Y; // pour sortir des boucles
  const int x1 = G.X - 1;
  const int y1 = G.Y - 1;

  // On fait deux parcours: un 1er pour compter le nombre n de cases
  // de type t, et un 2e pour tirer au hasard la position parmi les
  // n. A la fin du premier parcours on connaît le nombre n de cases
  // de type t. On tire alors au hasard un numéro r dans [0,n[. Puis
  // on recommence le comptage (n=0) de cases de type t et on s'arrête
  // dès qu'on arrive à la case numéro r.

  c = 0;
  do {
    n = 0;
    for (i = 1; i < x1; i++)
      for (j = 1; j < y1; j++)
        if (G.value[i][j] == t) {
          if (n == r)
            p.x = i, p.y = j,
            i = j = stop; // toujours faux
                          // au 1er parcours
          n++;
        }
    c = 1 - c;
    if (c)
      r = random() % n;
  } while (c); // vrai la 1ère fois, faux la 2e

  return p;
}

//
// Renvoie une grille de dimensions x,y rempli de points aléatoires de
// type et de densité donnés. Le départ et la destination sont
// initialisées aléatroirement dans une case V_FREE.
//
grid initGridPoints(int x, int y, int type, double density) {
  grid G = allocGrid(x, y); // alloue la grille et son image

  // vérifie que le type est correct, M_NULL par défaut
  if ((type < 0) || (type >= NCOLOR))
    type = M_NULL;

  // met les bords et remplit l'intérieur
  for (int i = 0; i < x; i++)
    for (int j = 0; j < y; j++)
      G.value[i][j] =
          onBorder(&G, i, j) ? V_WALL : ((RAND01 <= density) ? type : V_FREE);

  // position start/end aléatoires
  G.start = randomPosition(G, V_FREE);
  G.end = randomPosition(G, V_FREE);

  return G;
}

//
// Renvoie une grille aléatoire de dimensions x,y correspondant à
// partir un labyrinthe qui est un arbre de couvrant aléatoire
// uniforme de source start=en bas à droit. Le point end=en haut à
// gauche. La largeur des couloirs est donnée par width>0.
//
// Il s'agit de l'algorithme de Wilson par "marches aléatoires avec
// effacement de boucle" (cf. https://bl.ocks.org/mbostock/11357811)
//
grid initGridLaby(int x, int y, int width) {

  // vérifie les paramètres
  if (x < 3)
    x = 3;
  if (y < 3)
    y = 3;
  if (width <= 0)
    width = 1;

  // alloue la grille et son image
  int *value = malloc(x * y * sizeof(int *));

  // alloue la grille et son image
  grid Gw = allocGrid(x * (width + 1) + 1, y * (width + 1) + 1);

  // position par défaut
  Gw.start.x = Gw.X - 2;
  Gw.start.y = Gw.Y - 2;
  Gw.end.x = 1;
  Gw.end.y = 1;

  for (int i = 0; i < Gw.X; ++i) {
    for (int j = 0; j < Gw.Y; ++j) {
      Gw.value[i][j] =
          ((i % (width + 1) == 0) || (j % (width + 1) == 0)) ? V_WALL : V_FREE;
    }
  }

  for (int i = 0; i < x; i++)
    for (int j = 0; j < y; j++)
      value[i * y + j] = -1;

  int count = 1;
  value[0] = 0;
  while (count < x * y) {
    int i0 = 0;
    for (i0 = 0; i0 < x * y && value[i0] != -1; i0++)
      ;
    value[i0] = i0 + 1;
    while (i0 < x * y) {
      int x0 = i0 / y;
      int y0 = i0 % y;
      while (true) {
        int dir = rand() % 4;
        switch (dir) {
        case 0:
          if (x0 <= 0)
            continue;
          x0--;
          break;
        case 1:
          if (y0 <= 0)
            continue;
          y0--;
          break;
        case 2:
          if (x0 >= x - 1)
            continue;
          x0++;
          break;
        case 3:
          if (y0 >= y - 1)
            continue;
          y0++;
          break;
        }
        break;
      }
      if (value[x0 * y + y0] == -1) {
        value[x0 * y + y0] = i0 + 1;
        i0 = x0 * y + y0;
      } else {
        if (value[x0 * y + y0] > 0) {
          while (i0 != x0 * y + y0 && i0 > 0) {
            int i1 = value[i0] - 1;
            value[i0] = -1;
            i0 = i1;
          }
        } else {
          int i1 = i0;
          i0 = x0 * y + y0;
          do {
            int x0 = i0 / y;
            int y0 = i0 % y;
            int x1 = i1 / y;
            int y1 = i1 % y;
            if (x0 < x1)
              for (int i = 0; i < width; ++i)
                Gw.value[x1 * (width + 1)][y0 * (width + 1) + i + 1] = V_FREE;
            if (x0 > x1)
              for (int i = 0; i < width; ++i)
                Gw.value[x0 * (width + 1)][y0 * (width + 1) + i + 1] = V_FREE;
            if (y0 < y1)
              for (int i = 0; i < width; ++i)
                Gw.value[x1 * (width + 1) + i + 1][y1 * (width + 1)] = V_FREE;
            if (y0 > y1)
              for (int i = 0; i < width; ++i)
                Gw.value[x1 * (width + 1) + i + 1][y0 * (width + 1)] = V_FREE;
            i0 = i1;
            i1 = value[i0] - 1;
            value[i0] = 0;
            count++;
          } while (value[i1] != 0);
          break;
        }
      }
    }
  }

  free(value);

  return Gw;
}

grid initGridFile(char *file) {
  FILE *f = fopen(file, "r");
  if (f == NULL) {
    printf("Cannot open file \"%s\"\n", file);
    exit(1);
  }

  char *L = NULL; // L=buffer pour la ligne de texte à lire
  size_t b = 0;   // b=taille du buffer L utilisé (nulle au départ)
  ssize_t n;      // n=nombre de caractères lus dans L, sans le '\0'

  // Etape 1: on évalue la taille de la grille. On s'arrête si c'est
  // la fin du fichier ou si le 1ère caractère n'est pas un '#'

  int x = 0; // x=nombre de caractères sur une ligne
  int y = 0; // y=nombre de lignes

  while ((n = getline(&L, &b, f)) > 0) {
    if (L[0] != '#')
      break;
    if (L[n - 1] == '\n')
      n--; // se termine par '\n' sauf si fin de fichier
    if (n > x)
      x = n;
    y++;
  }

  rewind(f);

  if (x < 3)
    x = 3;
  if (y < 3)
    y = 3;
  grid G = allocGrid(x, y);

  // met des bords et remplit l'intérieur
  for (int i = 0; i < x; i++)
    for (int j = 0; j < y; j++)
      G.value[i][j] = onBorder(&G, i, j) ? V_WALL : V_FREE;

  // Etape 2: on relit le fichier et on remplit la grille

  int v;
  for (int j = 0; j < y; j++) {
    n = getline(&L, &b, f);
    if (L[n - 1] == '\n')
      n--;                        // enlève le '\n' éventuelle
    for (int i = 0; i < n; i++) { // ici n<=x
      switch (L[i]) {
      case ' ':
        v = V_FREE;
        break;
      case '#':
        v = V_WALL;
        break;
      case ';':
        v = V_SAND;
        break;
      case '~':
        v = V_WATER;
        break;
      case ',':
        v = V_MUD;
        break;
      case '.':
        v = V_GRASS;
        break;
      case '+':
        v = V_TUNNEL;
        break;
      case 's':
        v = V_FREE;
        G.start.x = i;
        G.start.y = j;
        break;
      case 't':
        v = V_FREE;
        G.end.x = i;
        G.end.y = j;
        break;
      default:
        v = V_FREE;
      }
      G.value[i][j] = v;
    }
  }

  free(L);
  fclose(f);
  return G;
}

// Ne touche pas au bord de la grille.
void addRandomBlob(grid G, int type, int nb) {
  int neighs[8][2] = {{0, -1},  {1, 0},  {0, 1},  {-1, 0},
                      {-1, -1}, {-1, 1}, {1, -1}, {1, 1}};
  for (int i = 0; i < nb; i++)
    G.value[1 + random() % (G.X - 2)][1 + random() % (G.Y - 2)] = type;

  for (int it = 0; it < G.X && it < G.Y; it++)
    for (int i = 2; i < G.X - 2; i++)
      for (int j = 2; j < G.Y - 2; j++) {
        int n = 0;
        for (int k = 0; k < 4; k++)
          if (G.value[i + neighs[k][0]][j + neighs[k][1]] == type)
            n++;
        if (n && random() % ((4 - n) * 20 + 1) == 0)
          G.value[i][j] = type;
      }
}
