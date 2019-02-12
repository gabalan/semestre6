#ifndef _VARIABLES_H
#define _VARIABLES_H

#ifdef __APPLE__
#include <OpenGL/glu.h>
#else
#include <GL/glu.h>
#endif
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <stdbool.h>

// Quelques variables globales pour ne pas s'embêter

#define NUM_VERTICES 1000

typedef struct {
  double x, y;
} point;

point *vertices;

/* une cellule de la table */
typedef struct {
  double length; // longueur du chemin minimum D[t][S]
  int pred;      // point précédant t dans la solution D[t][S]
} cell;

typedef struct {
  int x, y;
} position;

typedef struct {
  int X, Y;       // dimensions: X et Y
  int **value;    // valuation des cases: value[i][j], 0<=i<X, 0<=j<Y
  int **mark;     // marquage des cases: mark[i][j], 0<=i<X, 0<=j<Y
  position start; // position de la source
  position end;   // position de la destination
} grid;

// valeurs possibles des cases d'une grille pour .value et .mark
// l'ordre doit être cohérent avec color[] et weight[]
enum {

  // pour .value
  V_FREE = 0, // case vide
  V_WALL,     // Mur
  V_SAND,     // Sable
  V_WATER,    // Eau
  V_MUD,      // Boue
  V_GRASS,    // Herbe
  V_TUNNEL,   // Tunnel

  // pour .mark
  M_NULL,  // sommet non marqué
  M_USED,  // sommet marqué dans P
  M_FRONT, // sommet marqué dans Q
  M_PATH,  // sommet dans le chemin

  // divers
  C_START,    // couleur de la position de départ
  C_END,      // idem pour la destination
  C_FINAL,    // couleur de fin du dégradé pour M_USED
  C_END_WALL, // couleur de destination si sur V_WALL

  // extra
  M_USED2,  // sommet marqué dans P_t
  C_FINAL2, // couleur de fin du dégradé pour M_USED2
};

typedef struct {
  // l'ordre de la déclaration est important
  GLubyte R;
  GLubyte G;
  GLubyte B;
} RGB;

extern RGB color[]; // couleurs définies dans utils.c

// faux ssi drawXXX() peut être sauté si l'affichage a eut lieu il y a
// moins de 1/50s, ce qui accélère l'affichage. Mettre = true pour
// forcer l'affichage
bool update;
bool hover;

// Taille de la fenêtre mise à jour celle-ci est redimensionnée
int width, height;

double scale;                           // Zoom courrant
bool mouse_left_down, mouse_right_down; // Boutons de la souris enfoncé
bool running;                           // Dans la boucle principale
bool erase;
int delay; // délais d'affichage pour drawGrid(), unité = 0"01

// Objets SDL
SDL_Window *window;
SDL_GLContext glcontext;
GLvoid *gridImage;
GLuint texName;

#endif
