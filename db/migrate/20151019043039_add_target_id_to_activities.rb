class AddTargetIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :target_id, :integer
    remove_column :users, :target_id
  end
end
