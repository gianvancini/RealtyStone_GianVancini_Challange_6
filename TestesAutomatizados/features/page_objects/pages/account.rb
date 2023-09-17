require_relative '../sections/body'
require_relative '../sections/register_forgot'

module Pages
    class Account < SitePrism::Page
        section :body, Sections::Body, 'body'   
        section :register_forgot, Sections::Register_Forgot, '#rightPanel' 

        # Função que recebe username e password e tenta fazer o login
        def login (username, password)
            body.input_username.set username
            body.input_password.set password
            body.button_login.click
        end

    end
end