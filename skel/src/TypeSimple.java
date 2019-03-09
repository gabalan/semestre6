import skel.Type;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import beaver.Symbol;

public  class TypeSimple extends Symbol implements Type {
	private Tag tag;
	TypeSimple(Tag tag){
		this.tag=tag;
	}
	Tag getTypeSimple(){
		return this.tag;
	}

	public String toString() {
		return "voici un type : "+this.tag+" ";
	}
}
