val_sym([x[i,j] | i, j in 1..n],
        [n - i + 1 | i in 1..n]);
var_seq_sym(
  array2d(1..n, 1..n, [x[i,j] | i, j in 1..n]) );
var_seq_sym(
  array2d(1..n, 1..n, [x[j,i] | i, j in 1..n]) );
