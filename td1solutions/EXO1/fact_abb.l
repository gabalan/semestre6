/* fact_abb.l */
%{
int res=0;
%}

%%
"abb"                      {res=1;}
.                          {;}
\n                         {;}
%%

//int yywrap()
//{return(1);}

int main()
{yylex();
if (res==1)
printf("le facteur abb est present\n");
else
printf("le facteur abb est absent\n");
//return(analyselex);
}

