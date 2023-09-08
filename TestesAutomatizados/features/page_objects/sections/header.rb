module Sections
    class Header < SitePrism::Section
        elements :buttons_header_left, 'ul.leftmenu>li'
        elements :buttons_header_right, 'ul.button>li'
    end
end
