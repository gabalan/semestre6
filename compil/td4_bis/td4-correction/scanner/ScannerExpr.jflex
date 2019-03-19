import beaver.Symbol;
import beaver.Scanner;

%%

%class ScannerExpr
%extends Scanner
%function nextToken
%type Symbol
%yylexthrow Scanner.Exception
%eofval{
	return new Symbol(Terminals.EOF);
%eofval}
%unicode
%line
%column

%%

"+" 	        { return new Symbol(Terminals.TOKEN_PLUS, yyline, yycolumn); }
"-" 	        { return new Symbol(Terminals.TOKEN_MINUS, yyline, yycolumn); }
"*" 	        { return new Symbol(Terminals.TOKEN_TIMES, yyline, yycolumn); }
"/" 	        { return new Symbol(Terminals.TOKEN_DIV, yyline, yycolumn); }
"<" 	        { return new Symbol(Terminals.TOKEN_LT, yyline, yycolumn); }
"<=" 	        { return new Symbol(Terminals.TOKEN_LE, yyline, yycolumn); }
">" 	        { return new Symbol(Terminals.TOKEN_GT, yyline, yycolumn); }
">=" 	        { return new Symbol(Terminals.TOKEN_GE, yyline, yycolumn); }
"=="|"=" 	        { return new Symbol(Terminals.TOKEN_EQ, yyline, yycolumn); }
"!="|"<>" 	        { return new Symbol(Terminals.TOKEN_NE, yyline, yycolumn); }
"&&"|"∧" 	        { return new Symbol(Terminals.TOKEN_AND, yyline, yycolumn); }
"||"|"∨" 	        { return new Symbol(Terminals.TOKEN_OR, yyline, yycolumn); }
"!"|"¬" 	        { return new Symbol(Terminals.TOKEN_NOT, yyline, yycolumn); }
"(" 	        { return new Symbol(Terminals.TOKEN_LPAR, yyline, yycolumn); }
")" 	        { return new Symbol(Terminals.TOKEN_RPAR, yyline, yycolumn); }
"true"  { return new Symbol(Terminals.TOKEN_TRUE, yyline, yycolumn); }
"false"  { return new Symbol(Terminals.TOKEN_FALSE, yyline, yycolumn); }
[:digit:]+  { return new Symbol(Terminals.TOKEN_NUMBER, yyline, yycolumn, new Double(yytext())); }
[^]|\n      { }
