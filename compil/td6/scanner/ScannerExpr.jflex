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
%{
  private Symbol newToken(short id) {
    return new Symbol(id, yyline , yycolumn, yylength(),null);
  }
  private Symbol newToken(short id, Object value) {
    return new Symbol(id, yyline , yycolumn , yylength(), value);
  }
%}

// Compléter à partir d'ici
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

WhiteSpace = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} |
          {DocumentationComment}

TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/*" "*"+ [^/*] ~"*/"
/* identifiers */
Identifier = [:jletter:][:jletterdigit:]*

Integer = [0-9]+
Decimal = ({Integer}(\.{Integer})?)|(\.{Integer})
Float = {Decimal}([eE][+-]?{Integer})?
Unary =	sqrt |sin | round |cos | tan | abs
Binary =min|max|pow

%%
"int" 	        	{  return newToken(Terminals.INT); }
"+" 	        	{  return newToken(Terminals.PLUS); }
"-" 	        	{  return newToken(Terminals.MINUS); }
"*" 	        	{  return newToken(Terminals.TIMES); }
"/" 	        	{  return newToken(Terminals.DIV); }
"(" 	        	{  return newToken(Terminals.LPAR); }
")" 	        	{  return newToken(Terminals.RPAR); }
"=" 	        	{  return newToken(Terminals.EQ); }
"," 	        	{  return newToken(Terminals.COMMA); }
";" 	        	{  return newToken(Terminals.SEMI); }

{Integer}				{  return newToken(Terminals.valeur_entiere, new Integer(yytext())); }

{Identifier}		{  return newToken(Terminals.identificateur, yytext()); }
{WhiteSpace}                   { /* ignore */ }
{Comment} {/*ignore */}
