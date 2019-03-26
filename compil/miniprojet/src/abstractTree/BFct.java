package abstractTree;

public class BFct extends AbstTree {
	private String bfct;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		left.peval(environment);
		right.peval(environment);
		double left_value=left.getValue();
		double right_value=right.getValue();
		apply_operation(left_value,right_value);
	}
	public BFct(AbstTree left ,AbstTree right,String func) {
		super(left,right);
		this.bfct=func;
	}
	public String toString(){
		return this.bfct+"("+super.left+","+super.right+")";
	}
		//effectue le calcul associé à cette classe
	public void apply_operation(double left_value,double right_value){
		switch(this.bfct){
			case "min":
			super.value=Math.min(left_value,right_value);
			break;
			case "max":
			super.value=Math.max(left_value,right_value);
			break;
			case "pow" :
			super.value=(double)Math.pow(left_value,right_value);
			break;
			default:
			break;
		}
	}

}
