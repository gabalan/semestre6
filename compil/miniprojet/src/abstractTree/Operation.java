package abstractTree;

public class Operation extends AbstTree{
	private String operation;//le type d'operation à effectuer (+,-,/,*)
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
		left.peval(environment);
		right.peval(environment);
		apply_operation(left.getValue(),right.getValue());
	}
//Constructeur
public Operation(AbstTree left ,AbstTree right,String operation) {
	super(left,right);
	this.operation =operation;
	}
	public String toString(){
		return this.operation+"("+left +","+right+")";
	}
		//effectue le calcul associé à cette classe
	public void apply_operation(double left_value,double right_value){
		switch(this.operation){
		case "PLUS":
			super.value= left_value+right_value;
			break;
		case "MINUS" :
			super.value= left_value-right_value;
			break;
		case "DIV" :
			super.value=left_value / right_value;
			break;
		default:
			super.value= left_value * right_value;
			break;
		}

	}
}
