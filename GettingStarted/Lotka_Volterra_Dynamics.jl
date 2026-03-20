import DifferentialEquations as DE
import ModelingToolkit as MTK
import Plots

# Define a variável independente
@independent_variables t

# Define as variáveis de estado: state(t) = condição inicial
@variables x(t)=1 y(t)=1 z(t)

# Define os parÂmetros
@parameters α=1.5 β=1.0 γ=3.0 δ=1.0

# Define as equações diferenciais do sistema
eqs = [D(x) ~ α * x - β * x * y
       D(y) ~ -γ * y + δ * x * y
       z ~ x + y]

# Junta as partes do sistema de equações diferenciais (eqs) 
# usando ODESystem com a variável independente t
@mtkcompile sys = MTK.ODESystem(eqs, t)

# Converte o problema da forma simbólica para a forma numérica
tspan = (0.0, 10.0)
prob = DE.ODEProblem(sys, [], tspan)

# Resolve a equação diferencial
sol = DE.solve(prob)

# Plota a solução do problema
p1 = Plots.plot(sol, title = "Coelhos vs Lobos")
p2 = Plots.plot(sol, idxs = z, title = "Total de Animais")

Plots.plot(p1, p2, layout = (2, 1))