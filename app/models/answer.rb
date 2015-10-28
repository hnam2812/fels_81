class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :results

  validates :content, presence: true
end
