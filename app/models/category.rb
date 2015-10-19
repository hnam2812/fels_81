class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lessons
end
