% Regras para filtrar por diferentes critérios
filtrar_por_genero(Genero, Titulo) :-
    filme(Titulo, Genero, _, _, _, _, _).

filtrar_por_ano(Ano, Titulo) :-
    filme(Titulo, _, Ano, _, _, _, _).

filtrar_por_duracao(Duracao, Titulo) :-
    filme(Titulo, _, _, Duracao, _, _, _).

filtrar_por_pais(Pais, Titulo) :-
    filme(Titulo, _, _, _, Pais, _, _).

filtrar_por_diretor(Diretor, Titulo) :-
    filme(Titulo, _, _, _, _, Diretores, _),
    member(Diretor, Diretores).

filtrar_por_ator(Ator, Titulo) :-
    filme(Titulo, _, _, _, _, _, Atores),
    member(Ator, Atores).

% Regra para listar filmes por critério e valor
listar_filmes_por_criterio(Criterio, Valor) :-
    call(Criterio, Valor, Titulo),
    write(Titulo), nl,
    fail.
listar_filmes_por_criterio(_, _).


