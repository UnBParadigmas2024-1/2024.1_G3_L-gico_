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
    findall(Diretor, (filme(_, _, _, _, _, Diretores, _),
                      member(Diretor, Diretores),
                      Diretor \= []), ListaDiretores),
    sort(ListaDiretores, DiretoresUnicos),
    mostrar_resultados(DiretoresUnicos).

listar_elenco :-
    findall(Ator, (filme(_, _, _, _, _, _, Elenco),
                   member(Ator, Elenco),
                   Ator \= []), ListaElenco),
    sort(ListaElenco, ElencoUnico),
    mostrar_resultados(ElencoUnico).

todos_filmes(ListaFilmes) :-
    findall(filme(Titulo, Ano, Genero, Duracao, Pais, Diretor, Ator),
            filme(Titulo, Ano, Genero, Duracao, Pais, Diretor, Ator),
            ListaFilmes),
    formatar_filmes(ListaFilmes, FilmesFormatados),
    mostrar_resultados(FilmesFormatados).

formatar_filmes([], []).
formatar_filmes([filme(Titulo, Ano, Genero, Duracao, Pais, Diretor, Ator)|Resto], [Formatado|FilmesFormatados]) :-
    format(atom(Formatado), 'Título: ~w, Ano: ~w, Gênero: ~w, Duração: ~w, País: ~w, Diretor: ~w, Ator: ~w',
           [Titulo, Ano, Genero, Duracao, Pais, Diretor, Ator]),
    formatar_filmes(Resto, FilmesFormatados).

% Usar de quiser mostrar no terminal
listar_itens(Lista) :-
    nl,
    forall(member(Item, Lista), (write(Item), nl)),
    nl.
