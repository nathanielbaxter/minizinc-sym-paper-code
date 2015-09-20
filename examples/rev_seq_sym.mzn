rev_seq_sym(array[int] of var int: x) = 
  let {
    int: l = length(x),
    array[1..2,1..l] of 1..l:
      y = array2d(1..2, 1..l,
        [ if i == 1 then j
          else l - j + 1 endif
        | i in 1..2, j in 1..l ] )
  } in var_perm_sym(x,y);
