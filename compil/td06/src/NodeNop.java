public class NodeNop extends Node {
    public NodeNop () {
	this.type = null;
    }

    public Code linearize (CodeList cl) {
	cl.add (new CodeNop ());
	return null;
    }

    public String toString () {
	return ("");
    }
}
