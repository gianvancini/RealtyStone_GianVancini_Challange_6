module Sections
    class Footer < SitePrism::Section

        # Links menu do footer
        element :button_home_footer, '#footerPanel>ul:nth-child(1)>li:nth-child(1)>a'
        element :button_about_us_footer, '#footerPanel>ul:nth-child(1)>li:nth-child(2)>a'
        element :button_services_footer, '#footerPanel>ul:nth-child(1)>li:nth-child(3)>a'
        element :button_products_footer, '#footerPanel>ul:nth-child(1)>li:nth-child(4)>a'
        element :button_locations_footer, '#footerPanel>ul:nth-child(1)>li:nth-child(5)>a'
        element :button_forum_footer, '#footerPanel>ul:nth-child(1)>li:nth-child(6)>a'
        element :button_site_map_footer, '#footerPanel>ul:nth-child(1)>li:nth-child(7)>a'
        element :button_contact_footer, '#footerPanel>ul:nth-child(1)>li:nth-child(8)>a'

        # Link visit us
        element :button_visit_parasoft, '#footerPanel>ul.visit>li:nth-child(2)>a'
        
    end
end
