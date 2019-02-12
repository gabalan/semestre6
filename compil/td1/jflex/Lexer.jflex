import java.io.*;

%%

%public
%class Lexer
%standalone
%8bit
%public 
%{
    private int lineno
%}
%eof{
    System.out.println("NB_LINES : %s",lineno);
%eof}
Comment=("//".*) | ("/*" ~"*/")
Identificateur = [a-zA-Z_][a-zA-Z0-9_]*
Chiffre=[0-9]
Entier={Chiffres}+
Floats=[0-9]+\.[eE]
//operateurs=
//separateurs=
//String=
//Comment=

%%

/* Keywords */
   while            {System.out.println("KEYWORD : WHILE");}
    if              {System.out.println("KEYWORD : IF");}
    else            {System.out.println("KEYWORD : ELSE");}
    elseif          {System.out.println("KEYWORD : ELSEIF");}
    bool            {System.out.println("KEYWORD : BOOL");}
    break           {System.out.println("KEYWORD : BREAK");}
    case            {System.out.println("KEYWORD : CASE");}
    catch           {System.out.println("KEYWORD : CATCH");}
    char            {System.out.println("KEYWORD : CHAR");}
    class           {System.out.println("KEYWORD : CLASS");}
    const           {System.out.println("KEYWORD : CONST");}
    continue        {System.out.println("KEYWORD : CONTINUE");}
    void            {System.out.println("KEYWORD : VOID");}
    virtual         {System.out.println("KEYWORD : VIRTUAL");}
    using           {System.out.println("KEYWORD : USING");}
    unsigned        {System.out.println("KEYWORD : UNSIGNED");}
    union           {System.out.println("KEYWORD : UNION");}
    typename        {System.out.println("KEYWORD : TYPENAME");}
    typeid          {System.out.println("KEYWORD : TYPEID");}
    typedef         {System.out.println("KEYWORD : TYPEDEF");}
    try             {System.out.println("KEYWORD : TRY");}
    true            {System.out.println("KEYWORD : TRUE");}
    throw           {System.out.println("KEYWORD : THROW");}
    this            {System.out.println("KEYWORD : THIS");}
    template        {System.out.println("KEYWORD : TEMPLATE");}
    switch          {System.out.println("KEYWORD : SWITCH");}
    struct          {System.out.println("KEYWORD : STRUCT");}
    static          {System.out.println("KEYWORD : STATIC");}
    sizeof          {System.out.println("KEYWORD : SIZEOF");}
    unsigned        {System.out.println("KEYWORD : UNSIGNED");}
    namespace       {System.out.println("KEYWORD : NAMESPACE");}
/*Identficateurs*/
   // {Identificateur} {System.out.println("Identficateur               "+yytext());}
    {Chiffre} {System.out.println("Chiffres"+yytext());}
    {Entier} {System.out.println("Entiers                  "+yytext());}
    Comment={}
    \n {lineno++;}
/* Operators */
"+"	{System.out.printf("OPERATOR:%s\n", yytext());}

[^]|\n {}
/*
"abc"    \[^\"]*\"
"ab\"c"  \"([^\"] | \\\")* \"
"ab\\c\"d" \"([^\"] | \\\\ | \\\ ")*\"
*/
