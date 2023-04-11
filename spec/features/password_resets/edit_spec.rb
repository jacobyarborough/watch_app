require "rails_helper" 

RSpec.describe "passwrod reset edit page", type: :feature do 
  context "the link has not expired" do 
    it "presents a form to enter new passwords" do 
      user = User.create(email: "lolz@mail.com", password: "password", password_confirmation: "password")
      @token = user.signed_id(purpose: "password_reset")

      visit edit_password_reset_path(token: @token) 

      fill_in "Password", with: "new_password" 
      fill_in "Password confirmation", with: "new_password"
      click_on "Update Password" 

      expect(page).to have_current_path(new_session_path)
      expect(page).to have_content("You have successfully updated the password")
    end 
  end 
end 