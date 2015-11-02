class Admin::UsersController < ApplicationController
  before_action :require_login, :admin_user, :find_user, only: :destroy

  def destroy
    if @user.destroy
      flash[:success] = t "flash.user.delete.success"
    else
      flash[:warning] = t "flash.user.delete.fail"
    end
    redirect_to users_url
  end
end
