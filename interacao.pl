% Pergunta ao usuário suas preferências de filmes
perguntar_criterio(Genre, Year, Duration, Country, Directors, Actors) :-
    write('Qual genero de filme voce prefere? (Digite "any" para qualquer genero): '), read_line_to_string(user_input, Genre),
    write('Qual é o ano de lançamento do filme? (Digite "any" para qualquer ano): '), read_line_to_string(user_input, Year),
    write('Qual é o tempo de duração do filme? (Digite "any" para qualquer tempo): '), read_line_to_string(user_input, Duration),
    write('Qual é o país que foi gravado o filme? (Digite "any" para qualquer país): '), read_line_to_string(user_input, Country),
    write('Qual diretor voce prefere? (Digite "any" para qualquer diretor): '), read_line_to_string(user_input, Directors),
    write('Qual ator principal voce prefere? (Digite "any" para qualquer ator): '), read_line_to_string(user_input, Actors),
    % Depuração para ver os critérios lidos
    write('Critérios lidos: '), nl,
    write('Genero: '), write(Genre), nl,
    write('Ano: '), write(Year), nl,
    write('Duração: '), write(Duration), nl,
    write('País: '), write(Country), nl,
    write('Diretor: '), write(Directors), nl,
    write('Ator: '), write(Actors), nl.
