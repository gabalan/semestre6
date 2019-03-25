package abstractTree;

public class FloatExp extends AbstTree{

	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
	}
	public FloatExp(Double value) {
		super();
		super.value=value;

	}

	public String toString(){

		return ""+super.value;
	}
}
