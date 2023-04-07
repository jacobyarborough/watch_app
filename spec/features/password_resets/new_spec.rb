require "rails_helper"

RSpec.describe "New form for forgot password" do 
  it "displays a form to enter in your email, then redirects to root" do 
    user = User.create(email: "lolz@mail.com", password: "password", password_confirmation: "password")
    visit new_password_reset_path 

    fill_in "Email", with: "lolz@mail.com"
    click_on "Send Forgot Email Link"

    expect(page).to have_content("If the email is on file we will send a link")
    expect(page).to have_current_path(root_path)
  end 
end 