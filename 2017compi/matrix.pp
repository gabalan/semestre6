var d: integer,
var M1: array of array of integer,
var P: array of array of integer,
var S1: integer,
var Sd-1: integer,
var Sd : integer


/* initialise la matrice A a 0 (matrice d x d) */
defpro mat0(A: array of array of integer, d: integer)
       var i : integer, var j : integer
       i:=0;
       while i < d do
       	 {A[i]:= new array of integer[d];
	 i := i + 1
	 }

/* retourne le produit de A par B (matrices d x d) */
defun prod(A: array of array of integer, B : array of array of integer, d: integer):
      	      array of array of integer
      var M: array of array of integer,
      var i : integer, var j : integer, var k : integer

      M := new array of array of integer[d];
      i:=0;
      while i < d do
      	 {M[i]:= new array of integer[d];
	  j:=0;
	  while j < d do
	  	{/* calcul de M[i][j] */
	    	  k:=0; M[i][j]:=0;
		  while k < d do
		  	{M[i][j] := M[i][j] + A[i][k]*B[k][j];
			k := k+1
			};
		  j :=j + 1
		};
	  i := i+1
	  };
      prod := M
      
/* retourne la puissance e  de A (matrice d x d) */
defun pui(A: array of array of integer, e: integer, d: integer):
      	      array of array of integer
      var M: array of array of integer,
      var i : integer, var j : integer

      M := new array of array of integer[d];
      mat0(M,d);
      /* M= copy(A) */
      while i < d do
      	 {j:=0;
	  while j < d do
	  	{M[i][j]:=A[i][j];
		  j :=j + 1
		};
	  i := i+1
	  };
       i:=0;
       while i < (e - 1) do
       	     {M := prod(M,A,d);
	      i := i + 1
	     };
       pui := M
       
/* retourne une matrice d x d, nilpotente d'ordre d, avec coefficients 0 ou coef */
defun nilp(coef: integer, d: integer):
      	      array of array of integer
      var M: array of array of integer,
      var i : integer 
      M := new array of array of integer[d];
      mat0(M,d);
      i := 0;
      while i < (d - 1) do
      	 {M[i+1][i] := coef;
	  i := i+1
	  };
      nilp := M

/* retourne la somme des coefficients de A */
defun sum(A: array of array of integer, d: integer):integer
      var i : integer, var j : integer
      sum := 0;
      i:=0;
      while i < d do
      	 {j:=0;
	  while j < d do
	     {sum := sum + A[i][j];
	      j :=j + 1
	      };
	  i:=i + 1
	  }
d := 10;
M1 := nilp(2,d);
S1 := sum(M1,d);
P := pui(M1,d - 1,d);
Sd-1 := sum(P,d);
P := prod(P,M1,d);
Sd := sum(P,d)
/* Sd-1 <>0 , Sd==0: M1 est nilpotente d'ordre d i.e. M1^k=0 ssi k >= d */

/* maintenant les quadruplets 
ET0       :Afc    10                  d         
ET1       :Paramc coef      2                   
ET2       :Param  d         d                   
ET3       :Paramc var#135   0                   
ET4       :Paramc var#134   0                   
ET5       :Paramc var#133   0                   
ET6       :Paramc var#132   0                   
ET7       :Paramc var#112   0                   
ET8       :Paramc var#111   0                   
ET9       :Paramc var#110   0                   
ET10      :Paramc var#108   0                   
ET11      :Paramc var#107   0                   
ET12      :Paramc var#51    0                   
ET13      :Paramc var#50    0                   
ET14      :Paramc var#48    0                   
ET15      :Paramc var#47    0                   
ET16      :Paramc var#46    0                   
ET17      :Paramc nilp      0                   
ET18      :Paramc M         0                   
ET19      :Paramc i         0                   
ET20      :Call   nilp      19                  
ET21      :Af     M1        nilp#     
ET22      :Param  A         M1                  
ET23      :Param  d         d                   
ET24      :Paramc var#137   0                   
ET25      :Paramc var#136   0                   
ET26      :Paramc var#117   0                   
ET27      :Paramc var#116   0                   
ET28      :Paramc var#114   0                   
ET29      :Paramc var#113   0                   
ET30      :Paramc var#58    0                   
ET31      :Paramc var#56    0                   
ET32      :Paramc var#53    0                   
ET33      :Paramc var#52    0                   
ET34      :Paramc sum       0                   
ET35      :Paramc i         0                   
ET36      :Paramc j         0                   
ET37      :Call   sum       15                  
ET38      :Af     S1        sum#      
ET39      :Afc    1                   var#138   
ET40      :Mo     d         var#138   var#2     
ET41      :Param  A         M1                  
ET42      :Param  e         var#2               
ET43      :Param  d         d                   
ET44      :Paramc var#131   0                   
ET45      :Paramc var#130   0                   
ET46      :Paramc var#129   0                   
ET47      :Paramc var#128   0                   
ET48      :Paramc var#127   0                   
ET49      :Paramc var#106   0                   
ET50      :Paramc var#105   0                   
ET51      :Paramc var#104   0                   
ET52      :Paramc var#102   0                   
ET53      :Paramc var#101   0                   
ET54      :Paramc var#99    0                   
ET55      :Paramc var#98    0                   
ET56      :Paramc var#96    0                   
ET57      :Paramc var#95    0                   
ET58      :Paramc var#44    0                   
ET59      :Paramc var#43    0                   
ET60      :Paramc var#40    0                   
ET61      :Paramc var#38    0                   
ET62      :Paramc var#36    0                   
ET63      :Paramc var#35    0                   
ET64      :Paramc var#34    0                   
ET65      :Paramc var#33    0                   
ET66      :Paramc pui       0                   
ET67      :Paramc M         0                   
ET68      :Paramc i         0                   
ET69      :Paramc j         0                   
ET70      :Call   pui       29                  
ET71      :Af     P         pui#      
ET72      :Param  A         P                   
ET73      :Param  d         d                   
ET74      :Paramc var#137   0                   
ET75      :Paramc var#136   0                   
ET76      :Paramc var#117   0                   
ET77      :Paramc var#116   0                   
ET78      :Paramc var#114   0                   
ET79      :Paramc var#113   0                   
ET80      :Paramc var#58    0                   
ET81      :Paramc var#56    0                   
ET82      :Paramc var#53    0                   
ET83      :Paramc var#52    0                   
ET84      :Paramc sum       0                   
ET85      :Paramc i         0                   
ET86      :Paramc j         0                   
ET87      :Call   sum       15                  
ET88      :Af     Sd-1      sum#      
ET89      :Param  A         P                   
ET90      :Param  B         M1                  
ET91      :Param  d         d                   
ET92      :Paramc var#126   0                   
ET93      :Paramc var#125   0                   
ET94      :Paramc var#124   0                   
ET95      :Paramc var#123   0                   
ET96      :Paramc var#122   0                   
ET97      :Paramc var#121   0                   
ET98      :Paramc var#94    0                   
ET99      :Paramc var#93    0                   
ET100     :Paramc var#92    0                   
ET101     :Paramc var#90    0                   
ET102     :Paramc var#89    0                   
ET103     :Paramc var#87    0                   
ET104     :Paramc var#86    0                   
ET105     :Paramc var#84    0                   
ET106     :Paramc var#83    0                   
ET107     :Paramc var#81    0                   
ET108     :Paramc var#80    0                   
ET109     :Paramc var#78    0                   
ET110     :Paramc var#77    0                   
ET111     :Paramc var#75    0                   
ET112     :Paramc var#74    0                   
ET113     :Paramc var#72    0                   
ET114     :Paramc var#71    0                   
ET115     :Paramc var#70    0                   
ET116     :Paramc var#69    0                   
ET117     :Paramc var#68    0                   
ET118     :Paramc var#66    0                   
ET119     :Paramc var#65    0                   
ET120     :Paramc var#64    0                   
ET121     :Paramc var#63    0                   
ET122     :Paramc var#62    0                   
ET123     :Paramc var#31    0                   
ET124     :Paramc var#29    0                   
ET125     :Paramc var#27    0                   
ET126     :Paramc var#25    0                   
ET127     :Paramc var#24    0                   
ET128     :Paramc var#23    0                   
ET129     :Paramc var#22    0                   
ET130     :Paramc var#21    0                   
ET131     :Paramc var#20    0                   
ET132     :Paramc var#19    0                   
ET133     :Paramc var#18    0                   
ET134     :Paramc var#17    0                   
ET135     :Paramc var#16    0                   
ET136     :Paramc var#15    0                   
ET137     :Paramc var#14    0                   
ET138     :Paramc var#13    0                   
ET139     :Paramc var#12    0                   
ET140     :Paramc prod      0                   
ET141     :Paramc M         0                   
ET142     :Paramc i         0                   
ET143     :Paramc j         0                   
ET144     :Paramc k         0                   
ET145     :Call   prod      56                  
ET146     :Af     P         prod#     
ET147     :Param  A         P                   
ET148     :Param  d         d                   
ET149     :Paramc var#137   0                   
ET150     :Paramc var#136   0                   
ET151     :Paramc var#117   0                   
ET152     :Paramc var#116   0                   
ET153     :Paramc var#114   0                   
ET154     :Paramc var#113   0                   
ET155     :Paramc var#58    0                   
ET156     :Paramc var#56    0                   
ET157     :Paramc var#53    0                   
ET158     :Paramc var#52    0                   
ET159     :Paramc sum       0                   
ET160     :Paramc i         0                   
ET161     :Paramc j         0                   
ET162     :Call   sum       15                  
ET163     :Af     Sd        sum#      
ET164     :St                         
mat0      :Sk                                   
ET165     :Afc    0                   i         
ET166     :Lt     i         d         var#10    
ET180     :Jz     var#10              ET181     
ET167     :Af     var#8     padrl#    
ET168     :Afc    1                   var#119   
ET169     :Pl     padrl#    var#119   padrl#    
ET170     :AfInd  ADR#      var#8     ptasl#    
ET171     :AfInd  TAL#      var#8     d         
ET172     :Pl     ptasl#    d         ptasl#    
ET173     :Ind    ADR#      A         var#59    
ET174     :Pl     var#59    i         var#60    
ET175     :AfInd  TAS#      var#60    var#8     
ET176     :Afc    1                   var#120   
ET177     :Pl     i         var#120   i         
ET178     :Lt     i         d         var#10    
ET179     :Jp                         ET180     
ET181     :Sk                         
ET182     :Ret                                  
prod      :Sk                                   
ET183     :Af     M         padrl#    
ET184     :Afc    1                   var#121   
ET185     :Pl     padrl#    var#121   padrl#    
ET186     :AfInd  ADR#      M         ptasl#    
ET187     :AfInd  TAL#      M         d         
ET188     :Pl     ptasl#    d         ptasl#    
ET189     :Afc    0                   i         
ET190     :Lt     i         d         var#31    
ET253     :Jz     var#31              ET254     
ET191     :Af     var#13    padrl#    
ET192     :Afc    1                   var#122   
ET193     :Pl     padrl#    var#122   padrl#    
ET194     :AfInd  ADR#      var#13    ptasl#    
ET195     :AfInd  TAL#      var#13    d         
ET196     :Pl     ptasl#    d         ptasl#    
ET197     :Ind    ADR#      M         var#62    
ET198     :Pl     var#62    i         var#63    
ET199     :AfInd  TAS#      var#63    var#13    
ET200     :Afc    0                   j         
ET201     :Lt     j         d         var#29    
ET247     :Jz     var#29              ET248     
ET202     :Afc    0                   k         
ET203     :Ind    ADR#      M         var#65    
ET204     :Pl     var#65    i         var#66    
ET205     :Ind    TAS#      var#66    var#14    
ET206     :Ind    ADR#      var#14    var#68    
ET207     :Pl     var#68    j         var#69    
ET208     :Afc    0                   var#123   
ET209     :AfInd  TAS#      var#69    var#123   
ET210     :Lt     k         d         var#27    
ET241     :Jz     var#27              ET242     
ET211     :Ind    ADR#      M         var#71    
ET212     :Pl     var#71    i         var#72    
ET213     :Ind    TAS#      var#72    var#16    
ET214     :Ind    ADR#      M         var#74    
ET215     :Pl     var#74    i         var#75    
ET216     :Ind    TAS#      var#75    var#18    
ET217     :Ind    ADR#      A         var#77    
ET218     :Pl     var#77    i         var#78    
ET219     :Ind    TAS#      var#78    var#20    
ET220     :Ind    ADR#      B         var#80    
ET221     :Pl     var#80    k         var#81    
ET222     :Ind    TAS#      var#81    var#22    
ET223     :Ind    ADR#      var#20    var#83    
ET224     :Pl     var#83    k         var#84    
ET225     :Ind    TAS#      var#84    var#21    
ET226     :Ind    ADR#      var#22    var#86    
ET227     :Pl     var#86    j         var#87    
ET228     :Ind    TAS#      var#87    var#23    
ET229     :Ind    ADR#      var#18    var#89    
ET230     :Pl     var#89    j         var#90    
ET231     :Ind    TAS#      var#90    var#19    
ET232     :Mu     var#21    var#23    var#24    
ET233     :Pl     var#19    var#24    var#25    
ET234     :Ind    ADR#      var#16    var#92    
ET235     :Pl     var#92    j         var#93    
ET236     :AfInd  TAS#      var#93    var#25    
ET237     :Afc    1                   var#124   
ET238     :Pl     k         var#124   k         
ET239     :Lt     k         d         var#27    
ET240     :Jp                         ET241     
ET242     :Sk                         
ET243     :Afc    1                   var#125   
ET244     :Pl     j         var#125   j         
ET245     :Lt     j         d         var#29    
ET246     :Jp                         ET247     
ET248     :Sk                         
ET249     :Afc    1                   var#126   
ET250     :Pl     i         var#126   i         
ET251     :Lt     i         d         var#31    
ET252     :Jp                         ET253     
ET254     :Sk                         
ET255     :Af     prod      M         
ET256     :Af     prod#     prod      
ET257     :Ret                                  
pui       :Sk                                   
ET258     :Af     M         padrl#    
ET259     :Afc    1                   var#127   
ET260     :Pl     padrl#    var#127   padrl#    
ET261     :AfInd  ADR#      M         ptasl#    
ET262     :AfInd  TAL#      M         d         
ET263     :Pl     ptasl#    d         ptasl#    
ET264     :Param  A         M                   
ET265     :Param  d         d                   
ET266     :Paramc var#120   0                   
ET267     :Paramc var#119   0                   
ET268     :Paramc var#61    0                   
ET269     :Paramc var#60    0                   
ET270     :Paramc var#59    0                   
ET271     :Paramc var#10    0                   
ET272     :Paramc var#8     0                   
ET273     :Paramc var#7     0                   
ET274     :Paramc i         0                   
ET275     :Paramc j         0                   
ET276     :Call   mat0      12                  
ET277     :Lt     i         d         var#40    
ET302     :Jz     var#40              ET303     
ET278     :Afc    0                   j         
ET279     :Lt     j         d         var#38    
ET296     :Jz     var#38              ET297     
ET280     :Ind    ADR#      M         var#95    
ET281     :Pl     var#95    i         var#96    
ET282     :Ind    TAS#      var#96    var#33    
ET283     :Ind    ADR#      A         var#98    
ET284     :Pl     var#98    i         var#99    
ET285     :Ind    TAS#      var#99    var#35    
ET286     :Ind    ADR#      var#35    var#101   
ET287     :Pl     var#101   j         var#102   
ET288     :Ind    TAS#      var#102   var#36    
ET289     :Ind    ADR#      var#33    var#104   
ET290     :Pl     var#104   j         var#105   
ET291     :AfInd  TAS#      var#105   var#36    
ET292     :Afc    1                   var#128   
ET293     :Pl     j         var#128   j         
ET294     :Lt     j         d         var#38    
ET295     :Jp                         ET296     
ET297     :Sk                         
ET298     :Afc    1                   var#129   
ET299     :Pl     i         var#129   i         
ET300     :Lt     i         d         var#40    
ET301     :Jp                         ET302     
ET303     :Sk                         
ET304     :Afc    0                   i         
ET305     :Afc    1                   var#130   
ET306     :Mo     e         var#130   var#43    
ET307     :Lt     i         var#43    var#44    
ET372     :Jz     var#44              ET373     
ET308     :Param  A         M                   
ET309     :Param  B         A                   
ET310     :Param  d         d                   
ET311     :Paramc var#126   0                   
ET312     :Paramc var#125   0                   
ET313     :Paramc var#124   0                   
ET314     :Paramc var#123   0                   
ET315     :Paramc var#122   0                   
ET316     :Paramc var#121   0                   
ET317     :Paramc var#94    0                   
ET318     :Paramc var#93    0                   
ET319     :Paramc var#92    0                   
ET320     :Paramc var#90    0                   
ET321     :Paramc var#89    0                   
ET322     :Paramc var#87    0                   
ET323     :Paramc var#86    0                   
ET324     :Paramc var#84    0                   
ET325     :Paramc var#83    0                   
ET326     :Paramc var#81    0                   
ET327     :Paramc var#80    0                   
ET328     :Paramc var#78    0                   
ET329     :Paramc var#77    0                   
ET330     :Paramc var#75    0                   
ET331     :Paramc var#74    0                   
ET332     :Paramc var#72    0                   
ET333     :Paramc var#71    0                   
ET334     :Paramc var#70    0                   
ET335     :Paramc var#69    0                   
ET336     :Paramc var#68    0                   
ET337     :Paramc var#66    0                   
ET338     :Paramc var#65    0                   
ET339     :Paramc var#64    0                   
ET340     :Paramc var#63    0                   
ET341     :Paramc var#62    0                   
ET342     :Paramc var#31    0                   
ET343     :Paramc var#29    0                   
ET344     :Paramc var#27    0                   
ET345     :Paramc var#25    0                   
ET346     :Paramc var#24    0                   
ET347     :Paramc var#23    0                   
ET348     :Paramc var#22    0                   
ET349     :Paramc var#21    0                   
ET350     :Paramc var#20    0                   
ET351     :Paramc var#19    0                   
ET352     :Paramc var#18    0                   
ET353     :Paramc var#17    0                   
ET354     :Paramc var#16    0                   
ET355     :Paramc var#15    0                   
ET356     :Paramc var#14    0                   
ET357     :Paramc var#13    0                   
ET358     :Paramc var#12    0                   
ET359     :Paramc prod      0                   
ET360     :Paramc M         0                   
ET361     :Paramc i         0                   
ET362     :Paramc j         0                   
ET363     :Paramc k         0                   
ET364     :Call   prod      56                  
ET365     :Af     M         prod#     
ET366     :Afc    1                   var#131   
ET367     :Pl     i         var#131   i         
ET368     :Afc    1                   var#130   
ET369     :Mo     e         var#130   var#43    
ET370     :Lt     i         var#43    var#44    
ET371     :Jp                         ET372     
ET373     :Sk                         
ET374     :Af     pui       M         
ET375     :Af     pui#      pui       
ET376     :Ret                                  
nilp      :Sk                                   
ET377     :Af     M         padrl#    
ET378     :Afc    1                   var#132   
ET379     :Pl     padrl#    var#132   padrl#    
ET380     :AfInd  ADR#      M         ptasl#    
ET381     :AfInd  TAL#      M         d         
ET382     :Pl     ptasl#    d         ptasl#    
ET383     :Param  A         M                   
ET384     :Param  d         d                   
ET385     :Paramc var#120   0                   
ET386     :Paramc var#119   0                   
ET387     :Paramc var#61    0                   
ET388     :Paramc var#60    0                   
ET389     :Paramc var#59    0                   
ET390     :Paramc var#10    0                   
ET391     :Paramc var#8     0                   
ET392     :Paramc var#7     0                   
ET393     :Paramc i         0                   
ET394     :Paramc j         0                   
ET395     :Call   mat0      12                  
ET396     :Afc    0                   i         
ET397     :Afc    1                   var#133   
ET398     :Mo     d         var#133   var#50    
ET399     :Lt     i         var#50    var#51    
ET414     :Jz     var#51              ET415     
ET400     :Afc    1                   var#134   
ET401     :Pl     i         var#134   var#46    
ET402     :Ind    ADR#      M         var#107   
ET403     :Pl     var#107   var#46    var#108   
ET404     :Ind    TAS#      var#108   var#47    
ET405     :Ind    ADR#      var#47    var#110   
ET406     :Pl     var#110   i         var#111   
ET407     :AfInd  TAS#      var#111   coef      
ET408     :Afc    1                   var#135   
ET409     :Pl     i         var#135   i         
ET410     :Afc    1                   var#133   
ET411     :Mo     d         var#133   var#50    
ET412     :Lt     i         var#50    var#51    
ET413     :Jp                         ET414     
ET415     :Sk                         
ET416     :Af     nilp      M         
ET417     :Af     nilp#     nilp      
ET418     :Ret                                  
sum       :Sk                                   
ET419     :Afc    0                   sum       
ET420     :Afc    0                   i         
ET421     :Lt     i         d         var#58    
ET441     :Jz     var#58              ET442     
ET422     :Afc    0                   j         
ET423     :Lt     j         d         var#56    
ET435     :Jz     var#56              ET436     
ET424     :Ind    ADR#      A         var#113   
ET425     :Pl     var#113   i         var#114   
ET426     :Ind    TAS#      var#114   var#52    
ET427     :Ind    ADR#      var#52    var#116   
ET428     :Pl     var#116   j         var#117   
ET429     :Ind    TAS#      var#117   var#53    
ET430     :Pl     sum       var#53    sum       
ET431     :Afc    1                   var#136   
ET432     :Pl     j         var#136   j         
ET433     :Lt     j         d         var#56    
ET434     :Jp                         ET435     
ET436     :Sk                         
ET437     :Afc    1                   var#137   
ET438     :Pl     i         var#137   i         
ET439     :Lt     i         d         var#58    
ET440     :Jp                         ET441     
ET442     :Sk                         
ET443     :Af     sum#      sum       
ET444     :Ret   
*/

/* envirnts d'arrivee 
variable var#138 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable sum# DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable nilp# DIM:2,TAILLE:0,TYPEF:313valeur 1 
variable pui# DIM:2,TAILLE:0,TYPEF:313valeur 100 
variable prod# DIM:2,TAILLE:0,TYPEF:313valeur 111 
variable ptasl# DIM:0,TAILLE:0,TYPEF:313valeur 1211 
variable padrl# DIM:0,TAILLE:0,TYPEF:313valeur 122 
variable TAS# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable TAL# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable ADR# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable var#2 DIM:0,TAILLE:0,TYPEF:313valeur 9 
variable d DIM:0,TAILLE:0,TYPEF:313valeur 10 
variable M1 DIM:2,TAILLE:0,TYPEF:313valeur 1 
variable P DIM:2,TAILLE:0,TYPEF:313valeur 111 
variable S1 DIM:0,TAILLE:0,TYPEF:313valeur 18 
variable Sd-1 DIM:0,TAILLE:0,TYPEF:313valeur 512 
variable Sd DIM:0,TAILLE:0,TYPEF:313valeur 0 
fin d'environnement 
*/








