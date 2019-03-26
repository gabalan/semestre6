/* trans.l */
/* marche */
/* bizarreries de terminaisons: sur aaaaaaaaaaaa: 3 fois C-d pour provoquer " OK "  */
/* sur aaaaaaaaaaaa\n: 1 seul C-d provoque " OK " */
%{

%}

%%
a         {printf("b");}
b         {printf("c");}
c         {printf("a");}
\n        {;}
[^abc]    {return(0);}
<<EOF>>   {return(1);}
%%
#include<stdio.h>

int main()
{int res;
 res=yylex();
 if (res==1)
     printf(" OK \n");
 else
     printf("KO \n");
 return(EXIT_SUCCESS);
}


