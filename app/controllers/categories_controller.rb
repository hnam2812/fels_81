class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page],
      per_page: Settings.pagination.categories_per_page
    @lesson = Lesson.new
  end

  def show
    @category = Category.find params[:id]
  end
end
