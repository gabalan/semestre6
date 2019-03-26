/* phi(0) := 01, phi(1) := 10 : morphisme de Thue-Morse */
/* calcule le mot TM(n) := phi^n(0) */
var n: integer,
var p : integer,
var i: integer,
var L: integer,
var W: array of integer,
var nW: array of integer,
var f0:integer,
var f1:integer,
var f2:integer,
var f3:integer,
var f4:integer,
var f5:integer,
var f6:integer,
var f7:integer

n:= 3;
/* W := 0 */
p := 0; L := 1;
W := new array of integer[L]; 
W[0] := 0;
while (p < n ) do    /* W := phi(W) */
      {nW := new array of integer[2*L];
       i  := 0;
       while i < L do
       	     {if W[i] = 0
	     	 then {nW[2*i]    := 0;
		       nW[2*i +1] := 1
		       }
		 else {nW[2*i]    := 1;
		       nW[2*i +1] := 0
		       };
	      i:= i+1
	     };
	W := nW;
	p := p+1;
	L := 2*L
	/* L = 2^p, W = phi^p(0) */ 
	};
/* ecriture de 	TM(3) */
f0:= W[0];
f1:= W[1];
f2:= W[2];
f3:= W[3];
f4:= W[4];
f5:= W[5];
f6:= W[6];
f7:= W[7]

/* interp par interp_mp.c */
0:1:1:0:1:0:0:1

/*  maintenant les quadruplets 
ET0       :Afc    3                   n         
ET1       :Afc    0                   p         
ET2       :Afc    1                   L         
ET3       :Af     W         padrl#    
ET4       :Afc    1                   var#71    
ET5       :Pl     padrl#    var#71    padrl#    
ET6       :AfInd  ADR#      W         ptasl#    
ET7       :AfInd  TAL#      W         L         
ET8       :Pl     ptasl#    L         ptasl#    
ET9       :Ind    ADR#      W         var#29    
ET10      :Afc    0                   var#72    
ET11      :Pl     var#29    var#72    var#30    
ET12      :Afc    0                   var#73    
ET13      :AfInd  TAS#      var#30    var#73    
ET14      :Lt     p         n         var#20    
ET74      :Jz     var#20              ET75      
ET15      :Afc    2                   var#74    
ET16      :Mu     var#74    L         var#2     
ET17      :Af     nW        padrl#    
ET18      :Afc    1                   var#75    
ET19      :Pl     padrl#    var#75    padrl#    
ET20      :AfInd  ADR#      nW        ptasl#    
ET21      :AfInd  TAL#      nW        var#2     
ET22      :Pl     ptasl#    var#2     ptasl#    
ET23      :Afc    0                   i         
ET24      :Lt     i         L         var#17    
ET65      :Jz     var#17              ET66      
ET25      :Ind    ADR#      W         var#32    
ET26      :Pl     var#32    i         var#33    
ET27      :Ind    TAS#      var#33    var#14    
ET28      :Afc    0                   var#76    
ET29      :Eq     var#14    var#76    var#15    
ET59      :Jz     var#15              ET44      
ET30      :Afc    2                   var#77    
ET31      :Mu     var#77    i         var#4     
ET32      :Ind    ADR#      nW        var#35    
ET33      :Pl     var#35    var#4     var#36    
ET34      :Afc    0                   var#78    
ET35      :AfInd  TAS#      var#36    var#78    
ET36      :Afc    2                   var#79    
ET37      :Mu     var#79    i         var#6     
ET38      :Afc    1                   var#80    
ET39      :Pl     var#6     var#80    var#7     
ET40      :Ind    ADR#      nW        var#38    
ET41      :Pl     var#38    var#7     var#39    
ET42      :Afc    1                   var#81    
ET43      :AfInd  TAS#      var#39    var#81    
ET60      :Jp                         ET58      
ET44      :Afc    2                   var#82    
ET45      :Mu     var#82    i         var#9     
ET46      :Ind    ADR#      nW        var#41    
ET47      :Pl     var#41    var#9     var#42    
ET48      :Afc    1                   var#83    
ET49      :AfInd  TAS#      var#42    var#83    
ET50      :Afc    2                   var#84    
ET51      :Mu     var#84    i         var#11    
ET52      :Afc    1                   var#85    
ET53      :Pl     var#11    var#85    var#12    
ET54      :Ind    ADR#      nW        var#44    
ET55      :Pl     var#44    var#12    var#45    
ET56      :Afc    0                   var#86    
ET57      :AfInd  TAS#      var#45    var#86    
ET58      :Sk                         
ET61      :Afc    1                   var#87    
ET62      :Pl     i         var#87    i         
ET63      :Lt     i         L         var#17    
ET64      :Jp                         ET65      
ET66      :Sk                         
ET67      :Af     W         nW        
ET68      :Afc    1                   var#88    
ET69      :Pl     p         var#88    p         
ET70      :Afc    2                   var#89    
ET71      :Mu     var#89    L         L         
ET72      :Lt     p         n         var#20    
ET73      :Jp                         ET74      
ET75      :Sk                         
ET76      :Ind    ADR#      W         var#47    
ET77      :Afc    0                   var#90    
ET78      :Pl     var#47    var#90    var#48    
ET79      :Ind    TAS#      var#48    f0        
ET80      :Ind    ADR#      W         var#50    
ET81      :Afc    1                   var#91    
ET82      :Pl     var#50    var#91    var#51    
ET83      :Ind    TAS#      var#51    f1        
ET84      :Ind    ADR#      W         var#53    
ET85      :Afc    2                   var#92    
ET86      :Pl     var#53    var#92    var#54    
ET87      :Ind    TAS#      var#54    f2        
ET88      :Ind    ADR#      W         var#56    
ET89      :Afc    3                   var#93    
ET90      :Pl     var#56    var#93    var#57    
ET91      :Ind    TAS#      var#57    f3        
ET92      :Ind    ADR#      W         var#59    
ET93      :Afc    4                   var#94    
ET94      :Pl     var#59    var#94    var#60    
ET95      :Ind    TAS#      var#60    f4        
ET96      :Ind    ADR#      W         var#62    
ET97      :Afc    5                   var#95    
ET98      :Pl     var#62    var#95    var#63    
ET99      :Ind    TAS#      var#63    f5        
ET100     :Ind    ADR#      W         var#65    
ET101     :Afc    6                   var#96    
ET102     :Pl     var#65    var#96    var#66    
ET103     :Ind    TAS#      var#66    f6        
ET104     :Ind    ADR#      W         var#68    
ET105     :Afc    7                   var#97    
ET106     :Pl     var#68    var#97    var#69    
ET107     :Ind    TAS#      var#69    f7        
ET108     :St      
*/
/*envirnts d'arrivee 
variable var#97 DIM:0,TAILLE:0,TYPEF:313valeur 7 
variable var#96 DIM:0,TAILLE:0,TYPEF:313valeur 6 
variable var#95 DIM:0,TAILLE:0,TYPEF:313valeur 5 
variable var#94 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable var#93 DIM:0,TAILLE:0,TYPEF:313valeur 3 
variable var#92 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#91 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#90 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#89 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#88 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#87 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#86 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#85 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#84 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#83 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#82 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#81 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#80 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#79 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#78 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#77 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#76 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#75 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#74 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#73 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#72 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#71 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#69 DIM:0,TAILLE:0,TYPEF:313valeur 15 
variable var#68 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#66 DIM:0,TAILLE:0,TYPEF:313valeur 14 
variable var#65 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#63 DIM:0,TAILLE:0,TYPEF:313valeur 13 
variable var#62 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#60 DIM:0,TAILLE:0,TYPEF:313valeur 12 
variable var#59 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#57 DIM:0,TAILLE:0,TYPEF:313valeur 11 
variable var#56 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#54 DIM:0,TAILLE:0,TYPEF:313valeur 10 
variable var#53 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#51 DIM:0,TAILLE:0,TYPEF:313valeur 9 
variable var#50 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#48 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#47 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#46 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#45 DIM:0,TAILLE:0,TYPEF:313valeur 13 
variable var#44 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#43 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#42 DIM:0,TAILLE:0,TYPEF:313valeur 12 
variable var#41 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#40 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#39 DIM:0,TAILLE:0,TYPEF:313valeur 15 
variable var#38 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#37 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#36 DIM:0,TAILLE:0,TYPEF:313valeur 14 
variable var#35 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#33 DIM:0,TAILLE:0,TYPEF:313valeur 7 
variable var#32 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable var#31 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#30 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#29 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable ptasl# DIM:0,TAILLE:0,TYPEF:313valeur 16 
variable padrl# DIM:0,TAILLE:0,TYPEF:313valeur 5 
variable TAS# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable TAL# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable ADR# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable var#20 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#17 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#15 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#14 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#13 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#12 DIM:0,TAILLE:0,TYPEF:313valeur 5 
variable var#11 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable var#10 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#9 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable var#8 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#7 DIM:0,TAILLE:0,TYPEF:313valeur 7 
variable var#6 DIM:0,TAILLE:0,TYPEF:313valeur 6 
variable var#5 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#4 DIM:0,TAILLE:0,TYPEF:313valeur 6 
variable var#2 DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable var#1 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable n DIM:0,TAILLE:0,TYPEF:313valeur 3 
variable p DIM:0,TAILLE:0,TYPEF:313valeur 3 
variable i DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable L DIM:0,TAILLE:0,TYPEF:313valeur 8 
variable W DIM:1,TAILLE:0,TYPEF:313valeur 4 
variable nW DIM:1,TAILLE:0,TYPEF:313valeur 4 
variable f0 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable f1 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable f2 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable f3 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable f4 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable f5 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable f6 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable f7 DIM:0,TAILLE:0,TYPEF:313valeur 1 
fin d'environnement
*/