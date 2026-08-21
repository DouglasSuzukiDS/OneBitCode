/*
Desafio 30: Planilha Portátil 📑 (Manipulação de Arquivos, Matemática, Arrays, Strings, Classes, Promises)**

Um colega pediu sua ajuda para desenvolver o programa de uma planilha portátil capaz de ler, escrever, realizar operações matemáticas e salvar/abrir arquivos.
Escreva uma aplicação que simula o funcionamento de uma planilha. Ela precisa armazenar um array bidimensional de células e possuir quatro funções principais: leitura de célula, escrita de célula, salvar em arquivo e abrir de um arquivo.
A leitura recebe o nome ("A2", "C4")** e retorna o valor.
A escrita salva valor ou fórmulas (ex: SUM, SUB, MUL, DIV, MIN, MAX, AVG)** aceitando delimitadores de célula individual (;)** ou intervalo (:)**. Deve-se utilizar o módulo 'fs' do Node.js para salvar e carregar os dados em arquivo.

***ENTRADA:***

* Escrever valores em A1, A2, B1, B2, C1, C2 e fórmulas como 'SUM(A1:C2)**' em A3, 'AVG(A1;A2;A3)**' em A4, etc.


* Salvar e recarregar a planilha em uma nova instância.



***SAÍDA:***

* Célula 'A3' contendo o resultado da soma (ex: 14, depois atualizado para 18)**.


* Célula 'A4' contendo o resultado da média.


* Segunda planilha carregada mantendo os dados salvos e permitindo alterações isoladas.
*/


// ========================================
// SOLUÇÃO
// ========================================


