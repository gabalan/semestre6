public class CodeAssignOpBinary extends Code {
    public String op;
    public Code   dst;
    public Code   srcl;
    public Code   srcr;

    public CodeAssignOpBinary (Code d, String op, Code l, Code r) {
	super ();
	this.op   = op;
	this.dst  = d;
	this.srcl = l;
	this.srcr = r;
    }

    public String toString () {
	return (dst.toString () + " = " + srcl.toString () + " " + op + " " + srcr.toString ());
    }
}
