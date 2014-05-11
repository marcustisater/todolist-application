class TodoitItemsController < ApplicationController
  
  before_action :find_todoit_list

  def index

  end

  def new
    
    @todoit_item = @todoit_list.todoit_items.new 
  end 


  def create
    
    @todoit_item = @todoit_list.todoit_items.new(todoit_item_params)
    if @todoit_item.save
      flash[:success] = "Added todoit list item."
      redirect_to todoit_list_todoit_items_path
    else
      flash[:error] = "There was a problem adding that todoit list item."
      render action: :new
    end
  end

  def edit

  end 

  def update
      @todoit_list = TodoitList.find(params[:todoit_list_id])
      @todoit_item = @todoit_list.todoit_items.find(params[:id])
      if @todoit_item.update_attributes(todoit_item_params) 
        flash[:success] = "Saved a todoit list item again!"
        redirect_to todoit_list_todoit_items_path
      else
        flash[:error] = "That todoit item couldn't be saved "
        render action: :edit
      end
  end 

  def destroy 
    @todoit_item = @todoit_list.todoit_items.find(params[:id])
    if @todoit_item.destroy
      flash[:success] = "Todoit list item was deleted"
    else 
      flash[:error] = "Todoit list was not deleted"
    end

    redirect_to todoit_list_todoit_items_path

  end 

  def complete
    @todoit_item = @todoit_list.todoit_items.find(params[:id])
    @todoit_item.update_attribute(:completed_at, Time.now)
    redirect_to todoit_list_todoit_items_path, notice: "Todoit item is marked as completed"
  end

  def url_options
    { todoit_list_id: params[:todoit_list_id] }.merge(super)
  end

  private 
  def find_todoit_list
    @todoit_list = TodoitList.find(params[:todoit_list_id])
  end 

  private
  def todoit_item_params
    params[:todoit_item].permit(:content)
  end



end
