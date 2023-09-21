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

    @account_overview
    Cenário: Verificar contas e movimentações
        Quando abrir o resumo de todas as contas
        E selecionar um periodo dentro de uma conta
        Então exibe as transações feitas no período

    @transfer_funds
    Cenário: Transferir Fundos
        Quando enviar fundos de uma conta para outra
        Então exibe a mensagem de transferencia de fundos
    
    @ignore
    @transfer_funds_invalid_value
    Cenário: Transferir Fundos com valor negativo
        Quando enviar fundos de uma conta para outra com valor negativo
        Então exibe a mensagem de erro na transferencia de fundos

    @ignore
    @transfer_funds_invalid_account
    Cenário: Transferir Fundos para a mesma conta de origem
        Quando enviar fundos de uma conta para a mesma conta de origem
        Então exibe a mensagem de conta inválida 
    
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
    @transaction_by_id_empty
    Cenário: Procurar conta por id vazio
        Quando buscar uma trnasação por id vazio
        Então exibe mensagem de campo obrigatório
    
    @find_transactions
    @transaction_by_date
    Cenário: Procurar conta por data
        Quando informar uma date de uma transação
        Então exibe o resultado da transaçao com os dados da mesma
    
    @find_transactions
    @transaction_by_date_empty
    Cenário: Procurar conta por data vazia
        Quando informar uma date vazia de uma transação
        Então exibe mensagem de campo obrigatório

    
    @find_transactions
    @transaction_by_range
    Cenário: Procurar conta por range de data
        Quando informar um range de data de uma transação
        Então exibe o resultado da transaçao com os dados da mesma
    
    @ignore
    @find_transactions
    @transaction_by_range_invalid
    Cenário: Procurar conta por range de data invalida
        Quando informar um range de data de uma transação invalida
        Então exibe uma mensagem de erro no formato da data
    
    @find_transactions
    @transaction_by_amount
    Cenário: Procurar conta por valor
        Quando informar um valor de uma transação
        Então exibe o resultado da transaçao com os dados da mesma
    
    @find_transactions
    @transaction_by_amount_empty
    Cenário: Procurar conta com valor vazio
        Quando deixar campo vazio para buscar uma transação
        Então exibe mensagem de campo obrigatório

    @update_info
    Cenário: Atualizar informaçoes do usuario
        Quando informar atualização nos dados cadastrais
        Então exibe a mensagem de perfil atualizado

    @update_info_empty
    Cenário: Atualizar informaçoes do usuario deixando campos em branco
        Quando atualizar os dados cadastrais com os campos em branco
        Então exibe a mensagem de preencha os campos obrigatórios
    
    @request_loan
    Cenário: Pedir emprestimo
        Quando Informar dados para o empréstimo
        Então exibe a mensagem de sucesso do empréstimo

    @ignore
    @request_loan_empty
    Cenário: Pedir emprestimo com campos vazios
        Quando deixar os campos vazios para o empréstimo
        Então exibe a mensagem de capos obrigatórios

    @ignore
    @invalid_request_loan
    Cenário: Pedir emprestimo com entrada maior que o emprestimo
        Quando Informar dados para o empréstimo invalidos
        Então exibe a mensagem de erro do empréstimo
    
    @log_out
    Cenário: Fazer log Out
        Quando realizar açao para fazer log out
        Então a pagina inicial será exibida sem as opçoes do usuário logado
    
    