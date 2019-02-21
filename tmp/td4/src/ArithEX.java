import java.io.*;

import beaver.Scanner;
import beaver.Symbol;
import beaver.Parser;

public class ArithEX   extends Symbol{
  public double arithValue;
  private boolean logicValue;

  public ArithEX(double d){
    super();
    this.arithValue=d;
  }
  public ArithEX(boolean d){
    super();
    this.logicValue=d;
  }
  public double getArithEX(){
    return this.arithValue;
  }
  public boolean getLogicVa(){
    return this.logicValue;
  }
}
