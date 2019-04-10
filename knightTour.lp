x(1..N) :- size(N).
y(1..N) :- size(N).

tile(X,Y) :- x(X), y(Y).

% at position 1,1 to start
at(1,1).

1{move(X,Y,X1,Y1) : validMove(X,Y,X1,Y1)}1 :- at(X,Y).

validMove(X,Y,X1,Y1) :- x(X), y(Y), x(X1), y(Y1), X-1=X1,Y-2=Y1.
validMove(X,Y,X1,Y1) :- x(X), y(Y), x(X1), y(Y1), X+1=X1,Y-2=Y1.
validMove(X,Y,X1,Y1) :- x(X), y(Y), x(X1), y(Y1), X+2=X1,Y-1=Y1.
validMove(X,Y,X1,Y1) :- x(X), y(Y), x(X1), y(Y1), X+2=X1,Y+1=Y1.
validMove(X,Y,X1,Y1) :- x(X), y(Y), x(X1), y(Y1), X+1=X1,Y+2=Y1.
validMove(X,Y,X1,Y1) :- x(X), y(Y), x(X1), y(Y1), X-1=X1,Y+2=Y1.
validMove(X,Y,X1,Y1) :- x(X), y(Y), x(X1), y(Y1), X-2=X1,Y+1=Y1.
validMove(X,Y,X1,Y1) :- x(X), y(Y), x(X1), y(Y1), X-2=X1,Y-1=Y1.

at(X1,Y1) :- move(X,Y,X1,Y1).

% you have to make the moves they give
:- givenmove(X,Y,X1,Y1), not move(X,Y,X1,Y1).

% you must visit every tile
:- not at(X,Y), tile(X,Y).

% you have to end at 1,1
% you can't move away from 1,1 twice
:- move(1,1,X,Y), move(1,1,X1,Y1), X!=X1, Y!=Y1.
% you have to move to 1,1 once
1{move(X,Y,1,1): validMove(X,Y,1,1)}1.

#show move/4.
