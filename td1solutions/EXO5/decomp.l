/* decomp.l */
/* marche  */
%{
int res;
%}

%%
[ab]           {printf("[%s]",yytext);}
(aa)+b         {printf("[%s]",yytext);}
(ab)+b         {printf("[%s]",yytext);}
\n             {;}
[^ab]          {return(0);}
<<EOF>>        {return(1);}
%%

int main()
{res=yylex();
printf(" res = %d ", res);
return(EXIT_SUCCESS);
}

/*aaaaabababbbbaab
-->[a][aaaab][ababb][b][b][aab]
*/
