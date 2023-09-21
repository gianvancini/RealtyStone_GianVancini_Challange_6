require_relative '../sections/body'
require_relative '../sections/user_services'

module Pages
    class User < SitePrism::Page
        section :body, Sections::Body, 'body' 
        section :user_services, Sections::User_Services, 'body' 
    
    end
end