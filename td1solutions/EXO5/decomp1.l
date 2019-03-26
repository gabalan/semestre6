/* decomp1.l */
/* marche !*/
%{
#include <string.h>
#define MAXL 100
//char facteur[MAXL];
char *facteur;
int num=0;
//facteur=(char *)malloc(MAXL*sizeof(char));
%}

%%
(aa)+b         {printf("[%s]",yytext);}
(aa)+ab        {printf("[%s]",yytext);}
(abab)+        {printf("[%s]",yytext);}
.              {ECHO;}
%%

int main()
{yylex();
return(EXIT_SUCCESS);
}
