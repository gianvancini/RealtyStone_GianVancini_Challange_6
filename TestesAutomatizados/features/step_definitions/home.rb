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