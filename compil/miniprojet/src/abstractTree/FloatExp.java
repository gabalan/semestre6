package abstractTree;

public class FloatExp extends AbstTree{
	public Double val;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub

	}
	public FloatExp(Double e1) {
		super();
		this.val=e1;
	}

	public String toString(){

		return " "+this.val;
	}
}
