% Un árbol binario se representará en Prolog con:
% --> nil, si es vacío.
% --> bin(izq, v, der), donde v es el valor del nodo, izq es el subárbol izquierdo y der es el subárbol derecho.
% Definir predicados en Prolog para las siguientes operaciones: vacío, raiz, altura y cantidadDeNodos. Asumir
% siempre que el árbol está instanciado.

%! vacio(+AB)
vacio(AB) :- AB == nil.

%! raiz(+AB, ?R)
raiz(bin(_, V, _), V).

%! altura(+AB, -A)
altura(nil, 0).
altura(bin(Izq, _, Der), A) :- altura(Izq, AI), altura(Der, AD), max(AI, AD, M), A is M + 1.

%! cantidadDeNodos(+AB, -C).
cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(Izq, _, Der), C) :- cantidadDeNodos(Izq, CI), cantidadDeNodos(Der, CD), C is 1 + CI + CD.

% AUXILIARES
%! max(+N1, +N2, -M)
max(N1, N2, N1) :- N1 >= N2.
max(N1, N2, N2) :- N1 < N2.