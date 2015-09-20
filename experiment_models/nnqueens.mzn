include "all_different.mzn";
include "val_sym.mzn";
include "var_seq_sym.mzn";
include "rot_sqr_sym.mzn";

int: n;

array[1..n,1..n] of var 1..n: x;

constraint forall (i in 1..n) (all_different([x[i,j] | j in 1..n]));
constraint forall (i in 1..n) (all_different([x[j,i] | j in 1..n]));

constraint forall (d in 3..2*n-1) (
      all_different([x[i,d-i] | i in 1..n where d-i >= 1 /\ d-i <= n])
  /\  all_different([x[n+1-i,d-i] | i in 1..n where d-i >= 1 /\ d-i <= n])
);

constraint val_sym([x[i,j] | i, j in 1..n], [i | i in 1..n]);
constraint var_seq_sym(array2d(1..2, 1..n*(n div 2), [x[i,j] | i in 1..n div 2, j in 1..n] ++ [x[n+1-i,j] | i in 1..n div 2, j in 1..n]));
constraint var_seq_sym(array2d(1..2, 1..n*(n div 2), [x[j,i] | i in 1..n div 2, j in 1..n] ++ [x[n+1-i,j] | i in 1..n div 2, j in 1..n]));
constraint rot_sqr_sym(x);

solve :: int_search([x[i,j] | i, j in 1..n], input_order, indomain_min, complete) satisfy;

