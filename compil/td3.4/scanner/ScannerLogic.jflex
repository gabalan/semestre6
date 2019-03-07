import beaver.Symbol;
import beaver.Scanner;

%%
%public
%class ScannerLogic
%extends Scanner
%function nextToken
%type Symbol
%yylexthrow Scanner.Exception
%eofval{
	return new Symbol(Terminals.EOF);
%eofval}
%unicode

%%
	"True"			{return new Symbol(Terminals.TRUE); }
	"False"			{return new Symbol(Terminals.FALSE); }
	[a-zA-Z_]+			{return new Symbol(Terminals.VAR); }
	"∨" |\u2228			{ System.out.println("AND"); return new Symbol(Terminals.OR); }
	"∧"	|\u2227			{ System.out.println("OR"); return new Symbol(Terminals.AND); }
	"¬"	|\u00AC			{ System.out.println("NOT"); return new Symbol(Terminals.NOT); }
	"("			{ System.out.println("LPAR"); return new Symbol(Terminals.LPAR); }
	")"			{ System.out.println("LPAR"); return new Symbol(Terminals.RPAR); }
	[^]|\n			 {}
	
