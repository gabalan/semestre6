import java.util.ArrayList;

public class CodeList {
    private ArrayList<Code> list;
    private int idnum;

    public CodeList () {
	this.list = new ArrayList<Code> ();
	this.idnum = 0;
    }

    public void add (Code c) {
	list.add (c);
    }

    public int getSize () {
	return (list.size ());
    }

    public CodeIdent newCodeIdent () {
	CodeIdent i = new CodeIdent ("#t" + Integer.toString (idnum));
	idnum += 1;
	return i;
    }

    public boolean equalsTo (Code n) {
	return false;
    }

    public String toString () {
	String s = "";
	for (int i = 0; i < list.size (); i ++)
	    s = s + (list.get (i)).toString () + "\n";
	return (s);
    }
}
