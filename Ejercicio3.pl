natural(0).
natural(suc(X)) :- natural(X).

% menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
% menorOIgual(X,X) :- natural(X).

% Item a) Ejecutar la consulta menorOIgual(0, X) cuelga el programa infinitamente.
% Esto se debe a que se ingresa siempre en la regla recursiva de menorOIgual, puesto que esta por encima de
% la regla "base".

% Item c) Corrigiendo el programa:

menorOIgual(X,X) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).