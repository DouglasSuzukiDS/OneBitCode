/*
Desafio 14: Licença de Voo 🛫 (Strings, Classes, Datas)**

Para pilotar uma nave de pequeno porte em qualquer planeta da Federação é preciso possuir uma licença de voo. O código usado na licença de voo é criado a partir de informações de seu dono, como nome e data de nascimento. Foi solicitado que você crie um método para gerar a licença de voo de uma determinada pessoa para ser integrado aos sistemas da Federação. É obrigatório fazer isso utilizando uma classe.
Escreva uma classe que contenha um método para gerar uma licença de voo e os seguintes atributos: Nome, Sobrenome, Data de Nascimento e Licença de Voo (que deve iniciar sempre como falso)**. Além disso a classe deve possuir um método para criar uma licença caso a pessoa ainda não possua uma. A licença deve ser uma string seguindo o seguinte padrão:

* Os primeiros cinco caracteres do sobrenome em letras maiúsculas (completado com 9's caso possua menos de cinco)**


* O 6º caractere é um traço (-)**


* O 7º caractere é o algarismo da década (penúltimo)** do ano de nascimento


* 8º e 9º caracteres são o mês de nascimento


* O 10º caractere é o algarismo do ano (último)** do ano de nascimento


* O 11º caractere é um ponto (.)**


* O 12º caractere é a primeira letra do primeiro nome (minúscula)**



***ENTRADA:***

* Pilot { firstName: 'John', lastName: 'Doe', birthday: 1977-05-25T03:00:00.000Z }


* Pilot { firstName: 'Hal', lastName: 'Jordan', birthday: 1995-09-02T03:00:00.000Z }


* Pilot { firstName: 'Carol', lastName: 'Danvers', birthday: 1968-08-17T03:00:00.000Z }


* Pilot { firstName: 'Poe', lastName: 'Dameron', birthday: 1979-03-09T03:00:00.000Z }



***SAÍDA:***

* flyingLicense: 'DOE99-7057.j'


* flyingLicense: 'JORDA-9095.h'


* flyingLicense: 'DANVE-6088.c'


* flyingLicense: 'DAMER-7039.p'



---

**
*/


// ========================================
// SOLUÇÃO
// ========================================


