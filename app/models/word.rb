class Word < ActiveRecord::Base
  belongs_to :category
  
  has_many :lesson, through: :lesson_word  
  has_many :results
  has_many :answers
  has_many :user_word
end
