import java.io.*;

import beaver.Scanner;
import beaver.Parser;

public class Main {
	public static void main(String[] args) throws Exception {
		for (String filename : args) {
			Scanner input = new ScannerExp(new FileReader(filename));
			Parser parser = new ParserExp();
			try {
				parser.parse(input);
				System.out.println("Le fichier " + filename + " est correct");
			}
			catch (Parser.Exception e) {
				System.err.println("Erreur de styntaxe: " + filename + ":" + e.getMessage());
			}
		}
	}
}
