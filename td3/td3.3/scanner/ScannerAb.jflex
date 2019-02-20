import beaver.Symbol;
import beaver.Scanner;

%%

%class ScannerAb
%extends Scanner
%function nextToken
%type Symbol
%yylexthrow Scanner.Exception
%eofval{
	return new Symbol(Terminals.EOF);
%eofval}
%unicode

%%

	"a"         { return new Symbol(Terminals.A); }
	"b"         { return new Symbol(Terminals.B); }
	\n         { return new Symbol(Terminals.NEWLINE); }
	[^]            { }
