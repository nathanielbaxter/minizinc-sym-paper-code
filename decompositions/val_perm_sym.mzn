predicate val_perm_sym(array[int] of var int: x,
                       array[int,int] of int: s) =
  let { int: l = min(index_set_1of2(s)),
        int: u = max(index_set_1of2(s)) }
  in
  forall (i in l..u, j in l..u where i != j) (
    val_perm_sym_pairwise(x,
      [ s[i,k] | k in index_set_2of2(s) ],
      [ s[j,k] | k in index_set_2of2(s) ])
  );

predicate val_perm_sym_pairwise(
    array[int] of var int: x,
    array[int] of int: s1,
    array[int] of int: s2) =
  let { int: l = min(index_set(x)),
        int: u = max(index_set(x)),
        set of int:
          A = { s1[i] | i in index_set(s1)
                       where s1[i] < s2[i] },
        set of int:
          B = { s1[i] | i in index_set(s1)
                      where s1[i] = s2[i] },
        set of int:
          C = { s1[i] | i in index_set(s1)
                      where s1[i] > s2[i] },
        array[l..u] of var 0..2: y }
  in
  forall (i in index_set(x)) (
       y[i] = 0 <-> (x[i] in A)
    /\ y[i] = 2 <-> (x[i] in C)
  )
  /\
  lex_lesseq(y, [1 | i in index_set(x)]);
