class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :require_login, except: [:new, :create, :destroy]
  before_action :find_user, except: [:index, :new, :create]

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = t "signup_success"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash.user.update.success"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def correct_user
    find_user
    redirect_to root_url unless current_user?(@user)
  end
end
