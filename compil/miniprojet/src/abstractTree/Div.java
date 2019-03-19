package abstractTree;
public class Div extends AbstTree{
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
			left.peval(environment);
			right.peval(environment);
			super.value=left.getValue()/right.getValue();
	}
public Div(AbstTree left ,AbstTree right){
	super(left,right);
	}
}
