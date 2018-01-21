module Keywords
  
    def access url
      visit url
    end
  
    def sign_in(username,password)
      click_link(OR['signin_text'])
      find(OR['username_id']).set(username)
      fill_in(OR['password_id'], with: password)
      click_button(OR['submit_login_id'])
    end

    def sign_in_error_check
      expect(page).to have_css(OR['error_css'])
      expect(page).to have_css('li', text: OR['error_msg'])
    end
  
    def contact_customer_service(order, message)
      click_link(OR['contact_us_text'])
      select('Customer service', from: OR['subject_heading_id'])
      find(OR['email_id']).set('abc@123.com')
      fill_in(OR['order_reference_id'], with: order)
      fill_in(OR['message_id'], with: message)
      click_button(OR['submit_message_id'])
    end

    def form_submit_success_check
      expect(page).to have_css(OR['success_css'])
      expect(page).to have_content(OR["success_msg"])
    end
  end