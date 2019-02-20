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

%%
	[a-zA-Z]+	{ return new Symbol(Terminals.VAR); }
	1 			{ return new Symbol(Terminals.TRUE); }
	0 			{ return new Symbol(Terminals.FALSE); }
	"(" 		{ return new Symbol(Terminals.PAR_IN); }
	")" 		{ return new Symbol(Terminals.PAR_OUT); }
	\u2228		{ return new Symbol(Terminals.OR); }
	\u2227		{ return new Symbol(Terminals.AND); }
	\u00AC		{ return new Symbol(Terminals.NOT); }
	\n         	{ return new Symbol(Terminals.NEWLINE); }
	[^]         { }
