#ifndef _SDLTOOLS_H
#define _SDLTOOLS_H

#include "misc.h"
#include <stdbool.h>

// Initialisation de SDL et OpenGL
void initSDLOpenGL(void);
// void init_SDL_OpenGL(void);

// Libération de mémoire
void cleaning(void);

// Gestion des évènements
bool handleEvent(bool wait_event);

// Convertit les coordonnées pixels en coordonnée dans le dessin
void pixelToCoord(int pixel_x, int pixel_y, double *x, double *y);

// Récupère les coordonnées du centre de la fenêtre
void getCenterCoord(double *x, double *y);

// Zoom centré en (x,y) en mutlipliant par scale
void zoomAt(double scale, double x, double y);

// Zooms centré au pixel (x,y)
void zoomPixel(double scale, int mouse_x, int mouse_y);
void zoomPixelIn(int x, int y);
void zoomPixelOut(int x, int y);

// Primitives de dessin
void drawLine(point p1, point p2);
void drawGrid(grid);
void drawPoint(point p);
void selectColor(double red, double green, double blue);

void drawTour(point *V, int n, int *P);
void drawPath(point *V, int n, int *path, int len);

#endif
