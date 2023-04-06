require "rails_helper"

RSpec.describe "New registrations page", type: :feature do 
  context "a user correctly enters information" do 
    it "displays a registration form" do 
      visit new_registration_path 

      fill_in "Email", with: "example@mail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create Account"

      expect(page).to have_current_path(root_path)
      
      user = User.last 

      expect(user.email).to eq("example@mail.com")
    end 
  end 

  context "a user does not enter a valid email address" do 
    it "displays an error message and renders the new form" do  
    end 
  end 

  context "a user enters in non-matching passwords" do 
    it "displays an error message and renders the new form" do  
    end 
  end 
end 