var X1 : integer,
var X2 : integer

defun foo(X : integer): integer
  if X = 0
     then foo := 1
  else if 0 < X
       then foo := X * foo (X - 1)
       else foo := 0

X1 := 5;
X2 := foo(X1)

/* maintenant les quadruplets 
ET0       :Afc    5                   X1        
ET1       :Param  X         X1                  
ET2       :Paramc var#8     0                   
ET3       :Paramc var#7     0                   
ET4       :Paramc var#6     0                   
ET5       :Paramc var#5     0                   
ET6       :Paramc var#4     0                   
ET7       :Paramc var#2     0                   
ET8       :Paramc var#1     0                   
ET9       :Call   foo       8                   
ET10      :Af     X2        foo#      
ET11      :St                         
foo       :Sk                                   
ET12      :Afc    0                   foo#      
ET13      :Afc    0                   var#6     
ET14      :Eq     X         var#6     var#5     
ET35      :Jz     var#5               ET16      
ET15      :Afc    1                   foo#      
ET36      :Jp                         ET32      
ET16      :Afc    0                   var#7     
ET17      :Lt     var#7     X         var#4     
ET33      :Jz     var#4               ET31      
ET18      :Afc    1                   var#8     
ET19      :Mo     X         var#8     var#1     
ET20      :Param  X         var#1               
ET21      :Paramc var#8     0                   
ET22      :Paramc var#7     0                   
ET23      :Paramc var#6     0                   
ET24      :Paramc var#5     0                   
ET25      :Paramc var#4     0                   
ET26      :Paramc var#2     0                   
ET27      :Paramc var#1     0                   
ET28      :Call   foo       8                   
ET29      :Af     var#2     foo#      
ET30      :Mu     X         var#2     foo#      
ET34      :Jp                         ET32      
ET31      :Afc    0                   foo#      
ET32      :Sk                         
ET37      :Ret
*/

/* envirnts d'arrivee 
variable foo# DIM:0,TAILLE:0,TYPEF:313valeur 120 
variable ptasl# DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable padrl# DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable TAS# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable TAL# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable ADR# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable X1 DIM:0,TAILLE:0,TYPEF:313valeur 5 
variable X2 DIM:0,TAILLE:0,TYPEF:313valeur 120 
fin d'environnement
*/