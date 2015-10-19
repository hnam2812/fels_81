class RenameColumnFromAnswer < ActiveRecord::Migration
  def change
    rename_column :answers, :true_answer, :correct
  end
end
