package abstractTree;

public class Aff extends AbstTree {
	String s;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
	}
	public Aff(AbstTree t,String s) {
		super(t);
		this.s=s;

	}
/*	public String toString(){

		return this.s;
	}*/
}
