require "rails_helper" 

RSpec.describe "Edit Password form", type: :feature do 
  context "the user is logged in" do 
    it "displays a form or a user to edit their password" do
      user = User.create!(email: "lol@mail.com", password: "password", password_confirmation: "password")

      visit root_path 

      click_on "Sign In"
      fill_in "Email", with: "lol@mail.com"
      fill_in "Password", with: "password"
      click_on "Log In"

      visit edit_password_path(user.id)

      fill_in "Password", with: "new_password"
      fill_in "Password confirmation", with: "new_password"
      click_on "Update Password"

      expect(page).to have_current_path(root_path)
      expect(page).to have_content("Successfully updated password")
    end 
  end 

  context "the user is not logged in" do 
    it "should redirect the user to the sign in page with an error" do 
      visit "/passwords/1/edit"

      expect(page).to have_current_path(new_session_path)
      # expect(page).to have_content("You must be signed in")
    end 
  end 

  context "the user does not enter matching passwords" do 
  end 
end 