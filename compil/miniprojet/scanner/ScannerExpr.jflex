import beaver.Symbol;
import beaver.Scanner;

%%

%class ScannerExpr
%extends Scanner
%function nextToken
%type Symbol
%yylexthrow Scanner.Exception
%eofval{
	System.out.println(yytext()); return new Symbol(Terminals.EOF);
%eofval}
%unicode
%line
%column

// Compléter à partir d'ici

Identifier = [a-zA-Z_][a-zA-Z0-9_]*
Integer = [0-9]+
Decimal = ({Integer}(\.{Integer})?)|(\.{Integer})
Float = [+-]?{Decimal}([eE][+-]?{Integer})?
Unary =	sqrt |sin | round |cos | tan | abs
Binary =min|max

%%

"+" 	        	{  return new Symbol(Terminals.PLUS, yyline, yycolumn); }
"-" 	        	{  return new Symbol(Terminals.MINUS, yyline, yycolumn); }
"*" 	        	{  return new Symbol(Terminals.TIMES, yyline, yycolumn); }
"/" 	        	{  return new Symbol(Terminals.DIV, yyline, yycolumn); }
"(" 	        	{  return new Symbol(Terminals.LPAR, yyline, yycolumn); }
")" 	        	{  return new Symbol(Terminals.RPAR, yyline, yycolumn); }
{Unary}					{  return new Symbol(Terminals.UFCT, yyline, yycolumn, yytext()); }
{Binary}				{  return new Symbol(Terminals.BFCT, yyline, yycolumn, yytext()); }
e								{  return new Symbol(Terminals.E, yyline, yycolumn, java.lang.Math.E); }
pi							{  return new Symbol(Terminals.PI, yyline, yycolumn, java.lang.Math.PI); }
"=" 	        	{  return new Symbol(Terminals.EQ, yyline, yycolumn); }
"," 	        	{  return new Symbol(Terminals.COMMA, yyline, yycolumn); }
";" 	        	{  return new Symbol(Terminals.SEMI, yyline, yycolumn); }
{Integer}				{  return new Symbol(Terminals.INTEGER, yyline, yycolumn, new Integer(yytext())); }
{Float}					{  return new Symbol(Terminals.FLOAT, yyline, yycolumn, new Double(yytext())); }
{Identifier}		{  return new Symbol(Terminals.ID, yyline, yycolumn, yytext()); }

[^]|\n					{ }
