/* parite.l */
%{
int na, nb =0;
%}

%%
a     {na++;}
b     {nb++;}
.      {;}
\n     {;}
%%

int main()
{yylex();
if ((na%2==0)&&(nb%2==1))
    printf("OK \n");
else
    printf("KO \n");
}
