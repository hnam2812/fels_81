class Lesson < ActiveRecord::Base
  include CreateActivity
  belongs_to :category
  belongs_to :user

  has_many :results, dependent: :destroy
  has_many :words, through: :results

  accepts_nested_attributes_for :results

  before_create :init_words
  after_create :create_learning_activity
  before_update :create_learned_activity

  def words_correct
    correct = self.results.select{|item| !item.answer.nil? && item.answer.correct}.size
    total = self.words.size
    [correct, total].join("/")
  end

  private
  def init_words
    self.words = self.category.words.not_learn(self.user.id)
      .order("RANDOM()").limit Settings.lesson.words_per_lesson
  end

  def create_learning_activity
    create_activity :learning, self.user.id, self.id
  end

  def create_learned_activity
    create_activity :learned, self.user.id, self.id
  end
end
