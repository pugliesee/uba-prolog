% Hay que definir el predicado APLANAR, que consiste en una lista de multiples niveles (con mas listas dentro)
% y los contenidos de esa lista deben "devolverse" en una unica lista.

aplanar([], []).
aplanar([X | XS], LS) :- aplanar(X, RS), aplanar(XS, XSS), append(RS, XSS, LS).
aplanar(X, [X]).