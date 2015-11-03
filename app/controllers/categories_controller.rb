class CategoriesController < ApplicationController
  before_action :require_login, :find_category

  def index
    @categories = Category.paginate page: params[:page],
      per_page: Settings.pagination.categories_per_page
    @lesson = Lesson.new
  end

  def show
  end
end
