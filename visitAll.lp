at(T,0) :- at(T).
visited(T) :- at(T).

% for each step choose a move
1{move(T1,T2,S) : connected(T1,T2), at(T1,S-1), visit(T2)}1 :- step(S).

at(T2,S) :- move(T1,T2,S).

visited(T2) :- move(T1,T2,S), step(S).

% you must visit every spot you're suppose to
:- visit(T), not visited(T).

count(C) :- C = #count{T1,T2,S : move(T1,T2,S)}.
#minimize{C : count(C)}.

#show move/3.
