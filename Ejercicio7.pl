% Item a) Definir interseccion(+L1, +L2, -L3) tal que L3 contenga la interseccion sin repetidos de L1 y L2.
% Consultar como hacerla sin el NOT

interseccion([], _, []).
interseccion([X | XS], YS, [X | RS]) :- interseccion(XS, YS, RS), member(X, YS), not(member(X, RS)).
interseccion([_ | XS], YS, RS) :- interseccion(XS, YS, RS).


% Item b) partir(N, L, L1, L2), donde L1 tiene los N primeros elementos de L, y L2 el resto. Si L tiene menos de N
% elementos el predicado debe fallar. Cuán reversible es este predicado? Es decir, qué parámetros pueden
% estar indenidos al momento de la invocación?

% L1 y L2 pueden NO estar definidos en el momento de la invocacion del predicado.
% N y L son necesarios para saber si falla o no el mismo.

partir(N, L, _, _) :- length(L, LT), LT >= N.


% Item c) borrar(+ListaOriginal, +X, -ListaSinXs), que elimina todas las ocurrencias de X de la lista ListaOriginal.

borrar([], _, []).
borrar([X | XS], X, RS) :- borrar(XS, X, RS).
borrar([X | XS], Y, [X | RS]) :- X \= Y, borrar(XS, Y, RS).


% Item d) sacarDuplicados(+L1, -L2), que saca todos los elementos duplicados de la lista L1.

sacarDuplicados([], []).
sacarDuplicados([X | XS], [X | LS]) :- borrar(XS, X, RS), sacarDuplicados(RS, LS).


% permutación(+L1, ?L2), que tiene éxito cuando L2 es permutación de L1. Hay una manera mas eficiente
% de definir este predicado para cuando L2 está instanciada?

permutacion([], []).
permutacion(LS, [L | RS]) :- select(L, LS, RSS), permutacion(RSS, RS).


% reparto(+L, +N, -LListas) que tenga éxito si LListas es una lista de N listas (N ≥1) de cualquier
% longitud - incluso vacías - tales que al concatenarlas se obtiene la lista L.

reparto(L, 0, [L]).
reparto(L, N, [L1 | LListas]) :- N \= 0, append(L1, L2, L), X is N-1, reparto(L2, X, LListas).


% repartoSinVacías(+L, -LListas) similar al anterior, pero ninguna de las listas de LListas puede ser
% vacía, y la longitud de LListas puede variar.

repartoSinVacias([], []).
repartoSinVacias(L, [L1 | LListas]) :- append(L1, L2, L), L1 \= [], repartoSinVacias(L2, LListas).