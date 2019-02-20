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

	"a"         {System.out.println("je vois un a"); return new Symbol(Terminals.A); }
	"b"         {System.out.println("je vois un b"); return new Symbol(Terminals.B); }
	\n         {System.out.println("fin de la ligne");return new Symbol(Terminals.NEWLINE); }
	[^]            { }
