module Sections
    class Body < SitePrism::Section
        element :input_username, 'input[name="username"]'
        element :input_password, 'input[name="password"]'
        element :button_login, 'input.button'
        element :button_forgot_login, '#loginPanel>p:nth-child(2)>a'
        element :button_register, '#loginPanel>p:nth-child(3)>a'
    end
end
