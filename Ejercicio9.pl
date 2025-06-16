% Los parametros deben seguir la siguiente forma:
%! desde(+X, -Y)
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

% Detalle: Si Y viene instanciado, el motor de Prolog va a iterar sobre el predicado hasta encontrar que X = Y.
% Cuando X = Y, sucedera que el motor devuelve true y luego entra en la segunda linea, sumando X hasa el infinito
% pues nunca volvera a encontrar otro X = Y.

%! desdeReversible(+X,?Y)
desdeReversible(X, Y) :- nonvar(Y), Y >= X.
desdeReversible(X, Y) :- var(Y), desde(X, Y).