Dado('que esteja na página inicial do banco') do
    @home = Pages::Home.new
    @home.load
end
  
Então('a HomePage é exibida corretamente') do
    expect(@home.logo_parabank.visible?).to be_truthy
end


Quando('acessa a funcionalidade para criação de nova conta') do
    @home.body.button_register.click
end
  
Então('é redirecionado para página de cadastro') do
    
    expect(@home.body.register_form.visible?).to be_truthy
end


Quando('acessa a funcionalidade para recuperação de senha') do
    @home.body.button_forgot_login.click
end
  
Então('é redirecionado para página de recuperação de senha') do
    @home.body.forgot_form.click
end


Quando('acessa a opção {string} da seção Header') do |link|
    url = Factory::Static.static_data_two('buttons_header', link)
    @home.header.send(url.to_sym).click
end

Quando('acessa a opção {string} da seção Footer') do |link|
    url = Factory::Static.static_data_two('buttons_footer', link)
    @home.footer.send(url.to_sym).click
end

Então('é redirecionado para página correta {string}') do |page_url|
    if page_url.include?('footer')
        if page_url.include?('visit_us')
            # Pagina visit us abre em outra guia
            page.driver.browser.switch_to.window(page.driver.browser.window_handles[1])
            redirect = Factory::Static.static_data_two('buttons_footer', page_url)
        else
            # botoes do footer
            redirect = Factory::Static.static_data_two('buttons_footer', page_url)
        end
    else
        # botoes do header
        redirect = Factory::Static.static_data_two('buttons_header', page_url)
    end
    expect(current_url).to eq redirect
end


Quando('acessa a funcionalidade de contato') do
    @home.header.button_contact_right.click
end
  
E('envia o formulário de contato com dados válidos') do
    @contact = Factory::Static.static_data('form_contact')

    @home.body.contact_name.set @contact["name"]
    @home.body.contact_email.set @contact["email"]
    @home.body.contact_phone.set @contact["phone"]
    @home.body.contact_message.set @contact["message"]

    @home.body.contact_button.click
end
  
Então('é apresentado uma mensagem de envio com sucesso') do
    expect(page).to have_content(@contact["success"])
end


E('envia o formulário de contato com dados inválidos') do
    @invalid_contact = Factory::Static.static_data('invalid_contact')

    @home.body.contact_name.set @invalid_contact["name"]
    @home.body.contact_email.set @invalid_contact["email"]
    @home.body.contact_phone.set @invalid_contact["phone"]
    @home.body.contact_message.set @invalid_contact["message"]

    @home.body.contact_button.click
end
  
Então('é apresentado uma mensagem de erro ao enviar contato') do
    expect(page).to have_content(@invalid_contact["error"])
end