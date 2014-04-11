class TodoitListsController < ApplicationController
  before_action :set_todoit_list, only: [:show, :edit, :update, :destroy]

  # GET /todoit_lists
  # GET /todoit_lists.json
  def index
    @todoit_lists = TodoitList.all
  end

  # GET /todoit_lists/1
  # GET /todoit_lists/1.json
  def show
  end

  # GET /todoit_lists/new
  def new
    @todoit_list = TodoitList.new
  end

  # GET /todoit_lists/1/edit
  def edit
  end

  # POST /todoit_lists
  # POST /todoit_lists.json
  def create
    @todoit_list = TodoitList.new(todoit_list_params)

    respond_to do |format|
      if @todoit_list.save
        format.html { redirect_to @todoit_list, notice: 'Todoit list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @todoit_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @todoit_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todoit_lists/1
  # PATCH/PUT /todoit_lists/1.json
  def update
    respond_to do |format|
      if @todoit_list.update(todoit_list_params)
        format.html { redirect_to @todoit_list, notice: 'Todoit list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todoit_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todoit_lists/1
  # DELETE /todoit_lists/1.json
  def destroy
    @todoit_list.destroy
    respond_to do |format|
      format.html { redirect_to todoit_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todoit_list
      @todoit_list = TodoitList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todoit_list_params
      params.require(:todoit_list).permit(:title, :description, :text)
    end
end
