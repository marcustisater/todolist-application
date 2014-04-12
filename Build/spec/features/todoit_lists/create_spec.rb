require 'spec_helper'


# testing my list
describe "Create a todo list" do

  it "redirects to my todolist page on success" do
        visit "/todoit_lists"
      click_link "New Todoit list"
      expect(page).to have_content ("New todoit_list")


      fill_in "Title", with: "My Todoit list"
      fill_in "Description", with: "This is what I'm doing today"
      fill_in "Text", width: "Not much..."


      expect(page).to have_content ("New todoit_list")

    end

    # when there is nothing in it...
    it "displays an error when the todo list has no title" do
    expect(TodoitList.count).ti eq(0)


    visit "/todoit_lists"
    click_link "New Todoit list"
    expect(page).to have_content ("New todoit_list")

    fill_in "Title", with: "My Todoit list"
    fill_in "Description", with: "This is what I'm doing today"
    fill_in "Text", width: "Not much..."

    expect(page).to have_content ("error")
    expect(TodoitList.count).ti eq(0)

    visit "/todoit_lists"
    expect(page).to_not have_content("This is what I'm doing today")
  end
end
