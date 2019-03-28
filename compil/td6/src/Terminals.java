/**
 * This class lists terminals used by the
 * grammar specified in "ParserExpr.grammar".
 */
public class Terminals {
	static public final short EOF = 0;
	static public final short identificateur = 1;
	static public final short PLUS = 2;
	static public final short MINUS = 3;
	static public final short LPAR = 4;
	static public final short valeur_entiere = 5;
	static public final short SEMI = 6;
	static public final short INT = 7;
	static public final short EQ = 8;
	static public final short RPAR = 9;
	static public final short TIMES = 10;

	static public final String[] NAMES = {
		"EOF",
		"identificateur",
		"PLUS",
		"MINUS",
		"LPAR",
		"valeur_entiere",
		"SEMI",
		"INT",
		"EQ",
		"RPAR",
		"TIMES"
	};
}
