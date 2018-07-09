reset

set key right top
set yrange [5:9]
set xtics ("8" 0, "16" 1, "32" 2, "64" 3, "128" 4)
set ytics ("32" 5, "64" 6, "128" 7, "256" 8, "512" 9)
set xlabel "Number of Broadwell/KNL nodes"
set ylabel "Time / sec"

log_b(x)=log(x)/log(2)

p '< grep t1 LCRC-Bebop/scaling_bdw.dat' u (log_b($1)-3):(log_b($6)) w lp t "BDW v6.3 MPI only", \
  '< grep -v t1 LCRC-Bebop/scaling_bdw.dat' u (log_b($1)-3):(log_b($6)) w lp t "BDW v6.3 MPI/OpenMP", \
  '< grep t1 LCRC-Bebop/scaling_knl.dat' u (log_b($1)-3):(log_b($6)) w lp t "KNL v6.3 MPI only", \
  '< grep -v t1 LCRC-Bebop/scaling_knl.dat' u (log_b($1)-3):(log_b($6)) w lp t "KNL v6.3 MPI/OpenMP"
