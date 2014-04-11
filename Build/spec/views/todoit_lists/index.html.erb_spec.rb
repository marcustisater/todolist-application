require 'spec_helper'

describe "todoit_lists/index" do
  before(:each) do
    assign(:todoit_lists, [
      stub_model(TodoitList,
        :title => "Title",
        :description => "Description",
        :text => "Text"
      ),
      stub_model(TodoitList,
        :title => "Title",
        :description => "Description",
        :text => "Text"
      )
    ])
  end

  it "renders a list of todoit_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
