int: n;
array[1..n,1..n] of var 1..n: x;

forall (i in 1..n) (
      all_different([x[i,j] | j in 1..n])
  /\  all_different([x[j,i] | j in 1..n]) );
