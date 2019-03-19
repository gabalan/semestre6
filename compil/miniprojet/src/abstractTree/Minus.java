package abstractTree;

public class Minus extends AbstTree{

	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
		left.peval(environment);
		right.peval(environment);
		super.value=left.getValue()-right.getValue();
	}
	public Minus(AbstTree left ,AbstTree right) {
		super(left,right);
	//	System.out.println("la valeur est de la fonction Minus "+super.value);
	}
public Minus(AbstTree left) {
		super(left);
		super.value=left.getValue();
	}


}
