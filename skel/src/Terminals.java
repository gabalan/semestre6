/**
 * This class lists terminals used by the
 * grammar specified in "Parser.grammar".
 */
public class Terminals {
	static public final short EOF = 0;
	static public final short LPAR = 1;
	static public final short IDENT = 2;
	static public final short LBRACKET = 3;
	static public final short CONST_INT = 4;
	static public final short CONST_STRING = 5;
	static public final short LIST = 6;
	static public final short TYPE_INT = 7;
	static public final short TYPE_STRING = 8;
	static public final short RPAR = 9;
	static public final short PLUS = 10;
	static public final short MINUS = 11;
	static public final short COMMA = 12;
	static public final short COLON = 13;
	static public final short SEMICOLON = 14;
	static public final short MAPSTO = 15;
	static public final short RBRACKET = 16;

	static public final String[] NAMES = {
		"EOF",
		"LPAR",
		"IDENT",
		"LBRACKET",
		"CONST_INT",
		"CONST_STRING",
		"LIST",
		"TYPE_INT",
		"TYPE_STRING",
		"RPAR",
		"PLUS",
		"MINUS",
		"COMMA",
		"COLON",
		"SEMICOLON",
		"MAPSTO",
		"RBRACKET"
	};
}
