package abstractTree;

public interface AbstTreeInt {
	
	// Cette fonction évalue l'arbre en affichant ce qu'il fait
	void eval(EnvironmentInt environment) throws Exception;
	
	// Cette fonction renvoie une valeur associée au noeud de l'arbre
	Double getValue();
	

}
