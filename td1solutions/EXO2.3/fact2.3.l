/* fact2.3.l */
%{
 int res;
 int posd;
%}

%%
cabbb    {res=0;
          printf("(%d,%d)", posd, res);
          posd=posd+3;
          yyless(3);
         }
bbc      {res=1;
           printf("(%d,%d)", posd, res);
          posd=posd+2;
          yyless(2);
         }
.        {posd=posd+1;}
\n       {;}
%%

int main()
{ yylex();
}



