% Carregar a base de dados
:- consult('basededados.pl').

% Incluir os predicados de filtro e interação
:- consult('filtro.pl').
:- consult('interacao.pl').
