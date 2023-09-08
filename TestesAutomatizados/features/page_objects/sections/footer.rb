module Sections
    class Footer < SitePrism::Section
        elements :buttons_menu_footer, '#footerPanel>ul:nth-child(1)'
        element :button_visit_parasoft, '#footerPanel>ul.visit>li:nth-child(2)>a'
    end
end
