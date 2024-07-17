% Regra para remover espaços em branco extras e pontuação de uma string
sanitize_string(String, Sanitized) :-
    atom_string(Atom, String),
    atomic_list_concat(List, ' ', Atom),
    atomic_list_concat(List, ' ', Cleaned),
    atom_string(CleanedAtom, Cleaned),
    string_codes(CleanedAtom, Codes),
    exclude(is_punctuation, Codes, SanitizedCodes),
    string_codes(Sanitized, SanitizedCodes).

% Predicado para verificar se um caractere é pontuação
is_punctuation(Code) :-
    char_type(Char, punct),
    char_code(Char, Code).

% Regra para verificar se um filme atende aos critérios do usuário
filtra_filme(Title, Genre, Year, Duration, Country, Directors, Actors) :-
    filme(Title, FGenre, FYear, FDuration, FCountry, FDirectors, FActors),
    write('Verificando filme: '), write(Title), nl,
    sanitize_string(Genre, SanitizedGenre),
    sanitize_string(FGenre, SanitizedFGenre),
    (SanitizedGenre == SanitizedFGenre -> write('Gênero corresponde'), nl ; (write('Gênero não corresponde: '), write(SanitizedGenre), write(' vs '), write(SanitizedFGenre), nl, fail)),
    atom_number(Year, YearNum),
    (YearNum == FYear -> write('Ano corresponde'), nl ; write('Ano não corresponde'), nl, fail),
    atom_number(Duration, DurationNum),
    (DurationNum == FDuration -> write('Duração corresponde'), nl ; write('Duração não corresponde'), nl, fail),
    (Country == FCountry -> write('País corresponde'), nl ; write('País não corresponde'), nl, fail),
    (member(Directors, FDirectors) -> write('Diretor corresponde'), nl ; write('Diretor não corresponde'), nl, fail),
    (member(Actors, FActors) -> write('Ator corresponde'), nl ; write('Ator não corresponde'), nl, fail).

% Predicado para iniciar o questionário e filtrar filmes com base nos critérios do usuário
iniciar_pergunta :-
    perguntar_criterio(Genre, Year, Duration, Country, Directors, Actors),
    write('Critérios lidos: '), nl,
    write('Genero: '), write(Genre), nl,
    write('Ano: '), write(Year), nl,
    write('Duração: '), write(Duration), nl,
    write('País: '), write(Country), nl,
    write('Diretor: '), write(Directors), nl,
    write('Ator: '), write(Actors), nl,
    findall(Title, filtra_filme(Title, Genre, Year, Duration, Country, Directors, Actors), Resultados),
    write('Filmes recomendados: '), nl,
    listar_resultados(Resultados).

% Regra para listar os resultados
listar_resultados([]) :-
    write('Nenhum filme encontrado.').
listar_resultados([H|T]) :-
    write(H), nl,
    listar_resultados(T).
