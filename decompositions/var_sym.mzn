predicate var_sym(array[int] of var int: x) =
  let { int: l = min(index_set(x)),
        int: u = max(index_set(x)) }
  in
  forall(i in l..u-1) ( x[i] <= x[i+1] );
