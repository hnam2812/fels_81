module CreateActivity
  def create_activity action_type, user_id, target_id
    Activity.create action_type: action_type, target_id: target_id, user_id: user_id
  end

  def destroy_activity target_id, action_type
    @activity = Activity.find_by target_id: target_id, action_type: action_type
    Activity.destroy @activity
  end
end
