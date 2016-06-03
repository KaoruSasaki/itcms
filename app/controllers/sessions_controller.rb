class SessionsController < ApplicationController
  def index
  end
  
  def create
    user = User.find_by_name params[:name]
    if user && user.authenticate(params[:pass])
      session[:user_id] = user.id
      redirect_to menus_path
    else
      redirect_to sessions_path, :flash => { :error => "Invalid!" }
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to sessions_path
  end
end
