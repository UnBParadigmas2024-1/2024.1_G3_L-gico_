% Menu interativo
filtrar_filmes :-
    write('Escolha o critério de filtragem: '), nl,
    write('1. Gênero'), nl,
    write('2. Ano'), nl,
    write('3. Duração'), nl,
    write('4. País'), nl,
    write('5. Diretor'), nl,
    write('6. Ator'), nl,
    read(Opcao),
    escolher_criterio(Opcao).

% Escolher critério e solicitar valor
escolher_criterio(1) :-
    write('Digite o gênero: '),
    read(Genero),
    listar_filmes_por_criterio(filtrar_por_genero, Genero).

escolher_criterio(2) :-
    write('Digite o ano: '),
    read(Ano),
    listar_filmes_por_criterio(filtrar_por_ano, Ano).

escolher_criterio(3) :-
    write('Digite a duração: '),
    read(Duracao),
    listar_filmes_por_criterio(filtrar_por_duracao, Duracao).

escolher_criterio(4) :-
    write('Digite o país: '),
    read(Pais),
    listar_filmes_por_criterio(filtrar_por_pais, Pais).

escolher_criterio(5) :-
    write('Digite o diretor: '),
    read(Diretor),
    listar_filmes_por_criterio(filtrar_por_diretor, Diretor).

escolher_criterio(6) :-
    write('Digite o ator: '),
    read(Ator),
    listar_filmes_por_criterio(filtrar_por_ator, Ator).

% Regra para tratar opção inválida
escolher_criterio(_) :-
    write('Opção inválida. Tente novamente.'), nl,
    filtrar_filmes.

% Consulta principal
?- filtrar_filmes.