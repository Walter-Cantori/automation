class HomePage < SitePrism::Page
    set_url "http://automationpractice.com"
    
    element :sign_in, "a[title='Log in to your customer account']"
    element :contact_us, "a[title='Contact Us']"
    element :sign_out, "a[title='Log me out']"

    #header menu
    element :menu_women, "a[title='Women']"
    element :menu_dresses, "a[title='Dresses']"
    element :menu_tshirts, "a[title='T-shirts']"

    #women header items
    element :summer_dresses, "a[title='Summer Dresses']"


end