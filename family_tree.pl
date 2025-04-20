parent(john, mary).
parent(john, tom).
parent(lisa, mary).
parent(lisa, tom).
parent(mary, susan).
parent(mary, sam).
parent(paul, susan).
parent(paul, sam).
parent(tom, linda).
parent(nancy, linda).

male(john).
male(tom).
male(paul).
male(sam).

female(lisa).
female(mary).
female(nancy).
female(susan).
female(linda).

% X is a grandparent of Y if X is parent of Z and Z is parent of Y
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% X and Y are siblings if they share at least one parent and are not the same person
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% X and Y are cousins if their parents are siblings
cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B),
    X \= Y.

% X is a child of Y if Y is a parent of X
child(X, Y) :-
    parent(Y, X).

% X is a descendant of Y (directly/indirectly)
descendant(X, Y) :-
    parent(Y, X).
descendant(X, Y) :-
    parent(Y, Z),
    descendant(X, Z).
