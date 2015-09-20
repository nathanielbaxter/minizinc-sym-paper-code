predicate val_sym(array[int] of var int: x,
                  array[int] of int: s) =
  let { int: l = min(index_set(x)),
        int: u = max(index_set(x)),
        array[1..length(s)] of var l..u+1: p =
          [ min([ u+1 + bool2int(x[j] = s[i])*(j-u-1)
                  | j in index_set(x)
                ]) | i in 1..length(s) ] }
  in
  forall (i in 1..length(s)-1) (
    p[i+1] > min(p[i],u)
  );
