class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page],
      per_page: Settings.pagination.categories_per_page
  end

  def show
    @category = Category.find params[:id]
  end
end
