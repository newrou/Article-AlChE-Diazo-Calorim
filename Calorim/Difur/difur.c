#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[])
{
 double k,m,A0,C0,A,C,t,dC,dt;
 int j;

 k=0.1;m=1.0;A0=0.5;C0=0.0001;
 for(j=1;j<argc;j++) 
  {
   if(strcmp(argv[j],"-k")==0) {k=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-A0")==0) {A0=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-C0")==0) {C0=atof(argv[j+1]);j++;continue;}
  }
 C=C0;dt=0.1;
 printf("T, k=%f A0=%f C0=%f, 0, 0\n",k,A0,C0);
 for(t=0;t<100;t+=dt)
  {
    A=A0-m*(C-C0);
    dC=k*(A0-m*(C-C0))*C;
    printf("%.1f, %f, %f, %f\n",t,dC/dt,A,C);
    C+=dC;
  }
}
