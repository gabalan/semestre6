var X : array of integer,
var m0: integer,
var m1: integer,
var m2: integer,
var m3: integer,
var m4: integer


/* retourne le quotient entier de x par y */
defun div(x: integer, y: integer):integer
      if y = 0
      	 then div := 0
	 else
		{while y * div < x do
      	    	       div := div + 1;
		 if x < y * div 
		    then div := div -1
		    else skip
		}
		
/* T[i .. j-1] et T[j ..k-1] sont tries; fusionne en un tableau trie */
defun fusion(T: array of integer, i: integer, j: integer, k:integer):array of integer 
        var ic: integer,             /* indices courants de T */
	var jc: integer,
	var f: integer,		     /* indice courant du resultat */
	var taille: integer          /* taille du tab a trier */
	taille := k - i;
	fusion := new array of integer[taille];
	f := 0; ic:=i; jc:=j ;
	while ((f < taille) and (ic < j)  and (jc < k)) do
	      { if T[ic] < T[jc]
	      	   then
			{fusion[f] := T[ic];
		   	ic := ic +1}
		   else
		   	{fusion[f] := T[jc];
		   	jc := jc+1
		   	};
		f:= f+1};
	while ((f < taille) and (ic = j)  and (jc < k)) do
	      {fusion[f] := T[jc]; jc := jc+1;f := f+1};
	while ((f < taille) and (ic < j)  and (jc = k)) do
	      {fusion[f] := T[ic]; ic := ic+1;f := f+1}
	
	      
/* trie, par fusion, le tableau T[i..k-1] */
defpro trifus(T: array of integer, i: integer, k: integer)
        var j: integer, /* indice de decoupage */
	var r: integer, /* indice de recopie */
	var F: array of integer
	if i = (k - 1)
   	   then skip
   	   else
		{j := i + div(k - i,2);
	   	 trifus(T,i,j);/* trie le prefixe de long div(k-i,2)*/
		 trifus(T,j, k);/* trie le suffixe restant*/
	   	 F:= fusion(T,i,j,k);
		 r := 0;
		 while r < (k - i) do /* copie F dans T[i .. k-1]*/
		       {T[i+r] := F[r];
		        r := r+1
			}	
		 }

X:= new array of integer[5];
X[0]:= 5;
X[1] := 4;
X[2]:= 3;
X[3] := 2;
X[4] := 1;
trifus(X,0,5);
m0:= X[0];
m1:= X[1];
m2:= X[2];
m3:= X[3];
m4:= X[4]

/* maintenant les quadruplets 
ET0       :Af     X         padrl#    
ET1       :Afc    1                   var#144   
ET2       :Pl     padrl#    var#144   padrl#    
ET3       :AfInd  ADR#      X         ptasl#    
ET4       :Afc    5                   var#145   
ET5       :AfInd  TAL#      X         var#145   
ET6       :Afc    5                   var#146   
ET7       :Pl     ptasl#    var#146   ptasl#    
ET8       :Ind    ADR#      X         var#65    
ET9       :Afc    0                   var#147   
ET10      :Pl     var#65    var#147   var#66    
ET11      :Afc    5                   var#148   
ET12      :AfInd  TAS#      var#66    var#148   
ET13      :Ind    ADR#      X         var#68    
ET14      :Afc    1                   var#149   
ET15      :Pl     var#68    var#149   var#69    
ET16      :Afc    4                   var#150   
ET17      :AfInd  TAS#      var#69    var#150   
ET18      :Ind    ADR#      X         var#71    
ET19      :Afc    2                   var#151   
ET20      :Pl     var#71    var#151   var#72    
ET21      :Afc    3                   var#152   
ET22      :AfInd  TAS#      var#72    var#152   
ET23      :Ind    ADR#      X         var#74    
ET24      :Afc    3                   var#153   
ET25      :Pl     var#74    var#153   var#75    
ET26      :Afc    2                   var#154   
ET27      :AfInd  TAS#      var#75    var#154   
ET28      :Ind    ADR#      X         var#77    
ET29      :Afc    4                   var#155   
ET30      :Pl     var#77    var#155   var#78    
ET31      :Afc    1                   var#156   
ET32      :AfInd  TAS#      var#78    var#156   
ET33      :Param  T         X                   
ET34      :Paramc i         0                   
ET35      :Paramc k         5                   
ET36      :Paramc var#143   0                   
ET37      :Paramc var#142   0                   
ET38      :Paramc var#130   0                   
ET39      :Paramc var#129   0                   
ET40      :Paramc var#128   0                   
ET41      :Paramc var#126   0                   
ET42      :Paramc var#125   0                   
ET43      :Paramc var#64    0                   
ET44      :Paramc var#63    0                   
ET45      :Paramc var#62    0                   
ET46      :Paramc var#61    0                   
ET47      :Paramc var#59    0                   
ET48      :Paramc var#58    0                   
ET49      :Paramc var#57    0                   
ET50      :Paramc var#54    0                   
ET51      :Paramc var#53    0                   
ET52      :Paramc j         0                   
ET53      :Paramc r         0                   
ET54      :Paramc F         0                   
ET55      :Call   trifus    22                  
ET56      :Ind    ADR#      X         var#80    
ET57      :Afc    0                   var#157   
ET58      :Pl     var#80    var#157   var#81    
ET59      :Ind    TAS#      var#81    m0        
ET60      :Ind    ADR#      X         var#83    
ET61      :Afc    1                   var#158   
ET62      :Pl     var#83    var#158   var#84    
ET63      :Ind    TAS#      var#84    m1        
ET64      :Ind    ADR#      X         var#86    
ET65      :Afc    2                   var#159   
ET66      :Pl     var#86    var#159   var#87    
ET67      :Ind    TAS#      var#87    m2        
ET68      :Ind    ADR#      X         var#89    
ET69      :Afc    3                   var#160   
ET70      :Pl     var#89    var#160   var#90    
ET71      :Ind    TAS#      var#90    m3        
ET72      :Ind    ADR#      X         var#92    
ET73      :Afc    4                   var#161   
ET74      :Pl     var#92    var#161   var#93    
ET75      :Ind    TAS#      var#93    m4        
ET76      :St                         
div       :Sk                                   
ET77      :Afc    0                   var#131   
ET78      :Eq     y         var#131   var#17    
ET96      :Jz     var#17              ET80      
ET79      :Afc    0                   div       
ET97      :Jp                         ET93      
ET80      :Mu     y         div       var#12    
ET81      :Lt     var#12    x         var#13    
ET87      :Jz     var#13              ET88      
ET82      :Afc    1                   var#132   
ET83      :Pl     div       var#132   div       
ET84      :Mu     y         div       var#12    
ET85      :Lt     var#12    x         var#13    
ET86      :Jp                         ET87      
ET88      :Sk                         
ET89      :Mu     y         div       var#15    
ET90      :Lt     x         var#15    var#16    
ET94      :Jz     var#16              ET93      
ET91      :Afc    1                   var#133   
ET92      :Mo     div       var#133   div       
ET95      :Jp                         ET93      
ET93      :Sk                         
ET98      :Af     div#      div       
ET99      :Ret                                  
fusion    :Sk                                   
ET100     :Mo     k         i         taille    
ET101     :Af     fusion    padrl#    
ET102     :Afc    1                   var#134   
ET103     :Pl     padrl#    var#134   padrl#    
ET104     :AfInd  ADR#      fusion    ptasl#    
ET105     :AfInd  TAL#      fusion    taille    
ET106     :Pl     ptasl#    taille    ptasl#    
ET107     :Afc    0                   f         
ET108     :Af     ic        i         
ET109     :Af     jc        j         
ET110     :Lt     f         taille    var#30    
ET111     :Lt     ic        j         var#31    
ET112     :And    var#30    var#31    var#32    
ET113     :Lt     jc        k         var#33    
ET114     :And    var#32    var#33    var#34    
ET149     :Jz     var#34              ET150     
ET115     :Ind    ADR#      T         var#95    
ET116     :Pl     var#95    ic        var#96    
ET117     :Ind    TAS#      var#96    var#26    
ET118     :Ind    ADR#      T         var#98    
ET119     :Pl     var#98    jc        var#99    
ET120     :Ind    TAS#      var#99    var#27    
ET121     :Lt     var#26    var#27    var#28    
ET139     :Jz     var#28              ET130     
ET122     :Ind    ADR#      T         var#101   
ET123     :Pl     var#101   ic        var#102   
ET124     :Ind    TAS#      var#102   var#21    
ET125     :Ind    ADR#      fusion    var#104   
ET126     :Pl     var#104   f         var#105   
ET127     :AfInd  TAS#      var#105   var#21    
ET128     :Afc    1                   var#135   
ET129     :Pl     ic        var#135   ic        
ET140     :Jp                         ET138     
ET130     :Ind    ADR#      T         var#107   
ET131     :Pl     var#107   jc        var#108   
ET132     :Ind    TAS#      var#108   var#24    
ET133     :Ind    ADR#      fusion    var#110   
ET134     :Pl     var#110   f         var#111   
ET135     :AfInd  TAS#      var#111   var#24    
ET136     :Afc    1                   var#136   
ET137     :Pl     jc        var#136   jc        
ET138     :Sk                         
ET141     :Afc    1                   var#137   
ET142     :Pl     f         var#137   f         
ET143     :Lt     f         taille    var#30    
ET144     :Lt     ic        j         var#31    
ET145     :And    var#30    var#31    var#32    
ET146     :Lt     jc        k         var#33    
ET147     :And    var#32    var#33    var#34    
ET148     :Jp                         ET149     
ET150     :Sk                         
ET151     :Lt     f         taille    var#39    
ET152     :Eq     ic        j         var#40    
ET153     :And    var#39    var#40    var#41    
ET154     :Lt     jc        k         var#42    
ET155     :And    var#41    var#42    var#43    
ET172     :Jz     var#43              ET173     
ET156     :Ind    ADR#      T         var#113   
ET157     :Pl     var#113   jc        var#114   
ET158     :Ind    TAS#      var#114   var#36    
ET159     :Ind    ADR#      fusion    var#116   
ET160     :Pl     var#116   f         var#117   
ET161     :AfInd  TAS#      var#117   var#36    
ET162     :Afc    1                   var#138   
ET163     :Pl     jc        var#138   jc        
ET164     :Afc    1                   var#139   
ET165     :Pl     f         var#139   f         
ET166     :Lt     f         taille    var#39    
ET167     :Eq     ic        j         var#40    
ET168     :And    var#39    var#40    var#41    
ET169     :Lt     jc        k         var#42    
ET170     :And    var#41    var#42    var#43    
ET171     :Jp                         ET172     
ET173     :Sk                         
ET174     :Lt     f         taille    var#48    
ET175     :Lt     ic        j         var#49    
ET176     :And    var#48    var#49    var#50    
ET177     :Eq     jc        k         var#51    
ET178     :And    var#50    var#51    var#52    
ET195     :Jz     var#52              ET196     
ET179     :Ind    ADR#      T         var#119   
ET180     :Pl     var#119   ic        var#120   
ET181     :Ind    TAS#      var#120   var#45    
ET182     :Ind    ADR#      fusion    var#122   
ET183     :Pl     var#122   f         var#123   
ET184     :AfInd  TAS#      var#123   var#45    
ET185     :Afc    1                   var#140   
ET186     :Pl     ic        var#140   ic        
ET187     :Afc    1                   var#141   
ET188     :Pl     f         var#141   f         
ET189     :Lt     f         taille    var#48    
ET190     :Lt     ic        j         var#49    
ET191     :And    var#48    var#49    var#50    
ET192     :Eq     jc        k         var#51    
ET193     :And    var#50    var#51    var#52    
ET194     :Jp                         ET195     
ET196     :Sk                         
ET197     :Af     fusion#   fusion    
ET198     :Ret                                  
trifus    :Sk                                   
ET199     :Afc    1                   var#142   
ET200     :Mo     k         var#142   var#63    
ET201     :Eq     i         var#63    var#64    
ET350     :Jz     var#64              ET203     
ET202     :Sk                         
ET351     :Jp                         ET349     
ET203     :Mo     k         i         var#53    
ET204     :Param  x         var#53              
ET205     :Paramc y         2                   
ET206     :Paramc var#133   0                   
ET207     :Paramc var#132   0                   
ET208     :Paramc var#131   0                   
ET209     :Paramc var#17    0                   
ET210     :Paramc var#16    0                   
ET211     :Paramc var#15    0                   
ET212     :Paramc var#13    0                   
ET213     :Paramc var#12    0                   
ET214     :Paramc div       0                   
ET215     :Call   div       11                  
ET216     :Af     var#54    div#      
ET217     :Pl     i         var#54    j         
ET218     :Param  T         T                   
ET219     :Param  i         i                   
ET220     :Param  k         j                   
ET221     :Paramc var#143   0                   
ET222     :Paramc var#142   0                   
ET223     :Paramc var#130   0                   
ET224     :Paramc var#129   0                   
ET225     :Paramc var#128   0                   
ET226     :Paramc var#126   0                   
ET227     :Paramc var#125   0                   
ET228     :Paramc var#64    0                   
ET229     :Paramc var#63    0                   
ET230     :Paramc var#62    0                   
ET231     :Paramc var#61    0                   
ET232     :Paramc var#59    0                   
ET233     :Paramc var#58    0                   
ET234     :Paramc var#57    0                   
ET235     :Paramc var#54    0                   
ET236     :Paramc var#53    0                   
ET237     :Paramc j         0                   
ET238     :Paramc r         0                   
ET239     :Paramc F         0                   
ET240     :Call   trifus    22                  
ET241     :Param  T         T                   
ET242     :Param  i         j                   
ET243     :Param  k         k                   
ET244     :Paramc var#143   0                   
ET245     :Paramc var#142   0                   
ET246     :Paramc var#130   0                   
ET247     :Paramc var#129   0                   
ET248     :Paramc var#128   0                   
ET249     :Paramc var#126   0                   
ET250     :Paramc var#125   0                   
ET251     :Paramc var#64    0                   
ET252     :Paramc var#63    0                   
ET253     :Paramc var#62    0                   
ET254     :Paramc var#61    0                   
ET255     :Paramc var#59    0                   
ET256     :Paramc var#58    0                   
ET257     :Paramc var#57    0                   
ET258     :Paramc var#54    0                   
ET259     :Paramc var#53    0                   
ET260     :Paramc j         0                   
ET261     :Paramc r         0                   
ET262     :Paramc F         0                   
ET263     :Call   trifus    22                  
ET264     :Param  T         T                   
ET265     :Param  i         i                   
ET266     :Param  j         j                   
ET267     :Param  k         k                   
ET268     :Paramc var#141   0                   
ET269     :Paramc var#140   0                   
ET270     :Paramc var#139   0                   
ET271     :Paramc var#138   0                   
ET272     :Paramc var#137   0                   
ET273     :Paramc var#136   0                   
ET274     :Paramc var#135   0                   
ET275     :Paramc var#134   0                   
ET276     :Paramc var#124   0                   
ET277     :Paramc var#123   0                   
ET278     :Paramc var#122   0                   
ET279     :Paramc var#120   0                   
ET280     :Paramc var#119   0                   
ET281     :Paramc var#118   0                   
ET282     :Paramc var#117   0                   
ET283     :Paramc var#116   0                   
ET284     :Paramc var#114   0                   
ET285     :Paramc var#113   0                   
ET286     :Paramc var#112   0                   
ET287     :Paramc var#111   0                   
ET288     :Paramc var#110   0                   
ET289     :Paramc var#108   0                   
ET290     :Paramc var#107   0                   
ET291     :Paramc var#106   0                   
ET292     :Paramc var#105   0                   
ET293     :Paramc var#104   0                   
ET294     :Paramc var#102   0                   
ET295     :Paramc var#101   0                   
ET296     :Paramc var#99    0                   
ET297     :Paramc var#98    0                   
ET298     :Paramc var#96    0                   
ET299     :Paramc var#95    0                   
ET300     :Paramc var#52    0                   
ET301     :Paramc var#51    0                   
ET302     :Paramc var#50    0                   
ET303     :Paramc var#49    0                   
ET304     :Paramc var#48    0                   
ET305     :Paramc var#45    0                   
ET306     :Paramc var#44    0                   
ET307     :Paramc var#43    0                   
ET308     :Paramc var#42    0                   
ET309     :Paramc var#41    0                   
ET310     :Paramc var#40    0                   
ET311     :Paramc var#39    0                   
ET312     :Paramc var#36    0                   
ET313     :Paramc var#35    0                   
ET314     :Paramc var#34    0                   
ET315     :Paramc var#33    0                   
ET316     :Paramc var#32    0                   
ET317     :Paramc var#31    0                   
ET318     :Paramc var#30    0                   
ET319     :Paramc var#28    0                   
ET320     :Paramc var#27    0                   
ET321     :Paramc var#26    0                   
ET322     :Paramc var#24    0                   
ET323     :Paramc var#23    0                   
ET324     :Paramc var#21    0                   
ET325     :Paramc var#20    0                   
ET326     :Paramc fusion    0                   
ET327     :Paramc ic        0                   
ET328     :Paramc jc        0                   
ET329     :Paramc f         0                   
ET330     :Paramc taille    0                   
ET331     :Call   fusion    67                  
ET332     :Af     F         fusion#   
ET333     :Afc    0                   r         
ET334     :Mo     k         i         var#61    
ET335     :Lt     r         var#61    var#62    
ET348     :Jz     var#62              ET349     
ET336     :Pl     i         r         var#57    
ET337     :Ind    ADR#      F         var#125   
ET338     :Pl     var#125   r         var#126   
ET339     :Ind    TAS#      var#126   var#59    
ET340     :Ind    ADR#      T         var#128   
ET341     :Pl     var#128   var#57    var#129   
ET342     :AfInd  TAS#      var#129   var#59    
ET343     :Afc    1                   var#143   
ET344     :Pl     r         var#143   r         
ET345     :Mo     k         i         var#61    
ET346     :Lt     r         var#61    var#62    
ET347     :Jp                         ET348     
ET349     :Sk                         
ET352     :Ret                                  
*/


/* envirnts d'arrivee 
variable var#161 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable var#160 DIM:0,TAILLE:0,TYPEF:313valeur 3 
variable var#159 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#158 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#157 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#156 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#155 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable var#154 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#153 DIM:0,TAILLE:0,TYPEF:313valeur 3 
variable var#152 DIM:0,TAILLE:0,TYPEF:313valeur 3 
variable var#151 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#150 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable var#149 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#148 DIM:0,TAILLE:0,TYPEF:313valeur 5 
variable var#147 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#146 DIM:0,TAILLE:0,TYPEF:313valeur 5 
variable var#145 DIM:0,TAILLE:0,TYPEF:313valeur 5 
variable var#144 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable fusion# DIM:1,TAILLE:0,TYPEF:313valeur 5 
variable div# DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#93 DIM:0,TAILLE:0,TYPEF:313valeur 5 
variable var#92 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#90 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable var#89 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#87 DIM:0,TAILLE:0,TYPEF:313valeur 3 
variable var#86 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#84 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#83 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#81 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#80 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#79 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#78 DIM:0,TAILLE:0,TYPEF:313valeur 5 
variable var#77 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#76 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#75 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable var#74 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#73 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#72 DIM:0,TAILLE:0,TYPEF:313valeur 3 
variable var#71 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#70 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#69 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable var#68 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#67 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#66 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable var#65 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable ptasl# DIM:0,TAILLE:0,TYPEF:313valeur 18 
variable padrl# DIM:0,TAILLE:0,TYPEF:313valeur 6 
variable TAS# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable TAL# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable ADR# DIM:1,TAILLE:0,TYPEF:313valeur 0 
variable var#5 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#4 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#3 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#2 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable var#1 DIM:0,TAILLE:0,TYPEF:313valeur 0 
variable X DIM:1,TAILLE:0,TYPEF:313valeur 1 
variable m0 DIM:0,TAILLE:0,TYPEF:313valeur 1 
variable m1 DIM:0,TAILLE:0,TYPEF:313valeur 2 
variable m2 DIM:0,TAILLE:0,TYPEF:313valeur 3 
variable m3 DIM:0,TAILLE:0,TYPEF:313valeur 4 
variable m4 DIM:0,TAILLE:0,TYPEF:313valeur 5 
fin d'environnement 


