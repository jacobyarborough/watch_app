require "rails_helper"

RSpec.describe "Welcome Page", type: :feature do 
  it "displays a welcome message" do 
    visit root_path 

    expect(page).to have_content("Welcome to the Watch App")
  end 

  it "has a link to sign-up/register" do 
    visit root_path 

    click_on "Register" 
    expect(page).to have_current_path(new_registration_path)
  end 

  it "allows you to sign out if signed in" do 
    user = User.create!(email: "example@gmail.com", password: "password", password_confirmation: "password")
    session[:user_id] = user.id
    visit root_path 

    click_on "Sign Out" 
    
    expect(page).not_to have_content("Sign Out")
    expect(page).not_to have_content("example@gmail.com")
  end 
end 