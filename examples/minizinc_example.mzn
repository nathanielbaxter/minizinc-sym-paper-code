int: n = 4;
array[1..n] of var 1..n: x;

constraint let {
  array[int] of int: p = [ n - i + 1 | i in 1..n ]
  } in
  forall (i in 1..n-1) ( x[p[i]] < x[p[i + 1]] );

constraint
  x[4] < x[3] /\ x[3] < x[2] /\ x[2] < x[1];

constraint all_different(x);

solve satisfy;
