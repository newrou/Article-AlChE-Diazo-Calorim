#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define MaxS 35000

double flow[35000];
double tm[35000];
long nf;
double tmax;

double test_kinetic(double k1, double A01, double C01, double H1, double k2, double A02, double C02, double H2)
{
 double m1,A1,C1,dC1,P1;
 double m2,A2,C2,dC2,P2;
 double t,dt,Psum;
 double Q,d;
 long n,nnf;

 m1=1.0;m2=1.0;
 nnf=nf;

// printf("t, k1=%f k2=%f A01=%f A02=%f C01=%f C02=%f, 0, 0, Hf1, Hf2, Hf\n",k1,k2,A01,A02,C01,C02);
 C1=C01;
 C2=C02;
 dt=tmax/nnf;
 Q=0.0;n=0;
// printf("dt=%f\n",dt);
 for(t=0;t<tmax;t+=dt)
  {
    n++;
    A1=A01-m1*(C1-C01);
    dC1=k1*(A01-m1*(C1-C01))*C1;
    P1=-H1*dC1/dt;
    A2=A02-m2*(C2-C02);
    dC2=k2*(A02-m2*(C2-C02))*C2;
    P2=-H2*dC2/dt;
    Psum=P1+P2;
//    printf("%.1f, %f, %f, %f, %f, %f, %f, %f, %f, %f\n",t,dC1/dt,dC2/dt,A1,A2,C1,C2,Hf1,Hf2,Hf);
    C1+=dC1;
    C2+=dC2;
    if(t<tm[0]) continue;
    d=fabs(Psum-flow[n]);
    Q+=d;
//    printf("t=(%f %f)  P=(%f %f) %f %e\n",t,tm[n+1],Psum,flow[n],d,Q);
  }
 return Q/nnf;
}

void fgetstr(FILE *f, char *s)
{
 long n=0;
 while(n<MaxS && !feof(f)) 
  {
   s[n]=fgetc(f);
   if(s[n]=='\n') break; 
   if(!feof(f)) n++;
  }
 s[n]='\0';
}

long read_hf(char *fname)
{
 char s[MaxS];
 FILE *f;
 float t,T,hf,h,nh;

 f=fopen(fname,"r");
 fgetstr(f,s);
 nf=0;
 while(!feof(f))
  {
   fgetstr(f,s);
   fgetstr(f,s);
   fgetstr(f,s);
   fgetstr(f,s);
   fgetstr(f,s);

   fgetstr(f,s);
   if(s==NULL) continue;
   sscanf(s,"%f,%f,%f,%f,%f",&t,&T,&hf,&h,&nh);
   tmax=t;flow[nf]=nh;tm[nf]=t;
   nf++;
  }
 fclose(f);
 printf("n=%ld   tmax=%f\n",nf,tmax);
 return nf;
}


int main(int argc, char *argv[])
{
 double k1avg,k2avg,C01avg,C02avg,H1avg,H2avg,Q,k1,k2,C01,C02,H1,H2,A01=0.0035185,A02=0.0035185;
 double Qmin,k1opt,k2opt,C01opt,C02opt,H1opt,H2opt,Dp;
 int j;
 long n,iter;
 char *fname;

 for(j=1;j<argc;j++) 
  {
   if(strcmp(argv[j],"-k1")==0) {k1avg=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-k2")==0) {k2avg=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-C01")==0) {C01avg=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-C02")==0) {C02avg=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-H1")==0) {H1avg=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-H2")==0) {H2avg=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-A01")==0) {A01=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-A02")==0) {A02=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-Dp")==0) {Dp=atof(argv[j+1])/100.0;j++;continue;}
   if(strcmp(argv[j],"-n")==0) {n=atol(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-f")==0) {fname=strdup(argv[j+1]);j++;continue;}
  }
 read_hf(fname);
// printf("n=%ld  k1=%e  k2=%e  C01=%e  C02=%e  H1=%e  H2=%e\n",n,k1avg,k2avg,C01avg,C02avg,H1avg,H2avg);

 Qmin=test_kinetic(k1avg, A01, C01avg, H1avg, k2avg, A02, C02avg, H2avg);
 k1opt=k1avg;k2opt=k2avg;C01opt=C01avg;C02opt=C02avg;H1opt=H1avg;H2opt=H2avg;
 printf("Qavg=%e  k1=%e  k2=%e  C01=%e  C02=%e  H1=%e  H2=%e\n",Qmin,k1opt,k2opt,C01opt,C02opt,H1opt,H2opt);
 iter=0;
 for(k1=k1avg*(1-Dp);k1<=k1avg*(1+Dp);k1+=2*Dp*k1avg/n)
  for(k2=k2avg*(1-Dp);k2<=k2avg*(1+Dp);k2+=2*Dp*k2avg/n)
   for(C01=C01avg*(1-Dp);C01<=C01avg*(1+Dp);C01+=2*Dp*C01avg/n)
    for(C02=C02avg*(1-Dp);C02<=C02avg*(1+Dp);C02+=2*Dp*C02avg/n)
     for(H1=H1avg*(1-Dp);H1<=H1avg*(1+Dp);H1+=2*Dp*H1avg/n)
      for(H2=H2avg*(1-Dp);H2>=H2avg*(1+Dp);H2+=2*Dp*H2avg/n)
       {
        iter++;
//      test_kinetic(double k1, double A01, double C01, double H1, double k2, double A02, double C02, double H2)
        Q=test_kinetic(k1, A01, C01, -H1, k2, A02, C02, H2);
//        printf("* Q=%e  k1=%e  k2=%e  C01=%e  C02=%e  H1=%e  H2=%e  Iter=%ld\n",Qmin,k1,k2,C01,C02,H1,H2,iter);
        if(Q<Qmin) {
	    Qmin=Q;k1opt=k1;k2opt=k2;C01opt=C01;C02opt=C02;H1opt=H1;H2opt=H2;
	    printf("** Qopt=%e  k1=%e  k2=%e  C01=%e  C02=%e  H1=%e  H2=%e  iter=%ld\n",Qmin,k1opt,k2opt,C01opt,C02opt,H1opt,H2opt,iter);
	    fflush(stdout);
	}
//      printf("%e  %f  %f  %f  %f\n",Q,k1,k2,C01,C02);
       }
 printf("\n*** Qopt=%e  k1=%e  k2=%e  C01=%e  C02=%e  H1=%e  H2=%e\n",Qmin,k1opt,k2opt,C01opt,C02opt,H1opt,H2opt);
 printf("./test-deconvolution -n 12000 -dt 1500000 -k1 %e -A01 %e -C01 %e -H1 %e -k2 %e -A02 %e -C02 %e -H2 %e > test-deconvolution-85.csv\n", k1opt, A01, C01opt, H1opt, k2opt, A02, C02opt, H2opt);

}
