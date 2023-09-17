Dado('esteja logado') do
    @account = Pages::Account.new
    @user = Pages::User.new
    user_login = Factory::Static.static_data('user_login')
    @account.login(user_login['valid_user'], user_login['valid_pass'])
end

#Quando('abre uma nova conta {string}') do |tipo_conta|
#    @user.user_services.open_new_account.click
#    @user.user_services.type_account
#end

#Quando('usar o saldo da segunda conta {string}') do |index|
#    @user.user_services.sender_account.select(value: 1)
#    @user.user_services.open_account_button.click
#end

#Então('exibe a mensagem de abertura de conta') do
#    expect(@user.user_services.open_success.text).to eq ("Account Opened!")
#end 