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
end 