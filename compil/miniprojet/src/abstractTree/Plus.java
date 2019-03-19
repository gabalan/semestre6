package abstractTree;

public class Plus extends  AbstTree {

	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
		left.peval(environment);
		right.peval(environment);
		super.value=left.getValue()+right.getValue();
	}
	public Plus(AbstTree e1 ,AbstTree e2) {
		super(e1,e2);

	}

}
