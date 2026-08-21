/*
Desafio 23: Corrida de Pods 🏎️ (Strings, Arrays)**

Corridas de pods são muito rápidas e perigosas, mas seres de todos os planetas adoram. Para acompanhar a classificação durante a corrida foi requisitado que você construa um programa que atualize a lista com a posição de todos os corredores a medida que eles vão ultrapassando uns aos outros ou sendo eliminados da corrida.
Escreva um programa que receba uma lista de classificação de nomes e uma string no formato "Nome +n" (ou -n)**, onde n é a quantidade de posições para subir ou descer na classificação, e retorne essa mesma lista com a classificação atualizada. A função também deve ser capaz de receber "Nome ELIMINATE", nesse caso o participante deve ser jogado para o fim da lista e deve ser acrescentado um " ELIMINATED" ao seu nome, indicando que ele foi eliminado. Os participantes eliminados não podem ter nenhum corredor não eliminado atrás deles na lista. Assuma que sempre receberá uma entrada válida no formato "Corredor AÇÃO".

***ENTRADA:***
Classificação Inicial: 'Alfa', 'Beta', 'Gama' e 'Delta'

* ('Beta +1')**


* ('Gama -1')**


* ('Delta ELIMINATE')**


* ('Gama +2')**



***SAÍDA:***

* 'Beta', 'Alfa', 'Gama' e 'Delta'


* 'Beta', 'Alfa', 'Delta' e 'Gama'


* 'Beta', 'Alfa', 'Gama' e 'Delta ELIMINATED'


* 'Gama', 'Beta', 'Alfa' e 'Delta ELIMINATED'



---

**
*/


// ========================================
// SOLUÇÃO
// ========================================


