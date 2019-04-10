highway(1..910).
depot(1) :- number_depots(X), X>0.
depot(Y+1) :- depot(Y), number_depots(X), Y<X.

% choose a highway spot for each depot
1{depotSpot(D,H) : highway(H), restaurant(R,H)}1 :- depot(D).

% choose a depot for each restaurant
1{restForDepot(D,R) : depot(D)}1 :- restaurant(R,X).

% distance from depot D to restaurant R
distance(D,R,H-H1) :- depotSpot(D,H), restForDepot(D,R), restaurant(R,H1), H>=H1.
distance(D,R,H1-H) :- depotSpot(D,H), restForDepot(D,R), restaurant(R,H1), H<H1.

t(T) :- T= #sum{X,D,R : distance(D,R,X)}.
#minimize{T : t(T)}.

#show depotSpot/2.
