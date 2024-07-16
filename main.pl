/*Base de dados dos filmes: Contém informações sobre os filmes, incluindo título, gênero, diretor, ano, ator principal, classificação, duração e país de produção.


Listar as opções de gênero, diretor, ano, ator principal, classificação.

Interação com o usuário: Faz perguntas ao usuário para coletar suas preferências.*/

%Pergunta ao usuário suas preferências de filmes
perguntar_criterio(Genero, Diretor, Ano, Ator, Classificacao, Duracao, Pais) :-
    write('Qual genero de filme voce prefere? (Digite "any" para qualquer genero): '), read(Genero),
    write('Qual diretor voce prefere? (Digite "any" para qualquer diretor): '), read(Diretor),
    write('Qual ano de lancamento voce prefere? (Digite "any" para qualquer ano): '), read(Ano),
    write('Qual ator principal voce prefere? (Digite "any" para qualquer ator): '), read(Ator),
    write('Qual classificacao voce prefere? (Digite "any" para qualquer classificacao): '), read(Classificacao),
 

%Predicado para iniciar o questionário
iniciar_pergunta :-
    perguntar_criterio(Genero, Diretor, Ano, Ator, Classificacao, Duracao, Pais),
    format('Genero: ~w~n', [Genero]),
    format('Diretor: ~w~n', [Diretor]),
    format('Ano: ~w~n', [Ano]),
    format('Ator: ~w~n', [Ator]),
    format('Classificacao: ~w~n', [Classificacao]).





/* Função principal para executar o programa: Controla o fluxo do programa, desde a interação com o usuário até a exibição das sugestões de filmes.*/

/*Listar filmes sugeridos: Exibe a lista de filmes sugeridos ao usuário*/