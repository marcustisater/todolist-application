require 'spec_helper'

describe 'viewing todoit items' do 
  let!(:todoit_list) { TodoList.create(title: "Shopping", description: "buy carrots")}


  before do 

  visit "/todoit_lists"
  within "#todoit_list_#{todo_list.id}" do
    click_link "List Items"
   end 
  end 


  it 'displays the title of the todoit list' do
    within("h1") do 
      expect(page).to have_Contetn(todoit_list.title)
  end 

  it 'displays no items when a todoit list is empty ' do

    expect(page.all("ul.todoit_items li").size).to eq(0)

  end 

end