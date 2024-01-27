#language:pt

@login
Funcionalidade: Cadatro de filmes
    Para que eu possa disponibilizar novos titulos no catalogo
    Sendo um gestor de catalogo
    Posso cadastrar um novo filme

    @new_movie 
    Esquema do Cenario: Novo filme
        O gestor de catálogo cadastrar um novo filme através do formulário
        e um novo registro é inserido no catálogo Ninjaflix

        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro deste filme
        Então devo ver o novo filme na lista

        Exemplos:
        |codigo     |
        |"ultimato" |
        |"spider"   |
        |"joker"    |

    @attempt_movie
    Esquema do Cenario: Campos obrigatórios
        O gestor de catálogo tenta cadastrar um novo filme, mas esquece de preencher um dos campos que são obrigatórios, em seguida,
        o sistema exibe uma notificação para o usuario.

        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro deste filme
        Então devo ver a notificação <texto>

         Exemplos:
        |codigo     |texto                                          |
        |"no_title" |"Oops - Filme sem titulo. Pode isso Arnaldo?"  |
        |"no_status"|"Oops - O status deve ser informado!"          |
        |"no_year"  |"Oops - Faltou o ano de lançamento também!"    |
        |"no_date"  |"Oops - Quase lá, só falta a data de estréia!"  |


    @dup_movie
    Cenario: Duplicado
        O gestor de catálogo tenta cadastrar um filme, porem os títulos
        já foi cadastrado e outro momento e o sistema notifica o usuário
        informando que o título já existe.

        Dado que "deadpool2" é um novo filme
        Mas este filme já existe no catálogo
        Quando eu faço o cadastro deste filme
        Então devo ver a notificação "Opps - Este titulo já existe no Ninjaflix."