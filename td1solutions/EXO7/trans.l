/* trans.l */
/* marche */
%{
#include<string.h>

char transchar(char ch,int par);
char *trans(char *mot,int par);

%}

%%
(aa)+b         {printf("%s ",trans(yytext,1));}
(ab)+b         {printf("%s",trans(yytext,2));}
.              {ECHO;}
%%

int main()
{yylex();
return(EXIT_SUCCESS);
}
/* deux fonctions */
char transchar(char ch,int par)
{return(ch+par);}

char *trans(char *mot,int par)
{int lg=strlen(mot);
char *tmot=(char *)malloc(lg*sizeof(char));
char *tcar;
tcar=tmot;
strcpy(tmot,mot);
int i=0;
for(i=0;i<lg;i++)
    {*tcar=transchar(*mot,par);
    tcar++;mot++;
    };
return(tmot);}

