class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to todo_lists_path

  else
    flash[:error] = "There was a problem logging into your ToDo account. Please check your password and e-mail otherwise contact Marcus!"
    render action: 'new'
    
    end   
  end
end
