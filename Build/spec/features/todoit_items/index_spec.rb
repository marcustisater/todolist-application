require 'spec_helper'

describe 'viewing todoit items' do 
  let!(:todoit_list) { TodoList.create(title: "Shopping", description: "buy carrots")}

  it 'displays no items when a todoit list is empty ' do

  visit "/todoit_lists"
  within "#todoit_list_#{todo_list.id}" do
    click_link "List Items"
  end 

  expect(page).to have_content("TodoitItems#index")

  
  end 

end