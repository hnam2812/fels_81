class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :name, presence: true
  before_save :create_slug

  def to_param
    slug
  end

  private
  def create_slug
    self.slug = self.name.gsub(" ", "-")
  end
end
