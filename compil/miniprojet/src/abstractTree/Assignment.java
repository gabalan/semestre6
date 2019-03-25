package abstractTree;
public class Assignment extends AbstTree {
	String s;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		left.peval(environment);
		right.peval(environment);
		environment.putVariable(s, left.getValue()) ;
		apply_operation(left.getValue());
	}
	public Assignment(AbstTree left,String s) {
		super(left,new Id(s));
		this.s=s;
	}
	public void apply_operation(double value){
		super.value=value;
	}
}
