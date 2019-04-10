size(3).
  
x(1..S), y(1..S) :- size(S).

tile(X,Y) :- x(X), y(Y).

neighbor(X,Y,X+1,Y) :- tile(X,Y), tile(X+1,Y).
neighbor(X,Y,X-1,Y) :- tile(X,Y), tile(X-1,Y).
neighbor(X,Y,X,Y+1) :- tile(X,Y), tile(X,Y+1).
neighbor(X,Y,X,Y-1) :- tile(X,Y), tile(X,Y-1).

neighbor(X1,Y1,X,Y) :- neighbor(X,Y,X1,Y1), tile(X,Y), tile(X1,Y1).

live(X,Y) :- 3 <= #count{X,Y,X1,Y1 : neighbor(X,Y,X1,Y1), tile(X,Y), tile(X1,Y1)}.

lives(T,R) :- 2 <= #count{T,R,T1,R1 : neighbor(T,R,T1,R1)} <= 3, tile(T,R).

dies(X,Y) :- 2 > #count{X,Y,X1,Y1 : neighbor(X,Y,X1,Y1), tile(X,Y), live(X,Y), tile(X1,Y1), live(X1,Y1)} > 3.

nonLiving(X,Y) :- not live(X,Y), tile(X,Y).
nonLiving(X,Y) :- dies(X,Y), tile(X,Y).

count(N) :- N = #count{X,Y : nonLiving(X,Y)}.
#minimize{N : count(N)}.

#show lives/2.
