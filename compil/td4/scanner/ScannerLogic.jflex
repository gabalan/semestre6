import beaver.Symbol;
import beaver.Scanner;

%%
%class ScannerLogic
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

%{
  private Symbol newToken(short id) {
    return new Symbol(id, yyline + 1, yycolumn + 1, yylength(),null);
  }
  private Symbol newToken(short id, Object value) {
    return new Symbol(id, yyline + 1, yycolumn + 1, yylength(), value);
  }
%}

Integer = [0-9]+

%%

	"+"													{return newToken(Terminals.PLUS); }
	"-"													{return newToken(Terminals.MINUS); }
	"/"													{return newToken(Terminals.DIV); }
	"<"													{return newToken(Terminals.LT); }
	">"													{return newToken(Terminals.LG); }
	"<="												{return newToken(Terminals.LLE); }
	">="												{return newToken(Terminals.GE); }
	"="													{return newToken(Terminals.EQ); }
	"!="												{return newToken(Terminals.NE); }
	"*"													{return newToken(Terminals.TIMES); }
	{Integer}
	{
		return newToken(Terminals.NUMBER, Integer.parseInt(yytext()));
	}
	True										{return newToken(Terminals.TRUE,Boolean.parseBoolean(yytext())); }
	False											{return newToken(Terminals.FALSE,Boolean.parseBoolean(yytext())); }
	"||" | \u2228			{  return newToken(Terminals.OR); }
	"&&"	| \u2227			{  return newToken(Terminals.AND);}
	"¬"	| \u00AC			{  return newToken(Terminals.NOT); }
	"("			{ return newToken(Terminals.LPAR); }
	")"			{ return newToken(Terminals.RPAR); }
	[\s] {}

[^]
	{
		throw new Scanner.Exception("caractère inattendu '" + yytext() + "'");
	}
