public class CodeConstInt extends Code {
    public int val;

    public CodeConstInt (int i) {
	this.val = i;
    }

    public String toString () {
	return (Integer.toString (val));
    }
}
