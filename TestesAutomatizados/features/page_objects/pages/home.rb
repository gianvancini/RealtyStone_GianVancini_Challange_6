require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/body'

module Pages
    class Home < SitePrism::Page
        set_url '/'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :body, Sections::Body, 'body'   

        element :logo_parabank, 'img[src="/parabank/images/logo.gif"]'
        
        # Função que recebe username e password e tenta fazer o login
        def login (username, password)
            body.input_username.set username
            body.input_password.set password
            body.button_login.click
        end

    end
end