package abstractTree;

public class UFct extends AbstTree{
	private String f;
	AbstTree e1;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub

	}
public UFct(AbstTree e1 ,String f) {
		super(e1);
		this.f=f;
		this.e1=e1;

	}
	public String toString(){

		return this.f+"("+this.e1.getValue()+")";
	}

}
