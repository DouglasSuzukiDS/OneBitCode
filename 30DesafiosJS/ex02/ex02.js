/*
Desafio 02: Procedimento Recursivo I 🔁 (Recursão, Strings)**

A equipe de manutenção da nave Highwind solicitou a sua ajuda para analisar o desempenho do computador portátil utilizado pela equipe de reconhecimento. Para isso, em um determinado momento, você precisou simular a criação de blocos de informação em formato de texto recursivamente, então decidiu criar uma função para imitar esse comportamento.
Escreva uma função que recebe um número e retorna uma quantidade equivalente de "chunks" separados por um traço "-" sem utilizar nenhuma estrutura de repetição (while, dowhile, for, etc)**.

***ENTRADA:***

* (4)**
* (1)**
* (8)**
* (2)**

***SAÍDA:***

* "chunk-chunk-chunk-chunk"
* "chunk"
* "chunk-chunk-chunk-chunk-chunk-chunk-chunk-chunk"
* "chunk-chunk"
*/

const showChunks = (num) => {
   const chunkText = `chunk-`
   const chunks = chunkText.repeat(num)

   return chunks.slice(0, -1) // remove the last -
}

const recursive = (num) => {
   if (num === 0) return
   if (num === 1) return `chunk`

   return `chunk-` + recursive(num - 1)
}

console.log(`Resolved with string method`)
console.log(showChunks(4))
console.log(showChunks(1))
console.log(showChunks(8))
console.log(showChunks(2))

console.log(`\n---------------------\n`)

console.log(`Resolved with recursive method`)
console.log(recursive(4))
console.log(recursive(1))
console.log(recursive(8))
console.log(recursive(2))