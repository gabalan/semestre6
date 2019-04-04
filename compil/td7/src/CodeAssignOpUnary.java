public class CodeAssignOpUnary extends Code {
    public String op;
    public Code   dst;
    public Code   src;

    public CodeAssignOpUnary (Code d, String op, Code s) {
	super ();
	this.op  = op;
	this.dst = d;
	this.src = s;
    }

    public String toString () {
	return (dst.toString () + " = " + op + " " + src.toString ());
    }
}
