predicate val_seq_sym_ord(
    array[int] of var int: x,
    array[int,int] of int: s,
    array[int] of var int: order) =
  let { array[1..length(x)] of var int:
          x2 = sort_by_var(x, order) }
  in
  val_seq_sym(x2, s);
