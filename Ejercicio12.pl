% Item a)
% inorder(+AB,-Lista), que tenga éxito si AB es un árbol binario y Lista la lista de sus nodos según el
% recorrido inorder.

%! inorder(+AB, -Lista)
inorder(nil, []).
inorder(bin(Izq, R, Der), Lista) :- inorder(Izq, InorderIzq), inorder(Der, InorderDer), append(InorderIzq, [R | InorderDer], Lista).

