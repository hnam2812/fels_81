module CreateActivity
  def create_activity action_type, user_id, target_id
    Activity.create action_type: action_type, target_id: target_id, user_id: user_id
  end
end
