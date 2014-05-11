class TodoitItemsController < ApplicationController
  def index

    @todoit_list = TodoitList.find(params[:todoit_list_id])

  end

  def new
    @todoit_list = TodoitList.find(params[:todoit_list_id])
    @todoit_item = @todoit_list.todoit_items.new 
  end 


  def create 

    

end
