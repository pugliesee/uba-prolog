% Item a)
last([X], X).
last([_ | XS], L) :- last(XS, L).

% Item b)
reverse([X], [X]).
reverse([X | XS], LS) :- reverse(XS, RS), append(RS, [X], LS).

% Item c)
prefijo([], _).
prefijo([X | XS], [X | LS]) :- prefijo(XS, LS).

prefijoUnaLinea(P, LS) :- append(P, _, LS).

% Item d)

% Forma de definir "sufijo" sin hacer uso de formulas anteriores.
sufijo(S, LS) :- append(_, S, LS).

% Forma feucha de definir "sufijo", haciendo uso de formulas que definimos antes.
sufijo2([], _).
sufijo2(XS, LS) :- reverse(XS, XSS), reverse(LS, LSS), prefijo(XSS, LSS).

% Item e)
sublista(S, LS) :- append(_, S, RS), append(RS, _, LS).

% Item f)
pertenece(X, [X]).
pertenece(X, [X | _]).
pertenece(X, [_ | YS]) :- pertenece(X, YS).