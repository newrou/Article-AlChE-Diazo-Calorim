#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_multimin.h>

void randomize() {
 struct timeval tv;
 struct timezone tz;

 gettimeofday(&tv,&tz);
 srandom(tv.tv_usec);
}

long rnd(long nmax) {return(rand()%nmax);}
double frnd() {return(1.0*rnd(1000000L)/1000000L);}

long Nx=2;
long Npar=5;

/* Paraboloid centered on (p[0],p[1]), with scale factors (p[2],p[3]) and minimum p[4] */
double my_f (const gsl_vector *v, void *params) {
  double x, y;
  double *p = (double *)params;

  x = gsl_vector_get(v, 0);
  y = gsl_vector_get(v, 1);

  return p[2] * (x - p[0]) * (x - p[0]) + p[3] * (y - p[1]) * (y - p[1]) + p[4];
}

/* The gradient of f, df = (df/dx, df/dy). */
void my_df (const gsl_vector *v, void *params, gsl_vector *df) {
  double x, y;
  double *p = (double *)params;

  x = gsl_vector_get(v, 0);
  y = gsl_vector_get(v, 1);

  gsl_vector_set(df, 0, 2.0 * p[2] * (x - p[0]));
  gsl_vector_set(df, 1, 2.0 * p[3] * (y - p[1]));
}

/* Compute both f and df together. */
void my_fdf (const gsl_vector *x, void *params, double *f, gsl_vector *df) {
  *f = my_f(x, params);
  my_df(x, params, df);
}

int minimizer_BFGS (long Nx, long Npar, double *par, double *rx) {
  size_t iter = 0;
  int status;
  long i;

  randomize();
  const gsl_multimin_fdfminimizer_type *T;
  gsl_multimin_fdfminimizer *s;

  gsl_vector *x;
  gsl_multimin_function_fdf my_func;

  my_func.n = Nx;
  my_func.f = my_f;
  my_func.df = my_df;
  my_func.fdf = my_fdf;
  my_func.params = par;

  /* Starting point, x = (5,7) */
//  x = gsl_vector_alloc (2);
//  gsl_vector_set (x, 0, 51.0);
//  gsl_vector_set (x, 1, 71.0);
  x = gsl_vector_alloc (Nx);
  for(i=0;i<Nx;i++) gsl_vector_set (x, i, 33.3*frnd());

  T = gsl_multimin_fdfminimizer_conjugate_fr;
  s = gsl_multimin_fdfminimizer_alloc (T, 2);

  gsl_multimin_fdfminimizer_set (s, &my_func, x, 0.01, 1e-4);
  printf ("%5d %.5f %.5f %10.5f\n", iter, gsl_vector_get (s->x, 0), gsl_vector_get (s->x, 1), s->f);

  do {
      iter++;
      status = gsl_multimin_fdfminimizer_iterate (s);

      if (status) break;

      status = gsl_multimin_test_gradient (s->gradient, 1e-3);

      if (status == GSL_SUCCESS) printf ("Minimum found at:\n");

      printf ("%5d %.5f %.5f %10.5f\n", iter,
              gsl_vector_get (s->x, 0),
              gsl_vector_get (s->x, 1),
              s->f);

  } while (status == GSL_CONTINUE && iter < 100);

  gsl_multimin_fdfminimizer_free (s);
  gsl_vector_free (x);

  return 0;
}


int main (void) {
  double rx[Nx];
  double par[5] = { 1.0312, 2.0312, 10.0312, 20.0312, 37.00312 }; // Position of the minimum (1,2), scale factors 10,20, height 30.

  return minimizer_BFGS(Nx, Npar, par, rx);
}
