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
        |  CHECKING   |     1      |
        |  SAVINGS    |     2      | 
    
    @transfer_funds
    Cenário: Transferir Fundos
        Quando enviar fundos de uma conta para outra
        Então exibe a mensagem de transferencia de fundos
    
    @bill_pay
    Cenário: Pagar contas
        Quando enviar formulário com dados de uma conta
        Então exibe a mensagem de pagamento de conta

    @find_transactions
    @transaction_by_id
    Cenário: Procurar conta por id
        Quando informar um id de uma transação
        Então exibe o resultado da transaçao com os dados da mesma
    
    @find_transactions
    @transaction_by_date
    Cenário: Procurar conta por data
        Quando informar uma date de uma transação
        Então exibe o resultado da transaçao com os dados da mesma
    
    @find_transactions
    @transaction_by_range
    Cenário: Procurar conta por range de data
        Quando informar um range de data de uma transação
        Então exibe o resultado da transaçao com os dados da mesma
    
    @find_transactions
    @transaction_by_amount
    Cenário: Procurar conta por valor
        Quando informar um valor de uma transação
        Então exibe o resultado da transaçao com os dados da mesma
    
    @update_info
    Cenário: Atualizar informaçoes do usuario
        Quando informar atualização nos dados cadastrais
        Então exibe a mensagem de perfil atualizado
    
    @request_loan
    Cenário: Pedir emprestimo
        Quando Informar dados para o empréstimo
        Então exibe a mensagem de sucesso do empréstimo
    
    @log_out
    Cenário: Fazer log Out
        Quando realizar açao para fazer log out
        Então a pagina inicial será exibida sem as opçoes do usuário logado
    
    