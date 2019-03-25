package abstractTree;
import java.util.HashMap;
import java.util.Map;

public class Environment implements EnvironmentInt {

	private Map<String, Double> hashtable;

		public Environment() {
			this.hashtable = new HashMap<String, Double>();
		}

		@Override
		public void putVariable(String id, Double value) {
			hashtable.put(id, value);
		//	System.out.println("Enregistre " + variable + " " + value);
		}

		@Override
		public Double getVariableValue(String id) {
			//System.out.println("Retrouve " + variable + " " + table.get(variable));
			return hashtable.get(id);
		}


}
