arch=knl
node=$1

if [ $# -ne 1 ]
then
  echo "needs two arguments: node"
  exit
fi

echo "# processor   nt  ndiag  ntg  electrons cegterg  h_psi  cdiaghg  rest" > time_${arch}.dat

for ntg in 1 2 4 8 16 32
do
  echo "# ntg-$ntg" >> time_${arch}.dat
  grep "electrons    :" ${arch}_n${node}*/*-${ntg}ntg.out | \
    sed "s/_n${node}_t/   /" | \
    sed "s/\/pw-.*rpn-.*t-4pool-/   /" | \
    sed "s/diag-/   /" | \
    sed "s/.out.*CPU    /   /" | \
    sed "s/s WALL.*$//" > time_tmp1.dat
  grep "cegterg  " ${arch}_n${node}*/*-${ntg}ntg.out | \
    sed "s/${arch}_n${node}_t.*CPU    /  /" | \
    sed "s/s WALL.*$//" > time_tmp2.dat
  grep "h_psi  " ${arch}_n${node}*/*-${ntg}ntg.out | \
    sed "s/${arch}_n${node}_t.*CPU    /  /" | \
    sed "s/s WALL.*$//" > time_tmp3.dat
  grep "cdiaghg  " ${arch}_n${node}*/*-${ntg}ntg.out | \
    sed "s/${arch}_n${node}_t.*CPU    /  /" | \
    sed "s/s WALL.*$//" > time_tmp4.dat
  paste -d " " time_tmp1.dat time_tmp2.dat time_tmp3.dat time_tmp4.dat | sort -k 2 -n | sed "s/8   64/8    64/" >> time_${arch}.dat 
done

rm time_tmp1.dat time_tmp2.dat time_tmp3.dat time_tmp4.dat
cat time_${arch}.dat

