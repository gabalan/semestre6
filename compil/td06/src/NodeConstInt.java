public class NodeConstInt extends Node {
    public int val;

    public NodeConstInt (int i) {
	this.type = new TypeInt ();
	this.val  = i;
    }

    public Code linearize (CodeList cl) {
	return (new CodeConstInt (val));
    }

    public String toString () {
	return (Integer.toString (val));
    }
}
