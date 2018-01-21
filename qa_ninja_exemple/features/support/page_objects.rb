class Login < SitePrism::Page

    element :username_input, 'input[name="username"]'
    element :password_input, "input[name='password']"
    element :submit_btn, "button[id='login-btn']"
    element :valid_user_check, "a[href='/dashboard']"
    element :invalid_user_check, "#message p"

    def click_submit
        submit_btn.click
    end

end