/**
 * This class lists terminals used by the
 * grammar specified in "Parser.grammar".
 */
public class Terminals {
	static public final short EOF = 0;
	static public final short IDENT = 1;
	static public final short PLUS = 2;
	static public final short MINUS = 3;
	static public final short LPAR = 4;
	static public final short SEMICOLON = 5;
	static public final short CONST_INT = 6;
	static public final short TYPE_INT = 7;
	static public final short ASSIGN = 8;
	static public final short RPAR = 9;
	static public final short STAR = 10;

	static public final String[] NAMES = {
		"EOF",
		"IDENT",
		"PLUS",
		"MINUS",
		"LPAR",
		"SEMICOLON",
		"CONST_INT",
		"TYPE_INT",
		"ASSIGN",
		"RPAR",
		"STAR"
	};
}
