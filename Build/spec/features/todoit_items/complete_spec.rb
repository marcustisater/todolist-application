require 'spec_helper'

describe 'complete my todoit items' do 
  let!(:todoit_list) { TodoList.create(title: "Shopping", description: "buy carrots")}
  let!(:todoit_list) { todoit_list.todoit_items.create(content: "Milk"))

  it "is succesfull when marking a single item complete" do
    expect(todoit_item.completed_at).to be_nil
    visit_todoit_list todoit_list
    within dom_id_for(todoit_item) do
      click_link "mark completed"
    end

    todoit_item.reload
    expect(todoit_item.completed_at).to_not be_nil
  end 

  context "with completed items" do

    let!(:todoit_list) { TodoList.create(title: "Shopping", description: "buy carrots", completed: "5min ago")}

    it "shows completed items as completed" do
      visit_todoit_list todoit_list
      within dom_id_for(completed_todoit_item) do
        expect(page).to have_content(completed_todoit_item_at)

    end

  end


end 