import java.io.*;
import java.util.ArrayList;
import java.util.List;

import beaver.Scanner;
import beaver.Symbol;
import beaver.Parser;

public class TypeComplexe   extends Symbol implements Type{
	private List <Type> childs;

	@Override
	public boolean CompareTo() {
		// TODO Auto-generated method stub
		return false;
	}
	public TypeComplexe() {
		this.childs=new ArrayList<Type>();}
	public TypeComplexe(Type list) {
		this();
		this.childs.add(list);}
	
	public Type getLeft() {
		return childs.get(0);
		
	}
	
	public Type getRight () {
		return childs.get(1);
	}
	public Type getN (int n) {
		return childs.get(n);
	}
	
}
