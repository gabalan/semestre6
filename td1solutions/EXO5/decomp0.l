/* decomp0.l */
/* marche */
%{
#include <string.h>
#define MAXL 100
//char facteur[MAXL];
char *facteur;
int num=0;
//facteur=(char *)malloc(MAXL*sizeof(char));
%}

%%
[a]+         {printf("facteur trouve: %d, total: %d \n",1,++num);}
[b]+         {printf("facteur trouve: %d , total: %d \n",2,++num);}
[c]+         {printf("facteur trouve: %d, total: %d\n",3,++num);}
.              {ECHO;}
%%

//int yywrap()
//{return(1);}

int main()
{yylex();
return(EXIT_SUCCESS);
}
