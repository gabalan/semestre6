package abstractTree;

public class BFct extends AbstTree {
	private String bfct;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub

	}
public BFct(AbstTree e1 ,AbstTree e2,String f) {
	super(e1,e2);

		this.bfct=f;
	}
	public String toString(){

		return this.bfct;
	}

}
