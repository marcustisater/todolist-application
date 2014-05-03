require 'spec_helper'

describe "Creating Todoit lists" do
  it "redirects to the Todoit list index page on success" do
    visit "/Todoit_lists"
    click_link "New Todoit list"
    expect(page).to have_content("New Todoit_list")

    fill_in "Title", with: "My Todoit list"
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create Todoit list"

    expect(page).to have_content("My Todoit list")
 end

  it "displays an error when the Todoit list has no title" do
    expect(TodoitList.count).to eq(0)

    visit "/todoit_lists"
    click_link "New Todoit list"
    expect(page).to have_content("New Todoit_list")

    fill_in "Title", with: ""
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create Todoit list"

    expect(page).to have_content("error")
    expect(TodoitList.count).to eq(0)

    visit "/todoit_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
 end

  it "displays an error when the Todoit list has a title less than 3 characters" do
    expect(TodoitList.count).to eq(0)

    visit "/Todoit_lists"
    click_link "New Todoit list"
    expect(page).to have_content("New Todoit_list")

    fill_in "Title", with: "Hi"
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create Todoit list"

    expect(page).to have_content("error")
    expect(TodoitList.count).to eq(0)

    visit "/Todoit_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
 end

end