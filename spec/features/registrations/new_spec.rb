require "rails_helper"

RSpec.describe "New registrations page", type: :feature do 
  it "displays a registration form" do 
    visit new_registration_path 

    fill_in "Email", with: "example@mail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"

    expect(response).to have_http_status(302)
    expect(page).to have_current_path(root_path)
    
    user = User.last 

    expect(user.email).to eq("example@mail.com")
  end 
end 