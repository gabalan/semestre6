
public class ExprArithm extends Expr {
	
	private Double value;

	public ExprArithm(Double value) {
		super();
		this.value = value;
	}

	@Override
	public Double getValue() {
		return value;
	}

	@Override
	public String toString() {
		return value.toString();
	}

}
