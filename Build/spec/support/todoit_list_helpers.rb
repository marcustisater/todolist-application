module TodoitListHelpers

    def visit_todoit_list(list)

      visit "/todoit_lists"
  within dom_id_for(list)  do
    click_link "List Items"
   end 

  end

end