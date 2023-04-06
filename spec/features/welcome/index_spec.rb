require "rails_helper"

RSpec.describe "Welcome Page", type: :feature do 
  it "displays a welcome message" do 
    visit root_path 

    expect(page).to have_content("Welcome to the Watch App")
  end 
end 