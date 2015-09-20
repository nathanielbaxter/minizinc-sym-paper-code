predicate var_seq_sym_ord(
    array[int,int] of var int: x,
    array[int] of var int: order) =
  let { int: l = min(index_set_1of2(x)),
        int: u = max(index_set_1of2(x)),
        int: n = 2*card(index_set_2of2(x)) }
  in
  forall (i in l..u, j in i+1..u) (
    let { array[1..n] of var int:
          y =  [ x[i,k] | k in index_set_2of2(x) ]
            ++ [ x[j,k] | k in index_set_2of2(x) ],
          array[1..2,1..n] of int:
          p = array2d(1..2, 1..n,
               [ k | k in 1..n ]
            ++ [ k+(n div 2) | k in 1..(n div 2) ]
            ++ [ k | k in 1..(n div 2) ]) }
    in 
    var_perm_sym_ord(y, p, order)
  );
