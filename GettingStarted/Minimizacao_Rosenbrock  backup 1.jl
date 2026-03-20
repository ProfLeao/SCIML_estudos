using Optimization, OptimizationNLopt, ForwardDiff

# Definição da função objetivo (Rosenbroke)
# na definição u é a variável independente e p são parâmetros do modeolo.
L(u, p) = (p[1] - u[1])^2 + p[2] * (u[2] - u[1]^2)^2

# Transformando a função convencional em uma função objetivo compreensível 
# pelo Optimization

optfun = OptimizationFunction(
    L, # A função objetivo
    Optimization.AutoForwardDiff() # Emprega o ForwardDiff para as derivações
)

# Parâmetros do modeolo
p = [1.0, 100.0]

# Condição inicial
u0 = zeros(2)

# Criação do problema a ser otimizado, ou seja a combinação dos 
# parâmetros com a condição incial, a função objetivo, e as
# restrições. 
prob = OptimizationProblem(
    optfun,
    u0,
    p,
    lb = [-1,-1], # limites inferiores de u
    ub = [1,1], # Limites superiores de u
)

# Solução do problema utilizando o método BFGS de NLopt
sol = solve(prob, NLopt.LD_LBFGS)

# Exibição do resultado

println("Solução ótima: $(sol.u)")

println("Valor da função objetivo: $(L(sol.u, p))")


