predicate val_sym_ord(
    array[int] of var int: x,
    array[int] of int: s,
    array[int] of var int: order) =
  let { array[1..length(x)] of var int:
          x2 = sort_by_var(x, order),
        array[1..length(s)] of int:
          s2 = sort(s) }
  in
  val_sym(x2, s2);
