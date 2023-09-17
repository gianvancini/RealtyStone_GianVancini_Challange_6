#language: pt

@regression
@user
Funcionalidade: HomePage
    SENDO um usuário do ParaBank
    QUERO utilizar as funcionalidades do Parabank
    PARA poder transferir, pagar e ver extratos de contas

    Contexto: Estar logado na aplicação
        Dado que esteja na página inicial do banco
        E esteja logado
    
    @open_new_account
    Esquema do Cenário: Abrir uma nova conta
        Quando abre uma nova conta "<tipo_conta>"
        E usar o saldo da segunda conta "<conta_sec>"
        Então exibe a mensagem de abertura de conta
        Exemplos:
        | tipo_conta  |  conta_sec |
        |  checking   |     0      |
        |  savings    |     1      |
    
    