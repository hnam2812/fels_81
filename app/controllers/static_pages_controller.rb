class StaticPagesController < ApplicationController
  def home
    @activities = current_user.load_activities.paginate page: params[:page],
      per_page:Settings.pagination.activities_per_page if logged_in?
  end

  def help
  end
end
