/PROG EXAMPLE
/ATTR
COMMENT                 = "Program Comment";
DEFAULT_GROUP           = 1,*,*,*,*;
CONTROL_CODE            = 00000000 00000000;
/MN
   : ! Registers ;
   : R[5] = R[AR[40]];

   : ! Control Flow;
   : LBL[300];
   : FOR R[50] = 1 TO 5;
   :    IF (R[105]=3) THEN;
   :       JMP LBL[500];
   :    ELSE;
   :       ABORT;
   :       END;
   :    ENDIF;
   : ENDFOR;

   : ! Functions;
   : CALL BINPICKING(1, R[30], 'AREASENSOR2');
   : CALL MAGNET_ON;
   : RUN BACKGROUNDPROC;

   : ! Motion;
   : J P[3] 100% CNT10;
   : L PR[3] 100mm/sec FINE;
   : L PR[3] 100cm/min FINE INC;
   : L PR[3] 100cm/min FINE VOFFSET, VR[1];
   : L PR[3] 100cm/min FINE OFFSET, PR[1];
   : C PR[3] PR[4] 100mm/sec FINE; 
   : A PR[3] 100cm/sec CNT100;
      
   : ! Vision & Other;
   : VISION RUN_FIND 'PROCESSNAME';
   : VISION GET_NFOUND 'PROCESSNAME' R[52];
   : WAIT 5sec;
   : FORCE CTRL[2:JIG];
   : MESSAGE[A user message];
   : UALM[3];

/POS
/END
