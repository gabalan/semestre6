package abstractTree;
public class Aff extends AbstTree {
	String s;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		//left.peval(environment);
		right.peval(environment);
		environment.putVariable(s, right.getValue()) ;
		super.value=right.getValue();
	}
	public Aff(AbstTree right,String s) {
		super(new Id(s),right);
		this.s=s;
	}
}
