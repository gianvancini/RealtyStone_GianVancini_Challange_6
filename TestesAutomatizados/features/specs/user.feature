#language: pt

@regression
@user
Funcionalidade: Usuário
    SENDO um usuário do ParaBank
    QUERO poder fazer login na aplicação
    PARA acessar as funcionalidades de usuário logado   

    Contexto: Estar na home page e fazer o login
        Dado que esteja na página inicial do banco
    
    @empty_login    
    Cenário: Fazer login com campos vazios
        Quando realiza o login com username e pwssword vazios
        Então exibe a mensagem de campo obrigatório

    @valid_login
    Cenário: Fazer login válido
        Quando realiza o login com username e pwssword válidos
        Então a página de visão geral de contas é apresentada
    
    @invalid_login
    Esquema do Cenário: Fazer login inválido
        Quando realiza o login com username "<username>" e password "<password>"
        Então exibe a mensagem "<mensage>"
        Exemplos:
        |   username    |   password    |   message     |
        |  valid_user   | invalid_user  |invalid_message|
        | invalid_user  |  valid_user   |invalid_message|