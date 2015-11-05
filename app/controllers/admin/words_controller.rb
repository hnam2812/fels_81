class Admin::WordsController < ApplicationController
  before_action :require_login, :admin_user
  before_action :load_categories, only: [:new, :create]
  before_action :find_word, only: :destroy

  def index
    @words = Word.paginate page: params[:page],
      per_page: Settings.pagination.words_per_page
  end

  def new
    @word = Word.new
    Settings.word.answers_per_word.times{@word.answers.new}
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t "admin.word.add.success"
      redirect_to admin_category_path @word.category
    else
      render :new
    end

  end

  def destroy
    if @word.destroy
      flash[:success] = t "admin.word.delete.success"
    else
      flash[:danger] = t "admin.word.delete.fail"
    end
    redirect_to admin_category_path @word.category
  end

  private
  def load_categories
    @categories = Category.all
  end

  def word_params
    params.require(:word).permit :category_id, :content,
      answers_attributes: [:content, :correct, :_destroy]
  end

  def find_word
    @word = Word.find params[:id]
  end
end
