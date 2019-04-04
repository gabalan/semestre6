public class NodeIdent extends Node {
    public String name;

    public NodeIdent (String s, Type t) {
	this.type = t;
	this.name = s;
    }

    public Code linearize (CodeList cl) {
	return (new CodeIdent (name));
    }

    public String toString () {
	return (name);
    }
}
