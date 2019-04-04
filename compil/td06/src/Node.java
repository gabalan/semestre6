public abstract class Node extends beaver.Symbol {
    public Type type;

    public boolean equalsTo (Node n) {
	return false;
    }

    abstract public Code linearize (CodeList cl);

    abstract public String toString ();
}
