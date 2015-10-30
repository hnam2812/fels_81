class Activity < ActiveRecord::Base
  belongs_to :user

  scope :show_activities, ->user_id{where("user_id in (select followed_id from
    relationships where follower_id = #{user_id}) or user_id = #{user_id}").
    order "created_at DESC"}

  def action_object_name object
    object.find_by id: self.target_id
  end
end
