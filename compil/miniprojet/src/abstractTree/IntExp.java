package abstractTree;

public class IntExp extends AbstTree{
		private int val;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub

	}
	public IntExp(int i) {
		super();
		this.val=i;
		System.out.println(this.val);
	}
	public String toString(){

		return " "+this.val;
	}
}
