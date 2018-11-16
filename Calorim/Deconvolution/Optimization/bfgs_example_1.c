/*       1         2         3         4         5         6         7
  345678901234567890123456789012345678901234567890123456789012345678901
  +--------------------------------------------------------------------
  |                         BFGS Example 1
  +--------------------------------------------------------------------
  | This example is based on Example 11.4 from
  | "Introduction to Optimization" book written by Chong, Edwin K.P.,
  | and Stanislaw H. Zak.
  | 
  | We are going to minimize this quadratic function f(x) by using
  | BFGS algorithm.
  |
  |               f(x) = 1/2*x^T*Q*x - x^T*b + log(PI)
  |
  |     where,
  |
  |         Q = [  5  -3
  |               -3   2 ]
  |
  |         b = [ 0
  |               1 ]
  |
  |         x^T denotes x transpose.
  |
  | This program uses BFGS implementation from GNU Scientific Library
  | (GSL) and matrix operation from OpenBLAS library.
  |
  |  How to compile source code?
  | -----------------------------
  | On FreeBSD 10.3 operating system, execute this command to compile:
  | $ cc bfgs_example_1.c -o bfgs_example_1 \
  |   -I /usr/local/include -L /usr/local/lib -lgsl -lgslcblas -lm
  |
  |  Links
  | -------
  | 1) gsl, https://www.gnu.org/software/gsl/
  | 2) openblas, http://www.openblas.net/
  | 3) freebsd, https://www.freebsd.org/
  |
  +--------------------------------------------------------------------
  |              Language: C
  |              Standard: C89
  |        Compiled using: clang-3.4.2
  |             Tested on: FreeBSD 10.3 (amd64) operating system
  |    Required Libraries: 1) gsl-1.16
  |                        2) openblass-0.2
  |
  |       Author: Nik Mohamad Aizuddin bin Nik Azmi
  |        Email: nik-mohamad-aizuddin@yandex.com
  | Date Created: 07/February/2017
  |     Revision: 1
  +------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_multimin.h>
#include <gsl/gsl_cblas.h>
#include <gsl/gsl_blas.h>


/**
 * Structure of extra input parameters for the
 * objective function.
 */
typedef struct params_t {
    const gsl_matrix *Q;
    const gsl_vector *b;
} params_t;


/*+--------------------------------------------------------------------
  | The quadratic function f(x) that we are going to minimize.
  | This is a callback function will be called by GSL.
  |
  | Input Parameters:
  |     1) x      -- The vector x
  |     2) params -- The extra input parameters
  |         2.1) Q
  |         2.2) b
  |
  | Output Parameters:
  |     None.
  |
  | Returns:
  |     The output of the function.
  +------------------------------------------------------------------*/
double objective_func(const gsl_vector *x, void *params) {
    double a[]   = {0.0f, 0.0f};
    double c[]   = {0.0f};
    double d[]   = {0.0f};

    /** Get the Q matrix and vector b from the input parameter */
    const gsl_matrix *Q = ((params_t *) params)->Q;
    const gsl_vector *b = ((params_t *) params)->b;

    /**
     * These A, B, C, D, and X are matrix representations that
     * will be used for OpenBLAS matrix operations only.
     */
    gsl_matrix_view A = gsl_matrix_view_array(a, 1, 2);
    gsl_matrix_view B = gsl_matrix_view_array(b->data, 2, 1);
    gsl_matrix_view C = gsl_matrix_view_array(c, 1, 1);
    gsl_matrix_view D = gsl_matrix_view_array(d, 1, 1);
    gsl_matrix_view X = gsl_matrix_view_array(x->data, 2, 1);

    /** a = product of x^T and Q */
    gsl_blas_dgemm(CblasTrans,   /** transpose x */
                   CblasNoTrans, /** no transpose for Q */
                   1.0,          /** alpha */
                   &X.matrix,
                   Q,
                   0.0,          /** beta */
                   &A.matrix);   /** output matrix */

    /** d = product of a and x */
    gsl_blas_dgemm(CblasNoTrans, /** no transpose for a */
                   CblasNoTrans, /** no transpose for x */
                   1.0,          /** alpha */
                   &A.matrix,
                   &X.matrix,
                   0.0,          /** beta */
                   &D.matrix);   /** output matrix */

    /** c = product of x^t and b */
    gsl_blas_dgemm(CblasTrans,   /** transpose x */
                   CblasNoTrans, /** no transpose or b */
                   1.0,          /** alpha */
                   &X.matrix,
                   &B.matrix,
                   0.0,          /** beta */
                   &C.matrix);   /** output matrix */

    return (1.0f/2.0f)*d[0] - c[0] + (log(M_PI)/log(10));
} /** end function objective_func() */


/*+--------------------------------------------------------------------
  | This is the gradient function or the derivative function of
  | f(x).
  |
  | Input parameters:
  |    1) v      -- The vector x
  |    2) params -- The extra input parameters
  |        2.1) Q
  |        2.2) b
  |
  | Output parameters:
  |    1) df -- The gradient vector
  |
  | Returns:
  |     Nothing.
  +------------------------------------------------------------------*/
void gradient_func(const gsl_vector *v, void *params, gsl_vector *df)
{
    double a[] = {0.0f, 0.0f};

    /** Get the Q matrix and vector b from the input parameter */
    const gsl_matrix *Q = ((params_t *) params)->Q;
    const gsl_vector *b = ((params_t *) params)->b;

    /**
     * These A, V, and B are matrix representations that
     * will be used for OpenBLAS matrix operations only.
     */
    gsl_matrix_view A = gsl_matrix_view_array(a, 2, 1);
    gsl_matrix_view V = gsl_matrix_view_array(v->data, 2, 1);
    gsl_matrix_view B = gsl_matrix_view_array(b->data, 2, 1);

    /** a = product of matrix Q and vector x */
    gsl_blas_dgemm(CblasNoTrans, /** no transpose for Q */
                   CblasNoTrans, /** no transpose for x */
                   1.0,          /** alpha */
                   Q,
                   &V.matrix,
                   0.0,          /** beta */
                   &A.matrix);   /** output matrix */

    /** a = a - b */
    gsl_matrix_sub(&A.matrix, &B.matrix);

    /**
     * Store the result of the gradient calculations into
     * the vector df.
     */
    gsl_matrix_get_col(df, &A.matrix, 0);
} /** end function gradient_func() */


/*+--------------------------------------------------------------------
  | This function is for GSL optimization purpose, to calculate
  | the objective function and its gradient or derivative function
  | at the same time.
  |
  | Input parameters:
  |     1) x      -- The vector x
  |     2) params -- The extra input parameter
  |         2.1) Q
  |         2.2) b
  | 
  | Output parameters:
  |     1) f  -- The output of the objective function
  |     2) df -- The output of the gradient or derivative of f(x)
  |
  | Return:
  |     Nothing.
  +------------------------------------------------------------------*/
void fdf(const gsl_vector *x, void *params, double *f, gsl_vector *df)
{
    *f = objective_func(x, params);
    gradient_func(x, params, df);
} /** end function fdf() */


/*+--------------------------------------------------------------------
  | For debugging purpose, to see the output for each iteration.
  |
  | Input parameters:
  |     1) s -- The GSL fdf function, here used for retrieving values.
  |     2) k -- The iteration number
  | 
  | Output parameters:
  |     None.
  |
  | Returns:
  |     Nothing.
  +------------------------------------------------------------------*/
void debug_print(const gsl_multimin_fdfminimizer *s, const int k)
{
    const gsl_vector   *x          = NULL;
    const gsl_vector   *g          = NULL;
    const unsigned int STR_BUFLEN  = 128;
    const unsigned int TMP_BUFLEN  = 64;
    char               *strbuf;
    char               *tmpbuf;

    /** Allocate buffers for the output strings */
    strbuf = (char *) malloc(sizeof(char) * STR_BUFLEN);
    tmpbuf = (char *) malloc(sizeof(char) * TMP_BUFLEN);

    /** Make sure the string buffers are clean */
    memset(strbuf, 0x00, STR_BUFLEN);
    memset(tmpbuf, 0x00, TMP_BUFLEN);

    /**
     * Display current iteration.
     */
    if(k != -1)
        sprintf(tmpbuf, "\nAt iteration k = %d,\n", k); 
    else
        sprintf(tmpbuf, "\nInitial state, befure running BFGS\n");
    strcat(strbuf, tmpbuf);

    /**
     * Display current gradient value.
     */
    g = gsl_multimin_fdfminimizer_gradient(s);
    sprintf(tmpbuf, "    g = [%.4lf, %.4lf]\n",
            gsl_vector_get(g, 0), gsl_vector_get(g, 1));
    strcat(strbuf, tmpbuf);

    /**
     * Display current x vector.
     */
    x = gsl_multimin_fdfminimizer_x(s);
    sprintf(tmpbuf, "    x = [%.4lf, %.4lf]\n",
            gsl_vector_get(x, 0), gsl_vector_get(x, 1));
    strcat(strbuf, tmpbuf);

    /**
     * Display current output of the objective function f(x).
     */
    sprintf(tmpbuf, "    f(x) = %.4lf\n",
            gsl_multimin_fdfminimizer_minimum(s));
    strcat(strbuf, tmpbuf);

    fprintf(stdout, "%s", strbuf);
    free(strbuf);
    free(tmpbuf);
} /** end function print_result() */


/**------------------------------------------------------------------*/
/**------------------------------------------------------------------*/


int main(void)
{
    params_t   *params = NULL;
    gsl_matrix *Q      = NULL;
    gsl_vector *b      = NULL;
    gsl_vector *x0     = NULL;
    int        status  = 0;
    int        k       = -1;

    const gsl_multimin_fdfminimizer_type *T;
    gsl_multimin_fdfminimizer            *s;
    gsl_multimin_function_fdf            my_func;

    /** Set matrix Q and vector b */
    Q = gsl_matrix_alloc(2, 2);
    gsl_matrix_set(Q, 0, 0,  5.0f);
    gsl_matrix_set(Q, 0, 1, -3.0f);
    gsl_matrix_set(Q, 1, 0, -3.0f);
    gsl_matrix_set(Q, 1, 1,  2.0f);
    b = gsl_vector_alloc(2);
    gsl_vector_set(b, 0, 0.0f);
    gsl_vector_set(b, 1, 1.0f);

    /** Initial guess, x0 = [0, 0] */
    x0 = gsl_vector_alloc(2);
    gsl_vector_set(x0, 0, 0.0f);
    gsl_vector_set(x0, 1, 0.0f);

    /** Load Q and b to objective function parameter */
    params = (params_t *) malloc(sizeof(params_t));
    params->Q = Q;
    params->b = b;

    T = gsl_multimin_fdfminimizer_vector_bfgs2;
    s = gsl_multimin_fdfminimizer_alloc(T, 2);
    my_func.n      = 2; /** dimension of x and gradient */
    my_func.f      = objective_func;
    my_func.df     = gradient_func;
    my_func.fdf    = fdf;
    my_func.params = params;

    gsl_multimin_fdfminimizer_set(s,
                                  &my_func,
                                  x0,
                                  0.5,      /** step size */
                                  0.0001f); /** tol */

    debug_print(s, k);
    printf("\n---------- BFGS algorithm begin ----------\n");
    k = 0;
    do {
        /**
         * Perform an iteration of optimization.
         * The function will return GSL_SUCCESS if there is
         * no calculation errors when calculating
         * the objective function and its gradient or derivative
         * function.
         */
        status = gsl_multimin_fdfminimizer_iterate(s);

        /** 
         * Check the gradient difference. 
         * The function will return GSL_SUCCESS if the
         * termination criteria has satisfiyed.
         */
        status = gsl_multimin_test_gradient(s->gradient, 0.0001f);

        debug_print(s, k);
        ++k;
    } while(status == GSL_CONTINUE && k < 100);
    printf("\n----------  BFGS algorithm end  ----------\n");

    free(params);
    gsl_multimin_fdfminimizer_free(s);
    gsl_matrix_free(Q);
    gsl_vector_free(b);
    gsl_vector_free(x0);
    return 0;
}
