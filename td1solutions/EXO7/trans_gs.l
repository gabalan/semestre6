/* trans_gs.l; marche */
%{
#include <stdio.h>

/*
* la macro REJECT n’est pas compatible avec les états
* deux appels successifs a yyless(0) provoque une coucle infiniee
*/

/*
* Compte le nombre de caractères à traduire
*/
int cpt;
 
%}

%s R1 R2 R3
%%

<INITIAL>{
  (aa)+b {
    printf("[");
    cpt=yyleng;
    BEGIN(R1);
    yyless(0);
  }
  
  (ab)+b  {
    printf("[");
    cpt=yyleng;
    BEGIN(R2);
    yyless(0);
  }
  
  (a|b) {
    printf("[");
    cpt=yyleng;
    BEGIN(R3);
    yyless(0);
  }
  
  .|\n ;
 }

<R1>{
a { printf("b");
    if (!(--cpt))
        {
        printf("]");
        BEGIN(INITIAL);
        }
   }
 b {
    printf("c");
    if (!(--cpt))
        {
        printf("]");
        BEGIN(INITIAL);
        }
    }
}

<R2>{
  a {
      printf("c");
      if (!(--cpt))
        {
        printf("]");
        BEGIN(INITIAL);
        }
    }
  b {
    printf("d");
    if (!(--cpt))
        {
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

int main(int argn, char** argv) {
        yylex();
}
