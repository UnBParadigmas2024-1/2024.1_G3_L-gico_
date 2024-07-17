:- [basededados].

menu :- 
    repeat,
    write('Escolha uma opção para listar:'), nl,
    write('1) Nomes dos filmes'), nl,
    write('2) Gêneros'), nl,
    write('3) Diretor(es)'), nl,
    write('4) Elenco'), nl,
    write('5) País(es) de produção'), nl,
    write('6) Sair'), nl,
    write('Digite sua escolha: '), nl,
    read(Escolha), 
    ( Escolha = 6 -> !, sair; processar_opcao(Escolha), fail).

processar_opcao(Escolha) :-
    ( Escolha >= 1, Escolha =< 5 ->
        opcao_valida(Escolha)
    ; 
        write('Opção inválida. Escolha um número de 1 a 6.'), nl,
        fail
    ).

opcao_valida(1) :- listar_titulos.
opcao_valida(2) :- listar_generos.
opcao_valida(3) :- listar_diretores.
opcao_valida(4) :- listar_elenco.
opcao_valida(5) :- listar_paises.

listar_titulos :-
    findall(Titulo, filme(Titulo, _, _, _, _, _, _), ListaTitulos),
    sort(ListaTitulos, TitulosUnicos),
    listar_itens(TitulosUnicos).

listar_generos :-
    findall(Genero, filme(_, Genero, _, _, _, _, _), ListaGeneros),
    sort(ListaGeneros, GenerosUnicos),
    listar_itens(GenerosUnicos).

listar_diretores :-
    findall(Diretor, (filme(_, _, _, _, _, Diretores, _), member(Diretor, Diretores), Diretor \= []), ListaDiretores),
    sort(ListaDiretores, DiretoresUnicos),
    listar_itens(DiretoresUnicos).

listar_elenco :-
    findall(Ator, (filme(_, _, _, _, _, _, Elenco), member(Ator, Elenco), Ator \= []), ListaElenco),
    sort(ListaElenco, ElencoUnico),
    listar_itens(ElencoUnico).

listar_paises :-
    findall(Pais, filme(_, _, _, _, Pais, _, _), ListaPaises),
    sort(ListaPaises, PaisesUnicos),
    listar_itens(PaisesUnicos).

listar_itens(Lista) :-
    nl,
    forall(member(Item, Lista), (write(Item), nl)),
    nl.

sair :-
    write('Saindo...'), nl.
