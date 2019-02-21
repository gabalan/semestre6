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

	"+"			{return new Symbol(Terminals.PLUS); }
	"-"			{return new Symbol(Terminals.MINUS); }
	"/"			{return new Symbol(Terminals.DIV); }
	"<"			{return new Symbol(Terminals.LT); }
	">"			{return new Symbol(Terminals.LG); }
	"<="		{return new Symbol(Terminals.LE); }
	">="		{return new Symbol(Terminals.GE); }
	"="			{return new Symbol(Terminals.EQ); }
	"!="		{return new Symbol(Terminals.NE); }
	"*"			{return new Symbol(Terminals.TIMES); }
	[0-9]+	{return new Symbol(Terminals.NUMBER); }
	"1"			{return new Symbol(Terminals.TRUE); }
	"0"			{return new Symbol(Terminals.FALSE); }
	[a-zA-Z_]+			{return new Symbol(Terminals.VAR); }
	"∨" |\u2228			{ System.out.println("AND"); return new Symbol(Terminals.OR); }
	"∧"	|\u2227			{ System.out.println("OR"); return new Symbol(Terminals.AND); }
	"¬"	|\u00AC			{ System.out.println("NOT"); return new Symbol(Terminals.NOT); }
	"("			{ System.out.println("LPAR"); return new Symbol(Terminals.LPAR); }
	")"			{ System.out.println("LPAR"); return new Symbol(Terminals.RPAR); }
	[^]|\n			 {}
