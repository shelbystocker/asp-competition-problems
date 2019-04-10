x(0..X-1) :- area(X,Y).
y(0..Y-1) :- area(X,Y).

tile(X,Y) :- x(X), y(Y).

% for each square S with dimension D choose a location
1{location(S,X,Y) : tile(X,Y)}1 :- square(S,D).

% defines tiles X1,Y1 taken by square S
taken(S,X1,Y1) :- location(S,X,Y), square(S,D), tile(X1,Y1), X1>X, Y1>Y, X1<X+D, Y1<Y+D.
taken(S,X1,Y1) :- location(S,X,Y), square(S,D), tile(X1,Y1), Y1=Y, X1>X, X1<X+D.
taken(S,X1,Y1) :- location(S,X,Y), square(S,D), tile(X1,Y1), X1=X, Y1>Y, Y1<Y+D.

% any upper left corner of a square is taken
taken(S,X,Y) :- location(S,X,Y).

% you can't have the upper left corner of a square in a taken spot unless it is the same square
:- location(S,X,Y), taken(S1,X,Y), S!=S1.

% a tile can't be taken by 2 different squares
:- taken(S,X,Y), taken(S1,X,Y), S!=S1.

% no 2 squares on same location
:- location(S,X,Y), location(S2,X,Y), S!=S2.

% the entire square must remain in the grid
:- location(S,X,Y), square(S,D), not x(X+D-1).
:- location(S,X,Y), square(S,D), not y(Y+D-1).

#show location/3.
