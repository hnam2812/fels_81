class Admin::UsersController < ApplicationController
  before_action :require_login, :admin_user

  def destroy
    if User.find(params[:id]).destroy
      flash[:success] = t "flash.user.delete.success"
    else
      flash[:warning] = t "flash.user.delete.fail"
    end
    redirect_to users_url
  end
end
