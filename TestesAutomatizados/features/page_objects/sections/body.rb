module Sections
    class Body < SitePrism::Section

        # Elementos login
        element :input_username, 'input[name="username"]'
        element :input_password, 'input[name="password"]'
        element :button_login, 'input.button'
        element :button_forgot_login, '#loginPanel>p:nth-child(2)>a'
        element :button_register, '#loginPanel>p:nth-child(3)>a'
        element :register_form, '#customerForm'
        element :forgot_form, '#lookupForm'   

        #Elementos Contato
        element :contact_name, '#name'
        element :contact_email, '#email'
        element :contact_phone, '#phone'
        element :contact_message, '#message'
        element :contact_button, 'input[value="Send to Customer Care"]'
        element :contact_success, '#rightPanel > p:nth-child(3)'

        #Elementos usuário logado
        element :login_success, '#leftPanel>h2'
        element :login_error, '.error'       
        
        #Elementos admin Page
        element :button_clean, 'button[value="CLEAN"]'
        element :button_initialize, 'button[value="INIT"]'
        element :message_bd, '#rightPanel>p>b'
    end
end
