reset

folder='n32'
arch='bdw'

set key center top
set xtics ("1(36)" 0, "2(18)" 1, "3(12)" 2, "6(6)" 3, "9(4)" 4)
set xlabel "OpenMP threads (MPI tasks per node)"
set ylabel "Time spent in electrons / sec"

wbox=0.1
set boxwidth wbox
set style fill solid

#set yrange [120:]
p '< grep " 1ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u ($0-7*wbox/2):5 with boxes fs solid 0.5 lc 1 t 'v6.2 ntg-1', \
  '< grep " 2ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u ($0-5*wbox/2):5 with boxes fs solid 0.5 lc 2 t 'v6.2 ntg-2', \
  '< grep " 4ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u ($0-3*wbox/2):5 with boxes fs solid 0.5 lc 3 t 'v6.2 ntg-4', \
  '< grep " 8ntg" LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'   u ($0-1*wbox/2):5 with boxes fs solid 0.5 lc 6 t 'v6.2 ntg-8', \
  '< grep " 1ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u ($0+1*wbox/2):5 with boxes lc 1 t 'v6.3 ntg-1', \
  '< grep " 2ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u ($0+3*wbox/2):5 with boxes lc 2 t 'v6.3 ntg-2', \
  '< grep " 4ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u ($0+5*wbox/2):5 with boxes lc 3 t 'v6.3 ntg-4', \
  '< grep " 8ntg" LCRC-Bebop/'.folder.'/time_'.arch.'.dat'        u ($0+7*wbox/2):5 with boxes lc 6 t 'v6.3 ntg-8'

pause -1

#set yrange [30:]
set ylabel "Time spent in hpsi / sec"
p '< grep " 1ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u ($0-7*wbox/2):7 with boxes fs solid 0.5 lc 1 t 'v6.2 ntg-1', \
  '< grep " 2ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u ($0-5*wbox/2):7 with boxes fs solid 0.5 lc 2 t 'v6.2 ntg-2', \
  '< grep " 4ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u ($0-3*wbox/2):7 with boxes fs solid 0.5 lc 3 t 'v6.2 ntg-4', \
  '< grep " 8ntg"  LCRC-Bebop-v6.2/'.folder.'/time_'.arch.'.dat'  u ($0-1*wbox/2):7 with boxes fs solid 0.5 lc 6 t 'v6.2 ntg-8', \
  '< grep " 1ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u ($0+1*wbox/2):7 with boxes lc 1 t 'v6.3 ntg-1', \
  '< grep " 2ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u ($0+3*wbox/2):7 with boxes lc 2 t 'v6.3 ntg-2', \
  '< grep " 4ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u ($0+5*wbox/2):7 with boxes lc 3 t 'v6.3 ntg-4', \
  '< grep " 8ntg"  LCRC-Bebop/'.folder.'/time_'.arch.'.dat'       u ($0+7*wbox/2):7 with boxes lc 6 t 'v6.3 ntg-8'
