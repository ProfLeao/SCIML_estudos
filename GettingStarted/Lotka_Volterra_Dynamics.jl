using ModelingToolkit, DifferentialEquations, Plots

# Define as variáveis de estado: estado(t) = condição inicial
@variables t x(t) = 1 y(t) = 1 z(t) = 2

# Define os parâmetros
@parameters α = 1.5 β = 1.0 γ = 3.0 δ = 1.0

# Define o operador diferencial declarando que a derivação é feita
# com respeito a t
d_t = Differential(t)

# Declara as equações difereniais do modelo
eqs = [
    d_t(x) ~ α * x - β * x * y
    d_t(y) ~ -γ * y + δ * x * y
    z ~ x + y 
]

# Cria o sistema de equações dieferenciais ordinárias
# considerando a variável t independente

@named sys = ODESystem(eqs, t)

# Realiza a simplificação simbólica do sistema
simpsys = structural_simplify(sys)

# Transforma o modelo simbólico em um problema numérico
# para a simulação. 
tspan = (0.0, 10.0)
prob = ODEProblem(simpsys, [], tspan)

# Resolve o sistema
sol = solve(prob)

# Plota a solução
p1 = plot(sol, title = "Coelhos vs Lobos")
p2 = plot(sol, idxs = z, title= "Total de animais.")

plot(p1, p2, layout = (2,1))