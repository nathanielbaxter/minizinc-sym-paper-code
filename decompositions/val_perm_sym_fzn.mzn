predicate val_perm_sym(array[int] of var int: x,
                       array[int,int] of int: s) =
  let { int: n = card(index_set_1of2(s)) }
  in
  val_perm_sym_fzn(x, n, 
    [s[i,j] i in index_set_1of2(s),
            j in index_set_20f2(s)]);

predicate val_perm_sym_fzn(
  array[int] of var int: x, int: n,
  array[int] of int: s);
