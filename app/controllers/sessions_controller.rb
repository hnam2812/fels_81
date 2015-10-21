class SessionsController < ApplicationController

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = t "error_login"
      render :new
    end
  end
   
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
