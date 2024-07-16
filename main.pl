:- consult('base_dados.pl').
:- consult('interacao.pl').
:- consult('filtro.pl').

%Predicado para iniciar a aplicação
iniciar :-
    iniciar_pergunta.
