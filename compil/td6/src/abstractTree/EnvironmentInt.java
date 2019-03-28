package abstractTree;

public interface EnvironmentInt {
	
	// Ajoute une variable à l'environement
	void putVariable(String var, Double value);

	// Retrouve une variable d'un environnement
	Double getVariableValue(String variable);
	

}
