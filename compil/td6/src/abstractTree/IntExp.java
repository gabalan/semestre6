package abstractTree;

public class IntExp extends AbstTree{
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {

	}
	public IntExp(int i) {
		super();
		super.value=	(double )i;//caster d'abord la variable i en double(car super.value est de type double)
	}
	public String toString(){

		return ""+super.value;
	}
}
