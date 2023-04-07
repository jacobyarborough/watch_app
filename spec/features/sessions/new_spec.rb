require "rails_helper"

RSpec.describe "Login page" do 
  context "the correct credentials are entered" do 
    it "displays a form to login and routes to root path" do 
      user = User.create(email: "hello@mail.com", password: "password", password_confirmation: "password")

      visit root_path 
  
      click_on "Sign In"
      fill_in "Email", with: "hello@mail.com"
      fill_in "Password", with: "password"
      click_on "Sign In"

      expect(page).to have_current_path(root_path)
      expect(page).to have_content("hello@mail.com")
    end 
  end 

  context "the incorrect credentials are entered" do 
  end 

  context "the user does not exist" do 
  end 
end 