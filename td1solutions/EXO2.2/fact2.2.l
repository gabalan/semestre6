/* fact4.2.l */
%{
 /* sortie pour position *pp, lexeme r, de longueur long */
 typedef int *Pint;
 void traiter(Pint pp, int reg, int lg);
 int res;
 int posd;
 Pint pposd=&posd;
%}

%%
cabb    {res=0;
         traiter(pposd, res, yyleng);
        }
cbab    {res=1;
         traiter(pposd, res, yyleng);
        }
cbb     {res=2;
         traiter(pposd, res, yyleng);
        }
cbbba   {res=3;
         traiter(pposd, res, yyleng);
        }
.       {*pposd=*pposd+1;}
\n      {;}
%%

int main()
{ yylex();
}

void traiter(Pint pp, int reg, int lg)
{ printf("(%d,%d)", *pp, reg);
  *pp = lg + (*pp);
}

