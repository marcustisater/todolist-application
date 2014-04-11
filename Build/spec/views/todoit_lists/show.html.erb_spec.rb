require 'spec_helper'

describe "todoit_lists/show" do
  before(:each) do
    @todoit_list = assign(:todoit_list, stub_model(TodoitList,
      :title => "Title",
      :description => "Description",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/Text/)
  end
end
