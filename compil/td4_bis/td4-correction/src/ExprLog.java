
public class ExprLog extends Expr {

	private Boolean value;

	public ExprLog(Boolean value) {
		super();
		this.value = value;
	}

	@Override
	public Boolean getValue() {
		return value;
	}

	@Override
	public String toString() {
		return value.toString();
	}

}
