require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/body'

module Pages
    class Home < SitePrism::Page
        set_url '/'
        section :header, Sections::Header, 'header'
        section :footer, Sections::Footer, 'footer'
        section :body, Sections::Body, 'body'    
    end
end