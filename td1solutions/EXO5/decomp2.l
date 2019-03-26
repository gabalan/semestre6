/* decomp2.l */
/* marche! */
%{

%}

%%
(aa)+b         {printf("[%s]",yytext);}
(ab)+b         {printf("[%s]",yytext);}
.              {ECHO;}
%%

int main()
{yylex();
return(EXIT_SUCCESS);
}

/*aaaabababbaab
--> [aaaab][ababb][aab]
*/
