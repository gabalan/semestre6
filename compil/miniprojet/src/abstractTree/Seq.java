package abstractTree;

public class Seq extends AbstTree{

	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
		left.peval(environment);
		right.peval(environment);
		super.value=right.value;
	}
	public Seq(AbstTree left,AbstTree right){
		super(left,right);
	}

}
