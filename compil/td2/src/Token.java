public class Token {  
    private Sym sym;
    private Object object;
    private int lin;
    private int col;

    public Token(Sym sym, Object value, int lin, int col) {
        this.sym = sym;
        this.object = value;
        this.lin = lin;
        this.col = col;
    }

    public String toString() {
        return "Sym :" + this.sym + "; Object :" + this.object + "; lin:" + this.lin + "; col:" + this.col;
    }
}
