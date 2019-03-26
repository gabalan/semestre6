/* fact4.l */
%{
 int res=0;
%}

%%
cabb    {res=1;}
cbab    {res=1;}
cbb     {res=1;}
cbbba   {res=1;}
.       {;}
\n      {;}
%%

int main()
{ yylex();
 if (res==1)
 printf("un facteur parmi cabb, cbab, cbb, cbbba est present\n");
 else
 printf("aucun facteur detecte \n");
}
