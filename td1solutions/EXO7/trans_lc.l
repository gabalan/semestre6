%{
#include <stdio.h>

/*
* Permet de rescanner yytext
* (la macro REJECT n’est pas compatible avec les états)
*/

void rescan();

/*
* Compte le nombre de caractères à traduire
*/
int cpt;
 
%}

%option noyywrap
%s R1 R2 R3
%%

<INITIAL>{
  (aa)+b {
    printf("[");
    cpt=yyleng;
    BEGIN(R1);
    rescan();
  }
  
  (ab)+b  {
    printf("[");
    cpt=yyleng;
    BEGIN(R2);
    rescan();
  }
  
  (a|b) {
    printf("[");
    cpt=yyleng;
    BEGIN(R3);
    rescan();
  }
  
  .|\n ;
 }

<R1>{
  a {
    printf("b");
    REJECT;
  }
  b {
    printf("c");
    REJECT;
  }
  a|b {
    if (!(--cpt)){
      printf("]");
      BEGIN(INITIAL);
    }
  }
 }

<R2>{
  a {
    printf("c");
    REJECT;
  }
  b {
    printf("d");
    REJECT;
  }
  a|b {
    if (!--cpt){
      printf("]");
      BEGIN(INITIAL);
    }
  }
  }

<R3>{
  a|b {
    ECHO;
    if (!--cpt){
      printf("]");
      BEGIN(INITIAL);
    }
  }
  }


%%

void rescan(){
  int i;
  /* Copy yytext because unput() trashes yytext */
  char *yycopy = strdup( yytext );
  for ( i = yyleng - 1; i >= 0; --i )
    unput( yycopy[i] );
  free( yycopy );
}


int main(int argn, char** argv) {
        yylex();
}
