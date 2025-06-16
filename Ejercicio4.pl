juntar([], YS, YS).
juntar([X | XS], YS, [X | LS]) :- juntar(XS, YS, LS).