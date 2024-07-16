% interacao.pl
:- [base_dados].

listar_generos :-
    findall(Genero, filme(_, Genero, _, _, _, _, _), ListaGeneros),
    sort(ListaGeneros, GenerosUnicos),
    listar_generos_unicos(GenerosUnicos).

listar_generos_unicos([]).
listar_generos_unicos([Genero | Resto]) :-
    write(Genero), nl,
    listar_generos_unicos(Resto).
