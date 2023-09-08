module Sections
    class Footer < SitePrism::Section

        # Links do footer
        elements :buttons_menu_footer, '#footerPanel>ul:nth-child(1)>li'
        element :button_visit_parasoft, '#footerPanel>ul.visit>li:nth-child(2)>a'

        def test_links_footer_menu
            
        end

        def test_links_footer_parasoft
            
        end
    end
end
