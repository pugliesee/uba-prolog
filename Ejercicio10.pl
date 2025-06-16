% Denir el predicado intercalar(L1, L2, L3), donde L3 es el resultado de intercalar uno a uno los elementos
% de las listas L1 y L2. Si una lista tiene longitud menor, entonces el resto de la lista mas larga es pasado sin
% cambiar. Indicar la reversibilidad, es decir si es posible obtener L3 a partir de L1 y L2, y viceversa.
% Ejemplo: intercalar([a,b,c], [d,e], [a,d,b,e,c]).

listaNoVacia(L) :- length(L, Longitud), Longitud > 0.

intercalar([], [], []).
intercalar([], L2, L2) :- listaNoVacia(L2).
intercalar(L1, [], L1) :- listaNoVacia(L1).
intercalar([L1 | LS1], [L2 | LS2], [L1, L2 | LS3]) :- intercalar(LS1, LS2, LS3).

% Es posible obtener tanto a L3 a partir de L1 y L2, y obtener L1 y L2 a partir de L3.
% Si L1 y L2 no vienen instanciados pero L3 si, obtendremos todas las combinaciones posibles de L1 y L2
% que forman la lista L3.