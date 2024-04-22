# Simulação da Dinâmica Lotka-Volterra Predador-Preza
## Autor: Prof. Reginaldo Gonçalves Leão Junior
Adpatado de sciml.ai

### O problema: Simular a Dinâmica Lotka-Volterra Predador-Preza

O dinâmica de nosso sistema é definida pelo sistema dinâmico Lotka-Volterra:
Tome $x(t)$ como o número de coelhos no escossistema e $y(t)$ o número de lobos.
As equações que definem o número a evolução do número de espécimes de cada tipo
são dadas por:

$$
\frac{dx}{dt} = ax - \beta xy \quad (1)
$$

$$
\frac{dx}{dt} = -\gamma y + \delta xy \quad (2)
$$

