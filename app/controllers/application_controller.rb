class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :set_locale

  def require_login
    unless logged_in?
      store_location
      flash[:danger] = t "login_require"
      redirect_to login_url
    end
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_user
    @user = User.find_by(id: params[:id]) || User.find_by(slug: params[:id])
  end

  def find_category
    @category = Category.find_by(id: params[:id]) ||
      Category.find_by(slug: params[:id])
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
