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

    fill_in "Email", with: "example@mail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"

    expect(page).to have_current_path(root_path)
    expect(page).to have_content("example@mail.com")
  end 

  it "allows you to sign out if signed in" do 
    visit root_path 

    click_on "Register" 
    expect(page).to have_current_path(new_registration_path)

    fill_in "Email", with: "example@mail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"

    expect(page).not_to have_content("Register")

    click_on "Sign Out"

    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Successfully signed out")
    expect(page).not_to have_content("example@gmail.com")
  end 

  it "has a link to sign in" do 
    user = User.create(email: "hello@mail.com", password: "password", password_confirmation: "password")

    visit root_path 

    click_on "Sign In"
    fill_in "Email", with: "hello@mail.com"
    fill_in "Password", with: "password"
    click_on "Sign In"

    expect(page).to have_current_path(root_path)
    expect(page).to have_content("hello@mail.com")
    expect(page).to have_content("Sign Out")
    expect(page).not_to have_content("Sign In")
    expect(page).not_to have_content("Register")
  end 

  it "has a link for a user to edit password" do 
    user = User.create!(email: "bye@mail.com", password: "password", password_confirmation: "password")

    visit root_path 

    click_on "Sign In"
    fill_in "Email", with: "bye@mail.com"
    fill_in "Password", with: "password"
    click_on "Sign In"

    click_on "Edit Password"
    expect(page).to have_current_path(edit_password_path(user))
  end 
end 