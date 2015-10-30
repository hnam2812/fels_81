class Admin::WordsController < ApplicationController
  before_action :require_login, :admin_user
  before_action :load_categories, only: [:new, :create]

  def new
    @word = Word.new
    Settings.word.answers_per_word.times{@word.answers.new}
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t "admin.word.add.success"
      redirect_to new_admin_word_path
    else
      render :new
    end

  end

  private
  def load_categories
    @categories = Category.all
  end

  def word_params
    params.require(:word).permit :category_id, :content,
      answers_attributes: [:content, :correct, :_destroy]
  end
end
