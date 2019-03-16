package abstractTree;

public class Id extends AbstTree{
	private String id;
	@Override
	protected void peval(EnvironmentInt environment) throws Exception {
		// TODO Auto-generated method stub

	}
	public Id(String Id) {
		super();
		this.id=Id;
	}
public String toString(){
	return id;
}
}
