padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).

% Ejecutar abuelo(X, manuel) retorna "Juan". Esto es esperable, ya que en nuestra base de conocimiento sabemos que
% Luis es el padre de Manuel, y el padre de Luis es Juan.

% Este predicado nos dice que X es hijo de Y
hijo(X, Y) :- padre(Y, X).

% Este predicado nos dice que X es hermano de Y
hermano(X,Y) :- padre(Z, X), padre(Z, Y), X \= Y.

% Este predicado nos dice que X es descendiente de Y
descendiente(X, Y) :- padre(Y, X).
descendiente(X, Y) :- padre(Y, Z), descendiente(X, Z).

% Item d) Para encontrar a los nietos de Juan, alcanza con realizar la consulta 'abuelo(juan, X)'
% Item e) Para conocer a todos los hermanos de Pablo, alcanza con realizar la consulta 'hermano(pablo, X)'

% Item f)
ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).

% Item g) Si se pide mas de un resultado, eventualmente se encuentran todos los ancestros de Juan, pero se siguen buscando
% otros ancestros + infinitamente.
% La primera respuesta es "Juan", puesto que se ingresa por la primera regla, ancestro(X,X)

% Item h) Veamos una mejor forma de reescribir el programa:
ancestroRecargado(X, X).
ancestroRecargado(X, Y) :-  padre(X, Z), ancestroRecargado(Z, Y).