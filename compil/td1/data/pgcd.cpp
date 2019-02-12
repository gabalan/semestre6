/////////////////////////////////////////////
// compilation: c++ -o pgcd pgcd.cc
// execution: ./pgcd
/////////////////////////////////////////////


#include <iostream>
using namespace std;

int main(int argn, char **argv){
int _ma55_c=50-10;
  int a;
  int b;
  std::cout << "Entrer a: ";
  std::cin >> a;
  std::cout << "Entrer b: ";
  std::cin >> b;

  while(true){
    if (b > a){
      b = b % a;
      if (b==0) break;
    }
    else{
      a = a % b;
      if (a == 0) break;
    }
  }
  std::cout << "pgcd: ";
  if (a == 0)
    std::cout << b << std::endl;
  else
    std::cout << a << std::endl;
}
