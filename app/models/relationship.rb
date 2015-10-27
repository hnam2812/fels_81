class Relationship < ActiveRecord::Base
  include CreateActivity
  attr_accessor
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  before_create :create_follow_activity
  before_destroy :create_unfollow_activity

  private
  def create_follow_activity
    create_activity :follow, follower.id, followed.id
  end

  def create_unfollow_activity
    create_activity :unfollow, follower.id, followed.id
  end
end
