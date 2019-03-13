import beaver.Symbol;
import beaver.Scanner;

%%

%class ScannerExp
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
	// Petit helpers pour simplifier la création de token.
	// On retient la position de chaque token pour la gestion d'erreur
	// voir beaver-rt/src/main/java/beaver/Symbol.java
	private Symbol newToken(short id)
	{
		return new Symbol(id, yyline + 1, yycolumn + 1, yylength(), null);
	}

	private Symbol newToken(short id, Object value)
	{
		return new Symbol(id, yyline + 1, yycolumn + 1, yylength(), value);
	}

%}

Integer = [0-9]+
Identifier = [a-z]+
String = \"~\"

%%
"+"
	{
		return newToken(Terminals.PLUS);
	}
"-"
	{
		return newToken(Terminals.MINUS);
	}
","
	{
		return newToken(Terminals.COMMA);
	}
":"
	{
		return newToken(Terminals.COLON);
	}
";"
	{
		return newToken(Terminals.SEMICOLON);
	}
"("
	{
		return newToken(Terminals.LPAR);
	}
")"
	{
		return newToken(Terminals.RPAR);
	}
"["
	{
		return newToken(Terminals.LBRACKET);
	}
"]"
	{
		return newToken(Terminals.RBRACKET);
	}
"->"
	{
		return newToken(Terminals.MAPSTO);
	}
List
	{
		return newToken(Terminals.LIST);
	}

int
	{
		return newToken(Terminals.TYPE_INT);
	}
string
	{
		return newToken(Terminals.TYPE_STRING);
	}

{Integer}
	{
		return newToken(Terminals.CONST_INT, Integer.parseInt(yytext()));
	}
{String}
	{
		return newToken(Terminals.CONST_STRING, yytext());
	}

{Identifier}
	{
		return newToken(Terminals.IDENT, yytext());
	}

[\s] {}

[^]
	{
		throw new Scanner.Exception("caractère inattendu '" + yytext() + "'");
	}