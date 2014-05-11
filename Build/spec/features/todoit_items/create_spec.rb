require 'spec_helper'

describe 'adding todoit items' do 
  let!(:todoit_list) { TodoList.create(title: "Shopping", description: "buy carrots")}


  def visit_todoit_list(list)

      visit "/todoit_lists"
  within "#todoit_list_#{list.id}" do
    click_link "List Items"
   end 

  end


  it " is succesful with valid content" do

    visit_todoit_list(todoit_list)
    click_link"New Todoit Item"
    fill_in "Content", with: "Milk"
    click_button "Save"
    expect(page).to have_content("Added todoit list item.")
    within("ul.todoit_items") do
      expect(page).to have_content ("Milk")

end 