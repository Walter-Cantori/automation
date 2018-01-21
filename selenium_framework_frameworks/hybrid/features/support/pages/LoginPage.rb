class LoginPage < SitePrism::Page
  
    element :email, "#email"
    element :password, "#passwd"
    element :signin_button, "#SubmitLogin"
  
  
    def login(username ,passwd)
        email.set username
        password.set passwd
        signin_button.click
    end
    
  
end