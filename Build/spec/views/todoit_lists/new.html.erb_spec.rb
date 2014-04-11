require 'spec_helper'

describe "todoit_lists/new" do
  before(:each) do
    assign(:todoit_list, stub_model(TodoitList,
      :title => "MyString",
      :description => "MyString",
      :text => "MyString"
    ).as_new_record)
  end

  it "renders new todoit_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", todoit_lists_path, "post" do
      assert_select "input#todoit_list_title[name=?]", "todoit_list[title]"
      assert_select "input#todoit_list_description[name=?]", "todoit_list[description]"
      assert_select "input#todoit_list_text[name=?]", "todoit_list[text]"
    end
  end
end
