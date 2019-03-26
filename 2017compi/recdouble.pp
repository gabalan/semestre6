/* phi(0) := 011, phi(1) := 10 : morhisme de Fibonnaci */
/* calcule le mot FIB(n) := phi^n(0) */
var n: integer,
var W: array of integer,
var lg: integer,
var f0:integer,
var f1:integer,
var f2:integer,
var f3:integer,
var f4:integer,
var f5:integer,
var f6:integer,
var f7:integer,
var f8:integer,
var f9:integer,
var f10:integer

/* nombre de 0 dans F(n)*/
defun L0(n: integer): integer
       if n = 0
       	  then L0 := 1
	  else L0 := L0(n - 1) + L1(n - 1)

/* nombre de 1 dans F(n)*/
defun L1(n: integer): integer
       if n = 0
       	  then L1 := 0
	  else L1 := 2 * L0(n - 1) + L1(n - 1)

/* longueur de F(n)*/
defun LF(n: integer): integer
       LF := L0(n) + L1(n)


/* nombre d'occurrences de letter dans W (qui est de longueur l) */
defun long(W: array of integer, letter: integer, l: integer): integer
      var i : integer
      i := 0;
      while  i < l do
      	     { if (W[i] = letter)
	       	  then long := long + 1
		  else skip;
	       i := i+1
	     }

/* homomorhisme de mots: W est un mot de longueur l*/
defun phi(W: array of integer, l: integer): array of integer
      var i : integer, var newi: integer, var newl : integer
      newl := 3 * long(W,0,l) + 2 * long(W,1,l);
      phi := new array of integer[newl];
      i:= 0; newi:=0;
      while i < l do
      	     if (W[i] = 0)
	    	then
	    	{phi[newi]:= 0;
		 phi[newi + 1] := 1;
		 phi[newi + 2] := 1;
		 newi := newi + 3;
		 i:= i + 1
		 }
		 else
		 {phi[newi]:= 1;
		 phi[newi + 1] := 0;
		 newi := newi + 2;
		 i:= i + 1
		 }
	    
	    
/* FIB(n) = phi^n(0) */
defun FIB(n: integer): array of integer
      FIB := new array of integer[LF(n)];
      if (n=0)
      	 then FIB[0]:=0
	 else FIB := phi(FIB(n - 1),LF(n - 1))

n := 2;
W := FIB(n);
lg := LF(n);
f0:= W[0];
f1:= W[1];
f2:= W[2];
f3:= W[3];
f4:= W[4];
f5:= W[5];
f6:= W[6]
/*f7:= W[7];
f8:= W[8];
f9:= W[9];
f10:= W[10]*/

/* maintenant les quadruplets 
ET0       :Afc    2                   n         
ET1       :Param  n         n                   
ET2       :Paramc var#135   0                   
ET3       :Paramc var#134   0                   
ET4       :Paramc var#133   0                   
ET5       :Paramc var#132   0                   
ET6       :Paramc var#131   0                   
ET7       :Paramc var#130   0                   
ET8       :Paramc var#104   0                   
ET9       :Paramc var#103   0                   
ET10      :Paramc var#102   0                   
ET11      :Paramc var#59    0                   
ET12      :Paramc var#57    0                   
ET13      :Paramc var#56    0                   
ET14      :Paramc var#55    0                   
ET15      :Paramc var#54    0                   
ET16      :Paramc var#53    0                   
ET17      :Paramc var#51    0                   
ET18      :Paramc FIB       0                   
ET19      :Call   FIB       18                  
ET20      :Af     W         FIB#      
ET21      :Param  n         n                   
ET22      :Paramc var#23    0                   
ET23      :Paramc var#22    0                   
ET24      :Paramc LF        0                   
ET25      :Call   LF        4                   
ET26      :Af     lg        LF#       
ET27      :Ind    ADR#      W         var#60    
ET28      :Afc    0                   var#136   
ET29      :Pl     var#60    var#136   var#61    
ET30      :Ind    TAS#      var#61    f0        
ET31      :Ind    ADR#      W         var#63    
ET32      :Afc    1                   var#137   
ET33      :Pl     var#63    var#137   var#64    
ET34      :Ind    TAS#      var#64    f1        
ET35      :Ind    ADR#      W         var#66    
ET36      :Afc    2                   var#138   
ET37      :Pl     var#66    var#138   var#67    
ET38      :Ind    TAS#      var#67    f2        
ET39      :Ind    ADR#      W         var#69    
ET40      :Afc    3                   var#139   
ET41      :Pl     var#69    var#139   var#70    
ET42      :Ind    TAS#      var#70    f3        
ET43      :Ind    ADR#      W         var#72    
ET44      :Afc    4                   var#140   
ET45      :Pl     var#72    var#140   var#73    
ET46      :Ind    TAS#      var#73    f4        
ET47      :Ind    ADR#      W         var#75    
ET48      :Afc    5                   var#141   
ET49      :Pl     var#75    var#141   var#76    
ET50      :Ind    TAS#      var#76    f5        
ET51      :Ind    ADR#      W         var#78    
ET52      :Afc    6                   var#142   
ET53      :Pl     var#78    var#142   var#79    
ET54      :Ind    TAS#      var#79    f6        
ET55      :St                         
L0        :Sk                                   
ET56      :Afc    0                   var#105   
ET57      :Eq     n         var#105   var#14    
ET91      :Jz     var#14              ET59      
ET58      :Afc    1                   L0        
ET92      :Jp                         ET90      
ET59      :Afc    1                   var#106   
ET60      :Mo     n         var#106   var#9     
ET61      :Afc    1                   var#107   
ET62      :Mo     n         var#107   var#11    
ET63      :Param  n         var#9               
ET64      :Paramc var#107   0                   
ET65      :Paramc var#106   0                   
ET66      :Paramc var#105   0                   
ET67      :Paramc var#14    0                   
ET68      :Paramc var#12    0                   
ET69      :Paramc var#11    0                   
ET70      :Paramc var#10    0                   
ET71      :Paramc var#9     0                   
ET72      :Paramc L0        0                   
ET73      :Call   L0        10                  
ET74      :Af     var#10    L0#       
ET75      :Param  n         var#11              
ET76      :Paramc var#111   0                   
ET77      :Paramc var#110   0                   
ET78      :Paramc var#109   0                   
ET79      :Paramc var#108   0                   
ET80      :Paramc var#21    0                   
ET81      :Paramc var#19    0                   
ET82      :Paramc var#18    0                   
ET83      :Paramc var#17    0                   
ET84      :Paramc var#16    0                   
ET85      :Paramc var#15    0                   
ET86      :Paramc L1        0                   
ET87      :Call   L1        12                  
ET88      :Af     var#12    L1#       
ET89      :Pl     var#10    var#12    L0        
ET90      :Sk                         
ET93      :Af     L0#       L0        
ET94      :Ret                                  
L1        :Sk                                   
ET95      :Afc    0                   var#108   
ET96      :Eq     n         var#108   var#21    
ET132     :Jz     var#21              ET98      
ET97      :Afc    0                   L1        
ET133     :Jp                         ET131     
ET98      :Afc    1                   var#109   
ET99      :Mo     n         var#109   var#15    
ET100     :Param  n         var#15              
ET101     :Paramc var#107   0                   
ET102     :Paramc var#106   0                   
ET103     :Paramc var#105   0                   
ET104     :Paramc var#14    0                   
ET105     :Paramc var#12    0                   
ET106     :Paramc var#11    0                   
ET107     :Paramc var#10    0                   
ET108     :Paramc var#9     0                   
ET109     :Paramc L0        0                   
ET110     :Call   L0        10                  
ET111     :Af     var#16    L0#       
ET112     :Afc    1                   var#110   
ET113     :Mo     n         var#110   var#18    
ET114     :Afc    2                   var#111   
ET115     :Mu     var#111   var#16    var#17    
ET116     :Param  n         var#18              
ET117     :Paramc var#111   0                   
ET118     :Paramc var#110   0                   
ET119     :Paramc var#109   0                   
ET120     :Paramc var#108   0                   
ET121     :Paramc var#21    0                   
ET122     :Paramc var#19    0                   
ET123     :Paramc var#18    0                   
ET124     :Paramc var#17    0                   
ET125     :Paramc var#16    0                   
ET126     :Paramc var#15    0                   
ET127     :Paramc L1        0                   
ET128     :Call   L1        12                  
ET129     :Af     var#19    L1#       
ET130     :Pl     var#17    var#19    L1        
ET131     :Sk                         
ET134     :Af     L1#       L1        
ET135     :Ret                                  
LF        :Sk                                   
ET136     :Param  n         n                   
ET137     :Paramc var#107   0                   
ET138     :Paramc var#106   0                   
ET139     :Paramc var#105   0                   
ET140     :Paramc var#14    0                   
ET141     :Paramc var#12    0                   
ET142     :Paramc var#11    0                   
ET143     :Paramc var#10    0                   
ET144     :Paramc var#9     0                   
ET145     :Paramc L0        0                   
ET146     :Call   L0        10                  
ET147     :Af     var#22    L0#       
ET148     :Param  n         n                   
ET149     :Paramc var#111   0                   
ET150     :Paramc var#110   0                   
ET151     :Paramc var#109   0                   
ET152     :Paramc var#108   0                   
ET153     :Paramc var#21    0                   
ET154     :Paramc var#19    0                   
ET155     :Paramc var#18    0                   
ET156     :Paramc var#17    0                   
ET157     :Paramc var#16    0                   
ET158     :Paramc var#15    0                   
ET159     :Paramc L1        0                   
ET160     :Call   L1        12                  
ET161     :Af     var#23    L1#       
ET162     :Pl     var#22    var#23    LF        
ET163     :Af     LF#       LF        
ET164     :Ret                                  
long      :Sk                                   
ET165     :Afc    0                   i         
ET166     :Lt     i         l         var#29    
ET180     :Jz     var#29              ET181     
ET167     :Ind    ADR#      W         var#81    
ET168     :Pl     var#81    i         var#82    
ET169     :Ind    TAS#      var#82    var#26    
ET170     :Eq     var#26    letter    var#27    
ET174     :Jz     var#27              ET173     
ET171     :Afc    1                   var#112   
ET172     :Pl     long      var#112   long      
ET175     :Jp                         ET173     
ET173     :Sk                         
ET176     :Afc    1                   var#113   
ET177     :Pl     i         var#113   i         
ET178     :Lt     i         l         var#29    
ET179     :Jp                         ET180     
ET181     :Sk                         
ET182     :Af     long#     long      
ET183     :Ret                                  
phi       :Sk                                   
ET184     :Param  W         W                   
ET185     :Paramc letter    0                   
ET186     :Param  l         l                   
ET187     :Paramc var#113   0                   
ET188     :Paramc var#112   0                   
ET189     :Paramc var#82    0                   
ET190     :Paramc var#81    0                   
ET191     :Paramc var#29    0                   
ET192     :Paramc var#27    0                   
ET193     :Paramc var#26    0                   
ET194     :Paramc long      0                   
ET195     :Paramc i         0                   
ET196     :Call   long      12                  
ET197     :Af     var#30    long#     
ET198     :Param  W         W                   
ET199     :Paramc letter    1                   
ET200     :Param  l         l                   
ET201     :Paramc var#113   0                   
ET202     :Paramc var#112   0                   
ET203     :Paramc var#82    0                   
ET204     :Paramc var#81    0                   
ET205     :Paramc var#29    0                   
ET206     :Paramc var#27    0                   
ET207     :Paramc var#26    0                   
ET208     :Paramc long      0                   
ET209     :Paramc i         0                   
ET210     :Call   long      12                  
ET211     :Af     var#32    long#     
ET212     :Afc    3                   var#114   
ET213     :Mu     var#114   var#30    var#31    
ET214     :Afc    2                   var#115   
ET215     :Mu     var#115   var#32    var#33    
ET216     :Pl     var#31    var#33    newl      
ET217     :Af     phi       padrl#    
ET218     :Afc    1                   var#116   
ET219     :Pl     padrl#    var#116   padrl#    
ET220     :AfInd  ADR#      phi       ptasl#    
ET221     :AfInd  TAL#      phi       newl      
ET222     :Pl     ptasl#    newl      ptasl#    
ET223     :Afc    0                   i         
ET224     :Afc    0                   newi      
ET225     :Lt     i         l         var#50    
ET270     :Jz     var#50              ET271     
ET226     :Ind    ADR#      W         var#84    
ET227     :Pl     var#84    i         var#85    
ET228     :Ind    TAS#      var#85    var#48    
ET229     :Afc    0                   var#117   
ET230     :Eq     var#48    var#117   var#49    
ET266     :Jz     var#49              ET251     
ET231     :Ind    ADR#      phi       var#87    
ET232     :Pl     var#87    newi      var#88    
ET233     :Afc    0                   var#118   
ET234     :AfInd  TAS#      var#88    var#118   
ET235     :Afc    1                   var#119   
ET236     :Pl     newi      var#119   var#37    
ET237     :Ind    ADR#      phi       var#90    
ET238     :Pl     var#90    var#37    var#91    
ET239     :Afc    1                   var#120   
ET240     :AfInd  TAS#      var#91    var#120   
ET241     :Afc    2                   var#121   
ET242     :Pl     newi      var#121   var#39    
ET243     :Ind    ADR#      phi       var#93    
ET244     :Pl     var#93    var#39    var#94    
ET245     :Afc    1                   var#122   
ET246     :AfInd  TAS#      var#94    var#122   
ET247     :Afc    3                   var#123   
ET248     :Pl     newi      var#123   newi      
ET249     :Afc    1                   var#124   
ET250     :Pl     i         var#124   i         
ET267     :Jp                         ET265     
ET251     :Ind    ADR#      phi       var#96    
ET252     :Pl     var#96    newi      var#97    
ET253     :Afc    1                   var#125   
ET254     :AfInd  TAS#      var#97    var#125   
ET255     :Afc    1                   var#126   
ET256     :Pl     newi      var#126   var#44    
ET257     :Ind    ADR#      phi       var#99    
ET258     :Pl     var#99    var#44    var#100   
ET259     :Afc    0                   var#127   
ET260     :AfInd  TAS#      var#100   var#127   
ET261     :Afc    2                   var#128   
ET262     :Pl     newi      var#128   newi      
ET263     :Afc    1                   var#129   
ET264     :Pl     i         var#129   i         
ET265     :Sk                         
ET268     :Lt     i         l         var#50    
ET269     :Jp                         ET270     
ET271     :Sk                         
ET272     :Af     phi#      phi       
ET273     :Ret                                  
FIB       :Sk                                   
ET274     :Param  n         n                   
ET275     :Paramc var#23    0                   
ET276     :Paramc var#22    0                   
ET277     :Paramc LF        0                   
ET278     :Call   LF        4                   
ET279     :Af     var#51    LF#       
ET280     :Af     FIB       padrl#    
ET281     :Afc    1                   var#130   
ET282     :Pl     padrl#    var#130   padrl#    
ET283     :AfInd  ADR#      FIB       ptasl#    
ET284     :AfInd  TAL#      FIB       var#51    
ET285     :Pl     ptasl#    var#51    ptasl#    
ET286     :Afc    0                   var#131   
ET287     :Eq     n         var#131   var#59    
ET380     :Jz     var#59              ET293     
ET288     :Ind    ADR#      FIB       var#102   
ET289     :Afc    0                   var#132   
ET290     :Pl     var#102   var#132   var#103   
ET291     :Afc    0                   var#133   
ET292     :AfInd  TAS#      var#103   var#133   
ET381     :Jp                         ET379     
ET293     :Afc    1                   var#134   
ET294     :Mo     n         var#134   var#54    
ET295     :Param  n         var#54              
ET296     :Paramc var#135   0                   
ET297     :Paramc var#134   0                   
ET298     :Paramc var#133   0                   
ET299     :Paramc var#132   0                   
ET300     :Paramc var#131   0                   
ET301     :Paramc var#130   0                   
ET302     :Paramc var#104   0                   
ET303     :Paramc var#103   0                   
ET304     :Paramc var#102   0                   
ET305     :Paramc var#59    0                   
ET306     :Paramc var#57    0                   
ET307     :Paramc var#56    0                   
ET308     :Paramc var#55    0                   
ET309     :Paramc var#54    0                   
ET310     :Paramc var#53    0                   
ET311     :Paramc var#51    0                   
ET312     :Paramc FIB       0                   
ET313     :Call   FIB       18                  
ET314     :Af     var#55    FIB#      
ET315     :Afc    1                   var#135   
ET316     :Mo     n         var#135   var#56    
ET317     :Param  n         var#56              
ET318     :Paramc var#23    0                   
ET319     :Paramc var#22    0                   
ET320     :Paramc LF        0                   
ET321     :Call   LF        4                   
ET322     :Af     var#57    LF#       
ET323     :Param  W         var#55              
ET324     :Param  l         var#57              
ET325     :Paramc var#129   0                   
ET326     :Paramc var#128   0                   
ET327     :Paramc var#127   0                   
ET328     :Paramc var#126   0                   
ET329     :Paramc var#125   0                   
ET330     :Paramc var#124   0                   
ET331     :Paramc var#123   0                   
ET332     :Paramc var#122   0                   
ET333     :Paramc var#121   0                   
ET334     :Paramc var#120   0                   
ET335     :Paramc var#119   0                   
ET336     :Paramc var#118   0                   
ET337     :Paramc var#117   0                   
ET338     :Paramc var#116   0                   
ET339     :Paramc var#115   0                   
ET340     :Paramc var#114   0                   
ET341     :Paramc var#101   0                   
ET342     :Paramc var#100   0                   
ET343     :Paramc var#99    0                   
ET344     :Paramc var#98    0                   
ET345     :Paramc var#97    0                   
ET346     :Paramc var#96    0                   
ET347     :Paramc var#95    0                   
ET348     :Paramc var#94    0                   
ET349     :Paramc var#93    0                   
ET350     :Paramc var#92    0                   
ET351     :Paramc var#91    0                   
ET352     :Paramc var#90    0                   
ET353     :Paramc var#89    0                   
ET354     :Paramc var#88    0                   
ET355     :Paramc var#87    0                   
ET356     :Paramc var#85    0                   
ET357     :Paramc var#84    0                   
ET358     :Paramc var#50    0                   
ET359     :Paramc var#49    0                   
ET360     :Paramc var#48    0                   
ET361     :Paramc var#45    0                   
ET362     :Paramc var#44    0                   
ET363     :Paramc var#43    0                   
ET364     :Paramc var#40    0                   
ET365     :Paramc var#39    0                   
ET366     :Paramc var#38    0                   
ET367     :Paramc var#37    0                   
ET368     :Paramc var#36    0                   
ET369     :Paramc var#33    0                   
ET370     :Paramc var#32    0                   
ET371     :Paramc var#31    0                   
ET372     :Paramc var#30    0                   
ET373     :Paramc phi       0                   
ET374     :Paramc i         0                   
ET375     :Paramc newi      0                   
ET376     :Paramc newl      0                   
ET377     :Call   phi       54                  
ET378     :Af     FIB       phi#      
ET379     :Sk                         
ET382     :Af     FIB#      FIB       
ET383     :Ret                                  
*/