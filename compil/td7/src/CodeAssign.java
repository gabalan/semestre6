public class CodeAssign extends Code {
    Code dst;
    Code src;

    public CodeAssign (Code d, Code s) {
	super ();
	this.dst = d;
	this.src = s;
    }

    public String toString () {
	return (dst.toString () + " = " + src.toString ());
    }
}
