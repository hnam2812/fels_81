class WordsController < ApplicationController
  before_action :load_categories
  def index
    @words = Word.paginate page: params[:page],
      per_page: Settings.pagination.words_per_page
  end

  private
  def load_categories
    @categories = Category.all
  end
end
