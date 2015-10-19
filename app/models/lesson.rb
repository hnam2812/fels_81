class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :results
  has_many :words, through: :lesson_word
end
