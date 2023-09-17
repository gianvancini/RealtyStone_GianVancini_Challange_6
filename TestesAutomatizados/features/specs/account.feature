#language: pt
@regression
@account
Funcionalidade: Conta de usuário
    SENDO um usuário do ParaBank
    QUERO poder gerenciar minha conta de usuãrio
    PARA acessar as funcionalidades de usuário  

    Contexto: Estar na home page e fazer o login
        Dado que esteja na página inicial do banco

    @valid_login
    Cenário: Fazer login válido
        Quando realiza o login com username e pawssword válidos
        Então o menu com as funcionalidades de usuario logado aparecerá
    
    @invalid_login
    Esquema do Cenário: Fazer login inválido
        Quando realiza o login com username "<username>" e password "<password>"
        Então exibe a mensagem "<message>"
        Exemplos:
        |   username    |   password    |   message     |
        | invalid_user  | invalid_pass  |invalid_message|
        |  valid_user   | invalid_pass  |invalid_message|
        | invalid_user  |  valid_pass   |invalid_message|
        |  empty_user   |  empty_pass   | empty_message |

    @register
    Cenário: Fazer um registro válido
        Quando o realizar o envio do formulário de cadastro com dados válidos
        Então o menu com as funcionalidades de usuario logado aparecerá
    
    @forgot
    Cenário: Recuperar senha
        Quando o realizar o envio do formulário de recuperação com dados válidos
        Então aparecerá os dados para login

