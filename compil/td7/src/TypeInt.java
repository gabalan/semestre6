public class TypeInt extends Type {
    public TypeInt () {}

    public boolean equalsTo (Type t) {
	return (t instanceof TypeInt);
    }

    public String toString () {
	return "int";
    }
}
