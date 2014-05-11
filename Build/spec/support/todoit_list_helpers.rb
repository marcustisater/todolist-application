module TodoitListHelpers

    def visit_todoit_list(list)

      visit "/todoit_lists"
  within "#todoit_list_#{list.id}" do
    click_link "List Items"
   end 

  end
  
end