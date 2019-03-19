
import java.io.*;

public class Main {
	public static void main(String[] args) throws Exception {
		ScannerExpr input = new ScannerExpr(new FileReader(args[0]));
		ParserExpr parser = new ParserExpr();
		Expr expr = (Expr) parser.parse(input);
		System.out.println(expr.toString());
	}
}
