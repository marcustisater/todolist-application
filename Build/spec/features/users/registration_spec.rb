require "spec_helper"

describe "Signing up" do
  it "allows a user to sign up for the site and creates the object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"

    fill_in "First Name", with: "Marcus"
    fill_in "Last Name", with: "Tisater"
    fill_in "Email", with: "marcus.tisater@elev.it-gymnasiet.se"
    fill_in "Password", with: "hello123"
    fill_in "Password (again)", with: "hello123"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end
  
end