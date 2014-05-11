require 'spec_helper'

describe todoitList do
  it { should have_many(:todoit_items) }

  describe "#has_complete_items?" do
    let(:todoit_list) { TodoitList.create(title: "Groceries", description: "Grocery list") }

    it "returns true with completed todoit list items" do
      todoit_list.todoit_items.create(content: "Eggs", completed_at: 1.minute.ago)
      expect(todoit_list.has_completed_items?).to be_true
    end

    it "returns false with no completed todoit list items" do
      todoit_list.todoit_items.create(content: "Eggs")
      expect(todoit_list.has_completed_items?).to be_false
    end
  end
  
  describe "#has_incomplete_items?" do
    let(:todoit_list) { TodoitList.create(title: "Groceries", description: "Grocery list") }

    it "returns true with incompleted todoit list items" do
      todoit_list.todoit_items.create(content: "Eggs")
      expect(todoit_list.has_incomplete_items?).to be_true
    end

    it "returns false with no incomplete todoit list items" do
      todoit_list.todoit_items.create(content: "Eggs", completed_at: 1.minute.ago)
      expect(todoit_list.has_incomplete_items?).to be_false
    end
  end

end
