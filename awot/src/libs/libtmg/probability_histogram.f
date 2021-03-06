      SUBROUTINE PROBABILITY_HISTOGRAM(A,N,BADDATA,BIN_MIN,BIN_INC,
     $N_BINS,PROBABILITY_HIST,N_TOT)

C  Thomas Matejka NOAA/NSSL 15 July 1996

      IMPLICIT NONE
      INTEGER::N,N_TOT,N_BINS,I_BIN
      INTEGER,DIMENSION(N_BINS)::NUMBER_HIST
      REAL::BADDATA,BIN_MIN,BIN_INC
      REAL,DIMENSION(N)::A
      REAL,DIMENSION(N_BINS)::PROBABILITY_HIST

      CALL NUMBER_HISTOGRAM(A,N,BADDATA,BIN_MIN,BIN_INC,N_BINS,
     $NUMBER_HIST,N_TOT)
      IF(N_TOT.GE.1)THEN
         DO I_BIN=1,N_BINS
            PROBABILITY_HIST(I_BIN)=FLOAT(NUMBER_HIST(I_BIN))/
     $      FLOAT(N_TOT)
         ENDDO
      ELSE
         DO I_BIN=1,N_BINS
            PROBABILITY_HIST(I_BIN)=0.
         ENDDO
      ENDIF
      END
