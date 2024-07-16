% Regra para verificar se um filme atende aos critérios do usuário
filtra_filme(Genero, Diretor, Ano, Ator, Classificacao, Titulo) :-
    filme(Titulo, Dir, An, Atr, Class, Gen),
    (Genero == any ; Genero == Gen),
    (Diretor == any ; Diretor == Dir),
    (Ano == any ; Ano == An),
    (Ator == any ; Ator == Atr),
    (Classificacao == any ; Classificacao == Class).

% Predicado para iniciar o questionário e filtrar filmes com base nos critérios do usuário
iniciar_pergunta :-
    perguntar_criterio(Genero, Diretor, Ano, Ator, Classificacao),
    findall(Titulo, filtra_filme(Genero, Diretor, Ano, Ator, Classificacao, Titulo), Resultados),
    write('Filmes recomendados: '), nl,
    listar_resultados(Resultados).

% Regra para listar os resultados
listar_resultados([]) :-
    write('Nenhum filme encontrado.').
listar_resultados([H|T]) :-
    write(H), nl,
    listar_resultados(T).
