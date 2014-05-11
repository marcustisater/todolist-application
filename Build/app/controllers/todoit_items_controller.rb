class TodoitItemsController < ApplicationController
  def index

    @todoit_list = TodoitList.find(params[:todoit_list_id])

  end

  def new
    @todoit_list = TodoitList.find(params[:todoit_list_id])
    @todoit_item = @todoit_list.todoit_items.new 
  end 


  def create 

    @todoit_list = TodoitList.find(params[:todoit_list_id])
    @todoit_item = @todoit_list.todoit_items.new(todoit_item_params)

    if @todoit_item.save
      flash[:success] = "Added todoit list item"
      redirect_to todoit_list_todoit_items_path
    else
      flash[:error] = "There was a problem adding that todoit list item"
      render action: :new 
   



  end 


  private 
  def todoit_item_params 
    params[:todoit_item].permit(:content)
  end 

end
