predicate var_seq_sym(array[int,int] of var int: x) =
  let { int: l1 = min(index_set_1of2(x)),
        int: u1 = max(index_set_1of2(x)),
        int: l2 = min(index_set_2of2(x)),
        int: u2 = max(index_set_2of2(x)) }
  in
  forall (i in l1..u1-1) (
    lex_lesseq([ x[i  ,j] | j in l2..u2 ],
               [ x[i+1,j] | j in l2..u2 ])
  );
