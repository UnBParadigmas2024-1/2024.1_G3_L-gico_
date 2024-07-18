% Base de dados de filmes
% filme(nome, genero, ano, duracao, diretor, ator, nota_imdb).

% Menu interativo
filtrar_filmes :-
    write('Escolha o critério de filtragem: '), nl,
    write('1. Gênero'), nl,
    write('2. Ano'), nl,
    write('3. Duração'), nl,
    write('4. Diretor'), nl,
    write('5. Ator'), nl,
    read(Opcao),
    escolher_criterio(Opcao).

% Lista de gêneros com números correspondentes
genero(1, 'drama').
genero(2, 'crime').
genero(3, 'action').
genero(4, 'biography').
genero(5, 'western').
genero(6, 'comedy').
genero(7, 'adventure').
genero(8, 'animation').
genero(9, 'horror').
genero(10, 'mystery').
genero(11, 'film-noir').
genero(12, 'fantasy').
genero(13, 'family').
genero(14, 'thriller').

% Escolher critério e solicitar valor
escolher_criterio(1) :-
    write('Escolha o gênero pelo número correspondente: '), nl,
    write('1. Drama'), nl,
    write('2. Crime'), nl,
    write('3. Action'), nl,
    write('4. Biography'), nl,
    write('5. Western'), nl,
    write('6. Comedy'), nl,
    write('7. Adventure'), nl,
    write('8. Animation'), nl,
    write('9. Horror'), nl,
    write('10. Mystery'), nl,
    write('11. Film-Noir'), nl,
    write('12. Fantasy'), nl,
    write('13. Family'), nl,
    write('14. Thriller'), nl,
    read(GeneroNum),
    genero(GeneroNum, Genero),
    listar_filmes_por_criterio(filtrar_por_genero, Genero).

escolher_criterio(2) :-
    write('Digite o ano seguido de um ponto final: '),
    read(Ano),
    listar_filmes_por_criterio(filtrar_por_ano, Ano).

escolher_criterio(3) :-
    write('Digite a duração em minutos seguido de um ponto final: '),
    read(Duracao),
    listar_filmes_por_criterio(filtrar_por_duracao, Duracao).

escolher_criterio(4) :-
    write('Digite o diretor entre aspas simples seguido de um ponto final: '),
    read(Diretor),
    listar_filmes_por_criterio(filtrar_por_diretor, Diretor).

escolher_criterio(5) :-
    write('Digite o ator entre aspas simples seguido de um ponto final: '),
    read(Ator),
    listar_filmes_por_criterio(filtrar_por_ator, Ator).

% Regra para tratar opção inválida
escolher_criterio(_) :-
    write('Opção inválida. Tente novamente.'), nl,
    filtrar_filmes.

% Consulta principal
:- filtrar_filmes.



% listar_filmes_por_criterio(Criterio, Valor) :-
%     findall(Filme, call(Criterio, Valor, Filme), Filmes),
%     write(Filmes), nl.