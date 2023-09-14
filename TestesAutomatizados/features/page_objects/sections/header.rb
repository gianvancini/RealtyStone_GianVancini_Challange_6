module Sections
    class Header < SitePrism::Section

        # Links do Header Esquerda
        element :button_about_us_left, 'ul.leftmenu>li:nth-child(2)>a'
        element :button_services_left, 'ul.leftmenu>li:nth-child(3)>a'
        element :button_products_left, 'ul.leftmenu>li:nth-child(4)>a'
        element :button_locations_left, 'ul.leftmenu>li:nth-child(5)>a'
        element :button_admin_page_left, 'ul.leftmenu>li:nth-child(6)>a'

        # Links do Header Esquerda
        element :button_home_right, 'ul.button>li:nth-child(1)>a'
        element :button_about_us_right, 'ul.button>li:nth-child(2)>a'
        element :button_contact_right, 'ul.button>li:nth-child(3)>a'
    end
end
