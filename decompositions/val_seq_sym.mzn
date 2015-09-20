predicate val_seq_sym(array[int] of var int: x,
                      array[int,int] of int: s) =
  let { int: l1 = min(index_set_1of2(s)),
        int: u1 = max(index_set_1of2(s)),
        int: l2 = min(index_set_2of2(s)),
        int: u2 = max(index_set_2of2(s)),
        set of int:
          A = { min([s[i,j] | i in l1..u1])
                            | j in l2..u2 },
        set of int:
          B = { s[i,j] | i in l1..u1, j in l2..u2 } 
              diff A,
        int: l = min(index_set(x)),
        int: u = max(index_set(x)),
        array[l..u] of var 0..2: y }
  in
  forall (i in index_set(x)) (
       (y[i] = 0 <-> (x[i] in A))
    /\ (y[i] = 2 <-> (x[i] in B))
  )
  /\
  lex_lesseq(y, [ 1 | i in index_set(x) ]);
