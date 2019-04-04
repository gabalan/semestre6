public class NodeOp extends Node {
    public String op;
    public Node lexpr;
    public Node rexpr;

    public NodeOp (String op, Node l, Node r) {
	this.type  = r.type;
        this.op    = op;
	this.lexpr = l;
	this.rexpr = r;
    }

    public NodeOp (String op, Node r) {
	this.type  = r.type;
        this.op    = op;
	this.lexpr = null;
	this.rexpr = r;
    }

    public Code linearize (CodeList cl) {
	Code d = cl.newCodeIdent ();
	Code r = rexpr.linearize (cl);
	if (lexpr != null) {
	    Code l = lexpr.linearize (cl);
	    cl.add (new CodeAssignOpBinary (d, op, l, r));
	}
	else
	    cl.add (new CodeAssignOpUnary (d, op, r));
	return (d);
    }

    public String toString () {
	if (lexpr == null)
	    return ("(" + op + " " + rexpr.toString () + ")");
	else
	    return ("(" + lexpr.toString () + " " + op + " " + rexpr.toString () + ")");
    }
}
