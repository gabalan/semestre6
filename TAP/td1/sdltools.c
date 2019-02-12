#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "sdltools.h"

bool mouse_left_down = false;
bool mouse_right_down = false;
// bool update = false;
bool running = true;
bool hover = true;
double scale = 1.0;
bool erase = true; // efface les couleurs à la fin ou pas

static int selectedVertex = -1;

void cleaning() {
  SDL_GL_DeleteContext(glcontext);
  SDL_DestroyWindow(window);
  SDL_Quit();
}

void drawLine(point p1, point p2) {
  glBegin(GL_LINES);
  glVertex2f(p1.x, p1.y);
  glVertex2f(p2.x, p2.y);
  glEnd();
}

void drawPoint(point p) {
  glPointSize(5.0f);
  glBegin(GL_POINTS);
  glVertex2f(p.x, p.y);
  glEnd();
}

void getCenterCoord(double *x, double *y) {
  GLint viewport[4];
  glGetIntegerv(GL_VIEWPORT, viewport);
  pixelToCoord((viewport[0] + viewport[2]) / 2, (viewport[1] + viewport[3]) / 2,
               x, y);
}

static int getClosestVertex(double x, double y) {
  int res = 0;
  double dmin = (x - vertices[0].x) * (x - vertices[0].x) +
                (y - vertices[0].y) * (y - vertices[0].y);

  for (int i = 1; i < NUM_VERTICES; i++) {
    double dist = (x - vertices[i].x) * (x - vertices[i].x) +
                  (y - vertices[i].y) * (y - vertices[i].y);
    if (dist < dmin) {
      dmin = dist;
      res = i;
    }
  }

  return res;
}

void initSDLOpenGL(void) {
  // Initialisation de SDL
  SDL_Init(SDL_INIT_VIDEO);

  window = SDL_CreateWindow(
      "TP Techniques algorithmiques", SDL_WINDOWPOS_UNDEFINED,
      SDL_WINDOWPOS_UNDEFINED, width, height,
      SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);

  if (window == NULL) {
    // Echec lors de la création de la fenêtre
    printf("Could not create window: %s\n", SDL_GetError());
    SDL_Quit();
    exit(1);
  }

  mouse_left_down = mouse_right_down = false; // boutons souris relachés

  SDL_GetWindowSize(window, &width, &height);
  // Contexte OpenGL
  glcontext = SDL_GL_CreateContext(window);

  // Projection de base, un point OpenGL == un pixel
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glOrtho(0.0, width, height, 0.0, 0.0f, 1.0f);
  glScalef(scale, scale, 1.0);

  glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
  glGenTextures(1, &texName);
  glBindTexture(GL_TEXTURE_2D, texName);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
}

void pixelToCoord(int pixel_x, int pixel_y, double *x, double *y) {
  GLdouble ray_z;
  GLint viewport[4];
  GLdouble proj[16];
  GLdouble modelview[16];

  // we query OpenGL for the necessary matrices etc.
  glGetIntegerv(GL_VIEWPORT, viewport);
  glGetDoublev(GL_PROJECTION_MATRIX, proj);
  glGetDoublev(GL_MODELVIEW_MATRIX, modelview);

  GLdouble _X = pixel_x;
  GLdouble _Y = viewport[3] - pixel_y;

  // using 1.0 for winZ gives u a ray
  gluUnProject(_X, _Y, 1.0f, modelview, proj, viewport, x, y, &ray_z);
}

void drawTour(point *V, int n, int *P) {

  // saute le dessin si le précédent a été fait il y a moins de 20ms
  static unsigned int last_tick = 0;
  if (n < 0) {
    last_tick = 0;
    n = -n;
  } // force le dessin si n<0
  if ((!update) && (last_tick + 20 > SDL_GetTicks()))
    return;
  last_tick = SDL_GetTicks();

  // gestion de la file d'event
  handleEvent(false);

  // efface la fenêtre
  glClearColor(0, 0, 0, 1);
  glClear(GL_COLOR_BUFFER_BIT);

  // dessine le cycle
  if (P && V) {
    selectColor(1, 1, 1); // couleur blanche
    for (int i = 0; i < n; i++)
      drawLine(V[P[i]], V[P[(i + 1) % n]]);
  }
  // dessine les points
  if (V) {
    selectColor(1, 0, 0); // couleur rouge
    for (int i = 0; i < n; i++)
      drawPoint(V[i]);
  }

  // affiche le dessin
  SDL_GL_SwapWindow(window);
}

void drawPath(point *V, int n, int *path, int len) {

  // saute le dessin si le précédent a été fait il y a moins de 20ms
  static unsigned int last_tick = 0;
  if (n < 0) {
    last_tick = 0;
    n = -n;
  } // force le dessin si n<0
  if ((!update) && (last_tick + 20 > SDL_GetTicks()))
    return;
  last_tick = SDL_GetTicks();

  // gestion de la file d'event
  handleEvent(false);

  // efface la fenêtre
  glClearColor(0, 0, 0, 1);
  glClear(GL_COLOR_BUFFER_BIT);

  // dessine le chemin
  selectColor(0, 1, 0); // vert
  for (int i = 0; i < len - 1; i++)
    drawLine(V[path[i]], V[path[i + 1]]);

  // dessine les points
  selectColor(1, 0, 0); // rouge
  for (int i = 0; i < n; i++)
    drawPoint(V[i]);

  // affiche le dessin
  SDL_GL_SwapWindow(window);
}

void drawGrid(grid G) {
  static unsigned int last_tick = 0;

  // Saute le dessin si update=false et que le précédent a été fait il
  // y a moins de 20ms = 1/50s

  if ((!update) && (last_tick + 20 > SDL_GetTicks()))
    return;
  last_tick = SDL_GetTicks();

  handleEvent(false);

  // Efface la fenêtre
  glClearColor(0, 0, 0, 1);
  glClear(GL_COLOR_BUFFER_BIT);

  // Dessin
  makeImage(&G);
  glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, G.X, G.Y, 0, GL_RGB, GL_UNSIGNED_BYTE,
               gridImage);
  glEnable(GL_TEXTURE_2D);
  glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_DECAL);
  glBindTexture(GL_TEXTURE_2D, texName);
  glBegin(GL_QUADS);
  glTexCoord2f(0.0, 0.0);
  glVertex3f(0, 0, 0);
  glTexCoord2f(0.0, 1.0);
  glVertex3f(0, G.Y, 0);
  glTexCoord2f(1.0, 1.0);
  glVertex3f(G.X, G.Y, 0);
  glTexCoord2f(1.0, 0.0);
  glVertex3f(G.X, 0, 0);
  glEnd();
  glFlush();
  glDisable(GL_TEXTURE_2D);

  // Affiche le résultat puis attend un certain délais
  SDL_GL_SwapWindow(window);
  SDL_Delay(delay);
}

bool handleEvent(bool wait_event) {
  SDL_Event e;
  bool has_changed = false;

  if (wait_event)
    SDL_WaitEvent(&e);
  else if (!SDL_PollEvent(&e))
    return has_changed;

  do {
    switch (e.type) {
    case SDL_KEYDOWN:
      if (e.key.keysym.sym == SDLK_q) {
        running = false;
        update = false;
        delay = 0;
        break;
      }
      if (e.key.keysym.sym == SDLK_a) {
        if (delay > 30)
          delay -= sqrt(delay);
        else
          delay--;
        if (delay < 0)
          delay = 0;
        break;
      }
      if (e.key.keysym.sym == SDLK_z) {
        delay += sqrt(delay);
        if (delay > 100)
          delay = 100;
        break;
      }
      if (e.key.keysym.sym == SDLK_p) {
        SDL_Delay(500);
        SDL_WaitEvent(&e);
        break;
      }
      if (e.key.keysym.sym == SDLK_c) {
        erase = !erase;
        break;
      }
      break;
    case SDL_QUIT:
      running = false;
      break;
    case SDL_WINDOWEVENT:
      if (e.window.event == SDL_WINDOWEVENT_SIZE_CHANGED) {
        double x, y;
        getCenterCoord(&x, &y);
        glViewport(0, 0, e.window.data1, e.window.data2);
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(0.0, e.window.data1, e.window.data2, 0.0f, 0.0f, 1.0f);
        glTranslatef(e.window.data1 / 2 - x, e.window.data2 / 2 - y, 0.0f);
        zoomAt(scale, x, y);
      }
      break;
    case SDL_MOUSEWHEEL:
      if (e.wheel.y > 0) {
        int x, y;
        SDL_GetMouseState(&x, &y);
        zoomPixelIn(x, y);
        scale *= 2;
      } else if (e.wheel.y < 0) {
        int x, y;
        SDL_GetMouseState(&x, &y);
        zoomPixelOut(x, y);
        scale *= 0.5;
      }
      break;
    case SDL_MOUSEBUTTONDOWN:
      if (e.button.button == SDL_BUTTON_LEFT) {
        double x, y;
        pixelToCoord(e.motion.x, e.motion.y, &x, &y);
        if (hover) {
          int v = getClosestVertex(x, y);
          if ((x - vertices[v].x) * (x - vertices[v].x) +
                  (y - vertices[v].y) * (y - vertices[v].y) <
              30.0f)
            selectedVertex = v;
        }
        mouse_left_down = true;
      }
      if (e.button.button == SDL_BUTTON_RIGHT)
        mouse_right_down = true;
      break;

    case SDL_MOUSEBUTTONUP:
      if (e.button.button == SDL_BUTTON_LEFT) {
        selectedVertex = -1;
        mouse_left_down = false;
      }
      if (e.button.button == SDL_BUTTON_RIGHT)
        mouse_right_down = false;
      break;

    case SDL_MOUSEMOTION:
      if (hover && !mouse_right_down && mouse_left_down &&
          selectedVertex >= 0) {
        pixelToCoord(e.motion.x, e.motion.y, &(vertices[selectedVertex].x),
                     &(vertices[selectedVertex].y));
        has_changed = true;
      }
      if (mouse_right_down) {
        glTranslatef(e.motion.xrel / scale, e.motion.yrel / scale, 0);
      }
      break;
    }
  } while (SDL_PollEvent(&e));

  return has_changed;
}

void selectColor(double red, double green, double blue) {
  glColor3f(red, green, blue);
}

void zoomAt(double scale, double x, double y) {
  glTranslatef(x, y, 0);
  glScalef(scale, scale, 1.0);
  glTranslatef(-x, -y, 0);
}

void zoomPixel(double scale, int mouse_x, int mouse_y) {
  double x, y;
  pixelToCoord(mouse_x, mouse_y, &x, &y);
  zoomAt(scale, x, y);
}

void zoomPixelIn(int x, int y) { zoomPixel(2.0, x, y); }

void zoomPixelOut(int x, int y) { zoomPixel(0.5, x, y); }
