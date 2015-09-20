include "all_different.mzn";
include "val_sym.mzn";
include "var_seq_sym.mzn";

int: n;
array[1..n,1..n] of var 1..n: x;

constraint forall (i in 1..n) (
      all_different([x[i,j] | j in 1..n])
  /\  all_different([x[j,i] | j in 1..n]) );

constraint val_sym([x[i,j] | i, j in 1..n], [n - i - 1 | i in 1..n]);
constraint var_seq_sym(
  array2d(1..n, 1..n, [x[i,j] | i, j in 1..n]) );
constraint var_seq_sym(
  array2d(1..n, 1..n, [x[j,i] | i, j in 1..n]) );

solve satisfy;
