reset

folder='n32'
arch='knl'

set key center top
set xtics ("1(64)" 0, "2(32)" 1, "4(16)" 2, "8(8)" 3, "16(4)" 4, "32(2)" 5)
set xlabel "OpenMP threads (MPI tasks per node)"
set ylabel "Time spent in electrons / sec"

wbox=0.08
set boxwidth wbox
set style fill solid

#set yrange [120:]
p '< grep " 1ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u (log($2)/log(2)-9*wbox/2):5 with boxes fs solid 0.5 lc 1 t 'v6.2 ntg-1', \
  '< grep " 2ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u (log($2)/log(2)-7*wbox/2):5 with boxes fs solid 0.5 lc 2 t 'v6.2 ntg-2', \
  '< grep " 4ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u (log($2)/log(2)-5*wbox/2):5 with boxes fs solid 0.5 lc 3 t 'v6.2 ntg-4', \
  '< grep " 8ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u (log($2)/log(2)-3*wbox/2):5 with boxes fs solid 0.5 lc 4 t 'v6.2 ntg-8', \
  '< grep " 16ntg" LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat' u (log($2)/log(2)-1*wbox/2):5 with boxes fs solid 0.5 lc 6 t 'v6.2 ntg-16', \
  '< grep " 1ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u (log($2)/log(2)+1*wbox/2):5 with boxes lc 1 t 'v6.3 ntg-1', \
  '< grep " 2ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u (log($2)/log(2)+3*wbox/2):5 with boxes lc 2 t 'v6.3 ntg-2', \
  '< grep " 4ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u (log($2)/log(2)+5*wbox/2):5 with boxes lc 3 t 'v6.3 ntg-4', \
  '< grep " 8ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u (log($2)/log(2)+7*wbox/2):5 with boxes lc 4 t 'v6.3 ntg-8', \
  '< grep " 16ntg" LCRC-Bebop/'.folder.'/time_'.arch.'.dat'      u (log($2)/log(2)+9*wbox/2):5 with boxes lc 6 t 'v6.3 ntg-16'

pause -1

#set yrange [30:]
set ylabel "Time spent in hpsi / sec"
p '< grep " 1ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u (log($2)/log(2)-9*wbox/2):7 with boxes fs solid 0.5 lc 1 t 'v6.2 ntg-1', \
  '< grep " 2ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u (log($2)/log(2)-7*wbox/2):7 with boxes fs solid 0.5 lc 2 t 'v6.2 ntg-2', \
  '< grep " 4ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u (log($2)/log(2)-5*wbox/2):7 with boxes fs solid 0.5 lc 3 t 'v6.2 ntg-4', \
  '< grep " 8ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u (log($2)/log(2)-3*wbox/2):7 with boxes fs solid 0.5 lc 4 t 'v6.2 ntg-8', \
  '< grep " 16ntg" LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat' u (log($2)/log(2)-1*wbox/2):7 with boxes fs solid 0.5 lc 6 t 'v6.2 ntg-16', \
  '< grep " 1ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u (log($2)/log(2)+1*wbox/2):7 with boxes lc 1 t 'v6.3 ntg-1', \
  '< grep " 2ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u (log($2)/log(2)+3*wbox/2):7 with boxes lc 2 t 'v6.3 ntg-2', \
  '< grep " 4ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u (log($2)/log(2)+5*wbox/2):7 with boxes lc 3 t 'v6.3 ntg-4', \
  '< grep " 8ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u (log($2)/log(2)+7*wbox/2):7 with boxes lc 4 t 'v6.3 ntg-8', \
  '< grep " 16ntg" LCRC-Bebop/'.folder.'/time_'.arch.'.dat'      u (log($2)/log(2)+9*wbox/2):7 with boxes lc 6 t 'v6.3 ntg-16'
