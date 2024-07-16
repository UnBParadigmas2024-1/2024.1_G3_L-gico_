% Pergunta ao usuário suas preferências de filmes
perguntar_criterio(Genero, Diretor, Ano, Ator, Classificacao) :-
    write('Qual genero de filme voce prefere? (Digite "any" para qualquer genero): '), read(Genero),
    write('Qual diretor voce prefere? (Digite "any" para qualquer diretor): '), read(Diretor),
    write('Qual ano de lancamento voce prefere? (Digite "any" para qualquer ano): '), read(Ano),
    write('Qual ator principal voce prefere? (Digite "any" para qualquer ator): '), read(Ator),
    write('Qual classificacao voce prefere? (Digite "any" para qualquer classificacao): '), read(Classificacao).
