:- [basededados].

listar_titulos :-
    findall(Titulo, filme(Titulo, _, _, _, _, _, _), ListaTitulos),
    sort(ListaTitulos, TitulosUnicos),
    mostrar_resultados(TitulosUnicos).

listar_generos :-
    findall(Genero, filme(_, Genero, _, _, _, _, _), ListaGeneros),
    sort(ListaGeneros, GenerosUnicos),
    listar_itens(GenerosUnicos).

listar_diretores :-
    findall(Diretor, filme(_, _, _, _, _, Diretor, _), ListaDiretores),
    sort(ListaDiretores, DiretoresUnicos),
    listar_itens(DiretoresUnicos).

listar_elenco :-
    findall(Ator, filme(_, _, _, _, _, _, Ator), ListaElenco),
    sort(ListaElenco, ElencoUnico),
    listar_itens(ElencoUnico).
