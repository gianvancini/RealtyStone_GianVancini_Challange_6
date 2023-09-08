module Sections
    class Header < SitePrism::Section

        # Links do Header
        elements :buttons_header_left, 'ul.leftmenu>li'
        elements :buttons_header_right, 'ul.button>li'

        def test_links_header_left

        end

        def test_links_header_right
            
        end
    end
end
