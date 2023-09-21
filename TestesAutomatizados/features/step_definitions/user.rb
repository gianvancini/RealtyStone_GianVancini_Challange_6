Dado('esteja logado') do
    @account = Pages::Account.new
    @user = Pages::User.new
    @wait = Selenium::WebDriver::Wait.new
    user_login = Factory::Static.static_data('user_login')
    @account.login(user_login['valid_user'], user_login['valid_pass'])
end


Quando('abre uma nova conta {string}') do |tipo_conta|
    @user.user_services.open_new_account.click
    
    select_element = @user.user_services.account_type
    select_element.select(tipo_conta)
end

E('usar o saldo da segunda conta {string}') do |index|
    index_int = index.to_i
    select_element = @user.user_services.account_sender
    sleep(0.5)
    element = select_element.all('option')[index_int].text
    select_element.select(element)
    
    @user.user_services.account_open_button.click
    
    @wait.until { @user.user_services.div_success.visible? }
end

Então('exibe a mensagem de abertura de conta') do
    expect(@user.user_services.message_success.text).to eq ("Account Opened!")
end 


Quando('abrir o resumo de todas as contas') do
    @user.user_services.account_overview.click
end

E('selecionar um periodo dentro de uma conta') do
    @user.user_services.overview_account_one.click

    account_overview = Factory::Static.static_data('account_overview')
    mounth = account_overview['mounth'].to_i
    type = account_overview['type'].to_i

    select_element_mounth = @user.user_services.overview_mounth
    element_mounth = select_element_mounth.all('option')[mounth].text
    select_element_mounth.select(element_mounth)

    select_element_type = @user.user_services.overview_type
    element_type = select_element_type.all('option')[type].text
    select_element_type.select(element_type)
    
    @user.user_services.overview_go_button.click
end

Então('exibe as transações feitas no período') do
    expect(@user.user_services.overview_results.text).to eq ("12-11-2022")
end 


Quando('enviar fundos de uma conta para outra') do
    @user.user_services.transfer_funds.click
    sleep(0.5)
    amount = Factory::Static.static_data('amount')
    
    @user.user_services.transfer_amount.set amount
    select_element = @user.user_services.transfer_to_account
    element = (select_element.all('option')[1]).text
    select_element.select(element)
    
    @user.user_services.transfer_button.click

    @wait.until { @user.user_services.div_success.visible? }
end

Então('exibe a mensagem de transferencia de fundos') do
    expect(@user.user_services.message_success.text).to eq ("Transfer Complete!")
end


Quando('enviar fundos de uma conta para outra com valor negativo') do
    @user.user_services.transfer_funds.click
    sleep(0.5)
    amount = Factory::Static.static_data('amount_negativo')
    
    @user.user_services.transfer_amount.set amount 
    select_element = @user.user_services.transfer_to_account
    element = (select_element.all('option')[1]).text
    select_element.select(element)
    @user.user_services.transfer_button.click

    @wait.until { @user.user_services.div_success.visible? }
end

Então('exibe a mensagem de erro na transferencia de fundos') do
    expect(@user.user_services.message_success.text).to eq ("Transfer Error!")
end



Quando('enviar fundos de uma conta para a mesma conta de origem') do
    @user.user_services.transfer_funds.click
    sleep(0.5)
    amount = Factory::Static.static_data('amount')
    
    @user.user_services.transfer_amount.set amount 
    @user.user_services.transfer_button.click

    @wait.until { @user.user_services.div_success.visible? }
end

Então('exibe a mensagem de conta inválida') do
    expect(@user.user_services.message_success.text).to eq ("Transfer Error!")
end


Quando('enviar formulário com dados de uma conta') do
    @user.user_services.bill_pay.click

    name = Factory::Dynamic.valid_register[:first_name]
    address = Factory::Dynamic.valid_register[:address]
    city = Factory::Dynamic.valid_register[:city]
    state = Factory::Dynamic.valid_register[:state]
    zip_code = Factory::Dynamic.valid_register[:zip_code]
    phone = Factory::Dynamic.valid_register[:phone]
    account = Factory::Dynamic.valid_register[:account]
    amount = Factory::Dynamic.valid_register[:amount]

    @user.user_services.payee_name.set name
    @user.user_services.payee_address.set address
    @user.user_services.payee_city.set city
    @user.user_services.payee_state.set state
    @user.user_services.payee_zip_code.set zip_code
    @user.user_services.payee_phone.set phone
    @user.user_services.payee_account.set account
    @user.user_services.payee_verify_account.set account
    @user.user_services.payee_amount.set amount

    @user.user_services.payee_button.click

    @wait.until { @user.user_services.payee_success.visible? }
end

Então('exibe a mensagem de pagamento de conta') do
    expect(@user.user_services.message_success.text).to eq ("Bill Payment Complete")
end


Quando('informar um id de uma transação') do
    @user.user_services.find_transactions.click
    transaction = Factory::Static.static_data('transaction')
    @user.user_services.find_by_id.set transaction['id']
    @user.user_services.find_button_by_id.click
    @wait.until { @user.user_services.div_success.visible? }
end


Quando('buscar uma trnasação por id vazio') do
    @user.user_services.find_transactions.click
    @user.user_services.find_button_by_id.click
end


Então('exibe o resultado da transaçao com os dados da mesma') do
    expect(@user.user_services.message_success.text).to eq ("Transaction Results")
end


Quando('informar uma date de uma transação') do
    @user.user_services.find_transactions.click
    transaction = Factory::Static.static_data('transaction')
    @user.user_services.find_by_date.set transaction['date']
    @user.user_services.find_button_by_date.click
    @wait.until { @user.user_services.div_success.visible? }
end


Quando('informar uma date vazia de uma transação') do
    @user.user_services.find_transactions.click
    @user.user_services.find_button_by_date.click
end


Quando('informar um range de data de uma transação') do
    @user.user_services.find_transactions.click
    transaction = Factory::Static.static_data('transaction')
    @user.user_services.find_by_range_1.set transaction['between_date']
    @user.user_services.find_by_range_2.set transaction['and_date']
    @user.user_services.find_button_by_range.click
    @wait.until { @user.user_services.div_success.visible? }
end


Quando('informar um range de data de uma transação invalida') do
    @user.user_services.find_transactions.click
    invalid_data = Factory::Dynamic.valid_register[:amount]
    @user.user_services.find_by_range_1.set invalid_data
    @user.user_services.find_by_range_2.set invalid_data
    @user.user_services.find_button_by_range.click
end

Então('exibe uma mensagem de erro no formato da data') do
    expect(page).to have_css('.ng-invalid', visible: false)
end


Quando('informar um valor de uma transação') do
    @user.user_services.find_transactions.click
    transaction = Factory::Static.static_data('transaction')
    @user.user_services.find_by_amount.set transaction['amount']
    @user.user_services.find_button_by_amount.click
    @wait.until { @user.user_services.div_success.visible? }
end


Quando('deixar campo vazio para buscar uma transação') do
    @user.user_services.find_transactions.click
    @user.user_services.find_button_by_amount.click
end

Então('exibe mensagem de campo obrigatório') do
    expect(page).to have_css('.ng-invalid', visible: false)
end


Quando('informar atualização nos dados cadastrais') do
    @user.user_services.update_contact.click
    sleep(0.3)
    phone = Factory::Dynamic.valid_register[:phone]
    @user.user_services.update_phone.set phone
    @user.user_services.update_button.click
    @wait.until { @user.user_services.div_success.visible? }
end

Então('exibe a mensagem de perfil atualizado') do
    expect(@user.user_services.message_success.text).to eq ("Profile Updated")
end


Quando('atualizar os dados cadastrais com os campos em branco') do
    @user.user_services.update_contact.click
    sleep(0.3)
    @user.user_services.update_first_name.set " "
    @user.user_services.update_last_name.set " "
    @user.user_services.update_address.set " "
    @user.user_services.update_city.set " "
    @user.user_services.update_state.set " "
    @user.user_services.update_zip_code.set " "
    @user.user_services.update_phone.set " "
    @user.user_services.update_button.click
end

Então('exibe a mensagem de preencha os campos obrigatórios') do
    messages = Factory::Static.static_data('messages_error')
    expect(@user.user_services.update_first_name_error.text).to eq messages['first_name']
    expect(@user.user_services.update_last_name_error.text).to eq messages['last_name']
    expect(@user.user_services.update_address_error.text).to eq messages['address']
    expect(@user.user_services.update_city_error.text).to eq messages['city']
    expect(@user.user_services.update_state_error.text).to eq messages['state']
    expect(@user.user_services.update_zip_code_error.text).to eq messages['zip_code']
end


Quando('Informar dados para o empréstimo') do
    @user.user_services.request_loan.click
    amount = Factory::Dynamic.valid_register[:amount]
    down_p = Factory::Dynamic.valid_register[:down_p]
    @user.user_services.loan_amount.set amount
    @user.user_services.loan_down.set down_p
    @user.user_services.loan_button.click
    @wait.until { @user.user_services.div_success.visible? }
end

Então('exibe a mensagem de sucesso do empréstimo') do
    expect(@user.user_services.message_success.text).to eq ("Loan Request Processed")
end


Quando('deixar os campos vazios para o empréstimo') do
    @user.user_services.request_loan.click
    @user.user_services.loan_button.click
    @wait.until { @user.user_services.div_success.visible? }
end

Então('exibe a mensagem de capos obrigatórios') do
    expect(@user.user_services.message_success.text).to eq ("Preencha os campos obrigatórios")
end


Quando('Informar dados para o empréstimo invalidos') do
    @user.user_services.request_loan.click
    amount = Factory::Dynamic.valid_register[:amount]
    down_p = Factory::Dynamic.valid_register[:down_p]
    @user.user_services.loan_amount.set down_p
    @user.user_services.loan_down.set amount
    @user.user_services.loan_button.click
    @wait.until { @user.user_services.div_success.visible? }
end

Então('exibe a mensagem de erro do empréstimo') do
    expect(@user.user_services.message_success.text).to eq ("Loan Request Error")
end



Quando('realizar açao para fazer log out') do
    @user.user_services.log_out.click
end

Então('a pagina inicial será exibida sem as opçoes do usuário logado') do
    expect(@user.body.input_username.visible?).to be_truthy
end