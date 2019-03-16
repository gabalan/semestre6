package abstractTree;

public class Aff extends AbstTree {
	String s;
	AbstTree t;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
	}
	public Aff(AbstTree t,String s) {
		//super(t);
		super();
		this.s=s;
		this.t=t;

	}
	public String toString(){

		return "Aff("+this.t+","+this.s+")";
	}
}
