package abstractTree;

public class BFct extends AbstTree {
	private String bfct;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		left.peval(environment);
		right.peval(environment);
		double value_left=left.getValue();
		double value_right=right.getValue();
		switch(this.bfct){
			case "min":
			super.value=Math.min(value_left,value_right);
			break;
			case "max":
			super.value=Math.max(value_left,value_right);
			break;
			case "pow" :
			super.value=(double)Math.pow(value_left,value_right);
			break;
			default:
			break;
		}

	}
public BFct(AbstTree left ,AbstTree right,String func) {
	super(left,right);
		this.bfct=func;
	}
	public String toString(){

		return this.bfct;
	}

}
