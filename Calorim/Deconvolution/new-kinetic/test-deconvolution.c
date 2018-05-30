#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[])
{
 double k1,m1,A01,C01,A1,C1,dC1,H1,Hf1;
 double k2,m2,A02,C02,A2,C2,dC2,H2,Hf2;
 double k3,m3,A03,C03,A3,C3,dC3,H3,Hf3;
 double t,dt,Hf,tmax;
 int j;
 long n;

 k1=0.1;m1=1.0;A01=0.5;C01=0.01;H1=10.0;
 k2=0.1;m2=1.0;A02=0.5;C02=0.01;H2=100.0;
 dt=0.1;tmax=50;n=10000;
 for(j=1;j<argc;j++) 
  {
   if(strcmp(argv[j],"-k1")==0) {k1=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-A01")==0) {A01=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-C01")==0) {C01=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-H1")==0) {H1=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-k2")==0) {k2=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-A02")==0) {A02=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-C02")==0) {C02=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-H2")==0) {H2=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-dt")==0) {tmax=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-n")==0) {n=atol(argv[j+1]);j++;continue;}
  }
 printf("t, k1=%f k2=%f A01=%f A02=%f C01=%f C02=%f, 0, 0, Hf1, Hf2, Hf\n",k1,k2,A01,A02,C01,C02);
 k3=k2/2.0;m3=m2;H3=H2;
 A1=A01;
 C1=C01;
 C2=0.0;
 C3=0.0;
 dt=tmax/n;
 printf("dt=%f\n",dt);
 for(t=0;t<tmax;t+=dt)
  {
    dC1=k1*A1*C1;
    Hf1=H1*dC1/dt;

    dC2=k2*C1*C1;
    Hf2=H2*dC2/dt;

    dC3=k3*C2*C1;
    Hf3=H3*dC3/dt;

    Hf=Hf1+Hf2+Hf3;
    printf("%.1f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f\n",t,dC1/dt,dC2/dt,A1,C1,C2,C3,Hf1,Hf2,Hf3,Hf);
    A1+=-dC1;
    C1+=dC1-2*dC2-dC3;
    C2+=dC2-dC3;
    C3+=dC3;
  }
}
