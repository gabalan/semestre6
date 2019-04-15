import java.util.HashMap;
import beaver.*;
import java.util.ArrayList;

/**
 * This class is a LALR parser generated by
 * <a href="http://beaver.sourceforge.net">Beaver</a> v0.9.6.1
 * from the grammar specification "Parser.grammar".
 */
public class ParserExp extends Parser {

	static final ParsingTables PARSING_TABLES = new ParsingTables(
		"U9nraSbEmp0GXdydXBO9QKb8AL2wI8W39mwW8YGkt5WkY2VYVTdB6hRXj#jMGnLiVJEV7SS" +
		"QUG1SOe05BAA6EWAvHZXRRM05RNJGG7VcYV9CUQ5yLVcwyXXT4SHI8a9VIlb47yj8iUHYoy" +
		"Kr5tjeOfEMouUyovkyScs$PyXvLw5M1e6hsB3cgTULnygJVxoXtDu3neYpvcF22jEAQF#m5" +
		"hbf#D$m2cxiaP7tVPyFo2bfaJFI90av9oSay#Toql7UytdBvnsoRNqAnwxF5zCz4HcJKf#h" +
		"mjQfVAJysEVvEWuhxZYQMmydINx85$uCUI8lyiWu9W$atktVoQtSC3#JRsuKd8QT3eZXImL" +
		"yDUC1En#mzw7hVieymR0J8J5yrS1Z#sCSxLzJCrAn");

  public HashMap<String,Node> symtab = new HashMap<String,Node> ();

  public CodeList cl = new CodeList ();

  static class Events extends beaver.Parser.Events
  {
    public void syntaxError (Symbol token)
    {
      System.err.format ("Erreur de syntaxe en ligne %d, colonne %d. Token inattendu: %s\n",
        Symbol.getLine (token.getStart ()),
        Symbol.getColumn (token.getStart ()),
        Terminals.NAMES[token.getId ()]);
    }
  }

	private final Action[] actions;

	public ParserExp() {
		super(PARSING_TABLES);
		actions = new Action[] {
			new Action() {	// [0] programme = instructions.i
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_i = _symbols[offset + 1];
					final Node i = (Node) _symbol_i.value;
					
      i.linearize (cl);
      System.out.format ("Programme :\n%s\n", cl.toString ());
      return (i);
				}
			},
			new Action() {	// [1] instructions = instructions.i1 instruction.i2
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_i1 = _symbols[offset + 1];
					final Node i1 = (Node) _symbol_i1.value;
					final Symbol _symbol_i2 = _symbols[offset + 2];
					final Node i2 = (Node) _symbol_i2.value;
					 return new NodeSeq (i1, i2);
				}
			},
			Action.RETURN,	// [2] instructions = instruction
			new Action() {	// [3] instruction = instruction_simple.i SEMICOLON
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_i = _symbols[offset + 1];
					final Node i = (Node) _symbol_i.value;
					 return i;
				}
			},
			Action.RETURN,	// [4] instruction_simple = declaration
			Action.RETURN,	// [5] instruction_simple = affectation
			new Action() {	// [6] instruction_simple = 
				public Symbol reduce(Symbol[] _symbols, int offset) {
					 return new NodeNop ();
				}
			},
			new Action() {	// [7] declaration = type_simple.t IDENT.i
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_t = _symbols[offset + 1];
					final Type t = (Type) _symbol_t.value;
					final Symbol _symbol_i = _symbols[offset + 2];
					final String i = (String) _symbol_i.value;
					
      Node n = symtab.get (i);
      if (n != null)
        System.err.format ("Identifiant %s red�fini\n", i);
      else {
        n = new NodeIdent (i, t);
        symtab.put (i, n);
      }
      return new NodeNop ();
				}
			},
			new Action() {	// [8] affectation = IDENT.l ASSIGN expression.r
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_l = _symbols[offset + 1];
					final String l = (String) _symbol_l.value;
					final Symbol _symbol_r = _symbols[offset + 3];
					final Node r = (Node) _symbol_r.value;
					
      Node n = symtab.get (l);
      if (n == null) {
        System.err.format ("Identifiant %s inconnu\n", l);
        return new NodeNop ();
      }
      return new NodeAssign (n, r);
				}
			},
			new Action() {	// [9] type_simple = TYPE_INT
				public Symbol reduce(Symbol[] _symbols, int offset) {
					 return new TypeInt ();
				}
			},
			new Action() {	// [10] expression = terme.t PLUS expression.e
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_t = _symbols[offset + 1];
					final Node t = (Node) _symbol_t.value;
					final Symbol _symbol_e = _symbols[offset + 3];
					final Node e = (Node) _symbol_e.value;
					 return new NodeOp ("+", t, e);
				}
			},
			new Action() {	// [11] expression = terme.t MINUS expression.e
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_t = _symbols[offset + 1];
					final Node t = (Node) _symbol_t.value;
					final Symbol _symbol_e = _symbols[offset + 3];
					final Node e = (Node) _symbol_e.value;
					 return new NodeOp ("-", t, e);
				}
			},
			Action.RETURN,	// [12] expression = terme
			new Action() {	// [13] terme = facteur.f STAR terme.t
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_f = _symbols[offset + 1];
					final Node f = (Node) _symbol_f.value;
					final Symbol _symbol_t = _symbols[offset + 3];
					final Node t = (Node) _symbol_t.value;
					 return new NodeOp ("*", f, t);
				}
			},
			Action.RETURN,	// [14] terme = facteur
			new Action() {	// [15] facteur = PLUS facteur.f
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_f = _symbols[offset + 2];
					final Node f = (Node) _symbol_f.value;
					 return f;
				}
			},
			new Action() {	// [16] facteur = MINUS facteur.f
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_f = _symbols[offset + 2];
					final Node f = (Node) _symbol_f.value;
					 return new NodeOp ("-", f);
				}
			},
			new Action() {	// [17] facteur = LPAR expression.e RPAR
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_e = _symbols[offset + 2];
					final Node e = (Node) _symbol_e.value;
					 return e;
				}
			},
			new Action() {	// [18] facteur = IDENT.s
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_s = _symbols[offset + 1];
					final String s = (String) _symbol_s.value;
					
      Node n = symtab.get (s);
      if (n == null)
        System.err.format ("Identifiant %s inconnu\n", s);
      return n;
				}
			},
			new Action() {	// [19] facteur = CONST_INT.v
				public Symbol reduce(Symbol[] _symbols, int offset) {
					final Symbol _symbol_v = _symbols[offset + 1];
					final int v = (int) _symbol_v.value;
					 return new NodeConstInt (v);
				}
			}
		};


  report = new Events ();
	}

	protected Symbol invokeReduceAction(int rule_num, int offset) {
		return actions[rule_num].reduce(_symbols, offset);
	}
}