:- [interface].
:- [basededados].

main :-
    menu.
    % Incluir os predicados de filtro e interação
    :- consult('filtro.pl').
    :- consult('interacao.pl').


:- initialization(main).




