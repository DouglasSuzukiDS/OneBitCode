/*
Desafio 17: Relatório de Missão 📋 (Strings, Arrays)**

Ao concluir uma missão em nome da Federação o capitão do esquadrão deve redigir o seu relatório como parte do protocolo padrão. Para auxiliar neste processo, um robô assistente revisa o texto e pode sugerir correções. A fim de agilizar esse processo, foi requisitado que você ajudasse na construção de uma interface para que o robô insira as correções diretamente no arquivo do relatório.
Escreva uma função que recebe três argumentos, uma frase, uma palavra e um array de índices. A função deve retornar a frase com a palavra inserida em cada uma das posições especificadas pelo array de índices.
A função não deve funcionar em índices que não estejam no alcance da frase.
A função deve retornar a mesma frase caso o array de índices esteja vazio.

***ENTRADA:***

* ('capaz utilizar as cápsulas emergência', 'de', [6, 27])**


* ('Nós decidimos apesar das chances serem baixas que enviaríamos um sinal para [...]', ',', [13, 45])**


* ('Hello', 'world', [6])**


* ('Isso é um teste', 'não', [])**



***SAÍDA:***

* 'capaz de utilizar as cápsulas de emergência'


* 'Nós decidimos, apesar das chances serem baixas, que enviaríamos um sinal para [...]'


* 'Hello'


* 'Isso é um teste'



---

**
*/


// ========================================
// SOLUÇÃO
// ========================================


