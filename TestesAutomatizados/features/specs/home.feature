#language: pt

@regression
@home
Funcionalidade: HomePage
    SENDO um usuário do ParaBank
    QUERO navegar na home Page
    PARA acessar as funcionalidades da aplicação

    Contexto: Estar na home page
        Dado que esteja na página inicial do banco
    
    @home_page_load
    Cenário: Carregamento da pagina
        Então a HomePage é exibida corretamente
    
    @links
    @links_header
    Esquema do Cenário: Links da seção header
        Quando acessa a opção "<link>" da seção Header
        Então é redirecionado para página correta "<page_url>"
        Exemplos:
        |   link     |     page_url     |
        | about_us   |   about_us_url   |
        | services   |   services_url   |
        | products   |   products_url   |
        | locations  |  locations_url   |
        | admin_page |  admin_page_url  |
        |    home    |     home_url     |
        | about_us   |   about_us_url   |
        |   contact  |   contact_url    |
    
    @links
    @links_footer
    Esquema do Cenário: Links da seção footer
        Quando acessa a opção "<link>" da seção Footer
        Então é redirecionado para página correta "<page_url>"
        Exemplos:
        |       link       |       page_url        |
        |   home_footer    |    home_footer_url    |
        | about_us_footer  |  about_us_footer_url  |
        | services_footer  |  services_footer_url  |
        | products_footer  |  products_footer_url  |
        | locations_footer |  locations_footer_url |
        |  forum_footer    |  forum_footer_url     |
        | site_map_footer  |  site_map_footer_url  |
        |  contact_footer  |   contact_footer_url  |
        | visit_us_footer  |  visit_us_footer_url  |

    
    @redirect_to_register
    Cenário: Redirecionamento para página de cadastro
        Quando acessa a funcionalidade para criação de nova conta
        Então é redirecionado para página de cadastro
    
    @redirect_to_fogot_login
    Cenário: Redirecionamento para página de recuperação de senha
        Quando acessa a funcionalidade para recuperação de senha
        Então é redirecionado para página de recuperação de senha

    @contact
    Cenário: Entrar em contato
        Quando acessa a funcionalidade de contato
        E envia o formulário de contato com dados válidos
        Então é apresentado uma mensagem de envio com sucesso
    
    @ignore
    @invalid_contact
    Cenário: Entrar em contato com dados inválidos
        Quando acessa a funcionalidade de contato
        E envia o formulário de contato com dados inválidos
        Então é apresentado uma mensagem de erro ao enviar contato