CC = gcc
CFLAGS = -Wall -g -Wno-unused-function -Wno-deprecated-declarations
LDLIBS = -lm

ifeq ($(shell uname -s), Darwin)
    LF = /Library/Frameworks
    LDLIBS += -F $(LF)/
    LDLIBS += -framework OpenGL -framework GLUT -framework SDL2
    LDFLAGS += -I $(LF)/SDL2.framework/Headers/
else
    LDLIBS += -lglut -lGLU -lGL -lSDL2
endif

tsp: tsp.c sdltools.c misc.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

tsp_approx: tsp_approx.c sdltools.c misc.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

test_heap: test_heap.c heap.c
	$(CC) $(CFLAGS) $^ -o $@
	
a_star: a_star.c sdltools.c misc.c heap.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

cor: a_star.cor.c sdltools.c misc.c heap.cor.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

clean:
	rm -f tsp
	rm -f tsp_approx
	rm -f test_heap heap
	rm -f cor
	rm -f a_star
