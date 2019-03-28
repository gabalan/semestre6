package abstractTree;

public class UMinus extends AbstTree{

	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
		left.peval(environment);
		apply_operation(-left.getValue());
	}
	public UMinus(AbstTree left) {
		super(left);
	}
	public void apply_operation(double value){
		super.value=value;

	}


}
