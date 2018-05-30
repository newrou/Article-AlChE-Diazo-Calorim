#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <fftw3.h>

int
main ( void )
{
    int i;
    fftw_complex *in;
    fftw_complex *in2;
    int n = 10;
    fftw_complex *out;
    fftw_plan plan_backward;
    fftw_plan plan_forward;

    //Создаем входные данные
    in = fftw_malloc ( sizeof ( fftw_complex ) * n );
    printf ( "Input Data:\n" );
    for ( i = 0; i < n; i++ ){
        in[i][0] = cos(i*3.1415/n);in[i][1] = 0;
        printf ( "  %3d  %12f  %12f\n", i, in[i][0], in[i][1] );
    }

    //Выполняем прямое преобразование Фурье
    out = fftw_malloc ( sizeof ( fftw_complex ) * n );
    plan_forward = fftw_plan_dft_1d ( n, in, out, FFTW_FORWARD, FFTW_ESTIMATE );
    fftw_execute ( plan_forward );

    printf ( "Output FFT Coefficients:\n" );
    for ( i = 0; i < n; i++ )
        printf ( "  %3d  %12f  %12f\n", i, out[i][0], out[i][1] );

    //Выполняем обратное преобразование Фурье
    in2 = fftw_malloc ( sizeof ( fftw_complex ) * n );
    plan_backward = fftw_plan_dft_1d ( n, out, in2, FFTW_BACKWARD, FFTW_ESTIMATE );
    fftw_execute ( plan_backward );

    printf ( "Recovered input data:\n" );
    for ( i = 0; i < n; i++ )
        printf ( "  %3d  %12f  %12f\n", i, in2[i][0]/(double)(n), in2[i][1]/(double)(n) );

    //Прибираем за собой
    fftw_destroy_plan ( plan_forward );
    fftw_destroy_plan ( plan_backward );
    fftw_free ( in );
    fftw_free ( in2 );
    fftw_free ( out );

  return 0;
}
