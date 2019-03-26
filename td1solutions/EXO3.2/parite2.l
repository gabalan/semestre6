/* parite2.l */
%{
%}
%s Q00 Q01 Q10 Q11
%%
<INITIAL>a      {BEGIN Q10;}
<INITIAL>b      {BEGIN Q01;}
<Q00>a      {BEGIN Q10;}
<Q00>b      {BEGIN Q01;}
<Q01>a      {BEGIN Q11;}
<Q01>b      {BEGIN Q00;}
<Q10>a      {BEGIN Q00;}
<Q10>b      {BEGIN Q11;}
<Q11>a      {BEGIN Q01;}
<Q11>b      {BEGIN Q10;}
.           {;}
\n          {;}
<Q01><<EOF>>             {return(1);}
<Q00,Q10,Q11><<EOF>>     {return(0);} 
%%


int main()
{int res;
res=yylex();
if (res==1)
   printf(" mot reconnu \n");
else
   printf(" mot rejete \n");
exit(0);
}
