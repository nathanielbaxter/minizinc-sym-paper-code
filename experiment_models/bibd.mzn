include "var_seq_sym.mzn";

% bibd.mzn
% vim: ft=zinc ts=4 sw=4 et tw=0
% Ralph Becket <rafe@csse.unimelb.edu.au>
% Tue Oct 23 11:28:06 EST 2007
% Symmetries added July 2012 by G. Chu
%
% Balanced incomplete block designs.  See the following:
% http://mathworld.wolfram.com/BlockDesign.html
% http://www.dcs.st-and.ac.uk/~ianm/CSPLib/prob/prob028/spec.html
%
%
%
% A BIBD (v, b, r, k, lambda) problem is to find a binary matrix of v rows
% of b columns such that each row sums to r, each column sums to k, and
% the dot product beween any pair of distinct rows is lambda.

int: v;
int: k;
int: lambda;

int: b = (lambda * v * (v - 1)) div (k * (k - 1));
int: r = (lambda * (v - 1)) div (k - 1);

array [1..v, 1..b] of var 0..1: m;

    % Every row must sum to r.
    %
constraint forall (i in 1..v) (sum (j in 1..b) (m[i, j]) = r);

    % Every column must sum to k.
    %
constraint forall (j in 1..b) (sum (i in 1..v) (m[i, j]) = k);

    % The dot product of every pair of distinct rows must be lambda.
    %
array [1..v, 1..v, 1..b] of var bool: c;

constraint
    forall (i_a, i_b in 1..v) (
        forall (j in 1..b) (
            c[i_a, i_b, j] =
                if i_a < i_b then m[i_a, j] = 1 /\ m[i_b, j] = 1 else false endif
        )
    );

constraint
    forall (i_a, i_b in 1..v where i_a < i_b) (
        sum (j in 1..b) (bool2int(c[i_a, i_b, j])) = lambda
    );


constraint var_seq_sym(array2d(1..b, 1..v, [m[i,j] | j in 1..b, i in 1..v]));
constraint var_seq_sym(array2d(1..v, 1..b, [m[i,j] | i in 1..v, j in 1..b]));

    % Any solution will do.
    %
%solve satisfy;
solve :: int_search([m[i,j] | i in 1..v, j in 1..b] , input_order, indomain_min, complete) satisfy;

%----------------------------------------------------------------------------%
%----------------------------------------------------------------------------%
