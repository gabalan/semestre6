import java.io.IOException;
import java.io.InputStreamReader;

import beaver.Scanner;
import beaver.Symbol;

public class ScannerAb extends Scanner {

	private InputStreamReader reader;

	@Override
	public Symbol nextToken() throws IOException, Exception {
		for (;;) {
			switch (reader.read()) {
			case 'a':
			System.out.println("a");
				return new Symbol(Terminals.A);
			case 'b':
			System.out.println("b");
				return new Symbol(Terminals.B);
			case '\n':
			System.out.println("fin  de ligne");
				return new Symbol(Terminals.NEWLINE);
			case -1:
			System.out.println("fin du fichier");
				return new Symbol(Terminals.EOF);
			default:
				break;
			}
		}
	}

	public ScannerAb(InputStreamReader reader) {
		super();
		this.reader = reader;
	}

}
