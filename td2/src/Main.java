import java.io.FileReader;

public class Main {
    
    public static void main(String argv[]) {
	if (argv.length == 0) {
	    System.out.println("Usage : java Tokenizer <inputfile(s)>");
	}
	else {
	    int firstFilePos = 0;
	    String encodingName = "UTF-8";
	    for (int i = firstFilePos; i < argv.length; i++) {
		Tokenizer tokenizer = null;
		try {
		    java.io.FileInputStream stream =
			new java.io.FileInputStream(argv[i]);
		    java.io.Reader reader =
			new java.io.InputStreamReader(stream,
						      encodingName);
		    tokenizer = new Tokenizer(reader);
		    Token token;
		    do {
			token = tokenizer.yylex();
			if (token != null)
			    System.out.println (token.toString());
		    }
		    while (token != null);
		}
		catch (java.io.FileNotFoundException e) {
		    System.out.println("File not found : \""
				       +argv[i]+"\"");
		}
		catch (java.io.IOException e) {
		    System.out.println("IO error scanning file \""
				       +argv[i]+"\"");
		    System.out.println(e);
		}
		catch (Exception e) {
		    System.out.println("Unexpected exception:");
		    e.printStackTrace();
		}
	    }
	}
    }

}
