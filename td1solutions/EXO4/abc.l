/* abc.l */
%{
 int na, nb, nc =0;
%}

%%
a                   {na++;}
b                   {nb++;}
c                   {nc++;}
\n                  {;}
[^abc]              {return(0);}
<<EOF>>             {return(1);}
%%

int main()
{int res = yylex();
 if ((na==nb)&&(nb==nc)&&(res==1))
    printf("OK \n");
 else
    printf("KO \n");
}
