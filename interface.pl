:- use_module(library(pce)).
:- [basededados].
:- [listagem].

menu :-
    new(Dialog, dialog('Tela Ciano')),
    send(Dialog, size, size(2000, 450)),
    send(Dialog, background, colour(cyan)),
    send(Dialog, append, new(T, text(''))),
    send(T, font, font(screen, bold, 26)),
    mensagemInicial(Mensagem),
    send(T, string, Mensagem),
    
    new(Group, dialog_group(buttons, group)),
    send(Group, append, button('Ir para Listagem', message(@prolog, listar, Dialog))),
    send(Dialog, append, Group),
    
    send(Dialog, open_centered).

mensagemInicial(Mensagem) :-
    atomic_list_concat([
        'Olá, seja bem-vindo ao Movie Rescue, o programa que te ajudará a procurar seu novo filme favorito!\n\n',
        'Com esse programa, você verá dados de filmes buscando por atores, diretores, tempo de duração, gênero e nome.\n\n',
        'Basta você escrever o nome "filme()" e dentro do parágrafo indicar o título, ano, gênero, duração em minutos,\n',
        'país de produção, nome de diretor e nome de atores, nesta ordem e será apresentado as possíveis opções.\n\n',
        'Caso tenha um elemento que não seja relevante para a busca, basta colocar _ no campo.\n\n',
        'Se quiser saber os tipos de gêneros disponíveis ou os diferentes países, use as funções "mostra_generos" ou "mostra_países" para ter uma noção.\n\n',
        'Boa busca!'
    ], '', Mensagem).

listar(Dialog) :-
    send(Dialog, clear),
    send(Dialog, append, new(Group, dialog_group(buttons, group))),
    send_list(Group, append,
              [ new(T, menu(topicos, cycle)),
                button(voltar, message(@prolog, menu_inicial, Dialog)),
                button(pesquisar, and(message(@prolog, listar_recomendacoes, T?selection)))
              ]),
    opcoes_topicos(OP),
    send_list(T, append, OP),
    send(Dialog, layout_dialog),
    send(Dialog, layout).

menu_inicial(Dialog) :-
    send(Dialog, clear),
    send(Dialog, background, colour(cyan)),
    send(Dialog, append, new(T, text(''))),
    send(T, font, font(screen, bold, 26)),
    mensagemInicial(Mensagem),
    send(T, string, Mensagem),
    
    new(Group, dialog_group(buttons, group)),
    send(Group, append, button('Ir para Listagem', message(@prolog, listar, Dialog))),
    send(Dialog, append, Group),
    
    send(Dialog, layout).

opcoes_topicos(['Nome dos Filmes', 'Gêneros', 'Diretor(es)', 'Elenco', 'País(es) de Produção']).

listar_recomendacoes(Topico) :-
    ( Topico == 'Nome dos Filmes' ->
        listar_titulos
    ;   send(@display, inform, 'Selecione a opção "Nome dos Filmes" para listar os filmes.')
    ).

mostrar_resultados(Resultados) :-
    new(Dialog, dialog('Resultados da Pesquisa')),
    new(Fonte, font(screen, bold, 12)),
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
