#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>

#define MaxS 100000
#define MaxIter 100000

void randomize()
{
 struct timeval tv;
 struct timezone tz;

 gettimeofday(&tv,&tz);
 srandom(tv.tv_usec);
}

long rnd(long nmax) {return(rand()%nmax);}

double frnd() {return(1.0*rnd(1000000L)/1000000L);}

void fgetstr(FILE *f, char *s)
{
 long n=0;
 while(!feof(f)) 
  {
   s[n]=fgetc(f);
   if(s[n]=='\n') break; 
   if(s[n]!=EOF) n++;
   if(n>=MaxS) {s[n]='\0';break;}
  }
 s[n]='\0';
}

float shake(float x, float d) {return x+d*(2*frnd()-1.0);}

int main(int argc, char *argv[])
{
 char s[MaxS],Atom[MaxS];
 long i,j;
 float dx=0.002,dy=0,dz=0.002,d=0.002;
 float x,y,z;
 FILE *in,*out;

 randomize();
 in=stdin;out=stdout;
 for(j=1;j<argc;j++) 
  {
   if(strcmp(argv[j],"-dx")==0) {dx=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-dy")==0) {dy=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-dz")==0) {dz=atof(argv[j+1]);j++;continue;}
   if(strcmp(argv[j],"-d")==0) {d=atof(argv[j+1]);j++;dx=d;dy=d;dz=d;continue;}
   if(strcmp(argv[j],"-i")==0) {in=fopen(argv[j+1],"r");j++;continue;}
   if(strcmp(argv[j],"-o")==0) {out=fopen(argv[j+1],"w");j++;continue;}
  }

 fgetstr(in,s);fprintf(out,"%s\n",s);
 fgetstr(in,s);fprintf(out,"%s\n",s);
 fgetstr(in,s);fprintf(out,"%s\n",s);
 fgetstr(in,s);fprintf(out,"%s\n",s);
 fgetstr(in,s);fprintf(out,"%s\n",s);
 fgetstr(in,s);fprintf(out,"%s\n",s);
 fgetstr(in,s);fprintf(out,"%s\n",s);
 fgetstr(in,s);fprintf(out,"%s\n",s);
 while(!feof(in))
  {
   fgetstr(in,s);
   if(strlen(s)==0) break;
   sscanf(s,"%s %f %f %f",Atom,&x,&y,&z);
   fprintf(out,"  %s   %f   %f   %f\n",Atom,shake(x,dx),shake(y,dy),shake(z,dz));
  }
 while(!feof(in))
  {
   fgetstr(in,s);
   fprintf(out,"%s\n",s);
  }
 fclose(in);
 fclose(out);
}
