class RenameColumnFromActivity < ActiveRecord::Migration
  def change
    rename_column :activities, :title, :action_type
    remove_column :activities, :content
  end
end
