package abstractTree;
import beaver.Symbol;

public abstract class AbstTree extends Symbol implements AbstTreeInt {

	protected AbstTree left;
	protected AbstTree right;
	protected Double value;

	public AbstTree(AbstTree left, AbstTree right) {
		super();
		this.left = left;
		this.right = right;
	}

	public AbstTree(AbstTree left) {
		super();
		this.left = left;
	}

	public AbstTree() {
		super();
	}

	public Double getValue() {
		return value;
	}

	public String toString() {
		if (left != null)
			if (right != null)
				return this.getClass().getSimpleName() + "(" + left.toString() + "," + right.toString() + ")";
			else
				return this.getClass().getSimpleName() + "(" + left.toString() + ")";
		else
			return this.getClass().getSimpleName();
	}

	public void eval(EnvironmentInt environment) throws Exception {System.out.println("Eval:" + toString()); this.peval(environment);};
	
	abstract protected void peval(EnvironmentInt environment) throws Exception;
}
