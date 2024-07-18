:- use_module(library(pce)).
:- [listagem].
:- [filtro].

% Cria e exibe o menu principal
menu :-
    new(Dialog, dialog('Movie Rescue')),
    send(Dialog, size, size(2000, 450)),
    send(Dialog, background, colour(grey)),
    send(Dialog, append, new(T, text(''))),
    send(T, font, font(screen, bold, 26)),
    mensagem_inicial(Mensagem),
    send(T, string, Mensagem),
    send(Dialog, append, new(button('Listagem', message(@prolog, listar, Dialog)))),
    send(Dialog, append, new(button('Filtragem', message(@prolog, filtrar, Dialog)))),
    send(Dialog, open_centered).

% Mensagem inicial exibida no menu principal
mensagem_inicial(Mensagem) :-
    atomic_list_concat([
        'Olá, seja bem-vindo ao Movie Rescue, o programa que te ajudará a procurar seu novo filme favorito!\n\n',
        'Com esse programa, você verá sugestões de filmes buscando por gênero, ano de lançamento, tempo de duração, diretor(a)\nou ator/atriz.\n\n',
        'Após você definir o critério e especifiar o conteúdo do filtro, o programa vai listar sugestões de filmes\ne suas respectivas notas.\n\n',
        'Se quiser saber todos os nomes de filmes, gêneros, diretores(as), atores(ras) e disponíveis existe uma função de listagem.\n',
        'Inclusive uma listagem completa!.\n\n',
        'Boa busca!'
    ], '', Mensagem).

% Tela de listagem de filmes
listar(Dialog) :-
    send(Dialog, clear),
    send(Dialog, append, new(Group, dialog_group(buttons, group))),
    send_list(Group, append,
              [ new(T, menu(topicos, cycle)),
                button(voltar, message(@prolog, retorna_menu, Dialog)),
                button(pesquisar, and(message(@prolog, listar_recomendacoes, T?selection)))
              ]),
    opcoes_topicos(OP),
    send_list(T, append, OP),
    send(Dialog, layout_dialog),
    send(Dialog, layout).

% Tela de filtragem de filmes
filtrar(Dialog) :-
    send(Dialog, clear),
    send(Dialog, append, new(Group, dialog_group(buttons, group))),
    send_list(Group, append,
              [ new(T, menu(filtros, cycle)),
                new(Pesquisa, text_item(pesquisa, '')), % Novo campo de pesquisa
                button(voltar, message(@prolog, retorna_menu, Dialog)),
                button(aplicar, message(@prolog, aplicar_filtro, T?selection, Pesquisa?selection))
              ]),
    opcoes_filtros(Filtros),
    send_list(T, append, Filtros),
    send(Dialog, layout_dialog),
    send(Dialog, layout).

% Retornar ao menu principal
retorna_menu(Dialog) :-
    send(Dialog, clear),
    send(Dialog, background, colour(grey)),
    send(Dialog, append, new(T, text(''))),
    send(T, font, font(screen, bold, 26)),
    mensagem_inicial(Mensagem),
    send(T, string, Mensagem),
    send(Dialog, append, new(button('Listagem', message(@prolog, listar, Dialog)))),
    send(Dialog, append, new(button('Filtragem', message(@prolog, filtrar, Dialog)))),
    send(Dialog, layout).

% Opções disponíveis para listar filmes por diferentes critérios
opcoes_topicos(['Nome do Filme', 'Gênero', 'Diretor(a)', 'Ator/Atriz', 'Tudo']).

% Opções disponíveis para filtrar filmes
opcoes_filtros(['Gênero', 'Ano do Filme', 'Duração', 'Diretor', 'Ator/Atriz']).

% Lista recomendações de filmes baseado no tópico selecionado
listar_recomendacoes(Topico) :-
    ( Topico == 'Nome do Filme' -> listar_titulos
    ; Topico == 'Gênero' -> listar_generos
    ; Topico == 'Diretor(a)' -> listar_diretores
    ; Topico == 'Ator/Atriz' -> listar_elenco
    ; Topico == 'Tudo' -> todos_filmes(Todos), mostrar_resultados(Todos)
    ; send(@display, inform, 'Selecione uma opção válida.')
    ).

% Aplica filtro selecionado e exibir resultados
aplicar_filtro('Ano do Filme', TermoPesquisa) :-
    listar_filmes_por_criterio(filtrar_por_ano, TermoPesquisa, _Resultados).

aplicar_filtro('Gênero', TermoPesquisa) :-
    listar_filmes_por_criterio(filtrar_por_genero, TermoPesquisa, _Resultados).

aplicar_filtro('Duração', TermoPesquisa) :-
    listar_filmes_por_criterio(filtrar_por_duracao, TermoPesquisa, _Resultados).

aplicar_filtro('Diretor', TermoPesquisa) :-
    listar_filmes_por_criterio(filtrar_por_diretor, TermoPesquisa, _Resultados).

aplicar_filtro('Ator/Atriz', TermoPesquisa) :-
    listar_filmes_por_criterio(filtrar_por_ator, TermoPesquisa, _Resultados).

% Mostra os resultados da pesquisa em uma janela
mostrar_resultados(Resultados) :-
    new(Dialog, dialog('Resultados da Pesquisa')),
    new(Fonte, font(screen, bold, 26)),
    send(Dialog, background, 'grey'),
    send(Dialog, size, size(1100, 800)),
    new(ListaBrowser, list_browser),
    send(ListaBrowser, size, size(150, 40)),
    send(ListaBrowser, font, Fonte),
    send_list(ListaBrowser, append, Resultados),
    length(Resultados, TotalResultados),
    format(atom(TotalTexto), 'Total de resultados: ~d', [TotalResultados]),
    send(Dialog, append, text(TotalTexto, center, Fonte)),
    send(Dialog, append, ListaBrowser),
    send(Dialog, append, button(fechar, message(Dialog, destroy))),
    send(Dialog, default_button, fechar),
    send(Dialog, open_centered).
