import beaver.Symbol;
import beaver.Scanner;

%%
%class ScannerLogic
%extends Scanner
%function nextToken
%type Symbol
%yylexthrow Scanner.Exception
%eofval{
	return new beaver.Symbol(Terminals.EOF, "end-of-file");
%eofval}
%unicode

%line
%column

%{
  private beaver.Symbol sym(short id) {
    return new beaver.Symbol(id, yyline + 1, yycolumn + 1, yylength(), yytext());
  }
  private beaver.Symbol sym(short id, Object value) {
    return new beaver.Symbol(id, yyline + 1, yycolumn + 1, yylength(), value);
  }
%}
%%

	"+"													{return new Symbol(Terminals.PLUS); }
	"-"													{return new Symbol(Terminals.MINUS); }
	"/"													{return new Symbol(Terminals.DIV); }
	"<"													{return new Symbol(Terminals.LT); }
	">"													{return new Symbol(Terminals.LG); }
	"<="												{return new Symbol(Terminals.LLE); }
	">="												{return new Symbol(Terminals.GE); }
	"="													{return new Symbol(Terminals.EQ); }
	"!="												{return new Symbol(Terminals.NE); }
	"*"													{return new Symbol(Terminals.TIMES); }
	[1-9][0-9]* | 0									{return new Symbol(Terminals.NUMBER); }
	"True"											{return new Symbol(Terminals.TRUE); }
	"False"											{return new Symbol(Terminals.FALSE); }
	"∨" |\u2228			{ System.out.println("AND"); return new Symbol(Terminals.OR); }
	"∧"	|\u2227			{ System.out.println("OR"); return new Symbol(Terminals.AND); }
	"¬"	|\u00AC			{ System.out.println("NOT"); return new Symbol(Terminals.NOT); }
	"("			{ System.out.println("LPAR"); return new Symbol(Terminals.LPAR); }
	")"			{ System.out.println("LPAR"); return new Symbol(Terminals.RPAR); }
	[^] | \n			 {}
