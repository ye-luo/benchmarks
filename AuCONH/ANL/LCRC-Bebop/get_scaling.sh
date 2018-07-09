arch=bdw

grep "electrons    :" n*/${arch}_n*_t*/*.out > scaling_${arch}.tmp.dat

echo "# nodes threads rpn ndiag ntg electrons" > scaling_${arch}.dat
grep 1t scaling_${arch}.tmp.dat | grep n8   | sort -n -k6 | head -1 >> scaling_${arch}.dat
grep 1t scaling_${arch}.tmp.dat | grep n16  | sort -n -k6 | head -1 >> scaling_${arch}.dat
grep 1t scaling_${arch}.tmp.dat | grep n32  | sort -n -k6 | head -1 >> scaling_${arch}.dat
grep 1t scaling_${arch}.tmp.dat | grep n64  | sort -n -k6 | head -1 >> scaling_${arch}.dat
grep 1t scaling_${arch}.tmp.dat | grep n128 | sort -n -k6 | head -1 >> scaling_${arch}.dat

echo "# OpenMP" >> scaling_${arch}.dat
grep n8   scaling_${arch}.tmp.dat | sort -n -k6 | head -1 >> scaling_${arch}.dat
grep n16  scaling_${arch}.tmp.dat | sort -n -k6 | head -1 >> scaling_${arch}.dat
grep n32  scaling_${arch}.tmp.dat | sort -n -k6 | head -1 >> scaling_${arch}.dat
grep n64  scaling_${arch}.tmp.dat | sort -n -k6 | head -1 >> scaling_${arch}.dat
grep n128 scaling_${arch}.tmp.dat | sort -n -k6 | head -1 >> scaling_${arch}.dat

rm scaling_${arch}.tmp.dat
