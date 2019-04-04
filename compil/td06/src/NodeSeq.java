import java.util.ArrayList;

public class NodeSeq extends Node {
    public ArrayList<Node> list;

    public NodeSeq (Node l, Node r) {
	     this.type = null;
        if (l instanceof NodeSeq) {
	    this.list = new ArrayList<Node> (((NodeSeq) l).list);
	    if (! (r instanceof NodeNop))
		      this.list.add (r);
        }
        else {
	    this.list = new ArrayList<Node> ();
	    if (! (l instanceof NodeNop))
		this.list.add (l);
	    if (! (r instanceof NodeNop))
		this.list.add (r);
        }
    }

    public Code linearize (CodeList cl) {
	for (int i = 0; i < list.size (); i ++)
	    (list.get (i)).linearize (cl);
	return null;
    }

    public String toString () {
	String s = "";
	for (int i = 0; i < list.size (); i ++)
	    s = s + (list.get (i)).toString () + "\n";
	return s;
    }
}
