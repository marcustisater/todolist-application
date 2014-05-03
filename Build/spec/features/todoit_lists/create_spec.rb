require 'spec_helper'

describe "Creating todoit lists" do
  def create_todoit_list(options={})
    options[:title] ||= "My todoit list"
    options[:description] ||= "This is my todoit list."

    visit "/todoit_lists"
    click_link "New Todoit list"
    expect(page).to have_content("New todoit_list")

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create Todoit list"
  end

  it "redirects to the todoit list index page on success" do
    create_todoit_list
    expect(page).to have_content("My todoit list")
  end

  it "displays an error when the todo list has no title" do
    expect(TodoitList.count).to eq(0)

    create_todoit_list title: ""

    expect(page).to have_content("error")
    expect(TodoitList.count).to eq(0)

    visit "/todoit_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the todoit list has a title less than 3 characters" do
    expect(TodoitList.count).to eq(0)

    create_todoit_list title: "Hi"

    expect(page).to have_content("error")
    expect(TodoitList.count).to eq(0)

    visit "/todoit_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the todo list has no description" do
    expect(TodoitList.count).to eq(0)

    create_todoit_list title: "Grocery list", description: ""

    expect(page).to have_content("error")
    expect(TodoitList.count).to eq(0)

    visit "/todoit_lists"
    expect(page).to_not have_content("Grocery list")
  end

  it "displays an error when the todoit list has no description" do
    expect(TodoitList.count).to eq(0)

    create_todoit_list title: "Grocery list", description: "Food"

    expect(page).to have_content("error")
    expect(TodoitList.count).to eq(0)

    visit "/todoit_lists"
    expect(page).to_not have_content("Grocery list")
  end
end