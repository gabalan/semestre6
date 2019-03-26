/* decomp3.l */
/* marche: s'arrete apres avoir reconnu UNE des expressions  */
%{
int res;
%}

%%
(aa)+b         {printf("[%s]",yytext);return(1);}
(ab)+b         {printf("[%s]",yytext);return(2);}
.              {ECHO;}
%%

int main()
{res=yylex();
printf(" res = %d ", res);
return(EXIT_SUCCESS);
}

/*
/aaabababb
--> a[aab] res = 1 
*/
