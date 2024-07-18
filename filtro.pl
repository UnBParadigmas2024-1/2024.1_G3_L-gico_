% Regras para filtrar por diferentes critérios
filtrar_por_genero(Genero, Titulo, Nota) :-
    filme(Titulo, Genero, _, _, _, _, Nota).

filtrar_por_ano(AnoString, Titulo, Nota) :-
    atom_number(AnoString, Ano),
    filme(Titulo, _, Ano, _, _, _, Nota).

filtrar_por_duracao(DuracaoString, Titulo, Nota) :-
    atom_number(DuracaoString, Duracao),
    filme(Titulo, _, _, Duracao, _, _, Nota).

filtrar_por_diretor(Diretor, Titulo, Nota) :-
    filme(Titulo, _, _, _, Diretores, _, Nota),
    (
        is_list(Diretores) ->
        member(D, Diretores),
        sub_string(D, _, _, _, Diretor)
    ;
        sub_string(Diretores, _, _, _, Diretor)
    ).

filtrar_por_ator(Ator, Titulo, Nota) :-
    filme(Titulo, _, _, _, _, Atores, Nota),
    (
        is_list(Atores) ->
        member(A, Atores),
        sub_string(A, _, _, _, Ator)
    ;
        sub_string(Atores, _, _, _, Ator)
    ).

% Regra para listar filmes por critério e valor e retornar uma lista de resultados formatados
listar_filmes_por_criterio(Criterio, Valor, Resultados) :-
    findall(Texto, (
        call(Criterio, Valor, Titulo, Nota),
        atomic_list_concat(['Titulo: ', Titulo, ', Nota IMDb: ', Nota], Texto)
    ), Resultados),
    mostrar_resultados(Resultados).
