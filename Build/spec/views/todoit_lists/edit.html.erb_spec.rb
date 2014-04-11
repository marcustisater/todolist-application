require 'spec_helper'

describe "todoit_lists/edit" do
  before(:each) do
    @todoit_list = assign(:todoit_list, stub_model(TodoitList,
      :title => "MyString",
      :description => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit todoit_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", todoit_list_path(@todoit_list), "post" do
      assert_select "input#todoit_list_title[name=?]", "todoit_list[title]"
      assert_select "input#todoit_list_description[name=?]", "todoit_list[description]"
      assert_select "input#todoit_list_text[name=?]", "todoit_list[text]"
    end
  end
end
