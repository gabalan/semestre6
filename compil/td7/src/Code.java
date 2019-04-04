public abstract class Code {
    String label;

    public Code () {
	this.label = null;
    }

    public boolean equalsTo (Code n) {
	return false;
    }

    abstract public String toString ();
}
