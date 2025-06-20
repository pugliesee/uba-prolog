% Denir el predicado coprimos(-X,-Y), que genere uno a uno todos los pares de números naturales coprimos
% (es decir, cuyo maximo común divisor es 1), sin repetir resultados. Usar la función gcd del motor aritmético.

% Según la documentación de Prolog:
% gcd(+IntExpr1, +IntExpr2)
% Result is the greatest common divisor of IntExpr1 and IntExpr2. The GCD is always a positive integer. 
% If either expression evaluates to zero the GCD is the result of the other expression.

% Necesitamos instanciar entonces de alguna manera a X y a Y para evaluar gcd.

%! coprimos(-X,-Y)
coprimos(X, Y) :- between(1, inf, X), between(1, X, Y), 1 is gcd(X, Y).