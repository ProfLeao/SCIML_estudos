# Simulação da Dinâmica Lotka-Volterra Predador-Preza
## Autor: Prof. Reginaldo Gonçalves Leão Junior
Adpatado de sciml.ai

### O problema: Simular a Dinâmica Lotka-Volterra Predador-Preza

O dinâmica de nosso sistema é definida pelo sistema dinâmico Lotka-Volterra:
Tome $x(t)$ como o número de coelhos no escossistema e $y(t)$ o número de lobos.
As equações que definem o número a evolução do número de espécimes de cada tipo
são dadas por:

$$
\frac{dx}{dt} = \alpha x - \beta xy \quad (1)
$$

$$
\frac{dx}{dt} = -\gamma y + \delta xy \quad (2)
$$

onde $\alpha x$, $\beta$, $\gamma$ e $\delta$ são parâmetros do modelo.

Começando com a mesma quantidade de coelhos e lobos, $x(0) = 1$ e $y(0) = 1$, pode-se simular esse sistema de $t_0 = 0$ até $t_f = 10$. Por
sorte, um guia local nos deu alguns parâmetros que parecem funcionar no
sistema! Eles são $\alpha x = 1,5$, $\beta = 1,0 $, $\gamma = 3,0$ e $\delta = 1,0$.

Quantos coelhos e lobos existirão 10 meses depois ? Se $z = x + y$, isto é, o 
total de animais em um dado intante, podemos visualizar este 
número total de animais ao longo do tempo?

Vide solução no arquivo `Lotka_Volterra_Dynamics.jl`

###  Solução *step-by-step*

#### Passo 1: Definir as equações diferenciais ordinárias.

Para isso usa-se mo método `@variable` do `ModelingToolkit` para declarar as 
variáveis do modelo. São uma variável independente, o tempo $t$ e três variáveis 
dependetes desta primeira $x(t)$, $y(t)$ e $z(t)$ iniciadas com os valores 1, 1 
e 2 respectivamente, correspondene à condição incial.

```Julia
@variables t x(t)=1 y(t)=1 z(t)=2
```

Os valores padrão dos parâmetros do modelo são declarados de forma 
similar, exceto pelo fato de serem constantes.

```Julia
@parameters α=1.5 β=1.0 γ=3.0 δ=1.0
```
Para a declaração das derivadas presentes nas equações diferenciais, é 
necessária a criação do operador diferencial, para isso, usa-se o construtor
`Differential` para a declaração do operador e a variável com respeito à qual as
derivadas serão realizadas. 

```Julia
d_t = Differential(t)
```

Finalmente declara-se uma matriz 1x3 contendo em cada elemento as equações 
que governam o sistema. Note que o sinal de igualdade utilizado é `~`, esta é
uma estratégia empregada em computação simbólica, já que o operador `=` não 
pode ser usado por tratar-se da atribuição. 

```Julia
eqs = [
    d_t(x) ~ α * x - β * x * y
    d_t(y) ~ -γ * y + δ * x * y
    z ~ x + y 
]```



