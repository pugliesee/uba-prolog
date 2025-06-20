% Definir el predicado corteMásParejo(+L,-L1,-L2) que, dada una lista de números, realiza el corte mas parejo
% posible con respecto a la suma de sus elementos (puede haber mas de un resultado).

%! corteMasParejo(+L, -L1, -L2)
corteMasParejo(L, L1, L2) :- append(L1, L2, L), not(hayUnCorteMasParejo(L1, L2, L)).

%! hayUnCorteMasParejo(+L1, +L2, +L)
hayUnCorteMasParejo(L1, L2, L) :- append(C1, C2, L), esMasParejo(C1, C2, L1, L2).

%! esMasParejo(+C1, +C2, +L1, +L2)
esMasParejo(C1, C2, L1, L2) :- 
                    sum_list(C1, SC1),
                    sum_list(C2, SC2),
                    sum_list(L1, SL1),
                    sum_list(L2, SL2),
                    abs(SC1 - SC2) < abs(SL1 - SL2).