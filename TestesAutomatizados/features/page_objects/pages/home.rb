require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/body'

module Pages
    class Home < SitePrism::Page
        set_url '/'
        section :header, Sections::Header, 'header'
        section :footer, Sections::Footer, 'footer'
        section :body, Sections::Body, 'body'   
        
        # Função que recebe username e password e tenta fazer o login
        def login (username, password)
            body.input_username.set username
            body.input_password.set password
            body.button_login.click
        end
    end
end