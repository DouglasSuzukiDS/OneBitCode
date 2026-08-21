/*
Desafio 22: Prisão Intergalática 🔒 (Strings, Manipulação de Tipos)**

A estação espacial Tartarus é utilizada pela Federação como prisão para criminosos de toda a galáxia e foi construída utilizando a mais avançada tecnologia para evitar qualquer possibilidade de fuga. Um dos recursos utilizados é o monitoramento constante de cada prisioneiro, o que deve ser feito com cuidado redobrado quando estes são liberados de suas celas. Sempre que isso ocorre é feito um escaneamento de todos os prisioneiros, que são sempre identificados por números consecutivos e possuem um tempo limite para entrarem ou saírem. Ao fim desse tempo é gerada uma lista que deve conter os números de todos os prisioneiros, mesmo que em ordem aleatória. Para garantir que todos entrem e saiam sem que nenhum fique para trás de forma automatizada foi requerido que você construa um código para realizar essa tarefa. Para esse cenário o último número será um verificador que indicará o número total de prisioneiros, portanto nunca estará faltando.
Escreva uma função que receba uma lista embaralhada de números únicos de 1 até n no formato "0001" (string com zeros à esquerda)**, verifique se há elementos faltando (onde n nunca estará faltando)** e, caso hajam, retorne os elementos que faltam.

***ENTRADA:***

* (['0020', '0002', '0013', '0004', '0001', '0016', '0015', '0006', '0012', '0007', '0005', '0008', '0011', '0010'])**


* (['0020', '0009', '0002', '0013', '0004', '0017', '0001', '0003', '0016', '0015', '0019', '0006', '0012', '0007', '0005', '0014', '0008', '0011', '0010', '0018'])**


* (['0004', '0002', '0005', '0003'])**


* ([])**



***SAÍDA:***

* ['0003', '0009', '0014', '0017', '0018', '0019']


* []


* ['0001']


* []



---

**
*/


// ========================================
// SOLUÇÃO
// ========================================


