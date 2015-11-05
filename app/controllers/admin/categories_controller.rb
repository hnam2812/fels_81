class Admin::CategoriesController < ApplicationController
  before_action :require_login, :admin_user
  before_action :find_category, except: [:index, :create, :new]

  def index
    @categories = Category.order(created_at: :desc).paginate page: params[:page],
      per_page: Settings.pagination.categories_per_page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "admin.category.add.success"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = t "admin.category.add.fail"
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "admin.category.update.success"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = t "admin.category.update.fail"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "admin.category.delete.success"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = t "admin.category.delete.fail"
      render :index
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
