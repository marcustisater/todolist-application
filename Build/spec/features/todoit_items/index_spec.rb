require 'spec_helper'

describe 'viewing todoit items' do 
  let!(:todoit_list) { TodoList.create(title: "Shopping", description: "buy carrots")}


  it 'displays the title of the todoit list' do
    visit_todoit_list(todoit_list)
    within("h1") do 
      expect(page).to have_Contetn(todoit_list.title)
  end 

  it 'displays no items when a todoit list is empty ' do

    expect(page.all("ul.todoit_items li").size).to eq(0)

  end 

  it "dispalys items contnt when a todoit list has tasks!"
  todoit_list.todoit_items.create(content: "milk")
  todoit_list.todoit_items.create(content: "milk2")
  visit_todoit_list(todoit_list)
  expect(page.all("ul.todoit_items li").size).to eq(2)
  within "ul.todoit_items" do
    todoit_list.todoit_items.create(content: "milk")
    todoit_list.todoit_items.create(content: "milk2")
  end 

end 


end