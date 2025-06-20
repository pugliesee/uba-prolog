% Un cuadrado semi-mágico es una matriz cuyas filas suman TODAS el mismo valor.

% Definir el predicado cuadradoSemiMágico(+N, -XS). El predicado debe ir devolviendo matrices (utili-
% zando la representación antes mencionada), que sean cuadrados semi-mágicos de dimensión N*N. Dichas
% matrices deben devolverse de manera ordenada: primero aquellas cuyas las suman 0, luego 1, luego 2, etc

% Primero vamos a definir la generación de una lista de tamaño N que sume X.
%! listaQueSumaDeTamanioN(+X, +N, -Lista)
listaQueSumaDeTamanioN(X, N, Lista) :- length(Lista, N), instanciaListaQueSumaX(Lista, X), sum_list(Lista, X).

% Como sum_list(+L, -X), necesitamos tener la lista de números instanciada
%! instanciaListaQueSumaX(-Lista, +X)
instanciaListaQueSumaX([], _).
instanciaListaQueSumaX([Valor | LS], X) :- between(0, X, Valor), instanciaListaQueSumaX(LS, X).

%! generarCuadradoSemiMagico(+M, +N, Suma, -XS)
generarCuadradoSemiMagico(0, _, _, []).
generarCuadradoSemiMagico(M, N, Suma, [X | XS]) :- M \= 0, listaQueSumaDeTamanioN(Suma, N, X), O is M - 1, generarCuadradoSemiMagico(O, N, Suma, XS).

%! cuadradoSemiMagico(+N, -XS)
cuadradoSemiMagico(N, XS) :- between(0, inf, Suma), generarCuadradoSemiMagico(N, N, Suma, XS).