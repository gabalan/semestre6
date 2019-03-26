/* trans_gs2.l; marche */
%{
#include <stdio.h>

/*
* attention:la macro REJECT n’est pas compatible avec les états;
* yyless(0) semble mieux marcher.
*/

/*
* Compte le nombre de caractères à traduire
*/
 int cpt;
 #define commencer(x) printf("[");cpt=yyleng;BEGIN(x);yyless(0);
 #define terminer(x) printf(x);if (!(--cpt)){printf("]");BEGIN(INITIAL);}
%}

%s R1 R2 R3
%%

<INITIAL>{
(aa)+b  {commencer(R1)}
  
(ab)+b  {commencer(R2)}
  
(a|b)   {commencer(R3)}
  
.|\n ;
}

<R1>{
a { terminer("b")
  }
b { terminer("c")
  }
}

<R2>{
a { terminer("c")
  }
b { terminer("d")
  }
}

<R3>{
a { terminer("a")
  }
b { terminer("b")
  }
}

%%

int main(int argn, char** argv) {
        yylex();
}
