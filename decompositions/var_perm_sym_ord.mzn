var_perm_sym_ord(array[int] of var int: x,
	         array[int,int] of int: p,
                 array[int] of var int: order) =
  let { int: n = length(x),
        int: np = card(index_set_1of2(p)),
        array[1..n] of 1..n:
          r = index_sort(x, order),
        array[1..np,1..n] of 1..n:
          pr = array2d(1..np,1..n,
          [ p[i,r[j]] | i in index_set_1of2(p),
                        j in 1..n ]) }
  in
  var_perm_sym(x, pr);
