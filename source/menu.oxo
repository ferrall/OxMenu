Ox0700                             $ox$info        $ox$end    $ox$literals =           P   C:\Users\Chris\Documents\OFFICE\software\Microeconometrics\OxMenu\source\menu.ox      Run All (excluding sub-options)      This is the default help text.
   '   menu items have to be an array of size       prompt should be a string      Menu   *   call should be a function or a Menu object      Run             _      .txt      l   
   Output of       :      ... finished.
   "   OxMenu Error: menu item not found       OxMenu Error: index too large:        versus       Command Line Options:       %t   .   Quitting Ox because command line input invalid      CallMenu      items   	   ParamMenu      CmdLine      SetPars      Interactive Menu:       [      %02u      ]       ]  Help on Menu      ]  QUIT       ]  Exit Ox
[      ]  go up to previous menu      ?       
 *** TRY AGAIN 
      Help: 
   $   Press any key and ENTER to continue
      %2c   /   Press any key and ENTER to continue or return 
      Set Parameters for        Current Value:       ] Reset to default list
[   "    Send current parameters to target       Return current parameters      %i      _Call_      with parameters       Enter        to exit or        to continue.      %d      %g      %s      ?      %#M      
ERROR:    %    too large. Enter a number less than       
   (   param items have to be an array of size     $ox$end    $ox$symbols %      arglist 0            $arglist            exit 0           c$exit           iexit       fclose 0           c$fclose           file       fopen 0�          c$fopen           sfile       isarray 0        	   c$isarray           a       isclass 0�       	   c$isclass           a       isdouble 0        
   c$isdouble           a    
   isfunction 0           c$isfunction           a       isint 0           c$isint           a       ismatrix 0        
   c$ismatrix           a       isstring 0        
   c$isstring           a       max 0�          c$max           a    
   oxrunerror 0�          c$oxrunerror           smsg    	   oxwarning 0           c$oxwarning           flset       println 0�       	   c$println           a       replace 0�             $replace           inval       oldval       newval       scan 0�          c$scan           a       sprint 0�          c$sprint           a       sscan 0�          cc$sscan           str       a       strfind 0�       
   cc$strfind           as       s    
   va_arglist 0            $va_arglist             d          d         d         d         d         d         d         d  @       d  ����    d          d         d         d        Menu       ����   prompt $        call $       ItemSize $       INVALID $ ����   EXIT $ ����   HELP $ ����   QUIT $ ����   DOALL $        CHOICE $       sep $    
---------------------------
    logdir      ./    keeplog  	        name  	        items  	           CmdLine 0        
   cc$CmdLine           this       $t0       Menu         	   cc  $Menu          this       $t0       name  @    Menu    keeplog  @     	   SetLogDir            cc $SetLogDir          this       $t0       folder  @    ./    add 0�           cc$add           this       $t0    	   itemparse      &     cc  $itemparse          this       $t0       token       items       ~Menu      �     cc$~Menu          this       $t0       CallMenu       8     Menu    prompt $        call $       ItemSize $       INVALID $ ����   EXIT $ ����   HELP $ ����   QUIT $ ����   DOALL $        CHOICE $       sep $    
---------------------------
    logdir      ./    keeplog  	        name  	        items  	        IamMain  	     	   help_text  	           CallMenu      &      cc   $CallMenu          this       $t0       name  @    Menu    keeplog  @        IamMain  @       CmdLine      �     cc $CmdLine          this       $t0       alist  @       Run      �     cc$Run          this       $t0       add  �    M      cc$add          this       $t0       make_the_call      �      cc $make_the_call          this       $t0       item    	   ParamMenu       8     Menu    prompt $        call $       ItemSize $       INVALID $ ����   EXIT $ ����   HELP $ ����   QUIT $ ����   DOALL $        CHOICE $       sep $    
---------------------------
    logdir      ./    keeplog  	        name  	        items  	        RESET $ ����   SEND $ ����   Value $       pars  	        TargFunc  	           CmdLine      �     cc  $CmdLine          this       $t0       TargFunc  @        args  @    	   ParamMenu      �     cc   $ParamMenu          this       $t0       name  @ 
   Set Params    keeplog  @        TargFunc  @        SetPars      �     cc $SetPars          this       $t0       TargFunc  @        add  �    �     cc$add          this       $t0       $ox$end 	   $ox$pcode �            q   #   I    1    1   U   #   A    P    P    p   U   #	   A    1   U   #
   L"   P   P    L"   M    #   A    R   #   q   #   I    P    L"   1   U
   #   R    #   q   #   I    1    P   P    L"   1   1   M   #    A    P   P    L#   P    P    p   P    c   Og   Ou   P    Og   Ou   M   #!   A    1   U   #"   A    P    c   U   ##   A    R   #$   q   #6   I   P    L   C    b   #7   i    P    7    B   P����P����P    @   @����T`   J�   #8   L   P    B    C   O^   Tl   B    f�   P    i   O�   #9   Fx   L   P    c   P    L   P   C   Oc   C   #:   L
   P    r    B    P    i    x    C   O^   #;   F�   L   P    c   C   #;   A    u   f�   F�   L   P    r    B    P    i   x    C   O^   F�   L   P    r    B    P    i   x    P    c   C   O^   #<   F�   L   P    c   C   #=   A    d   u   P    P    p   2    Og   Ou   Ou   U   #>   J]   -   5    R    #@   q   #F   I    P    L   P    r    A   P    i   x    C   #G   F�   r    A   P   x    P    c   P    M    #H   #I   R    #I   L   P    r    A   P    i   x    C   O^   #K   F�   #L   R    #L   A    u   #M   F  L   P    L"   u
   P    L   P    r    A   P    x    P    c	   P    c
   C   Oc   P    c   Oc   P    c   C   #N   L   P    c   1    u   P    c   Oc   P    r    A   P    x    Oc   P    L"   u	   C   #O   r    A   P   x    C    #Q   A    u   #R   F$  L   P    c   C   #S   L   P    c   C   #T   R    #V   q   #]   I   P    L   P    P    c	   1   C   #_   i    P    7    A   P����P����P    @   @����T<  JB  #`   L   2    C   #`   J9  -   5    i    P    7    A   P����P����P    @   @����TO  J�  #b   L
   P    A   C   #b   F�  i    P    7    A   P    4   P����P    @   @����Tb  J|  #c   L   P    r    B    P    i    x    P    B   x    P    A   C   P    i   Ot   O}   #c   F{  B   a   #c   J|  #c   J_  -   5    L
   P    A   C   #d   F�  L   P    c   1   Oc   C   #e   i����a   #f   J�  #g   J�  A   P    A   f�   O|   #j   F�  L   P    c   P    L   1   C   Oc   P    c   Oc   P    L   1   C   Oc   C   #k   i����a   #l   JL  -   5    A   #n   R   #n   R    #o   q   #�   I   P    b    #�   L   P    A   C   #�   F�  A   b    #�   L    C    a   #�   A   f�   P    B    O}   #�   F�  L   P    c   1    u   C   #�   #�   A    u   b   #�   L   P    r    A   2    OJ   b    O,   x    P    c   P    &    B   C   #�   L#   P   P    L"   2   2   M   b   #�   B   P    i����O{   #�   F   L   P    c   C   #�   B   P    i    O{   #�   F(  i   P    7    B   P����P����P    @   @����T  J$  #�   L   P    r    B   P    i   x    C   #�   F#  A    P   P    L#   2   M   #�   J  -   5   J�  #�   A    r    u   2   x    b   #�   L   P    r    B   P    i   x    P    c   C   Fr  B    P    A   f�   O   #�   FR  L   P    r    A   2    OJ   b    O,   x    P    c   P    &    B   C   #�   JS  Jr  #�   L#   P   P    L"   2   P    r    B   P   x    P    c   P    m    M   b   #�   r    B   P   x    P    c   P    m    2   x    b   #�   J/  L   P    r    B   P    i   x    P    c   C   #�   F�  B    P    A   f�   O   #�   F�  r    B   P   x    P    c   P    P    P    r    A   2    P ���O(   x    M   #�   J�  r    B   P   x    P    c   P    P    M   #�   #�   R    #�   J�  A    P   P    L#   2   M   #�   B    P    A   f�   O   #�   T�  J�  A    P   P    L#   M    #�   R    #�   q   #�   I   P    L   P    c   1    u   C   #�   #�   i   1    7    u   P    4    P����P    @   @����T�  J�  #�   L   P    c   P    c   2    P    c   P    r    B   P    x    C   #�   J�  -   5   L   P    c   P����P    c   C   #�   A    u   #�   F�  L   P    c   P����P    c    C   #�   J  L   P    c   P����P    c!   P����P    c"   C   #�   L   P    c#   P    c   P    &    B    C   #�   L   P����P    L#   P   P    L"   2    1    u   M   C   b    #�   B    b   #�   J$  J�  B   P����O{   F.  L   P    c$   C   #�   J#  B   P����O{   F7  L   P    C   #�   J#  B   P����O{   FI  L   P    L"   u	   P    c%   1    u   P    L"   u	   C   #�   J#  B   P����O{   FQ  #�   R    #�   J#  B   P    O{   F�  i   1    7    u   P����P����P    @   @����T`  Js  #�   L   P    r    B   P    i   x    C   #�   Fr  A    P   P    L#   2   M   #�   J]  -   5   L   P    c&   P    c'   P    &    B   C   #�   J#  A    P   P    L#   1    r    u   2    x    M   #�   L   P    c(   P    c'   P    &    B   C   #�   J#  5   i   #�   T�  R    #�   q   #�   I   P    1    7    u   P����P����P    @   @����T�  J�  #�   L   P    r    B    P    i   x    C   #�   F�  r    B    P   &    x    P    P    P    P    O�   M    O/   #�   J�  -   5    R    #�   q   #�   I    1    P   P    L"   1   1   M   #�   A    1   U   #�   A    R   #�   q   #�   I   P    b   #�   L   P    c)   1    u   C   #�   A    u   f�   b   #�   A    P    2   p   U   #�   i   1    7    u   P    4   P����P    @   @����T�  J
  #�   A    r   u   2   P    r    B   P   x    X   #�   J�  -   5   #�   i   1    7    u   P    4    P����P    @   @����T  J3  #�   L   P    c   P    c   2    P    c   P    r    B   P    x    P    c*   1    r    u   2    x    P    c	   C   #�   J  -   5   L   P    c   P����P    c!   P����P    c+   P����P    c   P    L   1   C   FH  c,   JI  c-   C   #�   L   P    c#   P    c.   P    &    B    C   #�   B    P    B   O   #�   Fv  B    b   #�   J`  Jt  B   P����O{   Fi  L   P    C   #�   J_  B   P����O{   F�  i   1    7    u   P    4   P����P    @   @����Ty  J�  #�   A    r   u   2   P    r    B   P   x    X   #�   Jv  -   5   J_  B   P����O{   F	  L   P    A   C   O^   F�  L   P    A    u   C   O^   #�   F�  A    u   #�   R   #�   B   OJ   b   #�   A    u   #�   F�  L   P    L"   u
   P    L   1    u   P    c	   P    c
   C   Oc   P    c/   Oc   P    L   2   C   Oc   P    c   Oc   P    c   C   #�   L   P    c   1    u   P    c0   1    u   P    L"   u	   C   #�   L   P    A   C   #�   F�  A   1    u   C   #�   J�  A    u   1    u   C   #�   A    u   #�   F�  L   P    c   C   #�   L   P    c   C   #�   L   P    c1   P����P    c2   P����P    c3   C   #�   L   P    c#   P    c.   P    &    B   C   #�   J_  L   P    A    r    u   P    B    x    C   #�   F  L   P    c#   P    c4   P    &    B   C   #�   Jl  L   P    A    r    u   P    B    x    C   #�   F5  L   P    c#   P    c5   P    &    B   C   #�   Jl  L
   P    A    r    u   P    B    x    C   #�   FK  L   P    c#   P    c6   P    &    B   C   #�   Jl  L	   P    A    r    u   P    B    x    C   #�   Fl  L   P    c7   P    c8   1    r    u   2    x    f�   1    r    u   2    x    f�   P    &    B   C   #�   A    r   u   2    2   X   #�   J_  5   J�  L   P    c9   2    P    c:   2   P    c;   C   #  5   i   #  T  R    #  q   #  I   P    b    i    b	   #  L   P    A   C   #  F�  A   b    #  L    C    a   #  A   f�   O^   #  F�  A    P   P    L$   1   M   #  R   #  1    u   f�   p   b   #  i   1    7    u   P    4   P����P    @   @����T�  J�  #  r   B   2   P    r    B   P   x    X   #  J�  -   5   B    P    A   f�   O   F�  L   P    r    A   2    OJ   b    O,   x    P    c4   P    &    B   P    c   P    &    B   P    c   P    &    B   C   #  B   P    A    u   f�   O   #  F�  B   b
   #  J�  J�  B
   P����O{   F   L   P    C   #  J�  B
   P����O{   F  i   1    7    u   P    4   P����P    @   @����T  J  #  r   B   2   P    r    B   P   x    X   #  J  -   5   J�  B
   P����O{   F�  B	   OJ   b	   #  A    u   #  FU  L   P    L"   u
   P    L   1    u   P    c	   P    c
   C   Oc   P    c/   Oc   P    L   2	   C   Oc   P    c   Oc   P    c   C   #  L   P    c   1    u   P    c0   2   P    L"   u	   C   #  L   P    A   C   #!  F`  A   2   C   #!  Jq  L   P    A    u   C   #"  Fm  A    u   2   C   #"  Jq  B   ##  R   ##  A    u   #$  F  L   P    c   C   #$  L   P    c   C   #$  J�  L	   P    r    B   P    B   x    C   #%  F�  L   2   P    c8   P    r    B   2   x    f�   P    r    B   2   x    f�   P    &    B   C   #&  B   b   #'  r   B   2   2   X   #)  J�  5
   5
   J�  R    #-  q   #>  I   P    L   C    b   #?  i    P    7    B   P����P����P    @   @����T�  J�  #@  L   P    B    C   O^   T�  B    f�   P    i   O�   #A  F�  L   P    c<   P    L   P   C   Oc   C   #B  L
   P    r    B    P    i    x    C   O^   #C  F�  L   P    c   C   #C  A    d   u   P    P    p   2    Og   Ou   Ou   U   #D  J�  -   5    R    #F     $ox$end 