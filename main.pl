:- [basededados].
moviesRescue :-
    write('Olá, seja bem-vindo ao Movie Rescue, o programa que te ajudará a procurar seu novo filme favorito!'),
    nl,
    write('Com esse programa, você verá dados de filmes buscando por atores, diretores, tempo de duração, gênero e nome'),
    nl,
    write('basta você escrever o nome "filme()" e dentro do parágrafo indicar o título, ano, gênero, duração em minutos,'),
    nl,
    write('país de produção, nome de diretor e nome de atores, nesta ordem,'),
    nl,
    write('e será apresentado as possíveis opções. Caso tenha um elemento que não seja relevante para a busca, basta colocar _ no campo.'),
    nl,
    write('Se quiser saber os tipos de gêneros disponíveis ou os diferentes países, use as funções "mostra_generos" ou "mostra_países" para ter uma noção.'),
    nl,
    write('Boa busca!').
    
:- consult('base_dados.pl').
:- consult('interacao.pl').
:- consult('filtro.pl').

%Predicado para iniciar a aplicação
iniciar :-
    iniciar_pergunta.