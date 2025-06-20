% Item a)
% inorder(+AB,-Lista), que tenga éxito si AB es un árbol binario y Lista la lista de sus nodos según el
% recorrido inorder.

%! inorder(+AB, -Lista)
inorder(nil, []).
inorder(bin(Izq, R, Der), Lista) :- inorder(Izq, InorderIzq), inorder(Der, InorderDer), append(InorderIzq, [R | InorderDer], Lista).


% Item b)
% arbolConInorder(+Lista,-AB), versión inversa del predicado anterior.

%! arbolConInorder(+Lista, -AB)
arbolConInorder([], nil).
arbolConInorder(XS, bin(Izq, R, Der)) :- append(InorderIzq, [R | InorderDer], XS), 
                                         arbolConInorder(InorderIzq, Izq), 
                                         arbolConInorder(InorderDer, Der).


% Item c)
% aBB(+T), que será verdadero si T es un árbol binario de búsqueda.

%! esABBIzquierda(+R, +InorderAB)
esABBIzquierda(_, []).
esABBIzquierda(R, [X | XS]) :- R > X, esABBIzquierda(R, XS).

%! esABBDerecha(+R, +InorderAB)
esABBDerecha(_, []).
esABBDerecha(R, [X | XS]) :- R < X, esABBDerecha(R, XS).

%! aBB(+T)
aBB(nil).
aBB(bin(Izq, R, Der)) :- aBB(Izq),
                         inorder(Izq, InorderIzq), esABBIzquierda(R, InorderIzq),
                         aBB(Der),
                         inorder(Der, InorderDer), esABBDerecha(R, InorderDer).


% Item d)
% aBBInsertar(+X, +T1, -T2), donde T2 resulta de insertar X en orden en el árbol T1.

%! aBBInsertar(+X, +T1, -T2)
aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(Izq, R, Der), bin(ST2, R, Der)) :- X < R, aBBInsertar(X, Izq, ST2).
aBBInsertar(X, bin(Izq, R, Der), bin(Izq, R, ST2)) :- X > R, aBBInsertar(X, Der, ST2).