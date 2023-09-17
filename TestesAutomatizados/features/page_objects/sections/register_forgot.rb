module Sections
    class Register_Forgot < SitePrism::Section

        #Elementos do registro
        element :register_first_name, '#customer\.firstName'
        element :register_last_name, '#customer\.lastName'
        element :register_address, '#customer\.address\.street'
        element :register_city, '#customer\.address\.city'
        element :register_state, '#customer\.address\.state'
        element :register_zip_code, '#customer\.address\.zipCode'
        element :register_phone, '#customer\.phoneNumber'
        element :register_ssn, '#customer\.ssn'
        element :register_username, '#customer\.username'
        element :register_password, '#customer\.password'
        element :register_confirm_password, '#repeatedPassword'
        element :register_form_button, 'input[value="Register"]'

        #Elementos da recuperaçao de senha
        element :forgot_first_name, '#firstName'
        element :forgot_last_name, '#lastName'
        element :forgot_address, '#address\.street'
        element :forgot_city, '#address\.city'
        element :forgot_state, '#address\.state'
        element :forgot_zip_code, '#address\.zipCode'
        element :forgot_ssn, '#ssn'
        element :forgot_form_button, 'input[value="Find My Login Info"]'
        element :forgot_success, '#rightPanel>h1'
    end
end
