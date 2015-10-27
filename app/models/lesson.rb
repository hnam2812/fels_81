class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :results
  has_many :words, through: :results

  accepts_nested_attributes_for :results

  before_create :init_words

  private
  def init_words
    self.words = self.category.words.not_learn(self.user.id)
      .order("RANDOM()").limit Settings.lesson.words_per_lesson
  end
end
