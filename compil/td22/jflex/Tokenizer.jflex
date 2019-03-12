import java.io.*;

%%

%public
%class Tokenizer
%type Token
%line
%column

%state COMMENT, COMMENT_DOC

%%

<YYINITIAL> {
    /* Keywords */
    bool        {return new Token(Sym.BOOL     , yytext(), yyline, yycolumn);}
    break       {return new Token(Sym.BREAK    , yytext(), yyline, yycolumn);}
    case        {return new Token(Sym.CASE     , yytext(), yyline, yycolumn);}
    catch       {return new Token(Sym.CATCH    , yytext(), yyline, yycolumn);}
    char        {return new Token(Sym.CHAR     , yytext(), yyline, yycolumn);}
    class       {return new Token(Sym.CLASS    , yytext(), yyline, yycolumn);}
    const       {return new Token(Sym.CONST    , yytext(), yyline, yycolumn);}
    continue    {return new Token(Sym.CONTINUE , yytext(), yyline, yycolumn);}
    default     {return new Token(Sym.DEFAULT  , yytext(), yyline, yycolumn);}
    delete      {return new Token(Sym.DELETE   , yytext(), yyline, yycolumn);}
    do          {return new Token(Sym.DO       , yytext(), yyline, yycolumn);}
    double      {return new Token(Sym.DOUBLE   , yytext(), yyline, yycolumn);}
    enum        {return new Token(Sym.ENUM     , yytext(), yyline, yycolumn);}
    else	    {return new Token(Sym.ELSE	   , yytext(), yyline, yycolumn);}
    elseif	    {return new Token(Sym.ELSEIF   , yytext(), yyline, yycolumn);}
    false       {return new Token(Sym.FALSE    , yytext(), yyline, yycolumn);}
    float       {return new Token(Sym.FLOAT    , yytext(), yyline, yycolumn);}
    for         {return new Token(Sym.FOR      , yytext(), yyline, yycolumn);}
    friend      {return new Token(Sym.FRIEND   , yytext(), yyline, yycolumn);}
    goto        {return new Token(Sym.GOTO     , yytext(), yyline, yycolumn);}
    if          {return new Token(Sym.IF       , yytext(), yyline, yycolumn);}
    inline      {return new Token(Sym.INLINE   , yytext(), yyline, yycolumn);}
    int         {return new Token(Sym.INT      , yytext(), yyline, yycolumn);}
    long        {return new Token(Sym.LONG     , yytext(), yyline, yycolumn);}
    namespace   {return new Token(Sym.NAMESPACE, yytext(), yyline, yycolumn);}
    new         {return new Token(Sym.NEW      , yytext(), yyline, yycolumn);}
    operator    {return new Token(Sym.OPERATOR , yytext(), yyline, yycolumn);}
    private     {return new Token(Sym.PRIVATE  , yytext(), yyline, yycolumn);}
    protected   {return new Token(Sym.PROTECTED, yytext(), yyline, yycolumn);}
    public      {return new Token(Sym.PUBLIC   , yytext(), yyline, yycolumn);}
    register    {return new Token(Sym.REGISTER , yytext(), yyline, yycolumn);}
    return      {return new Token(Sym.RETURN   , yytext(), yyline, yycolumn);}
    short       {return new Token(Sym.SHORT    , yytext(), yyline, yycolumn);}
    signed      {return new Token(Sym.SIGNED   , yytext(), yyline, yycolumn);}
    sizeof      {return new Token(Sym.SIZEOF   , yytext(), yyline, yycolumn);}
    static      {return new Token(Sym.STATIC   , yytext(), yyline, yycolumn);}
    struct      {return new Token(Sym.STRUCT   , yytext(), yyline, yycolumn);}
    switch      {return new Token(Sym.SWITCH   , yytext(), yyline, yycolumn);}
    template    {return new Token(Sym.TEMPLATE , yytext(), yyline, yycolumn);}
    this        {return new Token(Sym.THIS     , yytext(), yyline, yycolumn);}
    throw       {return new Token(Sym.THROW    , yytext(), yyline, yycolumn);}
    true        {return new Token(Sym.TRUE     , yytext(), yyline, yycolumn);}
    try         {return new Token(Sym.TRY      , yytext(), yyline, yycolumn);}
    typedef     {return new Token(Sym.TYPEDEF  , yytext(), yyline, yycolumn);}
    typeid      {return new Token(Sym.TYPEID   , yytext(), yyline, yycolumn);}
    typename    {return new Token(Sym.TYPENAME , yytext(), yyline, yycolumn);}
    union       {return new Token(Sym.UNION    , yytext(), yyline, yycolumn);}
    unsigned    {return new Token(Sym.UNSIGNED , yytext(), yyline, yycolumn);}
    using       {return new Token(Sym.USING    , yytext(), yyline, yycolumn);}
    virtual     {return new Token(Sym.VIRTUAL  , yytext(), yyline, yycolumn);}
    void        {return new Token(Sym.VOID     , yytext(), yyline, yycolumn);}
    while       {return new Token(Sym.WHILE    , yytext(), yyline, yycolumn);}

    /* Operators */
    "<<="	    {return new Token(Sym.RIGHT_SHIFT_EQUAL , yytext(), yyline, yycolumn);}
    ">>="	    {return new Token(Sym.LEFT_SHIFT_EQUAL , yytext(), yyline, yycolumn);}
    "++"	    {return new Token(Sym.MORE_MORE , yytext(), yyline, yycolumn);}
    "<<"	    {return new Token(Sym.LEFT_SHIFT , yytext(), yyline, yycolumn);}
    ">>"	    {return new Token(Sym.RIGHT_SHIFT , yytext(), yyline, yycolumn);}
    "<="	    {return new Token(Sym.MINOR_EQUAL , yytext(), yyline, yycolumn);}
    ">="	    {return new Token(Sym.MAJOR_EQUAL , yytext(), yyline, yycolumn);}
    "=="	    {return new Token(Sym.EQUAL , yytext(), yyline, yycolumn);}
    "!="	    {return new Token(Sym.DIFFERENT , yytext(), yyline, yycolumn);}
    "--"	    {return new Token(Sym.MINUS_MINUS , yytext(), yyline, yycolumn);}
    "&&"	    {return new Token(Sym.LOGICAL_AND , yytext(), yyline, yycolumn);}
    "||"	    {return new Token(Sym.LOGICAL_OR , yytext(), yyline, yycolumn);}
    "*="	    {return new Token(Sym.TIME_EQUAL , yytext(), yyline, yycolumn);}
    "/="	    {return new Token(Sym.DIVIDE_EQUAL , yytext(), yyline, yycolumn);}
    "%="	    {return new Token(Sym.MODULO_EQUAL , yytext(), yyline, yycolumn);}
    "+="	    {return new Token(Sym.PLUS_EQUAL , yytext(), yyline, yycolumn);}
    "-="	    {return new Token(Sym.MINUS_EQUAL , yytext(), yyline, yycolumn);}
    "&="	    {return new Token(Sym.AND_EQUAL , yytext(), yyline, yycolumn);}
    "^="	    {return new Token(Sym.XOR_EQUAL , yytext(), yyline, yycolumn);}
    "|="	    {return new Token(Sym.OR_EQUAL , yytext(), yyline, yycolumn);}
    "="	        {return new Token(Sym.ASSIGN , yytext(), yyline, yycolumn);}
    "-"	        {return new Token(Sym.MINUS , yytext(), yyline, yycolumn);}
    "&"	        {return new Token(Sym.AND , yytext(), yyline, yycolumn);}
    "|"	        {return new Token(Sym.OR , yytext(), yyline, yycolumn);}
    "*"	        {return new Token(Sym.TIME , yytext(), yyline, yycolumn);}
    "~"	        {return new Token(Sym.TILDE , yytext(), yyline, yycolumn);}
    "/"	        {return new Token(Sym.SLASH , yytext(), yyline, yycolumn);}
    "%"	        {return new Token(Sym.PERCENT , yytext(), yyline, yycolumn);}
    "+"	        {return new Token(Sym.PLUS , yytext(), yyline, yycolumn);}
    "<"	        {return new Token(Sym.MINOR , yytext(), yyline, yycolumn);}
    ">"	        {return new Token(Sym.MAJOR , yytext(), yyline, yycolumn);}
    "!"	        {return new Token(Sym.EXCLAMATION , yytext(), yyline, yycolumn);}
    "^"	        {return new Token(Sym.XOR , yytext(), yyline, yycolumn);}

    /* Separator */
    ","	        {return new Token(Sym.COLON , yytext(), yyline, yycolumn);}
    ";"	        {return new Token(Sym.SEMICOLON , yytext(), yyline, yycolumn);}
    ":"	        {return new Token(Sym.DOUBE_DOT , yytext(), yyline, yycolumn);}
    "("	        {return new Token(Sym.PARENTHESE_IN , yytext(), yyline, yycolumn);}
    ")"	        {return new Token(Sym.PARENTHESE_OUT , yytext(), yyline, yycolumn);}
    "["	        {return new Token(Sym.CROCHET_IN , yytext(), yyline, yycolumn);}
    "]"	        {return new Token(Sym.CROCHET_OUT , yytext(), yyline, yycolumn);}
    "."	        {return new Token(Sym.DOT , yytext(), yyline, yycolumn);}
    "{"	        {return new Token(Sym.BRACKET_IN , yytext(), yyline, yycolumn);}
    "}"	        {return new Token(Sym.BRACKET_OUT , yytext(), yyline, yycolumn);}


    /* Identificator */
    [0-9]+\.[0-9]*([eE][+-]?[0-9]*)?
    |   \.[0-9]+([eE][+-]?[0-9]*)?
    |   [0-9]+[eE][+-]?[0-9]+        {System.out.printf("FLOAT:%s\n", yytext());}
    [0-9]+                  {System.out.printf("NUMBER:%s\n", yytext());}
    [a-zA-Z_][A-Za-z0-9_]*  {System.out.printf("IDENTIFICATOR:%s\n", yytext());}

    /* Commentary */
    \/\/.*              {System.out.printf("LINE COMMENTARY:%s\n", yytext());}
    "/**"              {System.out.println("COMMENTARY DOC"); yybegin(COMMENT_DOC);}
    "/*"                {System.out.println("COMMENTARY"); yybegin(COMMENT);}

    /* String */
    \"[^\"]*\"          {System.out.printf("STRING:%s\n", yytext());}

    \n                  {}

    [^] {}
}

<COMMENT> {
    ~(\*\/)     {yybegin(YYINITIAL);}
}

<COMMENT_DOC> {
    @author .+     {System.out.printf("Author : %s\n", yytext());}
    @version [0-9\. /]*   {System.out.printf("Version : %s\n", yytext());}
    @param .+     {System.out.printf("Param : %s\n", yytext());}
    @return .+     {System.out.printf("return : %s\n", yytext());}
    \*\/            {yybegin(YYINITIAL);}
    [^] {}
}


