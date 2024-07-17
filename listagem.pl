:- [basededados].

listar_titulos :-
    findall(Titulo, filme(Titulo, _, _, _, _, _, _), ListaTitulos),
    sort(ListaTitulos, TitulosUnicos),
    mostrar_resultados(TitulosUnicos).

listar_generos :-
    findall(Genero, filme(_, Genero, _, _, _, _, _), ListaGeneros),
    sort(ListaGeneros, GenerosUnicos),
    mostrar_resultados(GenerosUnicos).

listar_diretores :-
    findall(Diretor, filme(_, _, _, _, Diretor, _, _), ListaDiretores),
    sort(ListaDiretores, DiretoresUnicos),
    mostrar_resultados(DiretoresUnicos).

listar_elenco :-
    findall(Ator, filme(_, _, _, _, _, Ator, _), ListaElenco),
    sort(ListaElenco, ElencoUnico),
    mostrar_resultados(ElencoUnico).

todos_filmes(ListaFilmes) :-
    findall(filme(Titulo, Genero, Ano, Duracao, Diretor, Ator, Nota),
            filme(Titulo, Genero, Ano, Duracao, Diretor, Ator, Nota),
            ListaFilmes),
    formatar_filmes(ListaFilmes, FilmesFormatados),
    mostrar_resultados(FilmesFormatados).

formatar_filmes([], []).
formatar_filmes([filme(Titulo, Genero, Ano, Duracao, Diretor, Ator, Nota)|Resto], [Formatado|FilmesFormatados]) :-
    format(atom(Formatado), 'Título: ~w, Gênero: ~w, Ano: ~w, Duração: ~w, Diretor: ~w, Ator: ~w, Nota: ~w',
           [Titulo, Genero, Ano, Duracao, Diretor, Ator, Nota]),
    formatar_filmes(Resto, FilmesFormatados).

% Usar de quiser mostrar no terminal
listar_itens(Lista) :-
    nl,
    forall(member(Item, Lista), (write(Item), nl)),
    nl.
