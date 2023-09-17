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

Quando('o realizar o envio do formulário de cadastro com dados válidos') do
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


Quando('o realizar o envio do formulário de recuperação com dados válidos') do
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