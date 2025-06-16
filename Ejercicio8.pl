% Denir el predicado parteQueSuma(+L,+S,-P) que es verdadero cuando P es una lista con elementos de L que
% suman S. Por ejemplo:
% ?- parteQueSuma([1,2,3,4,5],9,P).
% P = [1, 3, 5] ;
% P = [2, 3, 4] ;
% P = [4, 5] ;
% false.

% Primero voy a hacer un predicado auxiliar para la sumatoria

% sumatoria(+L, -S)
sumatoria([], 0).
sumatoria([L | LS], S) :- sumatoria(LS, SP), S is L + SP.

% Ahora tengo que hacer un predicado que me de una instancia de P
% listaConElementosDe(+L, -P).
listaConElementosDe([], []).
listaConElementosDe([L | LS], [L | PS]) :- listaConElementosDe(LS, PS).
listaConElementosDe([_ | LS], PS) :- listaConElementosDe(LS, PS).

parteQueSuma(L, S, P) :- listaConElementosDe(L, P), sumatoria(P, S).