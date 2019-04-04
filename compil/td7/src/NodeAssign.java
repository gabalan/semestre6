public class NodeAssign extends Node {
    public Node lexpr;
    public Node rexpr;

    public NodeAssign (Node l, Node r) {
	this.type  = l.type;
	this.lexpr = l;
	this.rexpr = r;
    }

    public Code linearize (CodeList cl) {
	Code r = rexpr.linearize (cl);
	Code l = lexpr.linearize (cl);
	cl.add (new CodeAssign (l, r));
	return (l);
    }

    public String toString () {
	return (lexpr.toString () + " = " + rexpr.toString ());
    }
}
