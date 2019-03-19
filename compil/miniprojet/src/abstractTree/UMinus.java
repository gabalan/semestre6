package abstractTree;

public class UMinus extends AbstTree{

	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
		left.peval(environment);
	//	super.value=left.getValue();
	}
public UMinus(AbstTree left) {
		super(left);
		super.value=-left.getValue();
	}


}
