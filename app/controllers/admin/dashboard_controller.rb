class Admin::DashboardController < ApplicationController
  before_action :require_login, :admin_user

  def home
  end
end
