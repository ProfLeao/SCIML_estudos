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

Quantos coelhos e lobos existirão 10 meses depois ? Se $z = x + y$, isto é, o total de animais em um dado intante, podemos visualizar este 
número total de animais ao longo do tempo?

