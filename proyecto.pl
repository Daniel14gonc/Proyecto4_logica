derivada(X, X, 1).

% Multiplicacion por constante
derivada(N*U, X, N * D) :- number(N), derivada(U, X, D).

% Derivada de suma
derivada(U + V, X, DU + DV) :- derivada(U, X, DU), derivada(V, X, DV).
derivada(U - V, X, DU - DV) :- derivada(U, X, DU), derivada(V, X, DV).
derivada(U * V, X, U * DV + V * DU) :- derivada(U, X, DU), derivada(V, X, DV).
derivada(U / V, X, (V * DU - U * DV) / V * V) :- U \== 1, derivada(U, X, DU), derivada(V, X, DV).
derivada(1 / V, X, -DV / (V * V)) :- derivada(V, X, DV).


% Derivadas trigonometricas
derivada(C, X, 0) :- number(C), atom(X).
derivada(sin(X), X, cos(X)).
derivada(cos(X), X, -sin(X)).
derivada(tan(X), X, 1/(cos(X)^2)).
derivada(arctan(X), X, 1/(1+X^2)).

% Derivadas funciones
derivada(ln(X), X, 1/X).
derivada(X ^ N, X, N * X ^ NN) :- N > 0, NN is N-1.

% Derivadas con cadenas
derivada(sin(U), X, cos(U) * D) :- derivada(U, X, D).
derivada(cos(U), X, -sin(U) * D) :- derivada(U, X, D).
derivada(ln(U), X, (1/U) * D) :- derivada(U, X, D).
derivada(tan(U), X, (1/(cos(U)^2)) * D) :- derivada(U, X, D).
derivada(arctan(U), X, (1/(1+U^2)) * D) :- derivada(U, X, D).

% Derivadas exponenciales
derivada(exp(N,X), X, exp(N,X) * (ln(N))).

