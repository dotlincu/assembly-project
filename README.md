# assembly-project

Começamos o código em .data, que é o segmento no qual declaramos os nomes dos
dados (labels) usados por nós, que são array1, leitura, n, valor, positivo e negativo:
- para array1, armazenamos seus dados em bytes especificando com align 2 e
usamos space 40 para especificar a quantidade de bytes armazenada;
- com leitura, criamos junto a mensagem que será exibida para o usuário digitar o
valor de um elemento do vetor;
- criamos n junto a uma string que pula uma linha;
- com valor, mostramos junto a mensagem pedindo para que o usuário digite o número
a ser buscado;
- junto de positivo está a mensagem que aparece caso o valor tenha sido encontrado;
- junto de negativo está a mensagem que aparece caso o valor não tenha sido
encontrado.

Depois em .text, segmento no qual colocamos as instruções do que deve ser feito pela
máquina:
- com o registrador $t5, passamos a quantidade 10 de iterações;
- com os registradores $t0 e $t2, passamos os iteradores;
Logo após, iniciamos o loop:
- usamos beq para terminar o loop caso o iterador $t0 seja igual ao valor de $t5, que é
10;
- adicionamos mais 1 ao iterador;
- pedimos ao usuário que digite o valor do elemento com a label leitura, com li e a
chamada do sistema (syscall);
- mostramos a posição do número a ser lido e fazemos outra syscall;
- carregamos o endereço da label n;
- lemos o número digitado e jogamos ele para o nossa array com sw (store word) e
offset $t2;
- aumentamos em 4 a posição do offset;
- terminamos o loop;

A seguir, usamos as mesmas ferramentas para exibir a mensagem para o usuário
mostrar o valor a ser digitado, e criamos mais um loop.

Esse é semelhante ao último loop, com a diferença que percorremos com ele os
elementos do array, e se o valor do índice atual do array corresponde ao valor digitado pelo
usuário que acabamos de pedir, então chamamos o bloco de código que nomeamos
Positivo. Se não chamamos o bloco de código Negativo.

Positivo:
- carregamos o serviço;
- carregamos a label positivo, mostrando a mensagem que o valor foi encontrado;
- fazemos um syscal;
- carregamos novamente o serviço;
- mostramos a posição no qual o valor digitado estava;
- fazemos outra syscall;

Negativo:
- carregamos o serviço;
- carregamos a mensagem da label negativo que o valor digitado não está no array;
- fazemos uma syscall;

Finalizamos o código
