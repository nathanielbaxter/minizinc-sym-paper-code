include "var_seq_sym.mzn";
include "val_seq_sym.mzn";

% n-queens example in MiniZinc using CP techniques
% vim: ft=zinc ts=4 sw=4 et tw=0
% By Reza Rafeh July 2005
% MiniZinc version
% Peter Stuckey September 30 2006
% Symmetries added July 2012 by G Chu

int: n;                                 % The number of queens.

array [1..n] of var 1..n: q;

predicate 
    noattack(int: i, int: j, var int: qi, var int: qj) =
    qi     != qj     /\
    qi + i != qj + j /\
    qi - i != qj - j;

constraint
    forall (i in 1..n, j in i+1..n) (
        noattack(i, j, q[i], q[j])
    );


constraint var_seq_sym(array2d(1..2, 1..n div 2, [q[i] | i in 1..n div 2] ++ [q[n+1-i] | i in 1..n div 2])); 
constraint val_seq_sym(q, array2d(1..2, 1..n div 2, [i | i in 1..n div 2] ++ [n+1-i | i in 1..n div 2]));

solve :: int_search(q, input_order, indomain_min, complete) satisfy;
