Quando('resetar banco de dados') do
    @home.header.button_admin_page_left.click
    @home.body.button_clean.click
    @home.body.button_initialize.click
end
  
Então('aparece mensagem de banco inicializado') do
    expect(@home.body.message_bd.text).to eq ("Database Initialized")
end


Quando('realiza o login com username e pawssword válidos') do
    @account = Pages::Account.new
    user_login = Factory::Static.static_data('user_login')
    @account.login(user_login['valid_user'], user_login['valid_pass'])
end
  
Então('o menu com as funcionalidades de usuario logado aparecerá') do
    expect(@account.body.login_success.text).to eq ("Account Services")
end


Quando('realiza o login com username {string} e password {string}') do |username, password|
    @account = Pages::Account.new
    @user_login = Factory::Static.static_data('user_login')
    @account.login(@user_login[username], @user_login[password])
end
  
Então('exibe a mensagem {string}') do |message|
    expect(@account.body.login_error.text).to eq (@user_login[message])
end

Quando('realizar o envio do formulário de cadastro com dados válidos') do
    @account = Pages::Account.new

    @home.body.button_register.click

    first_name = Factory::Dynamic.valid_register[:first_name]
    last_name = Factory::Dynamic.valid_register[:last_name]
    address = Factory::Dynamic.valid_register[:address]
    city = Factory::Dynamic.valid_register[:city]
    state = Factory::Dynamic.valid_register[:state]
    zip_code = Factory::Dynamic.valid_register[:zip_code]
    phone = Factory::Dynamic.valid_register[:phone]
    ssn = Factory::Dynamic.valid_register[:ssn]

    @account.register_forgot.register_first_name.set first_name
    @account.register_forgot.register_last_name.set last_name
    @account.register_forgot.register_address.set address
    @account.register_forgot.register_city.set city
    @account.register_forgot.register_state.set state
    @account.register_forgot.register_zip_code.set zip_code
    @account.register_forgot.register_phone.set phone
    @account.register_forgot.register_ssn.set ssn
    @account.register_forgot.register_username.set first_name
    @account.register_forgot.register_password.set first_name
    @account.register_forgot.register_confirm_password.set first_name

    @account.register_forgot.register_form_button.click
end


Quando('realizar o envio do formulário de cadastro') do
    @account = Pages::Account.new

    @home.body.button_register.click

    register = Factory::Static.static_data('forgot_login')

    @account.register_forgot.register_first_name.set register['first_name']
    @account.register_forgot.register_last_name.set register['first_name']
    @account.register_forgot.register_address.set register['first_name']
    @account.register_forgot.register_city.set register['first_name']
    @account.register_forgot.register_state.set register['first_name']
    @account.register_forgot.register_zip_code.set register['first_name']
    @account.register_forgot.register_phone.set register['first_name']
    @account.register_forgot.register_ssn.set register['first_name']
    @account.register_forgot.register_username.set register['first_name']
    @account.register_forgot.register_password.set register['first_name']
    @account.register_forgot.register_confirm_password.set register['first_name']

    @account.register_forgot.register_form_button.click
end

E('fazer o cadastro novamente com os mesmos dados') do
    @account.user_services.log_out.click

    @home.body.button_register.click

    register = Factory::Static.static_data('forgot_login')

    @account.register_forgot.register_first_name.set register['first_name']
    @account.register_forgot.register_last_name.set register['first_name']
    @account.register_forgot.register_address.set register['first_name']
    @account.register_forgot.register_city.set register['first_name']
    @account.register_forgot.register_state.set register['first_name']
    @account.register_forgot.register_zip_code.set register['first_name']
    @account.register_forgot.register_phone.set register['first_name']
    @account.register_forgot.register_ssn.set register['first_name']
    @account.register_forgot.register_username.set register['first_name']
    @account.register_forgot.register_password.set register['first_name']
    @account.register_forgot.register_confirm_password.set register['first_name']

    @account.register_forgot.register_form_button.click
end

Então('deverá exibir uma mensagem que já existe uma conta com estes dados') do
    messages_error = Factory::Static.static_data('messages_error')
    expect(@account.register_forgot.register_username_error.text).to eq (messages_error['duplicidade'])
end


Quando('realizar o envio do formulário de cadastro com os campos vazios') do
    @account = Pages::Account.new
    @home.body.button_register.click
    @account.register_forgot.register_form_button.click
end

Então('aparecerá mensagem de campo obrigatório no cadastro') do
    register_error = Factory::Static.static_data('messages_error')

    expect(@account.register_forgot.register_first_name_error.text).to eq (register_error['first_name'])
    expect(@account.register_forgot.register_last_name_error.text).to eq (register_error['last_name'])
    expect(@account.register_forgot.register_address_error.text).to eq (register_error['address'])
    expect(@account.register_forgot.register_city_error.text).to eq (register_error['city'])
    expect(@account.register_forgot.register_state_error.text).to eq (register_error['state'])
    expect(@account.register_forgot.register_zip_code_error.text).to eq (register_error['zip_code'])
    expect(@account.register_forgot.register_ssn_error.text).to eq (register_error['ssn'])
    expect(@account.register_forgot.register_username_error.text).to eq (register_error['username'])
    expect(@account.register_forgot.register_password_error.text).to eq (register_error['password'])
    expect(@account.register_forgot.register_confirm_password_error.text).to eq (register_error['confirm'])
end


Quando('realizar o envio do formulário de cadastro com os campos somente de string') do
    @account = Pages::Account.new
    @home.body.button_register.click
    @invalid_register = Factory::Static.static_data('invalid_register')

    @account.register_forgot.register_first_name.set @invalid_register['string']
    @account.register_forgot.register_last_name.set @invalid_register['string']
    @account.register_forgot.register_address.set @invalid_register['string']
    @account.register_forgot.register_city.set @invalid_register['string']
    @account.register_forgot.register_state.set @invalid_register['string']
    @account.register_forgot.register_zip_code.set @invalid_register['string']
    @account.register_forgot.register_phone.set @invalid_register['string']
    @account.register_forgot.register_ssn.set @invalid_register['string']
    @account.register_forgot.register_username.set @invalid_register['string']
    @account.register_forgot.register_password.set @invalid_register['string']
    @account.register_forgot.register_confirm_password.set @invalid_register['string']

    @account.register_forgot.register_form_button.click
end

Então('aparecerá mensagem de erro nos campos telefone, ssn e zip code') do
    expect(@account.register_forgot.register_zip_code_error.text).to eq @invalid_register['message_numbers']
    expect(@account.register_forgot.register_ssn_error.text).to eq @invalid_register['message_numbers']
    expect(@account.register_forgot.register_phone_error.text).to eq @invalid_register['message_numbers']
end


Quando('realizar o envio do formulário de cadastro com os campos somente de number') do
    @account = Pages::Account.new
    @home.body.button_register.click
    @invalid_register = Factory::Static.static_data('invalid_register')

    @account.register_forgot.register_first_name.set @invalid_register['number']
    @account.register_forgot.register_last_name.set @invalid_register['number']
    @account.register_forgot.register_address.set @invalid_register['number']
    @account.register_forgot.register_city.set @invalid_register['number']
    @account.register_forgot.register_state.set @invalid_register['number']
    @account.register_forgot.register_zip_code.set @invalid_register['number']
    @account.register_forgot.register_phone.set @invalid_register['number']
    @account.register_forgot.register_ssn.set @invalid_register['number']
    @account.register_forgot.register_username.set @invalid_register['number']
    @account.register_forgot.register_password.set @invalid_register['number']
    @account.register_forgot.register_confirm_password.set @invalid_register['number']

    @account.register_forgot.register_form_button.click
end

Então('aparecerá mensagem de erro nos campos nome, sobrenome, endereço, cidade, estado e username') do
    expect(@account.register_forgot.register_first_name_error.text).to eq @invalid_register['message_strings']
    expect(@account.register_forgot.register_last_name_error.text).to eq @invalid_register['message_strings']
    expect(@account.register_forgot.register_address_error.text).to eq @invalid_register['message_strings']
    expect(@account.register_forgot.register_city_error.text).to eq @invalid_register['message_strings']
    expect(@account.register_forgot.register_state_error.text).to eq @invalid_register['message_strings']
    expect(@account.register_forgot.register_username_error.text).to eq @invalid_register['message_strings']

end


Quando('realizar o envio do formulário de recuperação com dados válidos') do
    @account = Pages::Account.new
    user_forgot = Factory::Static.static_data('forgot_login')

    @home.body.button_forgot_login.click

    @account.register_forgot.forgot_first_name.set user_forgot['first_name']
    @account.register_forgot.forgot_last_name.set user_forgot['last_name']
    @account.register_forgot.forgot_address.set user_forgot['address']
    @account.register_forgot.forgot_city.set user_forgot['city']
    @account.register_forgot.forgot_state.set user_forgot['state']
    @account.register_forgot.forgot_zip_code.set user_forgot['zip_code']
    @account.register_forgot.forgot_ssn.set user_forgot['ssn']

    @account.register_forgot.forgot_form_button.click

end
  
Então('aparecerá os dados para login') do
    expect(@account.register_forgot.forgot_success.text).to eq ("Customer Lookup")
end


Quando('realizar o envio do formulário vazio para recuperação de senha') do
    @account = Pages::Account.new
    @home.body.button_forgot_login.click
    @account.register_forgot.forgot_form_button.click
end
  
Então('aparecerá mensagem de campo obrigatório') do
    forgot_error = Factory::Static.static_data('messages_error')

    expect(@account.register_forgot.forgot_first_name_error.text).to eq (forgot_error['first_name'])
    expect(@account.register_forgot.forgot_last_name_error.text).to eq (forgot_error['last_name'])
    expect(@account.register_forgot.forgot_address_error.text).to eq (forgot_error['address'])
    expect(@account.register_forgot.forgot_city_error.text).to eq (forgot_error['city'])
    expect(@account.register_forgot.forgot_state_error.text).to eq (forgot_error['state'])
    expect(@account.register_forgot.forgot_zip_code_error.text).to eq (forgot_error['zip_code'])
    expect(@account.register_forgot.forgot_ssn_error.text).to eq (forgot_error['ssn'])
end