require 'spec_helper'

describe 'adding todoit items' do 
  let!(:todoit_list) { TodoList.create(title: "Shopping", description: "buy carrots")}


  it " is succesful with valid content" do

    visit_todoit_list(todoit_list)
    click_link"New Todoit Item"
    fill_in "Content", with: "Milk"
    click_button "Save"
    expect(page).to have_content("Added todoit list item.")
    within("ul.todoit_items") do
      expect(page).to have_content ("Milk")
    end 
  end 

  it 'displays an error with no content less than 2 characters long ' do
    visit_todoit_list(todoit_list)
    click_link "New Todoit Item"
    fill_in "Content", with: "1"
    click_button "Save"
    within("div.flash") do
      expect(page).to have_content("there was a problem adding a todoit list item")
    end 

    expect(page).to have_content ("page is way toooo short man")
  end 







end 