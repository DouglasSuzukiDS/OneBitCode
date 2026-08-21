/*
Desafio 28: Hora de Jogar 🎮 (Classes, Objetos, Arrays, Matemática)**

Há exatamente 100 anos, quando a exploração de novos planetas ainda era algo reservado apenas para as ficções-científicas, um RPG de mesa muito popular te permitia viver aventuras em outros planetas como um explorador do espaço. Agora, para comemorar essa data especial uma equipe está criando uma versão digital deste mesmo jogo e você foi designado para cooperar com ela no desenvolvimento.
Escreva uma classe que calcula e mantém informações sobre exploradores, como seus nível e habilidades. Ela precisará obedecer aos seguintes requisitos:

* Nível de 1 a 99 (ganha exp ao explorar, precisa de 100 + 10 * nível atual para subir)**.


* Ranques: 1-9 (Novato)**, 10-29 (Explorador)**, 30-49 (Veterano)**, 50-79 (Elite)**, 80-98 (Mestre)**, 99 (Lenda)**.


* Ação explorar: requer planeta com id, nome, hostilidade e terreno.


* Sucesso simulado via dados (2 a 12)**:


* Pacífico: sucesso em 5-12, +15 exp (falha: +0 exp)**


* Neutro: sucesso em 7-12, +25 exp (falha: +0 exp)**


* Hostil: sucesso em 9-12, +50 exp (falha crítica [2]: morre; outra falha: +10 exp)**




* Bônus especialista (+1 no dado e imune a morte)** após 3 acertos críticos (resultado 12)** no mesmo tipo de terreno.



***ENTRADA:***

* Objeto Explorador nível 9 com 1340 exp.


* Explora planeta neutro { id: 1, name: 'Planeta 1', hostility: 'neutral', terrain: 'forest' } com sucesso.


* Explora planeta hostil { id: 2, name: 'Planeta 2', hostility: 'hostile', terrain: 'desert' } obtendo falha crítica (resultado 2)**.



***SAÍDA:***

* Ganha 25 exp, sobe para Nível 10, vira Ranque Explorador, torna-se especialista em 'forest' (+1 bônus)** e adiciona planeta aos conhecidos.


* Explorador morre, tornando-se incapaz de explorar novamente, mas mantendo suas informações salvas.



---

**
*/


// ========================================
// SOLUÇÃO
// ========================================


