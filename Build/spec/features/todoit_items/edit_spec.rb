require 'spec_helper'

describe 'editing my todoit items' do 
  let!(:todoit_list) { TodoList.create(title: "Shopping", description: "buy carrots")}
  let!(:todoit_list) { todoit_list.todoit_items.create(content: "Milk"))

  def visit_todoit_list(list)

      visit "/todoit_lists"
  within "#todoit_list_#{list.id}" do
    click_link "List Items"
   end 

  end

it 'is succesful with valid content' do
  visit_todoit_list(todoit_list)
  wihin("#todoit_items_#{todoit_item.id}") do
    click_link "Edit"
  end

  fill_in "Content", with: "Many Milk, Many drinks"
  click_button "Save"
  expect(page).to have_content ("Saved todoit list item")
  todoit_item.reload
  expect(todoit_item.content).to eq ("Many Milk, Many drinks")
  end 


end 