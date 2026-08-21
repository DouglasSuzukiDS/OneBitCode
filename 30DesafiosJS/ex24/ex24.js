/*
Desafio 24: Validações de Usuário 👤 (Strings, RegEx)**

Em uma nave de grande porte existem muitos terminais de acesso ao sistema principal, e para se conectar através deles um membro da tripulação deve utilizar seu nome de usuário, senha e verificação biométrica. O nome de usuário deve ser validado segundo algumas regras antes que possa ser cadastrado. Sua tarefa atual é construir um mecanismo de validação de nomes de usuário para ser utilizado pelo sistema de cadastro.
Escreva uma função que recebe uma string e verifica se ela atende aos seguintes requisitos:

* Deve conter entre 4 e 32 caracteres.


* Deve conter apenas letras (sem acentos)**, números ou _


* Deve começar com uma letra


* Não pode terminar com _


* Deve conter pelo menos um de cada tipo de caractere (letra, número e underscore)**


* Deve ser único (comparado a uma base fictícia)**
Caso atenda, retorne true, caso não atenda retorne false.



***ENTRADA:***
Usuários Já Registrados: ['erick_14', 'pam_ls2', 'VICTOR_99A']

* ('52alfred')**


* ('erick_14')**


* ('josh_g15')**


* ('hugo123_')**


* ('k_9')**



***SAÍDA:***

* false


* false


* true


* false


* false



---

**
*/


// ========================================
// SOLUÇÃO
// ========================================


