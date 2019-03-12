package abstractTree;
import beaver.Symbol;

public abstract class AbstTree extends Symbol implements AbstTreeInt {

	protected AbstTree left;
	protected AbstTree right;
	protected Double value;

	// Constructeur pour un arbre binaire
	public AbstTree(AbstTree left, AbstTree right) {
		super();
		this.left = left;
		this.right = right;
	}

	// Constructeur pour un arbre unaire
	public AbstTree(AbstTree left) {
		super();
		this.left = left;
	}

	// Constructeur pour un terme simple
	public AbstTree() {
		super();
	}
	
	// Renvoie la valeur calculée pour ce noeud
	public Double getValue() {
		return value;
	}

	// Affichage parenthésé de l'arbre
	public String toString() {
		if (left != null)
			if (right != null)
				return this.getClass().getSimpleName() + "(" + left.toString() + "," + right.toString() + ")";
			else
				return this.getClass().getSimpleName() + "(" + left.toString() + ")";
		else
			return this.getClass().getSimpleName();
	}

	// Affichage de l'arbre et évaluation
	public void eval(EnvironmentInt environment) throws Exception {System.out.println("Eval:" + toString()); this.peval(environment);};
	
	// Méthode virtuelle pure que vous devez écrire dans les classes dérivées de celle-ci
	abstract protected void peval(EnvironmentInt environment) throws Exception;
}
