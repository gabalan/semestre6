package abstractTree;
import  java.lang.Math.*;
public class UFct extends AbstTree{
	private String func;//string representant la fonction(sin,cos,max,min,---)
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
		left.peval(environment);
		this.apply_operation(left.getValue());

	}
	public UFct(AbstTree left ,String func) {
		super(left);
		this.func=func;
	}
	public String toString(){
		return this.func+"("+super.left+")";
	}
	public void apply_operation(double value){
		switch(this.func){
			case "sin":
			super.value=Math.sin(value);
			break;
			case "cos":
			super.value=Math.cos(value);
			break;
			case "round" :
			super.value=(double)Math.round(value);
			break;
			case "tan" :
			super.value=Math.tan(value);
			break;
			case "abs":
			super.value=Math.abs(value);
			break;
			case "sqrt" :
			super.value=Math.sqrt(value);
			break;
			default:
			break;
		}

	}

}
