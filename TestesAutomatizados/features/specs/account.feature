#language: pt
@regression
@account
Funcionalidade: Conta de usuário
    SENDO um usuário do ParaBank
    QUERO poder gerenciar minha conta de usuãrio
    PARA acessar as funcionalidades de usuário  

    Contexto: Estar na home page e fazer o login
        Dado que esteja na página inicial do banco

    @reset_bd
    Cenário: Resetar banco de dados
        Quando resetar banco de dados
        Então aparece mensagem de banco inicializado

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
        Quando realizar o envio do formulário de cadastro com dados válidos
        Então o menu com as funcionalidades de usuario logado aparecerá

    @register_exist
    Cenário: Fazer um em duplicidade
        Quando realizar o envio do formulário de cadastro
        E fazer o cadastro novamente com os mesmos dados
        Então deverá exibir uma mensagem que já existe uma conta com estes dados
    
    @empty_register
    Cenário: Fazer um registro com campos vazios
        Quando realizar o envio do formulário de cadastro com os campos vazios
        Então aparecerá mensagem de campo obrigatório no cadastro
    
    @ignore
    @invalid_register_string
    Cenário: Fazer um registro somente com strings
        Quando realizar o envio do formulário de cadastro com os campos somente de string
        Então aparecerá mensagem de erro nos campos telefone, ssn e zip code

    @ignore
    @invalid_register_number
    Cenário: Fazer um registro somente com number
        Quando realizar o envio do formulário de cadastro com os campos somente de number
        Então aparecerá mensagem de erro nos campos nome, sobrenome, endereço, cidade, estado e username
    
    @forgot
    Cenário: Recuperar senha
        Quando realizar o envio do formulário de recuperação com dados válidos
        Então aparecerá os dados para login
    
    @empty_forgot
    Cenário: Recuperar senha com campos vazios
        Quando realizar o envio do formulário vazio para recuperação de senha
        Então aparecerá mensagem de campo obrigatório

