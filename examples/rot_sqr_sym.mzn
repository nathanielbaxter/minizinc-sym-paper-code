rot_sqr_sym(array[int,int] of var int: x) =
  let { int: n = card(index_set_1of2(x)),
        int: n2 = card(index_set_2of2(x)),
        int: l = n * n,
        array[1..l] of var int:
          y = [ x[i,j] | i in index_set_1of2(x),
                         j in index_set_2of2(x) ],
        array[1..4,1..l] of 1..l: 
          p = array2d(1..4,1..l,
            [ if k == 1 then i*n + j - n else
              if k == 2 then (n - j)*n + i else
              if k == 3 then (n - i)*n + (n - j)+1
              else           i*n + (n - j) - n + 1 
                endif endif endif
            | k in 1..4, i,j in 1..n]) }
  in
  var_perm_sym(y,p);

