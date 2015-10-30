class WordsController < ApplicationController
  before_action :load_categories
  def index
    option = params[:option].nil? ? Settings.all_words : params[:option]
    if params[:category].nil? || params[:category].empty?
      @words = Word.send(option, current_user.id).
        paginate page: params[:page],
        per_page: Settings.pagination.words_per_page
    elsif (category = Category.find_by id: params[:category].to_i)
      @words = category.words.send(option, current_user.id).
        paginate page: params[:page],
        per_page: Settings.pagination.words_per_page
    else
      @words = []
    end
  end

  private
  def load_categories
    @categories = Category.all
  end
end
