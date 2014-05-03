require 'spec_helper'

describe "Editing todoit lists" do
  let!(:todoit_list) { TodoitList.create(title: "Groceries", description: "Grocery list.") }

  def update_todoit_list(options={})
    options[:title] ||= "My todoit list"
    options[:description] ||= "This is my todoit list."
    todoit_list = options[:todoit_list]

    visit "/todoit_lists"
    within "#todoit_list_#{todoit_list.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Todoit list"
  end

  it "updates a todoit list successfully with correct information" do
    update_todoit_list todo_list: todoit_list, 
                     title: "New title", 
                     description: "New description"

    todoit_list.reload

    expect(page).to have_content("Todoit list was successfully updated")
    expect(todoit_list.title).to eq("New title")
    expect(todoit_list.description).to eq("New description")
  end

  it "displays an error with no title" do
    update_todoit_list todoit_list: todoit_list, title: ""
    title = todoit_list.title
    todoit_list.reload
    expect(todoit_list.title).to eq(title)
    expect(page).to have_content("error")
  end

  it "displays an error with too short a title" do
    update_todoit_list todoit_list: todoit_list, title: "hi"
    expect(page).to have_content("error")
  end

  it "displays an error with no description" do
    update_todoit_list todoit_list: todoit_list, description: ""
    expect(page).to have_content("error")
  end

  it "displays an error with too short a description" do
    update_todoit_list todoit_list: todoit_list, description: "hi"
    expect(page).to have_content("error")
  end
end