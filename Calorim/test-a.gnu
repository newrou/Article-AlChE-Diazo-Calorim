
set terminal svg size 1200,900 font "Helvetica,18"
set xrange [0.0001:10000]

n1=1
m1=1

n2=0
m2=2

n3=2
m3=0

a0 = 0.0001
k1 = 0.03
k2 = 0.03
k3 = 0.03
a1 = a0
a2 = a0
a3 = a0

array v1[1001]
array v2[1001]
array v3[1001]

do for [x=1:1000] {
    v1[x] = k1*a1**m1*(1-a1)**n1
    a1 = a1 + v1[x]

    v2[x] = k2*a2**m2*(1-a2)**n2
    a2 = a2 + v2[x]

    v3[x] = k3*a3**m3*(1-a3)**n3
    a3 = a3 + v3[x]
}

set output "test-a.svg"
plot v1 with lines, v2 with lines, v3 with lines
