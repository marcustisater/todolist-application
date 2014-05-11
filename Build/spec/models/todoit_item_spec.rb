require 'spec_helper'

describe TodoitItem do
  it { should belong_to (:todoit_list)}


  describe '#completed?' do
    let(:todoit_item) { TodoitItem.create(content: "Hello")}

    it "is false when completed_is blank" do
      todoit_item.completed_at = nil
      expect(todoit_item.completed?).to be_false
    end 
  end

end
