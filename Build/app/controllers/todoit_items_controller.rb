class TodoitItemsController < ApplicationController
  def index

    @todoit_list = TodoitList.find(params[:todoit_list_id])

  end
end
