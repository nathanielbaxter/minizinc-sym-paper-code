var_sym_ord(array[int] of var int: x,
            array[int] of var int: order) =
  let { array[1..length(x)] of var int:
          x2 = sort_by_var(x, order) }
  in
  var_sym(x2);
