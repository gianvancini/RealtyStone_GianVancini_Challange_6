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
    element = select_element.all('option')[index_int].text
    select_element.select(element)
    
    @user.user_services.account_open_button.click
    
    @wait.until { @user.user_services.div_success.visible? }
end

Então('exibe a mensagem de abertura de conta') do
    expect(@user.user_services.message_success.text).to eq ("Account Opened!")
end 


Quando('enviar fundos de uma conta para outra') do
    @user.user_services.transfer_funds.click
    sleep(0.3)
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


Quando('informar um range de data de uma transação') do
    @user.user_services.find_transactions.click
    transaction = Factory::Static.static_data('transaction')
    @user.user_services.find_by_range_1.set transaction['between_date']
    @user.user_services.find_by_range_2.set transaction['and_date']
    @user.user_services.find_button_by_range.click
    @wait.until { @user.user_services.div_success.visible? }
end


Quando('informar um valor de uma transação') do
    @user.user_services.find_transactions.click
    transaction = Factory::Static.static_data('transaction')
    @user.user_services.find_by_amount.set transaction['amount']
    @user.user_services.find_button_by_amount.click
    @wait.until { @user.user_services.div_success.visible? }
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


Quando('realizar açao para fazer log out') do
    @user.user_services.log_out.click
end

Então('a pagina inicial será exibida sem as opçoes do usuário logado') do
    expect(@user.body.input_username.visible?).to be_truthy
end