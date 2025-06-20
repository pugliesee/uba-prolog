% Un número poderoso es un número natural M tal que por cada número primo P que divide a M, P^2 tambien
% divide a M. Definir el predicado próximoNumPoderoso(+X,-Y) que instancie en Y el siguiente número poderoso
% a partir de X.

%! proximoNumeroPoderoso(+X, -Y)
proximoNumeroPoderoso(X, Y) :- 
                    Inferior is X + 1,
                    between(Inferior, inf, N),
                    primosQueDividen(N, PN),
                    esPoderoso(N, PN),
                    not(esPrimo(N)),
                    Y is N,
                    !.

% Tengo que definir primero un predicado que me diga todos los números PRIMOS que dividen al número pasado por parámetro.
%! primosQueDividen(+X, -PS)
primosQueDividen(X, PS) :- findall(Numero, (Limite is X - 1, between(2, Limite, Numero), esPrimo(Numero), 0 is X mod Numero), PS).

%! esPrimo(+N)
esPrimo(N) :- N > 1, Limite is N - 1, forall(between(2, Limite, Divisor), (R is N mod Divisor, R \= 0)).

% Tenemos que ver si un número es poderoso.
%! esPoderoso(+X, +PS)
esPoderoso(_, []).
esPoderoso(X, [P | PS]) :- P2 is P * P, 0 is X mod P2, esPoderoso(X, PS).