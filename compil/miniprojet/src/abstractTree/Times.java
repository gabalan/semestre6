package abstractTree;

public class Times extends AbstTree{
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub
		//this.val=environment.getVariableValue("resultat");
		left.peval(environment);
		right.peval(environment);
		super.value=left.getValue()*right.getValue();
	}
public Times(AbstTree left ,AbstTree right) {

	super(left,right);
	//System.out.println("la valeur es "+e1.getValue());




	}

}
