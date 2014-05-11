require 'spec_helper'

describe 'delete my todoit items' do 
  let!(:todoit_list) { TodoList.create(title: "Shopping", description: "buy carrots")}
  let!(:todoit_list) { todoit_list.todoit_items.create(content: "Milk"))

  def visit_todoit_list(list)

      visit "/todoit_lists"
  within "#todoit_list_#{list.id}" do
    click_link "List Items"
   end 

  end

it 'is succesfull ' do
  visit_todoit_list(todoit_list)
  within "#todoit_item_#{todoit_item.id}" do
      click_link "Delete"
  end

  expect(page).to have_content ("todolist item is removed/deleted")
  expect(page.)to eq(0) 


end