/*
Desafio 11: Intervalo de Coordenadas 📍 (Arrays)**

O capitão da sua nave precisa que você implemente no sistema principal uma forma de obter todas as coordenadas abaixo de um determinado ponto partindo da origem (0,0)** e retorne isso para o sistema em uma lista ordenada crescente. As coordenadas são escritas na forma de pares ordenados (x,y)**.
Escreva uma função que receba um par ordenado (x,y)** e retorne um array de pares (x,y)** onde cada um deles possui x e y menor ou igual ao par recebido em ordem crescente. Os pares devem ser ordenados de forma que primeiro aumente o valor de y e depois o valor de x. Apenas o quadrante onde x e y são positivos deve ser considerado.

***ENTRADA:***

* ([2, 2])**


* ([2, 7])**


* ([-3, -3])**


* ([7, 6])**



***SAÍDA:***

* [[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]]


* [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7]]


* []


* [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6]]



---

**
*/


// ========================================
// SOLUÇÃO
// ========================================


