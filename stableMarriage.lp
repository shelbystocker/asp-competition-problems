man(M) :- manAssignsScore(M,W,S).
woman(W) :- womanAssignsScore(W,M,S).

1{match(M,W): woman(W)}1 :- man(M).

% woman can't be matched with more than one man
:- match(M,W), match(M1,W), M!=M1.

% man can't be matched with more than one woman
:- match(M,W), match(M,W1), W!=W1.

% this man and another woman want to be together
:- match(M,W), manAssignsScore(M,W,S), woman(W1), manAssignsScore(M,W1,S1), S1 > S, match(M1,W1), womanAssignsScore(W1,M1,S3), womanAssignsScore(W1,M,S2), S2 > S3.

#show match/2.
