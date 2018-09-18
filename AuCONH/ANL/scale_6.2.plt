reset

set key left top
set xrange [0:4.5]
set xtics ("8" 0, "16" 1, "32" 2, "64" 3, "128" 4)
set ytics ("1" 0, "2" 1, "4" 2, "8" 3, "16" 4)
set xlabel "Number of Broadwell nodes"
set ylabel "Speed-up"

ref1=485.16
ref2=444.17

p '< grep t1 LCRC-Bebop-v6.2/scaling_bdw.dat' u (log($1)/log(2)-3):(log(ref1/$6)/log(2)) w lp t "v6.2 MPI only", \
  '< grep -v t1 LCRC-Bebop-v6.2/scaling_bdw.dat' u (log($1)/log(2)-3):(log(ref1/$6)/log(2)) w lp t "v6.2 MPI/OpenMP", \
  x lc 0 t ""

pause -1

set key left top
set xrange [0:4.5]
set xtics ("8" 0, "16" 1, "32" 2, "64" 3, "128" 4)
set ytics ("1" 0, "2" 1, "4" 2, "8" 3, "16" 4)
set xlabel "Number of KNL nodes"
set ylabel "Speed-up"

#ref1=
ref2=415.46

p '< grep t1 LCRC-Bebop-v6.2/scaling_knl.dat' u (log($1)/log(2)-3):(log(ref1/$6)/log(2)) w lp t "v6.2 MPI only", \
  '< grep -v t1 LCRC-Bebop-v6.2/scaling_knl.dat' u (log($1)/log(2)-3):(log(ref1/$6)/log(2)) w lp t "v6.2 MPI/OpenMP", \
  x lc 0 t ""
