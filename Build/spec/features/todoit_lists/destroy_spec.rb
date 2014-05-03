require 'spec_helper'


describe "Deleting todoit lists" do 

  let!(:todoit_list) { TodoitList.create(title: "Jag ska ta bort den har ando", description: "Ja det ska jag, jag gor ando bara en test hehe")}

  it "is succesfull when I click delete" do

    visit "/todoit_lists"

    within "#todoit_list_#{todo_list.id}" do
      click_link "Destroy"

    end 

    expect(page).to_not habve_content(todoit_list.title)
    expect(TodoitList.count).to eq(0)

end
end 
  