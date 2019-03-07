import beaver.*;
import java.util.ArrayList;

/**
 * This class is a LALR parser generated by
 * <a href="http://beaver.sourceforge.net">Beaver</a> v0.9.6.1
 * from the grammar specification "ParserAb.grammar".
 */
public class ParserAb extends Parser {

	static final ParsingTables PARSING_TABLES = new ParsingTables(
		"U9nTZbaEX30CGqte0XNpmOtdsgp62Oo4fj9Jx3Ij0s16mWZZGg9m3H9w55If362Gp#wbErZ" +
		"WdIxcJEzwtRGluXIH7ZqzjOcFwnyaTvNyxddIdsztuI7sK1lFoAXABu5f4ujDalzm0Q3T7i" +
		"i=");

	private final Action[] actions;

	public ParserAb() {
		super(PARSING_TABLES);
		actions = new Action[] {
			Action.RETURN,	// [0] $goal = S
			new Action() {	// [1] S = LINE
				public Symbol reduce(Symbol[] _symbols, int offset) {
					ArrayList lst = new ArrayList(); lst.add(_symbols[offset + 1]); return new Symbol(lst);
				}
			},
			new Action() {	// [2] S = S LINE
				public Symbol reduce(Symbol[] _symbols, int offset) {
					((ArrayList) _symbols[offset + 1].value).add(_symbols[offset + 2]); return _symbols[offset + 1];
				}
			},
			new Action() {	// [3] LINE = X NEWLINE
				public Symbol reduce(Symbol[] _symbols, int offset) {
					 return new Symbol(0);
				}
			},
			new Action() {	// [4] X = A X B
				public Symbol reduce(Symbol[] _symbols, int offset) {
					return new Symbol(1);
				}
			},
			Action.NONE	// [5] X = 
		};
	}

	protected Symbol invokeReduceAction(int rule_num, int offset) {
		return actions[rule_num].reduce(_symbols, offset);
	}
}
