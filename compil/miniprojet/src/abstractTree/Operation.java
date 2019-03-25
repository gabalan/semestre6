package abstractTree;

public class Operation extends AbstTree{
	private String operation;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
		//this.val=environment.getVariableValue("resultat");
		left.peval(environment);
		right.peval(environment);
		super.value=this.apply_operation(left.getValue(),right.getValue());
	}
public Operation(AbstTree left ,AbstTree right,String operation) {
	super(left,right);
	this.operation =operation;
	}
	public String toString(){
		return this.operation+"("+left +","+right+")";
	}
	public double apply_operation(double value1,double value2){
		switch(this.operation){
		case "PLUS":
			return value1+value2;
		case "MINUS" :
			return value1-value2;
		case "DIV" :
			return value1 / value2;
		default:
			return value1 * value2;
		}
	}
}
