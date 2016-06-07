class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_name params[:name]
    if user && user.authenticate(params[:pass])
      log_in user
      redirect_to menus_path
    else
      redirect_to login_path, :flash => { :error => "ログイン情報が不正です。" }
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
