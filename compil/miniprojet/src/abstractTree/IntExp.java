package abstractTree;

public class IntExp extends AbstTree{
	//	private double val;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {

	}
	public IntExp(int i) {
		super();
		super.value=	(double )i;
	}
	public String toString(){

		return ""+super.value;
	}
}
